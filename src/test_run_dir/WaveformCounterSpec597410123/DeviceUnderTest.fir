;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit DeviceUnderTest : 
  module DeviceUnderTest : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<2>, flip b : UInt<2>, out : UInt<2>}
    
    node _T = and(io.a, io.b) @[testing.scala 14:18]
    io.out <= _T @[testing.scala 14:10]
    
