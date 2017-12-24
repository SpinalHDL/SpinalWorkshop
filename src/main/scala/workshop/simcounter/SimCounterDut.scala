package workshop.simcounter

import spinal.core._

class SimCounterDut extends Component{
  val io = new Bundle{
    val enable = in Bool
    val value = out UInt(8 bits)
  }

  val reg = Reg(UInt(8 bits)) init(0)
  when(io.enable){
    reg := reg + 1
  }
  io.value := reg
}
