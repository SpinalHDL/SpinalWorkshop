package workshop.mandelbrot

import spinal.core._

//Run this main to generate the RTL
object PixelSolverMultiCoreMain{
  def main(args: Array[String]) {
    SpinalConfig(targetDirectory = "rtl").generateVhdl(
      gen = PixelSolverMultiCore(
        g = PixelSolverGenerics(
          fixAmplitude = 7,
          fixResolution = -20,
          iterationLimit = 63
        ),
        coreCount = 8
      )
    )
  }
}