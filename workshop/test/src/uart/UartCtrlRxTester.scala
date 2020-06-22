package workshop.uart

import org.scalatest.FunSuite
import spinal.core.sim._
import spinal.sim._
import spinal.core._
import workshop.common.WorkshopSimConfig

import scala.collection.mutable
import scala.util.Random
class UartCtrlRxTester extends FunSuite{
  var compiled: SimCompiled[UartCtrlRx] = null

  test("compile") {
    compiled = WorkshopSimConfig().compile(UartCtrlRx(UartRxGenerics(1,5,2)))
  }

  test("testbench") {
    compiled.doSim { dut =>
      dut.clockDomain.forkStimulus(10)
      SimTimeout(10*10000)

      val baudPeriod = 800
      dut.io.rxd #= true

      //Send an uart frame to the DUT
      def tbToDut(buffer : Int) = {
        dut.io.rxd #= false
        sleep(baudPeriod)

        (0 to 7).foreach{ bitId =>
          dut.io.rxd #= ((buffer >> bitId) & 1) != 0
          sleep(baudPeriod)
        }

        dut.io.rxd #= true
        sleep(baudPeriod)
      }
      dut.clockDomain.waitSampling(100)
      fork{
        while(true) {
          dut.io.samplingTick #= true
          dut.clockDomain.waitSampling()
          dut.io.samplingTick #= false
          dut.clockDomain.waitSampling(baudPeriod / 10 / 8 - 1)
        }
      }

      val readQueue = mutable.Queue[Int]()
      fork{
        while(true) {
          dut.clockDomain.waitSamplingWhere(dut.io.read.valid.toBoolean)
          readQueue.enqueue(dut.io.read.payload.toInt)
        }
      }

      //Test RXD
      def testTbToDut(data : Int): Unit ={
        sleep(baudPeriod*8)
        assert(readQueue.length == 0, "Uart frame pop from nowhere")
        fork(tbToDut(data))
        sleep(baudPeriod*(1+8+3))
        if(readQueue.length == 0) simFailure("Uart frame lost")
        if(readQueue.length > 1) simFailure("Uart transaction appear from nowhere")
        assert(readQueue.dequeue() == data, "UART data are corrupted")
      }

      testTbToDut(0x00)
      testTbToDut(0xFF)
      testTbToDut(0xAA)
      testTbToDut(0xEE)
      testTbToDut(0x42)

    }
  }
}
