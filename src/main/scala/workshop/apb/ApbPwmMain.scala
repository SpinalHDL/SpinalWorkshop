package workshop.apb

import org.scalatest.FunSuite
import spinal.core._


//Run this main to generate the RTL
object ApbPwmMain{
  def main(args: Array[String]) {
    SpinalVhdl(
      gen = ApbPwm(
        apbConfig = ApbConfig(
          addressWidth = 8,
          dataWidth = 32,
          selWidth = 1
        ),
        timerWidth = 8
      )
    )
  }
}

//Run this scala test to generate and check that your RTL work correctly
class ApbPwmTester extends FunSuite{
  test("test") {
    SpinalVhdl(
      gen = ApbPwm(
        apbConfig = ApbConfig(
          addressWidth = 8,
          dataWidth = 32,
          selWidth = 1
        ),
        timerWidth = 8
      )
    )
    assert(doCmd(s"ghdl -a --ieee=synopsys ApbPwm.vhd ApbPwm_tb.vhd") == 0,"GHDL analysis fail")
    assert(doCmd(s"ghdl -e --ieee=synopsys ApbPwm_tb"                   ) == 0,"GHDL elaboration fail")
    assert(doCmd(s"ghdl -r --ieee=synopsys ApbPwm_tb --vcd=wave.vcd"    ) == 0,"GHDL simulation fail")
    println("SUCCESS")
  }

  def doCmd(cmd : String) : Int = {
    import scala.sys.process._
    println(cmd)
    cmd !
  }
}

