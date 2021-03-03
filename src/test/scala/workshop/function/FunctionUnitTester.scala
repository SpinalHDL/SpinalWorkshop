package workshop.function

import org.scalatest.FunSuite
import spinal.core._
import spinal.core.sim._
import workshop.common.WorkshopSimConfig

import scala.util.Random

//Run this scala test to generate and check that your RTL work correctly
class FunctionUnitTester extends FunSuite{
  var compiled: SimCompiled[FunctionUnit] = null

  test("compile") {
    compiled = WorkshopSimConfig().compile(FunctionUnit())
  }

  test("testbench") {
    compiled.doSim(seed = 42){dut =>
      dut.clockDomain.forkStimulus(10)
      dut.io.cmd.valid #= false

      def sendWithRandomTiming(value : BigInt) = {
        dut.clockDomain.waitSampling(Random.nextInt(4))
        dut.io.cmd.valid #= true
        dut.io.cmd.payload #= value
        dut.clockDomain.waitSampling()
        dut.io.cmd.valid #= false
        dut.io.cmd.payload.randomize()
      }

      def driveAndCheck(header : String,value : BigInt, pin : Bits) = {
        for(char <- header) {
          sendWithRandomTiming(char.toInt & 0xFF)
        }
        for(byteId <- 0 until widthOf(pin)/8) {
          sendWithRandomTiming((value >> byteId*8) & 0xFF)
        }
        dut.clockDomain.waitSampling(8)
        assert(pin.toBigInt === value, s"${pin.getName()} wasn't loaded correctly")
      }

       driveAndCheck("setValueA", 0x11l          , dut.io.valueA)
       driveAndCheck("setValueB", 0x22334455l    , dut.io.valueB)
       driveAndCheck("setValueC", 0x66778899AABBl, dut.io.valueC)
       driveAndCheck("setValueB", 0xCAFEF00Dl    , dut.io.valueB)
    }
  }
}
