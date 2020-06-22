## Description
The goal of this lab is to implement an component which implement an UDP application layer. This UDP application will be an server who listen to the port 37984 to return a message when an packet of one byte set to 0x11 is received

This lab will introduce :

- How to use the StateMachine library
- How to manage statemachine with inner states
- Kind of AXI-like communication layer protocol

## Bus specification
Receiving or transmitting UDP frames will be possible via the `UdpAppBus` interface.<br>

```scala
case class UdpAppBus() extends Bundle with IMasterSlave{
  val cmd  = Stream(UdpAppCmd())
  val data = Stream(Fragment(Bits(8 bits)))

  override def asMaster(): Unit = master(cmd,data)
}
```

The header of each packet will appear as a simple transaction on the `cmd` stream, while related payloads will appear as sequential transactions on the `data` stream (encapsulated by the Fragment concept).

The `UdpAppCmd` is constituted as following :

```scala
case class UdpAppCmd() extends Bundle{
  val ip      = Bits(32 bits)
  val srcPort = Bits(16 bits)
  val dstPort = Bits(16 bits)
  val length  = UInt(16 bits)
}
```

## Component interfaces

| Name | Direction | Type | Description |
| ------ | ----------- | ------ | ------ |
| rx | slave | UdpAppBus | Used to receive UDP packets |
| tx | master | UdpAppBus | Used to send UDP packets  |

## Hello protocol
The UDP application to implement has to implement the `Hello` protocol. This protocol has two different transactions :

| Name | Header byte | Payload | Direction | Description |
| ------ | ----------- | ------ | ------ | ------ | 
| discoveringCmd | 0x11 | - | C -> S | Ask for an discoveringRsp response |
| discoveringRsp | 0x22 | An string message of your choice |  S -> C |  Response given to an discoveringCmd packet |

## Notes
As usual there is an self tester testbench, but for this labs, there is also an testbench that wrap UDP transactions of the RTL simulation over the realworld network.

You can run this wrapped RTL by running `make` in the src/test/python/workshop/udp/onnetwork folder.<br>
You can also run a python script that will send an `discoveringCmd` and wait two seconds for `discoveringRsp` answers by running `python Client.py` in the same folder.<br>
By default Client.py broadcast requests are sent to the localhost (127.0.0.1). If you want to bind another network, you have to put the IP of your corresponding network card inside the ip.txt file.
