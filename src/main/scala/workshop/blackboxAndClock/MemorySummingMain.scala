package workshop.blackboxAndClock

import spinal.core.{SpinalConfig, ClockDomain, SpinalVhdl}


object MemorySummingMain{
  def main(args: Array[String]) {
    SpinalConfig(targetDirectory = "rtl").generateVerilog(MemorySumming(ClockDomain.external("io_wr"),ClockDomain.external("io_sum")))
  }
}
