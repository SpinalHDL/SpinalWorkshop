package workshop.counter

import org.scalatest.FunSuite
import spinal.core._

//Run this scala test to generate and check that your RTL work correctly
class CounterTester extends FunSuite{
  test("test") {
    SpinalConfig(targetDirectory = "rtl").generateVhdl(Counter(width = 4))
    assert(doCmd(s"ghdl -a --work=lib_counter --ieee=synopsys rtl/Counter.vhd rtl/Counter_tb.vhd") == 0,"GHDL analysis fail")
    assert(doCmd(s"ghdl -e --work=lib_counter --ieee=synopsys Counter_tb"                   ) == 0,"GHDL elaboration fail")
    assert(doCmd(s"ghdl -r --work=lib_counter --ieee=synopsys Counter_tb --vcd=waves/CounterTester.vcd --ieee-asserts=disable"    ) == 0,"GHDL simulation fail")
    println("SUCCESS")
  }

  def doCmd(cmd : String) : Int = {
    import scala.sys.process._
    println(cmd)
    cmd !
  }
}

