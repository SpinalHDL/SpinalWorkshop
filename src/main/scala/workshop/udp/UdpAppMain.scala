package workshop.udp

import spinal.core.SpinalVhdl


object UdpAppMain{
  def main(args: Array[String]) {
    SpinalVhdl(UdpApp("012345"))
  }
}
