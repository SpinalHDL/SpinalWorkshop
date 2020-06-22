package workshop.pwm

import spinal.core._


//Run this main to generate the RTL
object ApbPwmMain{
  def main(args: Array[String]) {
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
  }
}