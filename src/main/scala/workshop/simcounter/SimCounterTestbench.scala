package workshop.simcounter

import spinal.sim._
import spinal.core._
import spinal.core.sim._

object SimCounterTestbench {
  def main(args: Array[String]): Unit = {
    SimConfig.withWave.compile(new SimCounterDut).doSim{dut =>
      dut.clockDomain.forkStimulus(10)

      var counterModel = 0
      Suspendable.repeat(100) {
        dut.io.enable.randomize()
        dut.clockDomain.waitSampling()
        assert(dut.io.value.toInt == counterModel)
        if (dut.io.enable.toBoolean) {
          counterModel = (counterModel + 1) & 0xFF
        }
      }
    }
  }
}
