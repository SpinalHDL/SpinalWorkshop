package workshop.stream

import org.scalatest.FunSuite
import spinal.core._
import spinal.core.sim._
import spinal.lib.sim.{StreamDriver, StreamMonitor, StreamReadyRandomizer}
import workshop.common.WorkshopSimConfig

import scala.collection.mutable
import scala.util.Random

//Run this scala test to generate and check that your RTL work correctly
class StreamUnitTester extends FunSuite{
  var compiled: SimCompiled[StreamUnit] = null

  test("compile") {
    compiled = WorkshopSimConfig().compile{
      val c = StreamUnit()
      c.mem.simPublic()
      c
    }
  }

  test("testbench") {
    compiled.doSimUntilVoid(seed = 42){dut =>
      dut.clockDomain.forkStimulus(10)
      SimTimeout(10*5000)

      var rspCounter = 0
      var ramLoaded = false
      val ramContent = Array.fill(256)(Random.nextLong() & 0xFFFFFFFFl)

      StreamDriver(dut.io.cmdA, dut.clockDomain){p => p.randomize(); ramLoaded}
      StreamDriver(dut.io.cmdB, dut.clockDomain){p => p.randomize(); ramLoaded}
      StreamReadyRandomizer(dut.io.rsp, dut.clockDomain)

      val aHistory = mutable.Queue[Int]()
      val bHistory = mutable.Queue[Long]()
      StreamMonitor(dut.io.cmdA, dut.clockDomain){p => aHistory.enqueue(p.toInt)};
      StreamMonitor(dut.io.cmdB, dut.clockDomain){p => bHistory.enqueue(p.toLong)}
      StreamMonitor(dut.io.rsp, dut.clockDomain){p =>
        assert(aHistory.nonEmpty, "Got a rsp transaction without cmdA transaction")
        assert(bHistory.nonEmpty, "Got a rsp transaction without cmdB transaction")
        val a = aHistory.dequeue()
        val b = bHistory.dequeue()
        val ref = ramContent(a) ^ b
        assert(p.toLong == ref, f"rsp had the wrong value from cmdA=$a cmdB=$b%x mem(cmdB)=${ramContent(a)}%x")
        rspCounter = rspCounter + 1
        if(rspCounter == 100) simSuccess()
      }

      for(i <- 0 to 255){
        dut.io.memWrite.valid #= true
        dut.io.memWrite.address #= i
        dut.io.memWrite.data #= ramContent(i)
        dut.clockDomain.waitSampling()
      }
      dut.clockDomain.waitSampling()
      for(i <- 0 to 255){
        assert(dut.mem.getBigInt(i) == ramContent(i), s"dut.mem($i) wasn't written properly")
      }
      ramLoaded = true
    }
  }
}
