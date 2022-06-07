;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Flasher2 : 
  module Flasher2 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip start : UInt<1>, light : UInt<1>}
    
    node start = bits(io.start, 0, 0) @[Flasher.scala 82:24]
    reg stateReg : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[Flasher.scala 86:25]
    wire light : UInt<1>
    light <= UInt<1>("h00")
    wire timerLoad : UInt<1>
    timerLoad <= UInt<1>("h00")
    wire timerSelect : UInt<1>
    timerSelect <= UInt<1>("h01")
    wire timerDone : UInt<1> @[Flasher.scala 93:23]
    wire cntLoad : UInt<1>
    cntLoad <= UInt<1>("h00")
    wire cntDecr : UInt<1>
    cntDecr <= UInt<1>("h00")
    wire cntDone : UInt<1> @[Flasher.scala 97:21]
    timerLoad <= timerDone @[Flasher.scala 99:13]
    node _T = eq(UInt<2>("h00"), stateReg) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      timerLoad <= UInt<1>("h01") @[Flasher.scala 103:17]
      timerSelect <= UInt<1>("h01") @[Flasher.scala 104:19]
      cntLoad <= UInt<1>("h01") @[Flasher.scala 105:15]
      when start : @[Flasher.scala 106:20]
        stateReg <= UInt<2>("h01") @[Flasher.scala 106:31]
        skip @[Flasher.scala 106:20]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_1 = eq(UInt<2>("h01"), stateReg) @[Conditional.scala 37:30]
      when _T_1 : @[Conditional.scala 39:67]
        timerSelect <= UInt<1>("h00") @[Flasher.scala 109:19]
        light <= UInt<1>("h01") @[Flasher.scala 110:13]
        node _T_2 = eq(cntDone, UInt<1>("h00")) @[Flasher.scala 111:25]
        node _T_3 = and(timerDone, _T_2) @[Flasher.scala 111:23]
        when _T_3 : @[Flasher.scala 111:35]
          stateReg <= UInt<2>("h02") @[Flasher.scala 111:46]
          skip @[Flasher.scala 111:35]
        node _T_4 = and(timerDone, cntDone) @[Flasher.scala 112:23]
        when _T_4 : @[Flasher.scala 112:34]
          stateReg <= UInt<2>("h00") @[Flasher.scala 112:45]
          skip @[Flasher.scala 112:34]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_5 = eq(UInt<2>("h02"), stateReg) @[Conditional.scala 37:30]
        when _T_5 : @[Conditional.scala 39:67]
          cntDecr <= timerDone @[Flasher.scala 115:15]
          when timerDone : @[Flasher.scala 116:24]
            stateReg <= UInt<2>("h01") @[Flasher.scala 116:35]
            skip @[Flasher.scala 116:24]
          skip @[Conditional.scala 39:67]
    reg cntReg : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Flasher.scala 122:23]
    node _T_6 = eq(cntReg, UInt<1>("h00")) @[Flasher.scala 123:21]
    cntDone <= _T_6 @[Flasher.scala 123:11]
    when cntLoad : @[Flasher.scala 126:17]
      cntReg <= UInt<2>("h02") @[Flasher.scala 126:26]
      skip @[Flasher.scala 126:17]
    when cntDecr : @[Flasher.scala 127:17]
      node _T_7 = sub(cntReg, UInt<1>("h01")) @[Flasher.scala 127:36]
      node _T_8 = tail(_T_7, 1) @[Flasher.scala 127:36]
      cntReg <= _T_8 @[Flasher.scala 127:26]
      skip @[Flasher.scala 127:17]
    reg timerReg : UInt, clock with : (reset => (reset, UInt<1>("h00"))) @[Flasher.scala 130:25]
    node _T_9 = eq(timerReg, UInt<1>("h00")) @[Flasher.scala 131:25]
    timerDone <= _T_9 @[Flasher.scala 131:13]
    node _T_10 = eq(timerDone, UInt<1>("h00")) @[Flasher.scala 134:8]
    when _T_10 : @[Flasher.scala 134:20]
      node _T_11 = sub(timerReg, UInt<1>("h01")) @[Flasher.scala 135:26]
      node _T_12 = tail(_T_11, 1) @[Flasher.scala 135:26]
      timerReg <= _T_12 @[Flasher.scala 135:14]
      skip @[Flasher.scala 134:20]
    when timerLoad : @[Flasher.scala 137:20]
      when timerSelect : @[Flasher.scala 138:24]
        timerReg <= UInt<3>("h05") @[Flasher.scala 139:16]
        skip @[Flasher.scala 138:24]
      else : @[Flasher.scala 140:18]
        timerReg <= UInt<2>("h03") @[Flasher.scala 141:16]
        skip @[Flasher.scala 140:18]
      skip @[Flasher.scala 137:20]
    io.light <= light @[Flasher.scala 145:12]
    
