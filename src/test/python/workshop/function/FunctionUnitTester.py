import random

import cocotb
from cocotb.triggers import RisingEdge, Timer

from cocotblib.misc import ClockDomainAsyncReset, simulationSpeedPrinter, assertEquals, SimulationTimeout


# Send a transaction on io_cmd with a random timing
@cocotb.coroutine
def sendCmdRandomTiming(dut,payload):
    while random.random() < 0.5:
        yield RisingEdge(dut.clk)
    dut.io_cmd_valid <= 1
    dut.io_cmd_payload <= payload
    yield RisingEdge(dut.clk)
    dut.io_cmd_valid <= 0
    dut.io_cmd_payload <= 0

# Send a command with the given header + value and then check that the pin is correctly set by the hardware
@cocotb.coroutine
def driveAndCheck(dut,header,value,valueWidth,pin):
    assert(valueWidth % 8 == 0)

    for h in header:
        yield sendCmdRandomTiming(dut,ord(h))

    for i in range(int(valueWidth/8)):
        yield sendCmdRandomTiming(dut,(value >> (i*8)) & 0xFF)

    yield RisingEdge(dut.clk)
    yield RisingEdge(dut.clk)
    yield RisingEdge(dut.clk)
    yield RisingEdge(dut.clk)
    yield RisingEdge(dut.clk)
    assertEquals(pin, value,pin._name + " wasn't loaded correctly")


@cocotb.test()
def test1(dut):
    random.seed(0)

    cocotb.fork(ClockDomainAsyncReset(dut.clk, dut.reset))
    cocotb.fork(simulationSpeedPrinter(dut.clk))
    cocotb.fork(SimulationTimeout(1000*16000))

    yield driveAndCheck(dut, "setValueA",0x11,8,dut.io_valueA)
    yield driveAndCheck(dut, "setValueB", 0x22334455, 32, dut.io_valueB)
    yield driveAndCheck(dut, "setValueC", 0x66778899AABB, 48, dut.io_valueC)
    yield driveAndCheck(dut, "setValueB", 0xCAFEF00D, 32, dut.io_valueB)
    yield Timer(1000*20)


