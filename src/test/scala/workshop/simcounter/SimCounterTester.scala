package workshop.simcounter

import org.scalatest.FunSuite
import spinal.core._

//Just a simple wrapper for scala test purposes
class SimCounterTester extends FunSuite{
  test("test") {
    SimCounterTestbench.main(null)
  }
}

