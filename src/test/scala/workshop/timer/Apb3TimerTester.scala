package workshop.timer

import org.scalatest.FunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.bus.amba3.apb.sim.Apb3Driver
import workshop.common.WorkshopSimConfig

//Run this scala test to generate and check that your RTL work correctly
class Apb3TimerTester extends FunSuite{
  var compiled: SimCompiled[Apb3Timer] = null

  test("compile") {
    compiled = WorkshopSimConfig().compile(Apb3Timer())
  }

  test("testbench") {
    compiled.doSim { dut =>
      dut.clockDomain.forkStimulus(10)
      var testId = 0
      val driver = Apb3Driver(dut.io.apb, dut.clockDomain)
      def apbReadAssert(address : BigInt, data : BigInt, mask : BigInt, message : String) : Unit =  assert((driver.read(address) & mask) == data, "Test case " + testId + " :" + message)



      dut.io.apb.PENABLE #= false
      dut.io.apb.PSEL #= 0

      dut.clockDomain.waitSampling(1)

      def testSetA : Unit = {
        testId = 1
        driver.write(0x08, 0x00000000) // Clear timerA
        apbReadAssert(0x08, 0x00000000, 0x0000FFFF, "TimerA clear/read value doesn't work")

        testId = 2
        driver.write(0x04, 0x0000003F) // timerA set limit
        apbReadAssert(0x04, 0x0000003F, 0x0000FFFF, "TimerA limit read/write doesn't work")

        testId = 3
        driver.write(0x04, 0x0000001F) // timerA set limit
        apbReadAssert(0x04, 0x0000001F, 0x0000FFFF, "TimerA limit read/write doesn't work")
        driver.write(0x00, 0x00000001) // timerA self tick
        dut.clockDomain.waitSampling(31)
        assert(dut.io.fullA.toBoolean == false, "dut.io.fullA should be false")
        dut.clockDomain.waitSampling(1)
        assert(dut.io.fullA.toBoolean == true, "dut.io.fullA should be true")

        testId = 4
        dut.clockDomain.waitSampling(2)
        driver.write(0x04, 0x0000002F)
        dut.clockDomain.waitSampling(47)
        assert(dut.io.fullA.toBoolean == false, "dut.io.fullA should be false")
        dut.clockDomain.waitSampling(1)
        assert(dut.io.fullA.toBoolean == true, "dut.io.fullA should be true")
      }
      testSetA

      def testSetB : Unit = {
        testId = 5
        driver.write(0x04, 0x0000001F)
        driver.write(0x00, 0x00010001) // timerA self tick self reset
        driver.write(0x08, 0x00000000) // Clear timerA
        dut.clockDomain.waitSamplingWhere(dut.io.fullA.toBoolean == true)
        dut.clockDomain.waitSampling(31)
        assert(dut.io.fullA.toBoolean == false, "dut.io.fullA should be false")
        dut.clockDomain.waitSampling(1)
        assert(dut.io.fullA.toBoolean == true, "dut.io.fullA should be true")

        testId = 6
        driver.write(0x00, 0x00010002) // timerA clockdivider tick self reset
        driver.write(0x08, 0x00000000) // Clear timerA
        dut.clockDomain.waitSamplingWhere(dut.io.fullA.toBoolean == true)
        dut.clockDomain.waitSampling(31 * 16 - 1)
        assert(dut.io.fullA.toBoolean == false, "dut.io.fullA should be false")
        dut.clockDomain.waitSampling(1)
        assert(dut.io.fullA.toBoolean == true, "dut.io.fullA should be true")

        testId = 7
        dut.io.external.tick #= false
        dut.io.external.clear #= false
        driver.write(0x00, 0x00020004) // timerA clockdivider tick self reset
        driver.write(0x08, 0x00000000) // Clear timerA
        dut.io.external.tick #= true
        dut.clockDomain.waitSampling(6)
        dut.io.external.tick #= false
        apbReadAssert(0x08, 0x00000006, 0x0000FFFF, "TimerA external tick doesn't work")
        dut.io.external.clear #= true
        dut.clockDomain.waitSampling(1)
        dut.io.external.tick #= false
        apbReadAssert(0x08, 0x00000000, 0x0000FFFF, "TimerA external clear doesn't work")
      }

      testSetB

      def testSetC : Unit = {
        dut.clockDomain.waitSampling(100)

        testId = 8
        driver.write(0x18, 0x00000000) // Clear timerB
        apbReadAssert(0x18, 0x00000000, 0x000000FF, "TimerA clear/read value doesn't work")

        testId = 9
        driver.write(0x14, 0x0000003F) // timerB set limit
        apbReadAssert(0x14, 0x0000003F, 0x000000FF, "TimerA limit read/write doesn't work")

        testId = 10
        driver.write(0x14, 0x0000001F) // timerB set limit
        apbReadAssert(0x14, 0x0000001F, 0x000000FF, "TimerA limit read/write doesn't work")
        driver.write(0x10, 0x00000001) // timerB self tick
        dut.clockDomain.waitSampling(31)
        assert(dut.io.fullB.toBoolean == false, "dut.io.fullB should be false")
        dut.clockDomain.waitSampling(1)
        assert(dut.io.fullB.toBoolean == true, "dut.io.fullB should be true")

        testId = 11
        dut.clockDomain.waitSampling(2)
        driver.write(0x14, 0x0000002F)
        dut.clockDomain.waitSampling(47)
        assert(dut.io.fullB.toBoolean == false, "dut.io.fullB should be false")
        dut.clockDomain.waitSampling(1)
        assert(dut.io.fullB.toBoolean == true, "dut.io.fullB should be true")
      }
      testSetC

      def testSetD : Unit = {
        testId = 12
        driver.write(0x14, 0x0000001F)
        driver.write(0x10, 0x00010001) // timerB self tick self reset
        driver.write(0x18, 0x00000000) // Clear timerB
        dut.clockDomain.waitSamplingWhere(dut.io.fullB.toBoolean == true)
        dut.clockDomain.waitSampling(31)
        assert(dut.io.fullB.toBoolean == false, "dut.io.fullB should be false")
        dut.clockDomain.waitSampling(1)
        assert(dut.io.fullB.toBoolean == true, "dut.io.fullB should be true")

        testId = 13
        driver.write(0x10, 0x00010002) // timerB clockdivider tick self reset
        driver.write(0x18, 0x00000000) // Clear timerB
        dut.clockDomain.waitSamplingWhere(dut.io.fullB.toBoolean == true)
        dut.clockDomain.waitSampling(31 * 16 - 1)
        assert(dut.io.fullB.toBoolean == false, "dut.io.fullB should be false")
        dut.clockDomain.waitSampling(1)
        assert(dut.io.fullB.toBoolean == true, "dut.io.fullB should be true")

        testId = 14
        dut.io.external.tick #= false
        dut.io.external.clear #= false
        driver.write(0x10, 0x00020004) // timerB clockdivider tick self reset
        driver.write(0x18, 0x00000000) // Clear timerB
        dut.io.external.tick #= true
        dut.clockDomain.waitSampling(6)
        dut.io.external.tick #= false
        apbReadAssert(0x18, 0x00000006, 0x000000FF, "TimerA external tick doesn't work")
        dut.io.external.clear #= true
        dut.clockDomain.waitSampling(1)
        dut.io.external.tick #= false
        apbReadAssert(0x18, 0x00000000, 0x000000FF, "TimerA external clear doesn't work")


        dut.clockDomain.waitSampling(10)
      }
      testSetD
    }
  }
}

