package workshop.common

import spinal.core.SpinalConfig
import spinal.core.sim.SimConfig

object WorkshopSimConfig {
  def apply() = SimConfig.withWave.withConfig(SpinalConfig(targetDirectory = "rtl")).workspacePath("waves")
}
