import random
from queue import Queue

import cocotb
from cocotb.scoreboard import Scoreboard
from cocotb.triggers import RisingEdge

from cocotblib.Phase import PhaseManager, Infrastructure, PHASE_SIM
from cocotblib.Scorboard import ScorboardInOrder
from cocotblib.Stream import StreamDriverMaster, Stream, Transaction, StreamDriverSlave, StreamMonitor
from cocotblib.misc import ClockDomainAsyncReset, simulationSpeedPrinter, randBits, SimulationTimeout
import socket


class DriverAgent(Infrastructure):
    def __init__(self,name,parent,dut):
        Infrastructure.__init__(self,name,parent)

        StreamDriverMaster(Stream(dut,"io_cmdA"),self.genCmdA, dut.clk, dut.reset)
        StreamDriverMaster(Stream(dut, "io_cmdB"), self.genCmdB, dut.clk, dut.reset)
        StreamDriverSlave(Stream(dut, "io_rsp"), dut.clk, dut.reset)

        self.memInitDone = False

    def genCmdA(self):
        if self.getPhase() != PHASE_SIM:
            return None

        if self.memInitDone and random.random() < 0.5:
            trans = Transaction()
            trans.itself = randBits(8)
            return trans


    def genCmdB(self):
        if self.getPhase() != PHASE_SIM:
            return None

        if self.memInitDone and random.random() < 0.5:
            trans = Transaction()
            trans.itself = randBits(32)
            return trans

class MonitorAgent(Infrastructure):
    def __init__(self,name,parent,dut):
        Infrastructure.__init__(self,name,parent)
        self.dut = dut
        self.mem = [0 for i in range(1<<8)]
        self.cmdA = Queue()
        self.cmdB = Queue()
        self.scoreboard = ScorboardInOrder("rspScordboard",self)
        StreamMonitor(Stream(dut,"io_cmdA"), self.onCmdA, dut.clk, dut.reset)
        StreamMonitor(Stream(dut, "io_cmdB"), self.onCmdB, dut.clk, dut.reset)
        StreamMonitor(Stream(dut, "io_rsp"), self.scoreboard.uutPush, dut.clk, dut.reset)
        cocotb.fork(self.onMemWrite())

    @cocotb.coroutine
    def onMemWrite(self):
        while True:
            yield RisingEdge(self.dut.clk)
            if int(self.dut.io_memWrite_valid) == 1:
                self.mem[int(self.dut.io_memWrite_payload_address)] = int(self.dut.io_memWrite_payload_data)

    def onCmdA(self,trans):
        self.cmdA.put(trans)
        self.genRsp()


    def onCmdB(self, trans):
        self.cmdB.put(trans)
        self.genRsp()

    def genRsp(self):
        if not self.cmdA.empty() and not self.cmdB.empty():
            cmdA = self.cmdA.get()
            cmdB = self.cmdB.get()

            rsp = Transaction()
            rsp.itself = self.mem[cmdA.itself] ^ cmdB.itself

            self.scoreboard.refPush(rsp)

    def hasEnoughSim(self):
        return self.scoreboard.refsCounter > 100



@cocotb.test()
def test1(dut):
    random.seed(0)

    cocotb.fork(ClockDomainAsyncReset(dut.clk, dut.reset))
    cocotb.fork(simulationSpeedPrinter(dut.clk))
    cocotb.fork(SimulationTimeout(1000 * 8000))

    phaseManager = PhaseManager()
    phaseManager.setWaitTasksEndTime(1000 * 200)


    driver = DriverAgent("driver",phaseManager,dut)
    monitor = MonitorAgent("monitor",phaseManager,dut)

    for i in range(1<<8):
        dut.io_memWrite_valid <= 1
        dut.io_memWrite_payload_address <= i
        dut.io_memWrite_payload_data <= randBits(32)
        yield RisingEdge(dut.clk)
    dut.io_memWrite_valid <= 0
    driver.memInitDone = True

    yield phaseManager.run()