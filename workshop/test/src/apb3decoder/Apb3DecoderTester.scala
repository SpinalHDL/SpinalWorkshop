package workshop.apb3decoder

import org.scalatest.FunSuite
import spinal.core._
import spinal.lib.bus.amba3.apb.Apb3Config
import workshop.common.CocotbRunner

//Run this scala test to generate and check that your RTL work correctly
class Apb3DecoderTester extends FunSuite{
  test("test") {
    SpinalConfig(targetDirectory = "rtl").dumpWave(0,"../../../../../waves/Apb3Decoder.vcd").generateVerilog(
      new Apb3Decoder(
        apbConfig = Apb3Config(addressWidth = 16, dataWidth = 32),
        outputsMapping = List(
          Mapping(base = 0x0000, range = 0x1000),
          Mapping(base = 0x1000, range = 0x1000),
          Mapping(base = 0x4000, range = 0x2000),
          Mapping(base = 0x6000, range = 0x3000)
        )
      )
    )

    assert(CocotbRunner("./src/test/python/workshop/apb3decoder"),"Simulation faild")
    println("SUCCESS")
  }
}
