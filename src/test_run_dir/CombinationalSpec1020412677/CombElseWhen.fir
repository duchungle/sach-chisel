;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit CombElseWhen : 
  module CombElseWhen : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip cond : UInt<1>, flip cond2 : UInt<1>, out : UInt<4>}
    
    wire w : UInt @[Combinational.scala 101:15]
    when io.cond : @[Combinational.scala 103:15]
      w <= UInt<1>("h01") @[Combinational.scala 104:7]
      skip @[Combinational.scala 103:15]
    else : @[Combinational.scala 105:23]
      when io.cond2 : @[Combinational.scala 105:23]
        w <= UInt<2>("h02") @[Combinational.scala 106:7]
        skip @[Combinational.scala 105:23]
      else : @[Combinational.scala 107:16]
        w <= UInt<2>("h03") @[Combinational.scala 108:7]
        skip @[Combinational.scala 107:16]
    io.out <= w @[Combinational.scala 111:10]
    
