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
  val start        = RegInit(True) clearWhen(io.pixelTask.valid && !io.pixelResult.valid) setWhen(io.pixelTask.ready)
  val xReg,yReg    = Reg(fixType)
  val iterationReg = Reg(g.iterationType)

  //Mux algorithm inputs depending the start state
  val x         = start ? io.pixelTask.x | xReg
  val y         = start ? io.pixelTask.y | yReg
  val iteration = start ? U(0)           | iterationReg

  //Do some shared calculation
  val xx = x*x
  val yy = y*y
  val xy = x*y

  //Apply default assignement
  io.pixelTask.ready := False
  io.pixelResult.valid := False
  io.pixelResult.iteration := iteration

  //Is the mandelbrot iteration done ?
  when(xx + yy >= 4.0 || iteration === iterationLimit){
    io.pixelResult.valid := io.pixelTask.valid
    io.pixelTask.ready   := io.pixelResult.ready
  } otherwise{
    xReg := (xx - yy + io.pixelTask.x).truncated
    yReg := (((xy) << 1) + io.pixelTask.y).truncated
    iterationReg := iteration + 1
  }
}

