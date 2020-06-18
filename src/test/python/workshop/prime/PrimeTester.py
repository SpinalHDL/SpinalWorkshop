import random

import cocotb
from cocotb.triggers import RisingEdge, Timer

from cocotblib.misc import ClockDomainAsyncReset, simulationSpeedPrinter, assertEquals, SimulationTimeout, randBits

def is_prime(a):
    return all(a % i for i in range(2, a))

@cocotb.test()
def test1(dut):
    random.seed(0)


    for i in range(100):
       randValue = randBits(5)
       dut.io_value <= randValue
       yield Timer(1000)
       assertEquals(dut.io_isPrime, is_prime(randValue),"fail with " + str(randValue) + " which should have produce a isPrime=" + str(is_prime(randValue)))


