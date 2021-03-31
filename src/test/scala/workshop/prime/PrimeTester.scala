package workshop.prime

import org.scalatest.FunSuite
import spinal.core._
import spinal.core.sim._
import workshop.common.{CocotbRunner, WorkshopSimConfig}
import workshop.counter.Counter

import scala.util.Random

//Run this scala test to generate and check that your RTL work correctly
class PrimeTester extends FunSuite{
  var compiled: SimCompiled[PrimeUsage] = null

  test("compile") {
    compiled = WorkshopSimConfig().compile(PrimeUsage(5))
  }

  test("testbench") {
    compiled.doSim(seed = 42){dut =>

      var counter = 0
      for(_ <- 0 until 100){
        val value = dut.io.value.randomizedInt()
        val refIsPrime = Prime(value)
        dut.io.value #= value
        sleep(1)
        val dutIsPrime = dut.io.isPrime.toBoolean
        assert(dutIsPrime == refIsPrime, s"dut.io.isPrime missmatch. DUT=$dutIsPrime REF=$refIsPrime")
      }
    }
  }
}
