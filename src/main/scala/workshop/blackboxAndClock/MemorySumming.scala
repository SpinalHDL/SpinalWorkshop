package workshop.blackboxAndClock

import spinal.core._
import spinal.lib._


// Define a Ram as a BlackBox
case class Ram_1w_1r_2c(wordWidth: Int, addressWidth: Int,writeClock : ClockDomain,readClock : ClockDomain) extends BlackBox {
  // TODO define Generics

  // TODO define IO

  // TODO define ClockDomains mappings
}

// Create the top level and instanciate the Ram
case class MemorySumming(writeClock : ClockDomain,sumClock : ClockDomain) extends Component {
  val io = new Bundle {
    val wr = new Bundle {
      val en   = in Bool
      val addr = in UInt (8 bits)
      val data = in Bits (16 bits)
    }

    val sum = new Bundle{
      val start = in Bool
      val done  = out Bool
      val value = out UInt(16 bits)
    }
  }

  // TODO define the ram

  // TODO connect the io.wr port to the ram

  val sumArea = new ClockingArea(sumClock){
    // TODO define the memory read + summing logic
  }
}
