package workshop.function

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import workshop.common.CocotbRunner

//Run this scala test to generate and check that your RTL work correctly
class FunctionUnitTester extends AnyFunSuite{
  test("test") {
    SpinalConfig(targetDirectory = "rtl").dumpWave(0,"../../../../../waves/FunctionUnitTester.vcd").generateVerilog(
      FunctionUnit()
    )

    assert(CocotbRunner("./src/test/python/workshop/function"),"Simulation faild")
    println("SUCCESS")
  }
}
