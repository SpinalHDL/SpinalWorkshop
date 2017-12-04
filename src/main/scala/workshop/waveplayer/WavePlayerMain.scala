package workshop.waveplayer

import spinal.core._

object AxiLite4WavePlayerMain{
  def main(args: Array[String]): Unit = {
    SpinalConfig(targetDirectory = "rtl").generateVerilog(
      gen = new AxiLite4WavePlayer(
        wavePlayerGenerics = WavePlayerGenerics(
          sampleWidth = 16,
          sampleCountLog2 = 5,
          phaseWidth = 16,
          filterCoefWidth = 8
        )
      )
    )
  }
}