;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit NerdTicker : 
  module NerdTicker : 
    input clock : Clock
    input reset : UInt<1>
    output io : {tick : UInt<1>}
    
    reg cntReg : SInt<8>, clock with : (reset => (reset, asSInt(UInt<8>("h09")))) @[Ticker.scala 49:23]
    io.tick <= UInt<1>("h00") @[Ticker.scala 50:11]
    node _T = sub(cntReg, asSInt(UInt<2>("h01"))) @[Ticker.scala 52:20]
    node _T_1 = tail(_T, 1) @[Ticker.scala 52:20]
    node _T_2 = asSInt(_T_1) @[Ticker.scala 52:20]
    cntReg <= _T_2 @[Ticker.scala 52:10]
    node _T_3 = bits(cntReg, 7, 7) @[Ticker.scala 53:14]
    when _T_3 : @[Ticker.scala 53:19]
      cntReg <= asSInt(UInt<8>("h09")) @[Ticker.scala 54:12]
      io.tick <= UInt<1>("h01") @[Ticker.scala 55:13]
      skip @[Ticker.scala 53:19]
    
