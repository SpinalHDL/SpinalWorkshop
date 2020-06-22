package workshop.mandelbrot

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import workshop.common.CocotbRunner

//Run this scala test to generate and check that your RTL work correctly
class PixelSolverMultiCoreTester extends AnyFunSuite{
  test("test") {
    SpinalConfig(targetDirectory = "rtl").dumpWave(0,"../../../../../../../waves/PixelSolverMultiCoreTester.vcd").generateVerilog(
      PixelSolverMultiCore(
        g = PixelSolverGenerics(
          fixAmplitude = 7,
          fixResolution = -20,
          iterationLimit = 15
        ),
        coreCount = 8
      )
    )

    assert(CocotbRunner("./workshop/test/resources/python/workshop/mandelbrot/PixelSolverMultiCoreTester"),"Simulation faild")
    println("SUCCESS")
  }


}
