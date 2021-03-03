package workshop.timer

import org.scalatest.FunSuite
import spinal.core._
import spinal.core.sim._
import workshop.common.WorkshopSimConfig
import workshop.pwm.{ApbConfig, ApbPwm}

//Run this scala test to generate and check that your RTL work correctly
class TimerTester extends FunSuite {
  var compiled: SimCompiled[Timer] = null

  test("compile") {
    compiled = WorkshopSimConfig().compile(Timer(width = 8))
  }

  test("testbench") {
    compiled.doSim(seed=42) { dut =>
      dut.clockDomain.forkStimulus(10)

      dut.io.tick #= false
      dut.io.clear #= false
      dut.io.limit #= dut.io.limit.maxValue
      dut.clockDomain.waitSampling()
      
      // Do clear
      dut.io.clear #= true
      dut.clockDomain.waitSampling()
      dut.io.clear #= false
      dut.clockDomain.waitSampling()
      assert(dut.io.value.toInt == 0, "dut.io.value should be zero" )
      dut.clockDomain.waitSampling()
      assert(dut.io.value.toInt == 0, "dut.io.value should be zero" )

      dut.io.tick #= true
      dut.clockDomain.waitSampling(16)
      dut.io.tick #= false
      dut.clockDomain.waitSampling(2)
      assert(dut.io.value.toInt == 0x10, "dut.io.value should be 0x10" )

      dut.io.limit #= 0x20
      dut.io.tick #= true
      assert(dut.io.full.toBoolean == false, "dut.io.full should be false" )
      dut.clockDomain.waitSampling(16)
      assert(dut.io.value.toInt == 0x1F, "dut.io.value should be 0x1F" )
      assert(dut.io.full.toBoolean == false, "dut.io.full should be false" )
      dut.clockDomain.waitSampling()
      assert(dut.io.value.toInt == 0x20, "dut.io.value should be 0x20" )
      assert(dut.io.full.toBoolean == true, "dut.io.full should be true" )
      dut.clockDomain.waitSampling(10)
      dut.io.tick #= false
      assert(dut.io.value.toInt == 0x20, "dut.io.value should be 0x20" )
      assert(dut.io.full.toBoolean == true, "dut.io.full should be true" )


      // Do clear
      dut.io.clear #= true
      dut.clockDomain.waitSampling()
      dut.io.clear #= false
      dut.clockDomain.waitSampling()
      assert(dut.io.value.toInt == 0, "dut.io.value should be zero" )
      dut.clockDomain.waitSampling()
      assert(dut.io.value.toInt == 0, "dut.io.value should be zero" )


      dut.clockDomain.waitSampling(10)
    }
  }
}
