package workshop.waveplayer
import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axilite.{AxiLite4, AxiLite4SlaveFactory}

class AxiLite4WavePlayer(wavePlayerGenerics : WavePlayerGenerics) extends Component{
  import wavePlayerGenerics._
  val io = new Bundle{
    val axiLite = slave(AxiLite4(addressWidth = 2*sampleCountLog2, dataWidth = 32)) //2*sampleCountLog2 would allow, eventualy, to map the ROM into the memory space (optional)
    val wave = out(Sample)
  }

  val factory = new AxiLite4SlaveFactory(io.axiLite)
  val wavePlayer = new WavePlayer(wavePlayerGenerics)
  val mapper = new WavePlayerMapper(factory,wavePlayer)

  io.wave <> wavePlayer.filter.value
}


