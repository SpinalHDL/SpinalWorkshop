package workshop.mandelbrot

import org.scalatest.FunSuite
import spinal.core._
import workshop.common.CocotbRunner

//Run this scala test to generate and check that your RTL work correctly
class PixelSolverMultiCoreTester extends FunSuite{
  test("test") {
    SpinalConfig().dumpWave(0,"PixelSolverMultiCoreTester.vcd").generateVerilog(
      PixelSolverMultiCore(
        g = PixelSolverGenerics(
          fixAmplitude = 7,
          fixResolution = -20,
          iterationLimit = 15
        ),
        coreCount = 8
      )
    )

    assert(CocotbRunner("./src/test/python/workshop/mandelbrot/PixelSolverMultiCoreTester"),"Simulation faild")
    println("SUCCESS")
  }


}
