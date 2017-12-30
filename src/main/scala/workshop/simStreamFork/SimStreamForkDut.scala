package workshop.simStreamFork

import spinal.core._
import spinal.lib._

object SimStreamForkDut{
  var errorId = 0
}

class SimStreamForkDut extends Component{
  val io = new Bundle{
    val cmdA = slave Stream(UInt(32 bits))
    val cmdB = slave Stream(UInt(32 bits))
    val rspMul = master Stream(UInt(64 bits))
    val rspXor = master Stream(UInt(32 bits))
  }

  val cmdABuffer = io.cmdA.stage().stage()
  val cmdBBuffer = io.cmdB.stage()

  case class Cmd() extends Bundle{
    val a,b = UInt(32 bits)
  }
  val cmdJoin = Stream(Cmd())

  cmdJoin.arbitrationFrom(StreamJoin.arg(cmdABuffer, cmdBBuffer))
  cmdJoin.a := cmdABuffer.payload
  cmdJoin.b := cmdBBuffer.payload

  val (cmdMul, cmdXor) = StreamFork2(cmdJoin.stage)

  io.rspMul << cmdMul.translateWith(cmdMul.a * cmdMul.b).stage().stage()
  io.rspXor << cmdXor.translateWith(cmdXor.a ^ cmdXor.b).s2mPipe()
}
