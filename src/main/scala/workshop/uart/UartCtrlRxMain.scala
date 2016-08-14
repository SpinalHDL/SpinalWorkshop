package workshop.uart

import spinal.core.SpinalVhdl


object UartCtrlRxMain{
  def main(args: Array[String]) {
    SpinalVhdl(UartCtrlRx(UartRxGenerics(1,5,2)))
  }
}
