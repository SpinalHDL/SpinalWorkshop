import random

import cocotb
from cocotb.result import TestFailure
from cocotb.triggers import RisingEdge, Timer


@cocotb.coroutine
def genClockAndReset(dut):
    dut.reset = 1
    dut.clk = 0
    yield Timer(1000)
    dut.reset = 0
    yield Timer(1000)
    while True:
        dut.clk = 1
        yield Timer(500)
        dut.clk = 0
        yield Timer(500)


@cocotb.test()
def test1(dut):
    cocotb.fork(genClockAndReset(dut))

    counter = 0
    for i in xrange(256):
        yield RisingEdge(dut.clk)
        if dut.io_value != counter:
            raise TestFailure("io_value missmatch")

        if dut.io_full != 1 if counter == 16 else 0:
            raise TestFailure("io_full missmatch")

        if dut.io_clear == 1:
            counter = 0
        else:
            counter = (counter + 1) & 0xF

        dut.io_clear = (random.random() < 0.03)



