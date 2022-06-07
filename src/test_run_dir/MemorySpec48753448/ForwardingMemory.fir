;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit ForwardingMemory : 
  module ForwardingMemory : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rdAddr : UInt<10>, rdData : UInt<8>, flip wrEna : UInt<1>, flip wrData : UInt<8>, flip wrAddr : UInt<10>}
    
    smem mem : UInt<8>[1024], undefined @[Memory.scala 33:24]
    reg wrDataReg : UInt, clock @[Memory.scala 35:26]
    wrDataReg <= io.wrData @[Memory.scala 35:26]
    node _T = eq(io.wrAddr, io.rdAddr) @[Memory.scala 36:40]
    node _T_1 = and(_T, io.wrEna) @[Memory.scala 36:54]
    reg doForwardReg : UInt<1>, clock @[Memory.scala 36:29]
    doForwardReg <= _T_1 @[Memory.scala 36:29]
    read mport memData = mem[io.rdAddr], clock @[Memory.scala 38:25]
    when io.wrEna : @[Memory.scala 40:18]
      write mport MPORT = mem[io.wrAddr], clock
      MPORT <= io.wrData
      skip @[Memory.scala 40:18]
    node _T_2 = mux(doForwardReg, wrDataReg, memData) @[Memory.scala 44:19]
    io.rdData <= _T_2 @[Memory.scala 44:13]
    
