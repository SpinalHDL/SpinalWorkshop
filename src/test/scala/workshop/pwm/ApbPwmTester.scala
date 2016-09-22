package workshop.pwm

import org.scalatest.FunSuite
import spinal.core._

//Run this scala test to generate and check that your RTL work correctly
class ApbPwmTester extends FunSuite{
  test("test") {
    SpinalConfig(targetDirectory = "rtl").generateVhdl(
      gen = ApbPwm(
        apbConfig = ApbConfig(
          addressWidth = 8,
          dataWidth = 32,
          selWidth = 1
        ),
        timerWidth = 8
      )
    )
    assert(doCmd(s"ghdl -a --work=lib_apbpwm --ieee=synopsys rtl/ApbPwm.vhd rtl/ApbPwm_tb.vhd") == 0,"GHDL analysis fail")
    assert(doCmd(s"ghdl -e --work=lib_apbpwm --ieee=synopsys ApbPwm_tb"                   ) == 0,"GHDL elaboration fail")
    assert(doCmd(s"ghdl -r --work=lib_apbpwm --ieee=synopsys ApbPwm_tb --vcd=waves/ApbPwmTester.vcd --ieee-asserts=disable"    ) == 0,"GHDL simulation fail")
    println("SUCCESS")
  }

  def doCmd(cmd : String) : Int = {
    import scala.sys.process._
    println(cmd)
    cmd !
  }
}

