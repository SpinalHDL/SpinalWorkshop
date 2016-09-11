package workshop.stream

import org.scalatest.FunSuite
import spinal.core._
import workshop.common.CocotbRunner

//Run this scala test to generate and check that your RTL work correctly
class StreamUnitTester extends FunSuite{
  test("test") {
    SpinalConfig().dumpWave(0,"PixelSolverTester.vcd").generateVerilog(
      StreamUnit()
    )

    assert(CocotbRunner("./src/test/python/workshop/stream"),"Simulation faild")
    println("SUCCESS")
  }
}
