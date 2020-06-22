package workshop.mandelbrot

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import workshop.common.CocotbRunner

//Run this scala test to generate and check that your RTL work correctly
class PixelSolverTester extends AnyFunSuite{
  test("test") {
    SpinalConfig(targetDirectory = "rtl").dumpWave(0,"../../../../../../../waves/PixelSolverTester.vcd").generateVerilog(
      PixelSolver(
        g = PixelSolverGenerics(
          fixAmplitude = 7,
          fixResolution = -20,
          iterationLimit = 15
        )
      )
    )

    assert(CocotbRunner("./workshop/test/resources/python/workshop/mandelbrot/PixelSolverTester"),"Simulation faild")
    println("SUCCESS")
  }


}
