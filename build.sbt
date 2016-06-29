name := "SpinalBaseProject"

version := "1.0"

scalaVersion := "2.11.6"

EclipseKeys.withSource := true

libraryDependencies ++= Seq(
  "com.github.spinalhdl" % "spinalhdl-core_2.11" % "0.8.6",
  "com.github.spinalhdl" % "spinalhdl-lib_2.11" % "0.8.6"
)