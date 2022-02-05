package workshop.timer

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba3.apb.{Apb3SlaveFactory, Apb3}

case class Apb3Timer() extends Component{
  val io = new Bundle{
    val apb = slave(Apb3(addressWidth = 8,dataWidth = 32))
    val fullA = out Bool()
    val fullB = out Bool()
    val external = new Bundle{
      val tick  = in Bool()
      val clear = in Bool()
    }
  }

  val clockDivider = new Area{
    val counter = Reg(UInt(4 bits)) init(0)
    counter := counter + 1
    val full = counter === 0xF
  }

  val apbCtrl = Apb3SlaveFactory(io.apb)
  val timerA  = Timer(width = 16)
  val bridgeA = timerA.driveFrom(apbCtrl,0x00)(
    ticks  = List(True,clockDivider.full,io.external.tick),
    clears = List(timerA.io.full,io.external.clear)
  )

  val timerB  = Timer(width = 8)
  val bridgeB = timerB.driveFrom(apbCtrl,0x10)(
    ticks  = List(True,clockDivider.full,io.external.tick),
    clears = List(timerB.io.full,io.external.clear)
  )

  io.fullA := timerA.io.full
  io.fullB := timerB.io.full
}
