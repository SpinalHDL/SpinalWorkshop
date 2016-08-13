package workshop.uart

import org.scalatest.FunSuite
import spinal.core.SpinalVhdl


object UartCtrlRxMain{
  def main(args: Array[String]) {
    SpinalVhdl(new UartCtrlRx(UartRxGenerics(1,5,2)))
  }
}

class UartCtrlRxTester extends FunSuite{
  test("test") {
    SpinalVhdl(new UartCtrlRx(UartRxGenerics(1,5,2)))
    assert(doCmd(s"ghdl -a --ieee=synopsys UartCtrlRx.vhd UartCtrlRx_tb.vhd") == 0,"GHDL analysis fail")
    assert(doCmd(s"ghdl -e --ieee=synopsys UartCtrlRx_tb"                   ) == 0,"GHDL elaboration fail")
    assert(doCmd(s"ghdl -r --ieee=synopsys UartCtrlRx_tb --vcd=wave.vcd"    ) == 0,"GHDL simulation fail")
    println("SUCCESS")
  }

  def doCmd(cmd : String) : Int = {
    import scala.sys.process._
    println(cmd)
    cmd !
  }
}
