;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Combinational : 
  module Combinational : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<4>, flip b : UInt<4>, flip c : UInt<4>, out : UInt<4>, out2 : UInt<4>}
    
    node _T = and(io.a, io.b) @[Combinational.scala 17:14]
    node e = or(_T, io.c) @[Combinational.scala 17:19]
    node f = not(e) @[Combinational.scala 21:11]
    io.out <= e @[Combinational.scala 30:10]
    io.out2 <= f @[Combinational.scala 31:11]
    
