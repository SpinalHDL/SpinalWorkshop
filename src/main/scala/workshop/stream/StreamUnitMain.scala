package workshop.stream

import spinal.core._


object StreamUnitMain{
  def main(args: Array[String]) {
    SpinalConfig(targetDirectory = "rtl").generateVhdl(StreamUnit())
  }
}
