package workshop.timer

import spinal.core._


object Apb3TimerMain{
  def main(args: Array[String]) {
    SpinalConfig(targetDirectory = "rtl").generateVhdl(Apb3Timer())
  }
}
