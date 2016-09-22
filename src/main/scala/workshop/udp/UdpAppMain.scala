package workshop.udp

import spinal.core.{SpinalConfig, SpinalVhdl}


object UdpAppMain{
  def main(args: Array[String]) {
    SpinalConfig(targetDirectory = "rtl").generateVhdl(UdpApp("012345"))
  }
}
