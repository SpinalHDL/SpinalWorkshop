package workshop.uart

import spinal.core.{SpinalConfig, SpinalVhdl}


object UartCtrlRxMain{
  def main(args: Array[String]) {
    SpinalConfig(targetDirectory = "rtl").generateVhdl(UartCtrlRx(UartRxGenerics(1,5,2)))
  }
}
