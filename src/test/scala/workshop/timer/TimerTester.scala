package workshop.timer

import org.scalatest.FunSuite
import spinal.core._

//Run this scala test to generate and check that your RTL work correctly
class TimerTester extends FunSuite{
  test("test") {
    SpinalVhdl(
      gen = Timer(width = 8)
    )
    assert(doCmd(s"ghdl -a --ieee=synopsys Timer.vhd Timer_tb.vhd") == 0,"GHDL analysis fail")
    assert(doCmd(s"ghdl -e --ieee=synopsys Timer_tb"                   ) == 0,"GHDL elaboration fail")
    assert(doCmd(s"ghdl -r --ieee=synopsys Timer_tb --vcd=TimerTester.vcd --ieee-asserts=disable"    ) == 0,"GHDL simulation fail")
    println("SUCCESS")
  }

  def doCmd(cmd : String) : Int = {
    import scala.sys.process._
    println(cmd)
    cmd !
  }
}

