package workshop.blackboxAndClock

import spinal.core._
import spinal.lib._


// Define a Ram as a BlackBox
case class Ram_1w_1r_2c(wordWidth: Int, wordCount: Int,writeClock : ClockDomain,readClock : ClockDomain) extends BlackBox {
  val generic = new Generic {
    val wordCount = Ram_1w_1r_2c.this.wordCount
    val wordWidth = Ram_1w_1r_2c.this.wordWidth
  }

  val io = new Bundle {
    val wr = new Bundle {
      val clk = in Bool
      val en   = in Bool
      val addr = in UInt (log2Up(wordCount) bits)
      val data = in Bits (wordWidth bits)
    }
    val rd = new Bundle {
      val clk = in Bool
      val en   = in Bool
      val addr = in UInt (log2Up(wordCount) bits)
      val data = out Bits (wordWidth bits)
    }
  }

  mapClockDomain(clockDomain = writeClock,clock=io.wr.clk)
  mapClockDomain(clockDomain = readClock ,clock=io.rd.clk)
}

// Create the top level and instanciate the Ram
case class MemorySumming(writeClock : ClockDomain,sumClock : ClockDomain) extends Component {
  val io = new Bundle {
    val wr = new Bundle {
      val en   = in Bool
      val addr = in UInt (8 bits)
      val data = in Bits (16 bits)
    }

    val sum = new Bundle{
      val start = in Bool
      val done  = out Bool
      val value = out UInt(16 bits)
    }
  }

  val ram = new Ram_1w_1r_2c(
    wordWidth = 16,
    wordCount = 256,
    writeClock = writeClock,
    readClock  = sumClock
  )

  io.wr.en   <> ram.io.wr.en
  io.wr.addr <> ram.io.wr.addr
  io.wr.data <> ram.io.wr.data
  io.sum.done := False

  val sumArea = new ClockingArea(sumClock){
    val counter = Reg(UInt(8 bits))
    val active  = RegInit(False)

    ram.io.rd.en := active
    ram.io.rd.addr := counter

    when(!active){
      active := True
      counter := 0
    }otherwise{
      counter := counter + 1
      when(counter === counter.maxValue){
        active := False
      }
    }

    val readDataValid = RegNext(active) init(False)
    val sum = Reg(UInt(16 bits))
    when(readDataValid){
      sum := sum + ram.io.rd.data.asUInt
    } otherwise{
      sum := 0
    }

    when(readDataValid.fall(initAt = False)){
      io.sum.done := True
    }
  }

  io.sum.value := sumArea.sum
}
