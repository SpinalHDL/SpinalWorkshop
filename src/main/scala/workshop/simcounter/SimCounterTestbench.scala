package workshop.simcounter

import spinal.sim._
import spinal.core._
import spinal.core.sim._

object SimCounterTestbench extends App {
  SimConfig.withWave.compile(new SimCounterDut).doSim(dut => {
    dut.clockDomain.forkStimulus(10)

    var counterModel = 0
    Suspendable.repeat(100) {
      dut.io.enable.randomize()
      dut.clockDomain.waitActiveEdge()
      if (dut.io.enable.toBoolean) {
        counterModel = (counterModel + 1) & 0xFF
      }
      assert(dut.io.value.toInt == counterModel)
    }
  })
}
