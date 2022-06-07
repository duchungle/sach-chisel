;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit SequCounter : 
  module SequCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : UInt<4>, flip event : UInt<1>, eventCnt : UInt<4>, tick : UInt<1>, lowCnt : UInt<4>}
    
    reg cntReg : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Sequential.scala 78:23]
    node _T = add(cntReg, UInt<1>("h01")) @[Sequential.scala 80:20]
    node _T_1 = tail(_T, 1) @[Sequential.scala 80:20]
    cntReg <= _T_1 @[Sequential.scala 80:10]
    io.out <= cntReg @[Sequential.scala 82:10]
    reg cntEventsReg : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Sequential.scala 86:29]
    when io.event : @[Sequential.scala 87:15]
      node _T_2 = add(cntEventsReg, UInt<1>("h01")) @[Sequential.scala 88:34]
      node _T_3 = tail(_T_2, 1) @[Sequential.scala 88:34]
      cntEventsReg <= _T_3 @[Sequential.scala 88:18]
      skip @[Sequential.scala 87:15]
    io.eventCnt <= cntEventsReg @[Sequential.scala 91:15]
    reg tickCounterReg : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Sequential.scala 95:31]
    node tick = eq(tickCounterReg, UInt<3>("h04")) @[Sequential.scala 96:29]
    node _T_4 = add(tickCounterReg, UInt<1>("h01")) @[Sequential.scala 98:36]
    node _T_5 = tail(_T_4, 1) @[Sequential.scala 98:36]
    tickCounterReg <= _T_5 @[Sequential.scala 98:18]
    when tick : @[Sequential.scala 99:15]
      tickCounterReg <= UInt<1>("h00") @[Sequential.scala 100:20]
      skip @[Sequential.scala 99:15]
    reg lowFrequCntReg : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Sequential.scala 105:31]
    when tick : @[Sequential.scala 106:15]
      node _T_6 = add(lowFrequCntReg, UInt<1>("h01")) @[Sequential.scala 107:38]
      node _T_7 = tail(_T_6, 1) @[Sequential.scala 107:38]
      lowFrequCntReg <= _T_7 @[Sequential.scala 107:20]
      skip @[Sequential.scala 106:15]
    io.tick <= tick @[Sequential.scala 111:11]
    io.lowCnt <= lowFrequCntReg @[Sequential.scala 112:13]
    
