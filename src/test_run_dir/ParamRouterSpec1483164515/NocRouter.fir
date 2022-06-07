;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit NocRouter : 
  module NocRouter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inPort : {data : UInt<16>, flag : UInt<1>}[2], flip address : UInt<8>[2], outPort : {data : UInt<16>, flag : UInt<1>}[2]}
    
    io.outPort[0].flag <= io.inPort[1].flag @[NocRouter.scala 22:17]
    io.outPort[0].data <= io.inPort[1].data @[NocRouter.scala 22:17]
    io.outPort[1].flag <= io.inPort[0].flag @[NocRouter.scala 23:17]
    io.outPort[1].data <= io.inPort[0].data @[NocRouter.scala 23:17]
    
