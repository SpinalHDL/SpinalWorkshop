package workshop.simCounter

import spinal.core._


object SimCounterDut{
  var errorId = 0
}

class SimCounterDut extends Component{
  val io = new Bundle{
    val enable = in Bool()
    val value = out UInt(8 bits)
  }

  val reg = Reg(UInt(8 bits)) init(if(SimCounterDut.errorId == 2) 43 else 0)
  when(if(SimCounterDut.errorId == 3) !io.enable else io.enable){
    reg := reg + 1 + (if(SimCounterDut.errorId == 1) 1 else 0)
  }
  io.value := reg
}
