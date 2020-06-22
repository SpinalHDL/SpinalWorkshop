package workshop.timer

import spinal.core._
import spinal.lib._
import spinal.lib.bus.misc.BusSlaveFactory


case class Timer(width : Int) extends Component {
  val io = new Bundle {
    val tick = in Bool
    val clear = in Bool
    val limit = in UInt (width bits)

    val full  = out Bool
    val value = out UInt (width bits)
  }

  //TODO phase 1

  def driveFrom(busCtrl : BusSlaveFactory,baseAddress : BigInt)(ticks : Seq[Bool],clears : Seq[Bool]) = new Area {
    //TODO phase 2
  }
}