;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Dut : 
  module Dut : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<1>, out : UInt<1>}
    
    node _T = eq(io.in, UInt<1>("h00")) @[Snippets.scala 14:15]
    io.out <= _T @[Snippets.scala 14:12]
    
