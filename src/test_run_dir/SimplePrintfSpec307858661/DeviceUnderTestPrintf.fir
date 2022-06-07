;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit DeviceUnderTestPrintf : 
  module DeviceUnderTestPrintf : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<2>, flip b : UInt<2>, out : UInt<2>}
    
    node _T = and(io.a, io.b) @[testing.scala 26:18]
    io.out <= _T @[testing.scala 26:10]
    node _T_1 = bits(reset, 0, 0) @[testing.scala 27:9]
    node _T_2 = eq(_T_1, UInt<1>("h00")) @[testing.scala 27:9]
    when _T_2 : @[testing.scala 27:9]
      printf(clock, UInt<1>(1), "dut: %d %d %d\n", io.a, io.b, io.out) @[testing.scala 27:9]
      skip @[testing.scala 27:9]
    
