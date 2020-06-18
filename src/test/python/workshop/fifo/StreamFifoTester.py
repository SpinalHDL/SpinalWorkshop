import random
from queue import Queue

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


@cocotb.coroutine
def driverAgent(dut):
    dut.io_push_valid = 0
    dut.io_pop_ready  = 0

    while True:
        yield RisingEdge(dut.clk)
        # TODO generate random stimulus on the hardware


@cocotb.coroutine
def checkerAgent(dut):
    queue = Queue()
    matchCounter = 0
    while matchCounter < 5000:
        yield RisingEdge(dut.clk)
        # TODO Capture and store 'push' transactions into the queue

        # TODO capture and check 'pop' transactions with the head of the queue.
        # If match increment matchCounter else throw error


@cocotb.test()
def test1(dut):
    # Create all threads
    cocotb.fork(genClockAndReset(dut))
    cocotb.fork(driverAgent(dut))
    checker = cocotb.fork(checkerAgent(dut))

    # Wait until the checker finish his job
    yield checker.join()


