package workshop.simStreamFork

import spinal.sim._
import spinal.core._
import spinal.core.sim._
import spinal.lib._

import scala.collection.mutable

import SimStreamUtils._

object SimStreamForkTestbench {
  def main(args: Array[String]): Unit = {
    //Compile the simulator
    val compiled = SimConfig.withWave.compile(new SimStreamForkDut)

    //Run the simulation
    compiled.doSim{dut =>
      dut.clockDomain.forkStimulus(period = 10)
      SimTimeout(100000*10)

      val xorCmdAQueue, xorCmdBQueue = mutable.Queue[Long]()
      val mulCmdAQueue, mulCmdBQueue = mutable.Queue[Long]()

      val cmdADriver = streamMasterRandomizer(dut.io.cmdA, dut.clockDomain)
      val cmdBDriver = streamMasterRandomizer(dut.io.cmdB, dut.clockDomain)
      val rspXorDriver = streamSlaveRandomizer(dut.io.rspXor, dut.clockDomain)
      val rspMulDriver = streamSlaveRandomizer(dut.io.rspMul, dut.clockDomain)

      val cmdAMonitor = onStreamFire(dut.io.cmdA, dut.clockDomain) {
        xorCmdAQueue.enqueue(dut.io.cmdA.payload.toLong)
        mulCmdAQueue.enqueue(dut.io.cmdA.payload.toLong)
      }
      val cmdBMonitor = onStreamFire(dut.io.cmdB, dut.clockDomain) {
        xorCmdBQueue.enqueue(dut.io.cmdB.payload.toLong)
        mulCmdBQueue.enqueue(dut.io.cmdB.payload.toLong)
      }

      var rspXorCounter = 0
      onStreamFire(dut.io.rspXor, dut.clockDomain) {
        assert(dut.io.rspXor.payload.toLong == (xorCmdAQueue.dequeue() ^ xorCmdBQueue.dequeue()))
        rspXorCounter += 1
      }

      var rspMulCounter = 0
      onStreamFire(dut.io.rspMul, dut.clockDomain) {
        assert(dut.io.rspMul.payload.toBigInt == (BigInt(mulCmdAQueue.dequeue()) * BigInt(mulCmdBQueue.dequeue())))
        rspMulCounter += 1
      }

      waitUntil(rspMulCounter > 100 && rspXorCounter > 100)
    }
  }
}
