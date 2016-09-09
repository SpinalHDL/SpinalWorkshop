import random

import cocotb

from workshop.mandelbrot.common import pixelSolverTester


@cocotb.test()
def test1(dut):
    yield pixelSolverTester(dut)
