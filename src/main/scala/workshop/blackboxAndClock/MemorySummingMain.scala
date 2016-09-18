package workshop.blackboxAndClock

import spinal.core.{ClockDomain, SpinalVhdl}


object MemorySummingMain{
  def main(args: Array[String]) {
    SpinalVhdl(MemorySumming(ClockDomain.external("io_wr"),ClockDomain.external("io_sum")))
  }
}
