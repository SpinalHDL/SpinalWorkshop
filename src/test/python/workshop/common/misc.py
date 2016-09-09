import cocotb
from cocotb.triggers import Timer, RisingEdge


@cocotb.coroutine
def genClockAndReset(dut):
    dut.clk   <= 0
    dut.reset <= 1
    yield Timer(1000)
    dut.reset <= 0
    while(True):
        yield Timer(500)
        dut.clk <= 1
        yield Timer(500)
        dut.clk <= 0


import time;
@cocotb.coroutine
def simulationSpeedPrinter(clk):
    counter = 0
    lastTime = time.time()
    while True:
        yield RisingEdge(clk)
        counter += 1
        thisTime = time.time()
        if thisTime - lastTime >= 1.0:
            lastTime = thisTime
            print("Sim speed : %f khz" %(counter/1000.0))
            counter = 0

