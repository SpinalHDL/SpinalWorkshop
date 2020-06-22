package workshop.apb3decoder

import spinal.core._
import spinal.lib.bus.amba3.apb.Apb3Config

//Run this main to generate the RTL
object Apb3DecoderMain{
  def main(args: Array[String]) {
    SpinalConfig(targetDirectory = "rtl").generateVhdl(new Apb3Decoder(
      apbConfig = Apb3Config(
        addressWidth = 16,
        dataWidth = 32
      ),
      outputsMapping = List(
        Mapping(base = 0x0000, range = 0x1000),
        Mapping(base = 0x1000, range = 0x1000),
        Mapping(base = 0x4000, range = 0x2000),
        Mapping(base = 0x6000, range = 0x3000)
      )
    ))
  }
}
