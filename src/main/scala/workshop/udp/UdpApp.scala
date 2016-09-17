package workshop.udp
import spinal.core._
import spinal.lib._
import spinal.lib.fsm.{EntryPoint, StateParallelFsm, State, StateMachine}

//case class UdpUnit(helloMessage : String) extends Component{
//  val io = new Bundle{
//    val helloCmd = slave Event
//    val helloRsp = master Stream(Fragment(Bits(8 bits)))
//
//    val udpRx = slave  Stream(Fragment(Bits(8 bits)))
//    val udpTx = master Stream(Fragment(Bits(8 bits)))
//  }
//}

//case class PacketGenerics( idWidth : Int,
//                           lengthWidth : Int)
//case class PacketHandle(g : PacketGenerics) extends Bundle{
//  val id = UInt(g.idWidth bits)
//}
//
//case class PacketReadCmd(g : PacketGenerics) extends Bundle{
//  val id = UInt(g.idWidth bits)
//  val address = UInt(g.lengthWidth bits)
//}
//
//case class UdpUnit(packetGenerics : PacketGenerics,helloMessage : String) extends Component{
//  val io = new Bundle{
//    val handle  = slave Stream(PacketHandle(packetGenerics))
//
//    val readCmd = master Stream(PacketReadCmd(packetGenerics))
//    val readRsp = slave  Stream(Bits(8 bits))
//
//    val tx      = master Stream(Bits(8 bits))
//  }
//}


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

  io.rx.cmd.ready := False
  io.rx.data.ready := False

  io.tx.cmd.valid := False
  io.tx.cmd.ip := io.rx.cmd.ip
  io.tx.cmd.srcPort := io.rx.cmd.dstPort
  io.tx.cmd.dstPort := io.rx.cmd.srcPort
  io.tx.cmd.length  := 1 + helloMessage.length

  io.tx.data.valid    := False
  io.tx.data.last := False
  io.tx.data.fragment := 0

  val flushRx = new Area{
    def apply(): Unit ={
      active := True
    }

    val active = RegInit(False)
    when(active){
      io.rx.data.ready := True
      when(io.rx.data.valid && io.rx.data.last){
        io.rx.cmd.ready := True
        active := False
      }
    }
  }


  val fsm = new StateMachine{
    
    //Filter rx dst ports
    val idle : State = new State with EntryPoint{
      whenIsActive{
        when(io.rx.cmd.valid && !flushRx.active){
          switch(io.rx.cmd.dstPort){
            is(helloPort){
              goto(helloHeader)
            }
            default{
              flushRx()
            }
          }
        }
      }
    }

    //Check the hello protocol Header
    val helloHeader = new State{
      whenIsActive {
        when(io.rx.data.valid) {
          switch(io.rx.data.fragment) {
            is(Hello.discoveringCmd) {
              goto(discoveringRspTx)
            }
            default {
              flushRx()
              goto(idle)
            }
          }
        }
      }
    }

    //Send an discoveringRsp packet
    val discoveringRspTx = new StateParallelFsm(
      new StateMachine{
        val sendCmd = new State with EntryPoint{
          whenIsActive{
            io.tx.cmd.valid := True
            when(io.tx.cmd.ready){
              exit()
            }
          }
        }
      },
      new StateMachine{
        val sendHeader = new State with EntryPoint{
          whenIsActive{
            io.tx.data.valid   := True
            io.tx.data.fragment := Hello.discoveringRsp
            when(io.tx.data.ready){
              goto(sendMessage)
            }
          }
        }
        val sendMessage = new State{
          val counter = Reg(UInt(log2Up(helloMessage.length) bits))
          onEntry{
            counter := 0
          }
          whenIsActive{
            io.tx.data.valid    := True
            io.tx.data.fragment := helloMessage.map(c => B(c.toInt,8 bits)).read(counter)
            io.tx.data.last := counter === helloMessage.length-1
            when(io.tx.data.ready){
              counter := counter + 1
              when(io.tx.data.last){
                exit()
              }
            }
          }
        }
      }){
      whenCompleted{
        flushRx()
        goto(idle)
      }
    }
  }
}
