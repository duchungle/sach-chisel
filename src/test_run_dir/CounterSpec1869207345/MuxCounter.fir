;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit MuxCounter : 
  module MuxCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {cnt : UInt<8>, tick : UInt<1>}
    
    reg cntReg : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[Counter.scala 46:23]
    node _T = eq(cntReg, UInt<3>("h04")) @[Counter.scala 48:24]
    node _T_1 = add(cntReg, UInt<1>("h01")) @[Counter.scala 48:43]
    node _T_2 = tail(_T_1, 1) @[Counter.scala 48:43]
    node _T_3 = mux(_T, UInt<1>("h00"), _T_2) @[Counter.scala 48:16]
    cntReg <= _T_3 @[Counter.scala 48:10]
    node _T_4 = eq(cntReg, UInt<3>("h04")) @[Counter.scala 51:21]
    io.tick <= _T_4 @[Counter.scala 51:11]
    io.cnt <= cntReg @[Counter.scala 52:10]
    
