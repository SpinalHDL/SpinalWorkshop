package workshop.waveplayer

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axilite.{AxiLite4, AxiLite4SlaveFactory}
import spinal.lib.bus.misc.BusSlaveFactoryAddressWrapper

//This is a multi tone version of the AxiLite4Wave player. It is able to play multiple ROM in the same time on the wave output.
//It is only a show case.
class AxiLite4WavePlayerMultiTone(wavePlayerGenerics : WavePlayerGenerics, toneCount : Int) extends Component{
  import wavePlayerGenerics._
  val io = new Bundle{
    val axiLite = slave(AxiLite4(addressWidth = 2*sampleCountLog2*log2Up(toneCount), dataWidth = 32))
    val wave = out(Sample)
  }

  val factory = new AxiLite4SlaveFactory(io.axiLite)

  //Instanciate one wavePlayer and one WavePlayerMapper for each tones
  val tones = for(i <- 0 until toneCount) yield new Area {
    val wavePlayer = new WavePlayer(wavePlayerGenerics)
    //BusSlaveFactoryAddressWrapper allow to create a fake factory which will apply an address offset to each primitives calls
    val factoryWithOffset = new BusSlaveFactoryAddressWrapper(factory,i*2*sampleCountLog2)
    val mapper = new WavePlayerMapper(factoryWithOffset, wavePlayer)
  }

  //Take all tones and add their output together (add zero for the ones which aren't running)
  io.wave := tones.map(tone => tone.wavePlayer.phase.run ? tone.wavePlayer.filter.value | U(0)).reduce(_ + _)
}


object AxiLite4WavePlayerMultiTone{
  def main(args: Array[String]): Unit = {
    SpinalConfig(targetDirectory = "rtl").generateVerilog(
      gen = new AxiLite4WavePlayerMultiTone(
        wavePlayerGenerics = WavePlayerGenerics(
          sampleWidth = 16,
          sampleCountLog2 = 5,
          phaseWidth = 16,
          filterCoefWidth = 8
        ),
        toneCount = 4
      )
    )
  }
}