package workshop.apb3decoder

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba3.apb.{Apb3Config, Apb3}


case class Mapping(base : BigInt, range : BigInt){
  // Return true when the given UInt is in the mapping range
  // Very simple and unoptimised implementation
  def hit(address : UInt) : Bool = address >= base && address < base + range
}

//Example of instantiation :
//new Apb3Decoder(
//  apbConfig = Apb3Config(
//    addressWidth = 16,
//    dataWidth = 32
//  ),
//  outputsMapping = List(
//    Mapping(base = 0x0000, range = 0x1000),
//    Mapping(base = 0x1000, range = 0x1000),
//    Mapping(base = 0x4000, range = 0x2000),
//    Mapping(base = 0x6000, range = 0x3000)
//  )
//)
case class Apb3Decoder(apbConfig : Apb3Config, outputsMapping : Seq[Mapping]) extends Component{
  require(apbConfig.selWidth == 1)

  val io = new Bundle{
    val input   = slave(Apb3(apbConfig))
    val outputs = Vec(master(Apb3(apbConfig)), outputsMapping.length)
  }

  //TODO fully asynchronous apb3 decoder
}

