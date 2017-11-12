package workshop.pwm

import org.scalatest.FunSuite
import spinal.core._
import spinal.lib._

//APB configuration class (generic/parameter)
case class ApbConfig(addressWidth : Int,
                     dataWidth    : Int,
                     selWidth     : Int)

//APB interface definition
case class Apb(config: ApbConfig) extends Bundle with IMasterSlave {
  //TODO define APB signals

  override def asMaster(): Unit = {
    //TODO define direction of each signal in a master mode

  }
}

case class ApbPwm(apbConfig: ApbConfig,timerWidth : Int) extends Component{
  require(apbConfig.dataWidth == 32)
  require(apbConfig.selWidth == 1)

  val io = new Bundle{
    val apb = ??? //TODO
    val pwm = ??? //TODO
  }

  val logic = new Area {
    //TODO define the PWM logic
  }
  
  val control = new Area{
    //TODO define the APB slave logic that will make PWM's registers writable/readable
  }
}