package workshop.common

import scala.sys.process.{Process, ProcessIO}


object CocotbRunner{
  def apply(path : String) : Boolean = {

    doCmd(Seq(
      s"cd $path",
      "rm -f results.xml",
      "make")
    )
    getCocotbPass(path)
  }


  def doCmd(cmds : Seq[String]): Unit ={
    var out,err : String = null
    val io = new ProcessIO(
      stdin  => {
        for(cmd <- cmds)
          stdin.write((cmd + "\n").getBytes)
        stdin.close()
      },
      stdout => {
        out = scala.io.Source.fromInputStream(stdout).getLines.foldLeft("")(_ + "\n" + _)
        stdout.close()
      },
      stderr => {
        err = scala.io.Source.fromInputStream(stderr).getLines.foldLeft("")(_ + "\n" + _)
        stderr.close()
      })
    val proc = Process("sh").run(io)
    proc.exitValue()
    println(out)
    println(err)
  }

  def getCocotbPass(path : String) : Boolean = {
    import scala.io.Source
    for(line <- Source.fromFile(path + "/results.xml").getLines()) {
      if (line.contains("failure") || line.contains("skipped")){
        return false
      }
    }
    return true
  }

}
