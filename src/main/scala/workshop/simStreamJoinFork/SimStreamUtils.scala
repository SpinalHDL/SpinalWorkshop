package workshop.simStreamJoinFork

import spinal.core._
import spinal.core.sim._
import spinal.lib._

object SimStreamUtils {
  //Fork a thread to constantly randomize the valid/payload signals of the given stream
  def streamMasterRandomizer[T <: Data](stream : Stream[T], clockDomain: ClockDomain): Unit = fork{
    stream.valid #= false
    while(true){
      stream.valid.randomize()
      stream.payload.randomize()
      clockDomain.waitSampling()
    }
  }

  //Fork a thread to constantly randomize the ready signal of the given stream
  def streamSlaveRandomizer[T <: Data](stream : Stream[T], clockDomain: ClockDomain): Unit = fork{
    while(true){
      stream.ready.randomize()
      clockDomain.waitSampling()
    }
  }

  //Fork a thread which will call the body function each time a transaction is consumed on the given stream
  def onStreamFire[T <: Data](stream : Stream[T], clockDomain: ClockDomain)(body : => Unit): Unit = fork{
    while(true) {
      clockDomain.waitSampling()
      var dummy = if (stream.valid.toBoolean && stream.ready.toBoolean) {
        body
      }
    }
  }
}
