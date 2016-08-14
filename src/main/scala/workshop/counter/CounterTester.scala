package workshop.counter

import org.scalatest.FunSuite
import spinal.core._

//Run this scala test to generate and check that your RTL work correctly
class CounterTester extends FunSuite{
  test("test") {
    SpinalVhdl(Counter(width = 4))
    assert(doCmd(s"ghdl -a --ieee=synopsys Counter.vhd Counter_tb.vhd") == 0,"GHDL analysis fail")
    assert(doCmd(s"ghdl -e --ieee=synopsys Counter_tb"                   ) == 0,"GHDL elaboration fail")
    assert(doCmd(s"ghdl -r --ieee=synopsys Counter_tb --vcd=CounterTester.vcd"    ) == 0,"GHDL simulation fail")
    println("SUCCESS")
  }

  def doCmd(cmd : String) : Int = {
    import scala.sys.process._
    println(cmd)
    cmd !
  }
}

