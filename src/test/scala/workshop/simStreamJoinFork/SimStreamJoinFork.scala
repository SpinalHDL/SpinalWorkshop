package workshop.simStreamJoinFork

import org.scalatest.FunSuite

//Just a simple wrapper for scala test purposes
class SimStreamJoinFork extends FunSuite {
  test("pass on bug-free hardware") {
    SimStreamJoinForkDut.errorId = 0
    SimStreamJoinForkTestbench.main(null)
  }

  test("catch bad xor") {
    intercept [Throwable]{
      SimStreamJoinForkDut.errorId = 1
      SimStreamJoinForkTestbench.main(null)
    }
  }

  test("catch bad mul") {
    intercept [Throwable]{
      SimStreamJoinForkDut.errorId = 2
      SimStreamJoinForkTestbench.main(null)
    }
  }

  test("catch cmdA transaction vanish") {
    intercept [Throwable]{
      SimStreamJoinForkDut.errorId = 3
      SimStreamJoinForkTestbench.main(null)
    }
  }


  SimStreamJoinForkDut.errorId = 0
}

