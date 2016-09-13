import random
from Queue import Queue

import cocotb
from cocotb.scoreboard import Scoreboard
from cocotb.triggers import RisingEdge, Timer

from cocotblib.Phase import PhaseManager, Infrastructure, PHASE_SIM
from cocotblib.Scorboard import ScorboardInOrder
from cocotblib.Stream import StreamDriverMaster, Stream, Transaction, StreamDriverSlave, StreamMonitor
from cocotblib.misc import ClockDomainAsyncReset, simulationSpeedPrinter, randBits, assertEquals


@cocotb.coroutine
def sendCmdRandomTiming(dut,payload):
    while random.random() < 0.5:
        yield RisingEdge(dut.clk)
    dut.io_cmd_valid <= 1
    dut.io_cmd_payload <= payload
    yield RisingEdge(dut.clk)
    dut.io_cmd_valid <= 0
    dut.io_cmd_payload <= 0

@cocotb.coroutine
def driveAndCheck(dut,header,value,valueWidth,pin):
    assert(valueWidth % 8 == 0)

    for h in header:
        yield sendCmdRandomTiming(dut,ord(h))

    for i in xrange(valueWidth/8):
        yield sendCmdRandomTiming(dut,(value >> (i*8)) & 0xFF)

    yield RisingEdge(dut.clk)
    assertEquals(pin, value,pin._name + " wasn't loaded correctly")


@cocotb.test()
def test1(dut):
    random.seed(0)

    cocotb.fork(ClockDomainAsyncReset(dut.clk, dut.reset))
    cocotb.fork(simulationSpeedPrinter(dut.clk))

    yield driveAndCheck(dut,"setValueA",0x11,8,dut.io_valueA)
    yield driveAndCheck(dut, "setValueB", 0x22334455, 32, dut.io_valueB)
    yield driveAndCheck(dut, "setValueC", 0x66778899AABB, 48, dut.io_valueC)
    yield driveAndCheck(dut, "setValueB", 0xCAFEF00D, 32, dut.io_valueB)
    yield Timer(1000*20)


