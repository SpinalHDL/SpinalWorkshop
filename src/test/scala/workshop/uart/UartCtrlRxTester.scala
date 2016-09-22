package workshop.uart

import org.scalatest.FunSuite
import spinal.core.{SpinalConfig, SpinalVhdl}

class UartCtrlRxTester extends FunSuite{
  test("test") {
    SpinalConfig(targetDirectory = "rtl").generateVhdl(UartCtrlRx(UartRxGenerics(1,5,2)))
    assert(doCmd(s"ghdl -a --work=lib_uartctrlrx --ieee=synopsys rtl/UartCtrlRx.vhd rtl/UartCtrlRx_tb.vhd") == 0,"GHDL analysis fail")
    assert(doCmd(s"ghdl -e --work=lib_uartctrlrx --ieee=synopsys UartCtrlRx_tb"                   ) == 0,"GHDL elaboration fail")
    assert(doCmd(s"ghdl -r --work=lib_uartctrlrx --ieee=synopsys UartCtrlRx_tb --vcd=waves/uartCtrlRxTester.vcd --ieee-asserts=disable"    ) == 0,"GHDL simulation fail")
    println("SUCCESS")
  }

  def doCmd(cmd : String) : Int = {
    import scala.sys.process._
    println(cmd)
    cmd !
  }
}
