#!/bin/env python
import cocotb
from cocotb.result import TestFailure
from cocotb.triggers import Timer

@cocotb.test()
def myTestbench(dut):
    print("START")

    dut.reset = 1
    yield Timer(1000)

    dut.reset = 0
    yield Timer(1000)

    if dut.io_value != 42:
        raise TestFailure("io_value mismatch")

    print("SUCCESS")



import cocotb
from cocotb.result import TestFailure
from cocotb.triggers import Timer


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

@cocotb.coroutine
def checker(dut):
    yield Timer(10000)
    if dut.io_value != 42:
        raise TestFailure("io_value mismatch")


@cocotb.test()
def myTestbench2(dut):
    cocotb.fork(genClockAndReset(dut))
    yield checker(dut)