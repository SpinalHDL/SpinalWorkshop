package workshop.timer

import org.scalatest.FunSuite
import spinal.core._

//Run this scala test to generate and check that your RTL work correctly
class TimerTester extends FunSuite{
  test("test") {
    SpinalConfig(targetDirectory = "rtl").generateVhdl(
      gen = Timer(width = 8)
    )
    assert(doCmd(s"ghdl -a --work=lib_timer --ieee=synopsys rtl/Timer.vhd rtl/Timer_tb.vhd") == 0,"GHDL analysis fail")
    assert(doCmd(s"ghdl -e --work=lib_timer --ieee=synopsys Timer_tb"                   ) == 0,"GHDL elaboration fail")
    assert(doCmd(s"ghdl -r --work=lib_timer --ieee=synopsys Timer_tb --vcd=waves/TimerTester.vcd --ieee-asserts=disable"    ) == 0,"GHDL simulation fail")
    println("SUCCESS")
  }

  def doCmd(cmd : String) : Int = {
    import scala.sys.process._
    println(cmd)
    cmd !
  }
}

