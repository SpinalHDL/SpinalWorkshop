package workshop.mandelbrot

import java.awt.event.{WindowAdapter, WindowEvent}
import java.awt.image.BufferedImage
import java.awt.{Color, Dimension, Graphics}

import javax.swing.{JFrame, JPanel, WindowConstants}
import spinal.core._
import spinal.core.sim._
import spinal.lib._
import spinal.lib.sim.{StreamMonitor, StreamReadyRandomizer}

import scala.collection.mutable.ArrayBuffer
import scala.io.Source
import scala.util.Random

object PixelSolverChecker {


  def apply(cmd : Stream[PixelTask], rsp : Stream[PixelResult], cd : ClockDomain): Unit ={
    SimTimeout(2000000)

    val resX = 64
    val resY = 64
    //Produce cmd stimulus
    fork{
      val startX = -2.0
      val startY = -1.5
      val endX = 0.8
      val endY = 1.5
      val stepX = (endX - startX) / resX
      val stepY = (endY - startY) / resY

      cmd.valid #= false
      cd.waitSampling()

      for (y <- 0 until resY;
           x <- 0 until resX) {
        cd.waitSampling(Random.nextInt(10))
        cmd.valid #= true
        cmd.x.raw #= ((startX + x * stepX) * (1 << 20)).toInt
        cmd.y.raw #= ((startY + y * stepY) * (1 << 20)).toInt
        cd.waitSamplingWhere(cmd.ready.toBoolean)
        cmd.valid #= false
      }
    }

    StreamReadyRandomizer(rsp, cd)
    val resultArray = Array.ofDim[Int](resY, resY)

    //Monitor the rsp stream
    fork{
      val image = new BufferedImage(resX, resY, BufferedImage.TYPE_INT_BGR);
      for (y <- 0 until resY;
           x <- 0 until resX) {
        cd.waitSamplingWhere(rsp.valid.toBoolean && rsp.ready.toBoolean)
        resultArray(y)(x) = rsp.iteration.toInt
        image.setRGB(x, y, rsp.iteration.toInt*16*256)
      }

      val dutLines = ArrayBuffer[String]()
      println("DUT=")
      for (y <- 0 until resY) {
        val l = resultArray(y).map(v => f"$v%2d").mkString(",")
        println(l)
        dutLines += l
      }
      val ref = "src/test/scala/workshop/mandelbrot/mandelbrot.ref"
      var error = false
      for ((refLine, i) <- Source.fromFile(ref).getLines.zipWithIndex) {
        val dutLine = dutLines(i)
        if(dutLine != refLine) error = true
      }

      if(error) println("Error, Doesn't match the reference")

      //GUI
      val frame = new JFrame{
        setPreferredSize(new Dimension(resX*4+16, resY*4+48));
        var closed = false
        add(new JPanel{
          this.setPreferredSize(new Dimension(resX, resY))
          override def paintComponent(g : Graphics) : Unit = {
            g.drawImage(image, 0, 0, resX*4,resY*4, null)
          }
        })

        pack();
        setVisible(true);
        setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);
        addWindowListener(new WindowAdapter() {
          override def windowClosing(e: WindowEvent): Unit = {
            closed = true
          }
        });
      }

      while(true){
        if(frame.closed) {
          println("simTime : " + simTime())
          if(error) simFailure() else simSuccess()
            Thread.sleep(10)
          }
        }
    }
  }
}
