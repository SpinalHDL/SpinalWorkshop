package workshop.waveplayer

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axilite.{AxiLite4, AxiLite4SlaveFactory}
import spinal.lib.bus.misc.BusSlaveFactory

//0.25 + 0.5 + 0.5


case class WavePlayerGenerics(
  sampleWidth : Int,
  sampleCountLog2 : Int,
  phaseWidth : Int,
  filterCoefWidth : Int
){
  def Sample = UInt(sampleWidth bits)
  def sampleCount = 1 << sampleCountLog2
}

case class WavePlayer(generics : WavePlayerGenerics) extends Area{
  import generics._
  assert(phaseWidth >= sampleCountLog2)

  val phase = new Area{
    val run = Bool
    val rate = UInt(phaseWidth bits)

    val value = Reg(UInt(phaseWidth bits)) init(0)
    when(run){
      value := value + rate
    }
  }

  val sampler = new Area{
    val ram = Mem(Sample, sampleCount)
    val sample = ram.readAsync(phase.value >> (phaseWidth - sampleCountLog2))
  }

  val filter = new Area{
    val bypass = Bool
    val coef = UInt(filterCoefWidth bits)
    val accumulator = Reg(UInt(sampleWidth + filterCoefWidth bits)) init(0)
    accumulator := accumulator - (accumulator*coef >> filterCoefWidth) + sampler.sample * coef
    val filtredSampler = accumulator >> filterCoefWidth
    val value = bypass ? sampler.sample | filtredSampler
  }
}

class WavePlayerMapper(bus : BusSlaveFactory, wavePlayer : WavePlayer) extends Area{
  bus.drive(wavePlayer.phase.run,  address = 0x00) init(False)
  bus.drive(wavePlayer.phase.rate, address = 0x04)
  bus.read(wavePlayer.phase.value, address = 0x08)

  bus.drive(wavePlayer.filter.bypass, address = 0x10) init(True)
  bus.drive(wavePlayer.filter.coef, address = 0x14) init(0)

//  bus.writeMemWordAligned(wavePlayer.sampler.ram, addressOffset = wavePlayer.generics.sampleCount)
}

class AxiLite4WavePlayer(wavePlayerGenerics : WavePlayerGenerics) extends Component{
  import wavePlayerGenerics._
  val io = new Bundle{
    val axiLite = slave(AxiLite4(addressWidth = 2*sampleCountLog2, dataWidth = 32))
    val wave = out(Sample)
  }

  val factory = new AxiLite4SlaveFactory(io.axiLite)
  val wavePlayer = new WavePlayer(wavePlayerGenerics)
  val mapper = new WavePlayerMapper(factory,wavePlayer)

  io.wave <> wavePlayer.filter.value

  val ramInitValues = for(sampleId <- 0 until sampleCount)yield{
    val sin = Math.sin(2.0*Math.PI*sampleId/sampleCount)
    val normalizedSin = (0.5*sin + 0.5) * (Math.pow(2.0, sampleWidth) - 1)
    BigInt(normalizedSin.toLong)
  }
  wavePlayer.sampler.ram initBigInt(ramInitValues)
}


object AxiLite4WavePlayer{
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