package workshop.timer

import org.scalatest.FunSuite
import spinal.core._
import spinal.core.sim._
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
      def apb = dut.io.apb
      def apbWrite(address : BigInt, data : BigInt) : Unit@suspendable = {
        apb.PSEL #= 1
        apb.PENABLE #= false
        apb.PWRITE #= true
        apb.PADDR #= address
        apb.PWDATA #= data
        dut.clockDomain.waitSampling()
        apb.PENABLE #= true
        dut.clockDomain.waitSamplingWhere(apb.PREADY.toBoolean)
        apb.PSEL #= 0
        apb.PENABLE.randomize()
        apb.PADDR.randomize()
        apb.PWDATA.randomize()
        apb.PWRITE.randomize()
      }

      def apbReadImpl(address : BigInt) : BigInt@suspendable = {
        apb.PSEL #= 1
        apb.PENABLE #= false
        apb.PADDR #= address
        apb.PWRITE #= false
        dut.clockDomain.waitSampling()
        apb.PENABLE #= true
        dut.clockDomain.waitSamplingWhere(apb.PREADY.toBoolean)
        apb.PSEL #= 0
        apb.PENABLE.randomize()
        apb.PADDR.randomize()
        apb.PWDATA.randomize()
        apb.PWRITE.randomize()
        apb.PRDATA.toBigInt
      }
      var testId = 0

      def apbRead(address : BigInt, data : BigInt, mask : BigInt, message : String) : Unit@suspendable =  assert((apbReadImpl(address) & mask) == data, "Test case " + testId + " :" + message)



      dut.io.apb.PENABLE #= false
      dut.io.apb.PSEL #= 0

      dut.clockDomain.waitSampling(1)

      testId = 1
      apbWrite(0x08,0x00000000)    // Clear timerA
      apbRead (0x08,0x00000000,0x0000FFFF,"TimerA clear/read value doesn't work")

      testId = 2
      apbWrite(0x04,0x0000003F)    // timerA set limit
      apbRead (0x04,0x0000003F,0x0000FFFF,"TimerA limit read/write doesn't work")

      testId = 3
      apbWrite(0x04,0x0000001F)    // timerA set limit
      apbRead (0x04,0x0000001F,0x0000FFFF,"TimerA limit read/write doesn't work")
      apbWrite(0x00,0x00000001)    // timerA self tick
      dut.clockDomain.waitSampling(31)
      assert( dut.io.fullA.toBoolean == false , "dut.io.fullA should be false" )
      dut.clockDomain.waitSampling(1)
      assert( dut.io.fullA.toBoolean == true , "dut.io.fullA should be true" )

      testId = 4
      dut.clockDomain.waitSampling(2)
      apbWrite(0x04,0x0000002F)
      dut.clockDomain.waitSampling(47)
      assert( dut.io.fullA.toBoolean == false , "dut.io.fullA should be false" )
      dut.clockDomain.waitSampling(1)
      assert( dut.io.fullA.toBoolean == true , "dut.io.fullA should be true" )

      testId = 5
      apbWrite(0x04,0x0000001F)
      apbWrite(0x00,0x00010001)    // timerA self tick self reset
      apbWrite(0x08,0x00000000)    // Clear timerA
      dut.clockDomain.waitSamplingWhere(dut.io.fullA.toBoolean == true)
      dut.clockDomain.waitSampling(31)
      assert( dut.io.fullA.toBoolean == false , "dut.io.fullA should be false" )
      dut.clockDomain.waitSampling(1)
      assert( dut.io.fullA.toBoolean == true , "dut.io.fullA should be true" )

      testId = 6
      apbWrite(0x00,0x00010002)    // timerA clockdivider tick self reset
      apbWrite(0x08,0x00000000)    // Clear timerA
      dut.clockDomain.waitSamplingWhere(dut.io.fullA.toBoolean == true)
      dut.clockDomain.waitSampling(31*16-1)
      assert( dut.io.fullA.toBoolean == false , "dut.io.fullA should be false" )
      dut.clockDomain.waitSampling(1)
      assert( dut.io.fullA.toBoolean == true , "dut.io.fullA should be true" )

      testId = 7
      dut.io.external.tick #= false
      dut.io.external.clear #= false
      apbWrite(0x00,0x00020004)    // timerA clockdivider tick self reset
      apbWrite(0x08,0x00000000)    // Clear timerA
      dut.io.external.tick #= true
      dut.clockDomain.waitSampling(6)
      dut.io.external.tick #= false
      apbRead (0x08,0x00000006,0x0000FFFF,"TimerA external tick doesn't work")
      dut.io.external.clear #= true
      dut.clockDomain.waitSampling(1)
      dut.io.external.tick #= false
      apbRead (0x08,0x00000000,0x0000FFFF,"TimerA external clear doesn't work")


      dut.clockDomain.waitSampling(100)

      testId = 8
      apbWrite(0x18,0x00000000)    // Clear timerB
      apbRead (0x18,0x00000000,0x000000FF,"TimerA clear/read value doesn't work")

      testId = 9
      apbWrite(0x14,0x0000003F)    // timerB set limit
      apbRead (0x14,0x0000003F,0x000000FF,"TimerA limit read/write doesn't work")

      testId = 10
      apbWrite(0x14,0x0000001F)    // timerB set limit
      apbRead (0x14,0x0000001F,0x000000FF,"TimerA limit read/write doesn't work")
      apbWrite(0x10,0x00000001)    // timerB self tick
      dut.clockDomain.waitSampling(31)
      assert( dut.io.fullB.toBoolean == false , "dut.io.fullB should be false" )
      dut.clockDomain.waitSampling(1)
      assert( dut.io.fullB.toBoolean == true , "dut.io.fullB should be true" )

      testId = 11
      dut.clockDomain.waitSampling(2)
      apbWrite(0x14,0x0000002F)
      dut.clockDomain.waitSampling(47)
      assert( dut.io.fullB.toBoolean == false , "dut.io.fullB should be false" )
      dut.clockDomain.waitSampling(1)
      assert( dut.io.fullB.toBoolean == true , "dut.io.fullB should be true" )

      testId = 12
      apbWrite(0x14,0x0000001F)
      apbWrite(0x10,0x00010001)    // timerB self tick self reset
      apbWrite(0x18,0x00000000)    // Clear timerB
      dut.clockDomain.waitSamplingWhere(dut.io.fullB.toBoolean == true)
      dut.clockDomain.waitSampling(31)
      assert( dut.io.fullB.toBoolean == false , "dut.io.fullB should be false" )
      dut.clockDomain.waitSampling(1)
      assert( dut.io.fullB.toBoolean == true , "dut.io.fullB should be true" )

      testId = 13
      apbWrite(0x10,0x00010002)    // timerB clockdivider tick self reset
      apbWrite(0x18,0x00000000)    // Clear timerB
      dut.clockDomain.waitSamplingWhere(dut.io.fullB.toBoolean == true)
      dut.clockDomain.waitSampling(31*16-1)
      assert( dut.io.fullB.toBoolean == false , "dut.io.fullB should be false" )
      dut.clockDomain.waitSampling(1)
      assert( dut.io.fullB.toBoolean == true , "dut.io.fullB should be true" )

      testId = 14
      dut.io.external.tick #= false
      dut.io.external.clear #= false
      apbWrite(0x10,0x00020004)    // timerB clockdivider tick self reset
      apbWrite(0x18,0x00000000)    // Clear timerB
      dut.io.external.tick #= true
      dut.clockDomain.waitSampling(6)
      dut.io.external.tick #= false
      apbRead (0x18,0x00000006,0x000000FF,"TimerA external tick doesn't work")
      dut.io.external.clear #= true
      dut.clockDomain.waitSampling(1)
      dut.io.external.tick #= false
      apbRead (0x18,0x00000000,0x000000FF,"TimerA external clear doesn't work")




      dut.clockDomain.waitSampling(10)
    }
  }
}

