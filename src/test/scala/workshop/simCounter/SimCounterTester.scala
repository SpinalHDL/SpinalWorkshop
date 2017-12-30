package workshop.simCounter

import org.scalatest.FunSuite
import spinal.core._

//Just a simple wrapper for scala test purposes
class SimCounterTester extends FunSuite {
  test("pass on bug-free hardware") {
    SimCounterDut.errorId = 0
    SimCounterTestbench.main(null)
  }

  test("catch increment by two") {
    intercept [Throwable]{
      SimCounterDut.errorId = 1
      SimCounterTestbench.main(null)
    }
  }

  test("catch bad reset") {
    intercept [Throwable]{
      SimCounterDut.errorId = 2
      SimCounterTestbench.main(null)
    }
  }

  test("catch reversed enable") {
    intercept [Throwable]{
      SimCounterDut.errorId = 3
      SimCounterTestbench.main(null)
    }
  }

  SimCounterDut.errorId = 0
}

