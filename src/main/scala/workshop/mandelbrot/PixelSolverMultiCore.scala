package workshop.mandelbrot

import spinal.core._
import spinal.lib._


case class PixelSolverMultiCore(g : PixelSolverGenerics,coreCount : Int) extends Component {
  val io = new Bundle {
    val pixelTask = slave Stream (PixelTask(g))
    val pixelResult = master Stream (PixelResult(g))
  }

  val pixelTaskDispatcher = new StreamDispatcherSequencial(PixelTask(g), coreCount)
  val pixelTaskSolver    = List.fill(coreCount)(PixelSolver(g))
  val pixelResultArbiter = StreamArbiterFactory.sequentialOrder.build(PixelResult(g), coreCount)
  
  pixelTaskDispatcher.io.input << io.pixelTask
  for (solverId <- 0 until coreCount) {
    pixelTaskSolver(solverId).io.pixelTask <-< pixelTaskDispatcher.io.outputs(solverId)
    pixelResultArbiter.io.inputs(solverId) <-< pixelTaskSolver(solverId).io.pixelResult
  }
  io.pixelResult <-< pixelResultArbiter.io.output
}