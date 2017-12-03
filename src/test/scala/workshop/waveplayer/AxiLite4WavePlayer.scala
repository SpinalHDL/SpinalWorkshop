package workshop.waveplayer

import org.scalatest.FunSuite
import spinal.core.SpinalConfig
import workshop.common.CocotbRunner

class AxiLite4WavePlayerTester extends FunSuite{
  test("test") {
    SpinalConfig(targetDirectory = "rtl").dumpWave(0,"../../../../../waves/AxiLite4WavePlayer.vcd").generateVerilog(
      gen = new AxiLite4WavePlayer(
        wavePlayerGenerics = WavePlayerGenerics(
          sampleWidth = 16,
          sampleCountLog2 = 5,
          phaseWidth = 16,
          filterCoefWidth = 8
        )
      )
    )

    assert(CocotbRunner("./src/test/python/workshop/waveplayer"),"Simulation faild")
    println("SUCCESS")
  }
}
