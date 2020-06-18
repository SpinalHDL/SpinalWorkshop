import random

import cocotb
from cocotb.result import TestFailure
from cocotb.triggers import RisingEdge, Timer


@cocotb.coroutine
def genClockAndReset(dut):
    dut.reset = 1
    dut.clk   = 0
    yield Timer(1000)
    # TODO Animate the dut.clk and dut.reset

@cocotb.test()
def test1(dut):
    cocotb.fork(genClockAndReset(dut))

    counter = 0  # Used to model the hardware
    for i in range(256):
        yield RisingEdge(dut.clk)
        # TODO Check that the DUT match with the model (counter variable)
        # read io_value =>     dut.io_value
        # read io_full =>      dut.io_full
        # raise TestFailure("io_value missmatch")
        # raise TestFailure("io_full missmatch")


        # TODO Animate the model depending DUT inputs

        # TODO Generate random stimulus



