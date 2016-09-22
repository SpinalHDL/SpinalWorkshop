package workshop.timer

import spinal.core._
import workshop.uart.{UartCtrlRx, UartRxGenerics}




object TimerMain{
  def main(args: Array[String]) {
    SpinalConfig(targetDirectory = "rtl").generateVhdl(Timer(width = 16))
  }
}
