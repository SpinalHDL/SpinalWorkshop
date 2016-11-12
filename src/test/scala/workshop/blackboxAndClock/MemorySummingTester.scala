package workshop.blackboxAndClock

import org.scalatest.FunSuite
import spinal.core._

//Run this scala test to generate and check that your RTL work correctly
class MemorySummingTester extends FunSuite{
  test("test") {
    SpinalConfig(targetDirectory = "rtl").generateVhdl(MemorySumming(ClockDomain.external("io_wr"),ClockDomain.external("io_sum")))
    assert(doCmd(s"ghdl -a --work=lib_memorysumming --ieee=synopsys rtl/Ram_1w_1r_2c.vhd rtl/MemorySumming.vhd rtl/MemorySumming_tb.vhd") == 0,"GHDL analysis fail")
    assert(doCmd(s"ghdl -e --work=lib_memorysumming --ieee=synopsys MemorySumming_tb"                   ) == 0,"GHDL elaboration fail")
    assert(doCmd(s"ghdl -r --work=lib_memorysumming --ieee=synopsys MemorySumming_tb --vcd=waves/MemorySummingTester.vcd --ieee-asserts=disable"    ) == 0,"GHDL simulation fail")
    println("SUCCESS")
  }

  def doCmd(cmd : String) : Int = {
    import scala.sys.process._
    println(cmd)
    cmd !
  }
}

