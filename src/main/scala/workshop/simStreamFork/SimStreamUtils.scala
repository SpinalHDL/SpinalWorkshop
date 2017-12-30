package workshop.simStreamFork

import spinal.core._
import spinal.core.sim._
import spinal.lib._

object SimStreamUtils {
  def streamMasterRandomizer(stream : Stream[UInt], clockDomain: ClockDomain): Unit = fork{
    stream.valid #= false
    while(true){
      stream.valid.randomize()
      stream.payload.randomize()
      clockDomain.waitSampling()
    }
  }

  def streamSlaveRandomizer(stream : Stream[UInt], clockDomain: ClockDomain): Unit = fork{
    while(true){
      stream.ready.randomize()
      clockDomain.waitSampling()
    }
  }

  def onStreamFire(stream : Stream[UInt], clockDomain: ClockDomain)(body : => Unit@suspendable): Unit = fork{
    while(true) {
      clockDomain.waitSampling()
      var dummy = if (stream.valid.toBoolean && stream.ready.toBoolean) {
        body
      }
    }
  }
}
