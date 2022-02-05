package workshop.prime

import spinal.core._


case class PrimeUsage(width : Int = 8) extends Component{
  val io = new Bundle{
    val value = in UInt(width bits)
    val isPrime = out Bool()
  }

  io.isPrime := Prime(io.value)
}


//Run this main to generate the RTL
object PrimeMain{
  def main(args: Array[String]) {
    SpinalConfig(targetDirectory = "rtl").generateVerilog(PrimeUsage(width = 5))
  }
}
