;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit CombWireDefault : 
  module CombWireDefault : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip cond : UInt<1>, out : UInt<4>}
    
    wire w : UInt
    w <= UInt<1>("h00")
    when io.cond : @[Combinational.scala 124:15]
      w <= UInt<2>("h03") @[Combinational.scala 125:7]
      skip @[Combinational.scala 124:15]
    io.out <= w @[Combinational.scala 129:10]
    
