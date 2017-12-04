package workshop.waveplayer

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axilite.{AxiLite4, AxiLite4SlaveFactory}
import spinal.lib.bus.misc.BusSlaveFactory

//Class used to parametrized the WavePlayer instanciation
case class WavePlayerGenerics(
                               sampleWidth : Int,
                               sampleCountLog2 : Int,
                               phaseWidth : Int,
                               filterCoefWidth : Int
                             ){
  def Sample = UInt(sampleWidth bits)
  def sampleCount = 1 << sampleCountLog2
}

//Area of logic which implement a phase counter, a rom sampler.
case class WavePlayer(generics : WavePlayerGenerics) extends Area{
  import generics._
  assert(phaseWidth >= sampleCountLog2)

  val phase = new Area{
    val run = Bool  //Driven later by a WavePlayerMapper (see WavePlayerMapper implementation)
    val rate = UInt(phaseWidth bits) //Driven later by a WavePlayerMapper

    //TODO phase
  }

  val sampler = new Area{
    //TODO Rom definition with a sinus + it sampling
  }

  val filter = new Area{
    val bypass = Bool //Driven later by a WavePlayerMapper
    val coef = UInt(filterCoefWidth bits) //Driven later by a WavePlayerMapper
    val value = Sample //Output value of the filter Area
    //TODO first order filter + bypass logic
  }
}

//Area capable to map a WavePlayer on a BusSlaveFactory
class WavePlayerMapper(bus : BusSlaveFactory, wavePlayer : WavePlayer) extends Area{
  bus.drive(wavePlayer.phase.run,  address = 0x00) init(False)
  //TODO phase.rate, phase.value, filter.bypass, filter.coef mapping
}
