package workshop.blackboxAndClock

import spinal.core._
import spinal.lib._


// Define a Ram as a BlackBox
case class Ram_1w_1r_2c(wordWidth: Int, wordCount: Int,writeClock : ClockDomain,readClock : ClockDomain) extends BlackBox {
  // TODO define Generics

  // TODO define IO

  // TODO define ClockDomains mappings
}

// Create the top level and instanciate the Ram
case class MemorySumming(writeClock : ClockDomain,sumClock : ClockDomain) extends Component {
  // TODO define IO

  // TODO define the ram

  // TODO connect the io.wr port to the ram

  val sumArea = new ClockingArea(sumClock){
    // TODO define the memory read + summing logic
  }
}
