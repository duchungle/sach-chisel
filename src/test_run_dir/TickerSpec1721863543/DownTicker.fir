;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit DownTicker : 
  module DownTicker : 
    input clock : Clock
    input reset : UInt<1>
    output io : {tick : UInt<1>}
    
    reg cntReg : UInt, clock with : (reset => (reset, UInt<3>("h06"))) @[Ticker.scala 32:23]
    node _T = sub(cntReg, UInt<1>("h01")) @[Ticker.scala 34:20]
    node _T_1 = tail(_T, 1) @[Ticker.scala 34:20]
    cntReg <= _T_1 @[Ticker.scala 34:10]
    node _T_2 = eq(cntReg, UInt<1>("h00")) @[Ticker.scala 35:15]
    when _T_2 : @[Ticker.scala 35:24]
      cntReg <= UInt<3>("h06") @[Ticker.scala 36:12]
      skip @[Ticker.scala 35:24]
    node _T_3 = eq(cntReg, UInt<3>("h06")) @[Ticker.scala 39:21]
    io.tick <= _T_3 @[Ticker.scala 39:11]
    
