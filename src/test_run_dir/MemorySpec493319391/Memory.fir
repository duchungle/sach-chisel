;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Memory : 
  module Memory : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rdAddr : UInt<10>, rdData : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<10>}
    
    smem mem : UInt<8>[1024], undefined @[Memory.scala 13:24]
    read mport MPORT = mem[io.rdAddr], clock @[Memory.scala 15:24]
    io.rdData <= MPORT @[Memory.scala 15:13]
    when io.wrEna : @[Memory.scala 17:18]
      write mport MPORT_1 = mem[io.wrAddr], clock
      MPORT_1 <= io.wrData
      skip @[Memory.scala 17:18]
    
