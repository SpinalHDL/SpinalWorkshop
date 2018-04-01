name := "SpinalWorkshop"

version := "1.0"

scalaVersion := "2.11.6"

EclipseKeys.withSource := true

libraryDependencies ++= Seq(
  "org.scalatest" % "scalatest_2.11" % "2.2.1",
  "com.github.spinalhdl" % "spinalhdl-core_2.11" % "1.1.5",
  "com.github.spinalhdl" % "spinalhdl-lib_2.11" % "1.1.5"
)

addCompilerPlugin("org.scala-lang.plugins" % "scala-continuations-plugin_2.11.6" % "1.0.2")
scalacOptions += "-P:continuations:enable"
fork := true
