;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit DownCounter : 
  module DownCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {cnt : UInt<8>, tick : UInt<1>}
    
    reg cntReg : UInt, clock with : (reset => (reset, UInt<3>("h06"))) @[Counter.scala 60:23]
    node _T = sub(cntReg, UInt<1>("h01")) @[Counter.scala 62:20]
    node _T_1 = tail(_T, 1) @[Counter.scala 62:20]
    cntReg <= _T_1 @[Counter.scala 62:10]
    node _T_2 = eq(cntReg, UInt<1>("h00")) @[Counter.scala 63:15]
    when _T_2 : @[Counter.scala 63:24]
      cntReg <= UInt<3>("h06") @[Counter.scala 64:12]
      skip @[Counter.scala 63:24]
    node _T_3 = eq(cntReg, UInt<3>("h06")) @[Counter.scala 68:21]
    io.tick <= _T_3 @[Counter.scala 68:11]
    io.cnt <= cntReg @[Counter.scala 69:10]
    
