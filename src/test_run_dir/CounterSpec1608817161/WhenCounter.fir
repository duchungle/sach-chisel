;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit WhenCounter : 
  module WhenCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {cnt : UInt<8>, tick : UInt<1>}
    
    reg cntReg : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[Counter.scala 29:23]
    node _T = add(cntReg, UInt<1>("h01")) @[Counter.scala 31:20]
    node _T_1 = tail(_T, 1) @[Counter.scala 31:20]
    cntReg <= _T_1 @[Counter.scala 31:10]
    node _T_2 = eq(cntReg, UInt<2>("h03")) @[Counter.scala 32:15]
    when _T_2 : @[Counter.scala 32:22]
      cntReg <= UInt<1>("h00") @[Counter.scala 33:12]
      skip @[Counter.scala 32:22]
    node _T_3 = eq(cntReg, UInt<2>("h03")) @[Counter.scala 37:21]
    io.tick <= _T_3 @[Counter.scala 37:11]
    io.cnt <= cntReg @[Counter.scala 38:10]
    
