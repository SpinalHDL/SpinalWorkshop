// build.sc
import mill._, scalalib._

val SpinalVersion = "1.4.1"

trait CommonSpinalModule extends ScalaModule {
  def scalaVersion = "2.12.11"

  def scalacOptions = Seq("-unchecked", "-deprecation", "-feature")

  def ivyDeps = Agg(
    ivy"com.github.spinalhdl::spinalhdl-core:$SpinalVersion",
    ivy"com.github.spinalhdl::spinalhdl-lib:$SpinalVersion",
  )
  def scalacPluginIvyDeps = Agg(ivy"com.github.spinalhdl::spinalhdl-idsl-plugin:$SpinalVersion")
}

object workshop extends CommonSpinalModule {
  object test extends Tests {
    def ivyDeps = Agg(
      ivy"org.scalatest::scalatest:3.1.2",
      ivy"com.github.spinalhdl::spinalhdl-sim:$SpinalVersion",
    )
    def testFrameworks = Seq("org.scalatest.tools.Framework")

    def testOnly(args: String*) = T.command {
      super.runMain("org.scalatest.run", args: _*)
    }
  }
}
