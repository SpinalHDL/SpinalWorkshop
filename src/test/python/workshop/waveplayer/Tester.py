import random
from queue import Queue
from math import sin

import math

import cocotb
from cocotb.drivers.amba import AXI4LiteMaster
from cocotb.scoreboard import Scoreboard
from cocotb.triggers import RisingEdge, Timer

from cocotblib.Phase import PhaseManager, Infrastructure, PHASE_SIM
from cocotblib.Scorboard import ScorboardInOrder
from cocotblib.Stream import StreamDriverMaster, Stream, Transaction, StreamDriverSlave, StreamMonitor
from cocotblib.misc import ClockDomainAsyncReset, simulationSpeedPrinter, randBits, SimulationTimeout


class AxiLite4:
    def __init__(self,dut,name):
        self.ar = Stream(dut,name + "_ar")
        self.r  = Stream(dut, name + "_r")
        self.aw = Stream(dut, name + "_aw")
        self.w  = Stream(dut, name + "_w")
        self.b  = Stream(dut, name + "_b")


class AxiLite4Master:
    def __init__(self, axiLite, clk, reset):
        self.axiLite = axiLite
        self.clk = clk
        self.awQueue = Queue()
        self.arQueue = Queue()
        self.wQueue = Queue()
        self.awDriver = StreamDriverMaster(axiLite.aw, lambda : self.awQueue.get_nowait() if not self.awQueue.empty() else None, clk, reset)
        self.arDriver = StreamDriverMaster(axiLite.ar, lambda : self.arQueue.get_nowait() if not self.arQueue.empty() else None, clk, reset)
        self.wDriver = StreamDriverMaster(axiLite.w, lambda : self.wQueue.get_nowait() if not self.wQueue.empty() else None, clk, reset)
        StreamDriverSlave(axiLite.r, clk, reset)
        StreamDriverSlave(axiLite.b, clk, reset)

    @cocotb.coroutine
    def write(self, address, data):
        aw = Transaction()
        aw.addr = address
        aw.prot = 0
        self.awQueue.put(aw)
        w = Transaction()
        w.data = data
        w.strb = 0xF
        self.wQueue.put(w)
        while True:
            yield RisingEdge(self.clk)
            if self.axiLite.b.valid == True and self.axiLite.b.ready == True:
                break


    @cocotb.coroutine
    def read(self, address, rsp):
        ar = Transaction()
        ar.addr = address
        ar.prot = 0
        self.arQueue.put(ar)
        while True:
            yield RisingEdge(self.clk)
            if self.axiLite.r.valid == True and self.axiLite.r.ready == True:
                rsp[0] = int(self.axiLite.r.payload.data)
                break

    @cocotb.coroutine
    def readAssert(self,address, value, mask ,message):
        rsp = [0]
        yield self.read(address,rsp)
        assert rsp[0] & mask == value, message


@cocotb.coroutine
def analyseFreq(dut, periode):
    i = 0
    q = 0
    for phase in range(periode):
        yield RisingEdge(dut.clk)
        fPhase = 2*math.pi*phase/periode
        value = int(dut.io_wave)/65535.0*2-1
        i += math.sin(fPhase)*value
        q += math.cos(fPhase)*value

    i /= periode/2
    q /= periode/2
    # print(i, q, math.sqrt(i*i +q*q))
    assert math.sqrt(i*i +q*q) > 0.95, "The output isn't a sinus wave at the right frequancy"

@cocotb.test()
def test1(dut):
    random.seed(0)
    cocotb.fork(ClockDomainAsyncReset(dut.clk, dut.reset))
    cocotb.fork(simulationSpeedPrinter(dut.clk))
    cocotb.fork(SimulationTimeout(1000 * 8000))

    axiLite = AxiLite4(dut, "io_axiLite")
    master = AxiLite4Master(axiLite, dut.clk, dut.reset)


    yield RisingEdge(dut.clk)
    yield master.readAssert(0x00, 0, 1, "wavePlayer.phase.run was read as True, but should be False")
    yield master.readAssert(0x10, 1, 1, "wavePlayer.filter.bypass was read as False, but should be True")
    yield master.write(4, 0x80)
    yield master.write(0, 1)
    yield master.readAssert(0x00, 1, 1, "wavePlayer.phase.run was read as False, but should be True")
    phaseValue = 0
    for i in range(4):
        newValue = [0]
        yield master.read(0x8, newValue)
        assert newValue[0] > phaseValue, "wavePlayer.phase.value doesn't seem to increment"
        phaseValue = newValue[0]
        yield RisingEdge(dut.clk)


    yield analyseFreq(dut,0x200)
    yield Timer(1000*2000);

    yield master.write(0x14, 0x10)
    yield master.write(0x10, 0)
    yield master.readAssert(0x10, 0, 1, "wavePlayer.filter.bypass was read as True, but should be False")

    yield Timer(1000*2000);
    yield analyseFreq(dut,0x200)
    yield Timer(1000*2000);
