package workshop.mandelbrot

import spinal.core._

//Run this main to generate the RTL
object MandelbrotMain{
  def main(args: Array[String]) {
    SpinalVhdl(
      gen = PixelSolver(
        g = MandelbrotGenerics(
          fixAmplitude = 7,
          fixResolution = -20,
          iterationLimit = 63
        )
      )
    )
  }
}