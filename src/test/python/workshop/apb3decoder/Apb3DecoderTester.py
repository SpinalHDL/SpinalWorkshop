import random

import cocotb
from cocotb.triggers import RisingEdge, Timer

from cocotblib.misc import ClockDomainAsyncReset, simulationSpeedPrinter, assertEquals, SimulationTimeout, randBits, Bundle


def is_prime(a):
    return all(a % i for i in range(2, a))

@cocotb.test()
def test1(dut):
    random.seed(0)

    outputs = [Bundle(dut,"io_outputs_" + str(i)) for i in range(4)]
    mappings = [[0x0000,  0x1000],
                [0x1000,  0x1000],
                [0x4000, 0x2000],
                [0x6000,0x3000]]
    for i in range(100):
        dut.io_input_PADDR <= randBits(16)
        dut.io_input_PSEL <= randBits(1)
        dut.io_input_PENABLE <= randBits(1)
        dut.io_input_PWRITE <= randBits(1)
        dut.io_input_PWDATA <= randBits(32)

        for output in outputs:
            output.PREADY <= randBits(1)
            output.PRDATA <= randBits(32)
            output.PSLVERROR <= randBits(1)



        yield Timer(1000)
        select = None
        for  index, mapping in enumerate(mappings):
            if (int(dut.io_input_PADDR) >= mapping[0] and int(dut.io_input_PADDR) < mapping[0] + mapping[1]):
                select = index

        for index,output in enumerate(outputs):
            assertEquals(output.PADDR,dut.io_input_PADDR,"fail on output PADDR "  + str(index))
            assertEquals(output.PWRITE,dut.io_input_PWRITE,"fail on output PWRITE " + str(index))

            if select == index:
                assertEquals(output.PENABLE,dut.io_input_PENABLE,"fail on output PENABLE " + str(index))
                assertEquals(output.PSEL,dut.io_input_PSEL,"fail on output PSEL " + str(index))
            else:
                assertEquals(output.PSEL,0,"fail on output PSEL " + str(index))


            if select == index:
                assertEquals(output.PREADY, dut.io_input_PREADY, "fail on input PREADY")
                assertEquals(output.PRDATA,dut.io_input_PRDATA,"fail on input PRDATA")
                assertEquals(output.PSLVERROR,dut.io_input_PSLVERROR,"fail on input PSLVERROR")
