package workshop.prime

import org.scalatest.FunSuite
import spinal.core._
import workshop.common.CocotbRunner
import workshop.function.{PrimeUsage, FunctionUnit}

//Run this scala test to generate and check that your RTL work correctly
class PrimeTester extends FunSuite{
  test("test") {
    SpinalConfig(targetDirectory = "rtl").dumpWave(0,"../../../../../waves/PrimeTester.vcd").generateVerilog(
      PrimeUsage(5)
    )

    assert(CocotbRunner("./src/test/python/workshop/prime"),"Simulation faild")
    println("SUCCESS")
  }
}
