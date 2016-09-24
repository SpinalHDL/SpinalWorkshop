package workshop.udp
import spinal.core._
import spinal.lib._
import spinal.lib.fsm.{EntryPoint, StateParallelFsm, State, StateMachine}


case class UdpAppCmd() extends Bundle{
  val ip      = Bits(32 bits)
  val srcPort = Bits(16 bits)
  val dstPort = Bits(16 bits)
  val length  = UInt(16 bits)
}

case class UdpAppBus() extends Bundle with IMasterSlave{
  val cmd = Stream(UdpAppCmd())
  val data = Stream(Fragment(Bits(8 bits)))

  override def asMaster(): Unit = master(cmd,data)
}

object Hello{
  val discoveringCmd = 0x11
  val discoveringRsp = 0x22
}

case class UdpApp(helloMessage : String,helloPort : Int = 37984) extends Component{
  val io = new Bundle{
    val rx = slave(UdpAppBus())
    val tx = master(UdpAppBus())
  }

  // TODO give default value to rx/tx output pins

  val fsm = new StateMachine{
    //Filter rx dst ports
    val idle : State = new State with EntryPoint{
      whenIsActive{
        // TODO Check io.rx.cmd dst port
      }
    }

    //Check the hello protocol Header
    val helloHeader = new State{
      whenIsActive {
        // TODO check that the first byte of the packet payload is equals to Hello.discoveringCmd
      }
    }

    //Send an discoveringRsp packet
    val discoveringRspTx = new StateParallelFsm(
      discoveringRspTxCmdFsm,
      discoveringRspTxDataFsm
    ){
      whenCompleted{
        //TODO return to IDLE
      }
    }
  }

  //Inner FSM of the discoveringRspTx state
  lazy val discoveringRspTxCmdFsm = new StateMachine{
    val sendCmd = new State with EntryPoint{
      whenIsActive{
        //TODO send one io.tx.cmd transaction
      }
    }
  }

  //Inner FSM of the discoveringRspTx state
  lazy val discoveringRspTxDataFsm = new StateMachine{
    val sendHeader = new State with EntryPoint{
      whenIsActive{
        //TODO send the io.tx.cmd header (Hello.discoveringRsp)
      }
    }

    val sendMessage = new State{
      val counter = Reg(UInt(log2Up(helloMessage.length) bits))
      onEntry{
        counter := 0
      }
      whenIsActive{
        //TODO send the message on io.tx.cmd header
      }
    }
  }
}
