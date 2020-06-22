package workshop.function

import spinal.core._

//Run this main to generate the RTL
object FunctionUnitMain{
  def main(args: Array[String]) {
    SpinalConfig(targetDirectory = "rtl").generateVhdl(FunctionUnit())
  }
}
