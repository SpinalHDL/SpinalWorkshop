package workshop.stream

import spinal.core._
import spinal.lib._


case class MemoryWrite() extends Bundle{
  val address = UInt(16 bits)
  val data    = Bits(32 bits)
}

case class StreamComponent() extends Component{
  val io = new Bundle{
    val memWrite = slave Flow(MemoryWrite())
    val cmdA = slave Stream(UInt(16 bits))
    val cmdB = slave Stream(Bits(32 bits))
    val rsp = master Stream(Bits(32 bits))
  }

  val mem = Mem(Bits(32 bits),1 << 16)
  mem.write(
    enable = io.memWrite.valid,
    address = io.memWrite.address,
    data = io.memWrite.data
  )

  val memReadStream = io.cmdA.stage()
  val memReadData   = mem.readSync(
    enable = io.cmdA.fire,
    address = io.cmdA.payload
  )

  io.rsp << StreamJoin.arg(memReadStream,io.cmdB).translateWith(memReadData ^ io.cmdB.payload)
}


case class StreamComponentB() extends Component{
  val io = new Bundle{
    val memWrite = slave Flow(MemoryWrite())
    val cmdA = slave Stream(UInt(16 bits))
    val cmdB = slave Stream(Bits(32 bits))
    val rsp = master Stream(Bits(32 bits))
  }


  val mem = Mem(Bits(32 bits),1 << 16)
  mem.write(
    enable = io.memWrite.valid,
    address = io.memWrite.address,
    data = io.memWrite.data
  )

  val memReadValid = RegInit(False)
  val memReadReady = Bool

  when(memReadReady){
    memReadValid := False
  }
  when(!memReadValid || memReadReady){
    memReadValid := io.cmdA.valid
  }

  io.cmdA.ready := !memReadValid || memReadReady

  val memReadData = mem.readSync(
    enable = io.cmdA.fire,
    address = io.cmdA.payload
  )

  io.rsp.valid := memReadValid && io.cmdB.valid
  io.rsp.payload := memReadData ^ io.cmdB.payload
  memReadReady := io.rsp.fire
  io.cmdB.ready := io.rsp.fire
}