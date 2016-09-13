package workshop.function

import org.scalatest.FunSuite
import spinal.core._
import workshop.common.CocotbRunner

//Run this scala test to generate and check that your RTL work correctly
class FunctionUnitTester extends FunSuite{
  test("test") {
    SpinalConfig().dumpWave(0,"FunctionUnitTester.vcd").generateVerilog(
      FunctionUnit()
    )

    assert(CocotbRunner("./src/test/python/workshop/function"),"Simulation faild")
    println("SUCCESS")
  }
}
