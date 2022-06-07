;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit CombWhen : 
  module CombWhen : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip cond : UInt<1>, out : UInt<4>}
    
    wire w : UInt @[Combinational.scala 42:15]
    w <= UInt<1>("h00") @[Combinational.scala 44:5]
    when io.cond : @[Combinational.scala 45:15]
      w <= UInt<2>("h03") @[Combinational.scala 46:7]
      skip @[Combinational.scala 45:15]
    io.out <= w @[Combinational.scala 49:10]
    
