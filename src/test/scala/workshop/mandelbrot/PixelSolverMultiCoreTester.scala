package workshop.mandelbrot

import org.scalatest.FunSuite
import spinal.core._
import spinal.core.sim._
import workshop.common.WorkshopSimConfig

//Run this scala test to generate and check that your RTL work correctly
class PixelSolverMultiCoreTester extends FunSuite{

  var compiled: SimCompiled[PixelSolverMultiCore] = null

  test("compile") {
    compiled = WorkshopSimConfig().compile(
      PixelSolverMultiCore(
        g = PixelSolverGenerics(
          fixAmplitude = 7,
          fixResolution = -20,
          iterationLimit = 15
        ),
        coreCount = 8
      )
    )
  }

  test("testbench") {
    compiled.doSimUntilVoid(seed = 42){dut =>
      dut.clockDomain.forkStimulus(10)
      PixelSolverChecker(dut.io.cmd, dut.io.rsp, dut.clockDomain)
    }
  }
}
