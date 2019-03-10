name := "SpinalWorkshop"

version := "1.0"

scalaVersion := "2.11.12"

EclipseKeys.withSource := true

libraryDependencies ++= Seq(
  "org.scalatest" % "scalatest_2.11" % "2.2.1",
  "com.github.spinalhdl" % "spinalhdl-core_2.11" % "1.3.2",
  "com.github.spinalhdl" % "spinalhdl-lib_2.11" % "1.3.2"
)

fork := true
