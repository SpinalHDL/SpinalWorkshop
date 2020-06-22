package workshop.simStreamJoinFork

import spinal.core._
import spinal.lib._

object SimStreamJoinForkDut{
  var errorId = 0
}

class SimStreamJoinForkDut extends Component{
  val io = new Bundle{
    val cmdA = slave Stream(UInt(32 bits))
    val cmdB = slave Stream(UInt(32 bits))
    val rspMul = master Stream(UInt(64 bits))
    val rspXor = master Stream(UInt(32 bits))
  }
  import SimStreamJoinForkDut.errorId

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

  io.rspMul << cmdMul.translateWith(cmdMul.a * cmdMul.b + (if(errorId == 2) 4 else 0)).stage().stage()
  io.rspXor << cmdXor.translateWith(cmdXor.a ^ cmdXor.b ^ (if(errorId == 1) 4 else 0)).s2mPipe()

  if(errorId == 3) cmdABuffer.ready setWhen(cmdABuffer.payload(2 downto 0) === 2)
}
