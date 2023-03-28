package workshop.waveplayer

import java.io.File

import org.apache.commons.io.FileUtils
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
    ).generatedSourcesPaths.filter(_.endsWith(".bin")).foreach(rom => FileUtils.copyFileToDirectory(new File(rom), new File("./src/test/python/workshop/waveplayer")))



    assert(CocotbRunner("./src/test/python/workshop/waveplayer"),"Simulation faild")
    println("SUCCESS")
  }
}
