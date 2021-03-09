package workshop.blackboxAndClock

import org.scalatest.FunSuite
import spinal.core._
import spinal.core.sim._
import workshop.common.WorkshopSimConfig

import scala.util.Random

//Run this scala test to generate and check that your RTL work correctly
class BlackBoxAndClockTester extends FunSuite{
  var compiled: SimCompiled[MemorySumming] = null

  test("compile") {
    compiled = WorkshopSimConfig().addRtl("rtl/Ram_1w_1r_2c.v").compile(
      MemorySumming(
        writeClock = ClockDomain.external("io_wr", withReset = false),
        sumClock   = ClockDomain.external("io_sum")
      )
    )
  }

  test("testbench") {
    compiled.doSimUntilVoid(seed = 42){dut =>
      dut.writeClock.forkStimulus(10)
      dut.sumClock.forkStimulus(7)
      SimTimeout(10000)

      val memory = List.fill(256)(Random.nextInt(64 * 1024))

      val initThread = fork {
        for (i <- 0 to 255) {
          dut.io.wr.en #= true
          dut.io.wr.addr #= i
          dut.io.wr.data #= memory(i)
          dut.writeClock.waitSampling()
        }
        dut.io.wr.en #= false
      }

      val sumThread = fork {
        dut.io.sum.start #= false
        initThread.join()
        dut.io.sum.start #= true
        dut.sumClock.waitSampling()
        dut.io.sum.start #= false
      }

      val checkThread = fork {
        dut.sumClock.waitSamplingWhere(dut.io.sum.done.toBoolean)
        val dutValue = dut.io.sum.value.toInt
        val refValue = memory.sum & 0xFFFF
        assert(dutValue == refValue, s"Wrong sum. DUT=$dutValue REF=$refValue")
        dut.sumClock.waitSampling(10)
        simSuccess()
      }
    }
  }
}