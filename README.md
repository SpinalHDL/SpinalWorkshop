Spinal Base Project
============
This repository is a base SBT project added to help non Scala/SBT native people in their first steps.

## Basics, without any IDE

You need to install :

- Java JDK
- Scala
- SBT

And do the following :

- Clone or download this repository.
- Open a terminal in the root of it and run "sbt run". At the first execution, the process could take some seconds

Normally, this command must generate output files MyTopLevel.vhd.
The top level spinal code is defined into src\main\scala\MyCode

## Basics, with Intellij IDEA and its scala plugin

You need to install :

- Java JDK
- Scala
- SBT
- Intellij IDEA 14.1.3 (the free Community Edition is nice)
- Intellij IDEA Scala plugin

And do the following :

- Clone or download this repository.
- In Intellij IDEA, "import project" with the root of this repository, Import project from external model SBT, Check all box
- In addition maybe you need to specify some path like JDK to Intellij
- In the project (Intellij project GUI), right click on src/main/scala/MyCode/TopLeve.scala and select "Run MyTopLevel"

Normally, this must generate output files MyTopLevel.vhd.
