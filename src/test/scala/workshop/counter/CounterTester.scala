package workshop.counter

import org.scalatest.FunSuite
import spinal.core._
import spinal.core.sim._
import spinal.sim.Suspendable
import workshop.common.WorkshopSimConfig

import scala.sys.process._
import scala.util.Random

//Run this scala test to generate and check that your RTL work correctly
class CounterTester extends FunSuite {
  var compiled: SimCompiled[Counter] = null

  test("compile") {
    compiled = WorkshopSimConfig().compile(Counter(width = 4))
  }

  test("testbench") {
    compiled.doSim{dut =>
      dut.clockDomain.forkStimulus(10)
      var counter = 0
      Suspendable.repeat(100){
        dut.io.clear #= Random.nextDouble() < 0.1
        dut.clockDomain.waitSampling()
        assert(dut.io.value.toInt == counter, "dut.io.value missmatch")
        assert(dut.io.full.toBoolean == (counter == 15), "dut.io.full missmatch")
        counter = if(dut.io.clear.toBoolean) 0 else (counter + 1) & 0xF
      }
    }
  }
}

