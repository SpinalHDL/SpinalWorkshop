package workshop.mandelbrot

import org.scalatest.FunSuite
import spinal.core._
import workshop.common.CocotbRunner

//Run this scala test to generate and check that your RTL work correctly
class PixelSolverTester extends FunSuite{
  test("test") {
    SpinalConfig().dumpWave(0,"PixelSolverTester.vcd").generateVerilog(
      PixelSolver(
        g = MandelbrotGenerics(
          fixAmplitude = 7,
          fixResolution = -20,
          iterationLimit = 15
        )
      )
    )

    assert(CocotbRunner("./src/test/python/workshop/mandelbrot/PixelSolverTester"),"Simulation faild")
    println("SUCCESS")
  }


}
