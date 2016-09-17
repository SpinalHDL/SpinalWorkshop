package workshop.udp

import org.scalatest.FunSuite
import spinal.core._
import workshop.common.CocotbRunner

//Run this scala test to generate and check that your RTL work correctly
class UdpAppOnNetwork extends FunSuite{
  test("test") {
    SpinalConfig().dumpWave(0,"UdpAppOnNetwork.vcd").generateVerilog(
      UdpApp("test1234")
    )

    assert(CocotbRunner("./src/test/python/workshop/udp/onnetwork"),"Simulation faild")
    println("SUCCESS")
  }
}
