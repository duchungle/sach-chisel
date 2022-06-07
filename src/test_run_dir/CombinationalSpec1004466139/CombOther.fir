;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit CombOther : 
  module CombOther : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip cond : UInt<1>, out : UInt<4>}
    
    wire w : UInt @[Combinational.scala 79:15]
    when io.cond : @[Combinational.scala 81:15]
      w <= UInt<1>("h01") @[Combinational.scala 82:7]
      skip @[Combinational.scala 81:15]
    else : @[Combinational.scala 83:16]
      w <= UInt<2>("h02") @[Combinational.scala 84:7]
      skip @[Combinational.scala 83:16]
    io.out <= w @[Combinational.scala 87:10]
    
