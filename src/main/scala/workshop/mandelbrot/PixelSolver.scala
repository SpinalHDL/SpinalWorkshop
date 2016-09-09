package workshop.mandelbrot

import spinal.core._
import spinal.lib._

case class PixelSolverGenerics(fixAmplitude : Int,
                              fixResolution : Int,
                              iterationLimit : Int){
  val iterationWidth = log2Up(iterationLimit+1)
  def iterationType = UInt(iterationWidth bits)
  def fixType = SFix(
    peak = fixAmplitude exp,
    resolution = fixResolution exp
  )
}

case class PixelTask(g : PixelSolverGenerics) extends Bundle{
  val x,y = g.fixType
}

case class PixelResult(g : PixelSolverGenerics) extends Bundle{
  val iteration = g.iterationType
}

case class PixelSolver(g : PixelSolverGenerics) extends Component{
  val io = new Bundle{
    val pixelTask = slave Stream(PixelTask(g))
    val pixelResult = master Stream(PixelResult(g))
  }

  import g._

  //Define states
  val x,y       = Reg(fixType) init(0)
  val iteration = Reg(iterationType) init(0)

  //Do some shared calculation
  val xx = x*x
  val yy = y*y
  val xy = x*y

  //Apply default assignement
  io.pixelTask.ready := False
  io.pixelResult.valid := False
  io.pixelResult.iteration := iteration

  //Is the mandelbrot iteration done ?
  when(io.pixelTask.valid) {
    when(xx + yy >= 4.0 || iteration === iterationLimit) {
      io.pixelResult.valid := True
      when(io.pixelResult.ready){
        io.pixelTask.ready := True
        x := 0
        y := 0
        iteration := 0
      }
    } otherwise {
      x := (xx - yy + io.pixelTask.x).truncated
      y := (((xy) << 1) + io.pixelTask.y).truncated
      iteration := iteration + 1
    }
  }
}

