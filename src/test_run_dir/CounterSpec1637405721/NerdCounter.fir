;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit NerdCounter : 
  module NerdCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {cnt : UInt<8>, tick : UInt<1>}
    
    reg cntReg : SInt<8>, clock with : (reset => (reset, asSInt(UInt<8>("h0b")))) @[Counter.scala 99:23]
    io.tick <= UInt<1>("h00") @[Counter.scala 100:11]
    node _T = sub(cntReg, asSInt(UInt<2>("h01"))) @[Counter.scala 102:20]
    node _T_1 = tail(_T, 1) @[Counter.scala 102:20]
    node _T_2 = asSInt(_T_1) @[Counter.scala 102:20]
    cntReg <= _T_2 @[Counter.scala 102:10]
    node _T_3 = bits(cntReg, 7, 7) @[Counter.scala 103:14]
    when _T_3 : @[Counter.scala 103:19]
      cntReg <= asSInt(UInt<8>("h0b")) @[Counter.scala 104:12]
      io.tick <= UInt<1>("h01") @[Counter.scala 105:13]
      skip @[Counter.scala 103:19]
    node _T_4 = asUInt(cntReg) @[Counter.scala 109:26]
    io.cnt <= _T_4 @[Counter.scala 109:10]
    
