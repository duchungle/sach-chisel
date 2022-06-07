;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit UpTicker : 
  module UpTicker : 
    input clock : Clock
    input reset : UInt<1>
    output io : {tick : UInt<1>}
    
    reg cntReg : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[Ticker.scala 16:23]
    node _T = add(cntReg, UInt<1>("h01")) @[Ticker.scala 18:20]
    node _T_1 = tail(_T, 1) @[Ticker.scala 18:20]
    cntReg <= _T_1 @[Ticker.scala 18:10]
    node _T_2 = eq(cntReg, UInt<3>("h04")) @[Ticker.scala 19:15]
    when _T_2 : @[Ticker.scala 19:22]
      cntReg <= UInt<1>("h00") @[Ticker.scala 20:12]
      skip @[Ticker.scala 19:22]
    node _T_3 = eq(cntReg, UInt<3>("h04")) @[Ticker.scala 23:21]
    io.tick <= _T_3 @[Ticker.scala 23:11]
    
