package workshop.blackboxAndClock

import org.scalatest.FunSuite
import spinal.core._

//Run this scala test to generate and check that your RTL work correctly
class MemorySummingTester extends FunSuite{
  test("test") {
    SpinalVhdl(MemorySumming(ClockDomain.external("io_wr"),ClockDomain.external("io_sum")))
    assert(doCmd(s"ghdl -a --ieee=synopsys  Ram_1w_1r_2c.vhd MemorySumming.vhd MemorySumming_tb.vhd") == 0,"GHDL analysis fail")
    assert(doCmd(s"ghdl -e --ieee=synopsys MemorySumming_tb"                   ) == 0,"GHDL elaboration fail")
    assert(doCmd(s"ghdl -r --ieee=synopsys MemorySumming_tb --vcd=MemorySummingTester.vcd --ieee-asserts=disable"    ) == 0,"GHDL simulation fail")
    println("SUCCESS")
  }

  def doCmd(cmd : String) : Int = {
    import scala.sys.process._
    println(cmd)
    cmd !
  }
}

