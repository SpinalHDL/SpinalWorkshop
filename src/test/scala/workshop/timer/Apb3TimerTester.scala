package workshop.timer

import org.scalatest.FunSuite
import spinal.core._

//Run this scala test to generate and check that your RTL work correctly
class Apb3TimerTester extends FunSuite{
  test("test") {
    SpinalConfig(targetDirectory = "rtl").generateVhdl(
      gen = Apb3Timer()
    )
    assert(doCmd(s"ghdl -a --work=lib_apb3timer --ieee=synopsys rtl/Apb3Timer.vhd rtl/Apb3Timer_tb.vhd") == 0,"GHDL analysis fail")
    assert(doCmd(s"ghdl -e --work=lib_apb3timer --ieee=synopsys Apb3Timer_tb"                   ) == 0,"GHDL elaboration fail")
    assert(doCmd(s"ghdl -r --work=lib_apb3timer --ieee=synopsys Apb3Timer_tb --vcd=waves/Apb3TimerTester.vcd --ieee-asserts=disable"    ) == 0,"GHDL simulation fail")
    println("SUCCESS")
  }

  def doCmd(cmd : String) : Int = {
    import scala.sys.process._
    println(cmd)
    cmd !
  }
}

