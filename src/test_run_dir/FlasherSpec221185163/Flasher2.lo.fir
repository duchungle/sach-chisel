circuit Flasher2 :
  module Flasher2 :
    input clock : Clock
    input reset : UInt<1>
    input io_start : UInt<1>
    output io_light : UInt<1>

    node start = bits(io_start, 0, 0) @[Flasher.scala 82:24]
    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[Flasher.scala 86:25]
    node _T = eq(UInt<2>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(start, UInt<2>("h1"), stateReg) @[Flasher.scala 106:20 Flasher.scala 106:31 Flasher.scala 86:25]
    node _T_1 = eq(UInt<2>("h1"), stateReg) @[Conditional.scala 37:30]
    reg cntReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Flasher.scala 122:23]
    node _T_6 = eq(cntReg, UInt<1>("h0")) @[Flasher.scala 123:21]
    node cntDone = _T_6 @[Flasher.scala 97:21 Flasher.scala 123:11]
    node _T_2 = eq(cntDone, UInt<1>("h0")) @[Flasher.scala 111:25]
    reg timerReg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), timerReg) @[Flasher.scala 130:25]
    node _T_9 = eq(timerReg, UInt<1>("h0")) @[Flasher.scala 131:25]
    node timerDone = _T_9 @[Flasher.scala 93:23 Flasher.scala 131:13]
    node _T_3 = and(timerDone, _T_2) @[Flasher.scala 111:23]
    node _GEN_1 = mux(_T_3, UInt<2>("h2"), stateReg) @[Flasher.scala 111:35 Flasher.scala 111:46 Flasher.scala 86:25]
    node _T_4 = and(timerDone, cntDone) @[Flasher.scala 112:23]
    node _GEN_2 = mux(_T_4, UInt<2>("h0"), _GEN_1) @[Flasher.scala 112:34 Flasher.scala 112:45]
    node _T_5 = eq(UInt<2>("h2"), stateReg) @[Conditional.scala 37:30]
    node _GEN_3 = mux(timerDone, UInt<2>("h1"), stateReg) @[Flasher.scala 116:24 Flasher.scala 116:35 Flasher.scala 86:25]
    node _GEN_4 = mux(_T_5, timerDone, UInt<1>("h0")) @[Conditional.scala 39:67 Flasher.scala 115:15]
    node _GEN_5 = mux(_T_5, _GEN_3, stateReg) @[Conditional.scala 39:67 Flasher.scala 86:25]
    node _GEN_6 = mux(_T_1, UInt<1>("h0"), UInt<1>("h1")) @[Conditional.scala 39:67 Flasher.scala 109:19]
    node _GEN_7 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 Flasher.scala 110:13]
    node _GEN_8 = mux(_T_1, _GEN_2, _GEN_5) @[Conditional.scala 39:67]
    node _GEN_9 = mux(_T_1, UInt<1>("h0"), _GEN_4) @[Conditional.scala 39:67]
    node _GEN_10 = mux(_T, UInt<1>("h1"), timerDone) @[Conditional.scala 40:58 Flasher.scala 103:17 Flasher.scala 99:13]
    node _GEN_11 = mux(_T, UInt<1>("h1"), _GEN_6) @[Conditional.scala 40:58 Flasher.scala 104:19]
    node _GEN_12 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 40:58 Flasher.scala 105:15]
    node _GEN_13 = mux(_T, _GEN_0, _GEN_8) @[Conditional.scala 40:58]
    node _GEN_14 = mux(_T, UInt<1>("h0"), _GEN_7) @[Conditional.scala 40:58]
    node _GEN_15 = mux(_T, UInt<1>("h0"), _GEN_9) @[Conditional.scala 40:58]
    node cntLoad = _GEN_12
    node _GEN_16 = mux(cntLoad, UInt<2>("h2"), cntReg) @[Flasher.scala 126:17 Flasher.scala 126:26 Flasher.scala 122:23]
    node _T_7 = sub(cntReg, UInt<1>("h1")) @[Flasher.scala 127:36]
    node _T_8 = tail(_T_7, 1) @[Flasher.scala 127:36]
    node cntDecr = _GEN_15
    node _GEN_17 = mux(cntDecr, _T_8, _GEN_16) @[Flasher.scala 127:17 Flasher.scala 127:26]
    node _T_10 = eq(timerDone, UInt<1>("h0")) @[Flasher.scala 134:8]
    node _T_11 = sub(timerReg, UInt<1>("h1")) @[Flasher.scala 135:26]
    node _T_12 = tail(_T_11, 1) @[Flasher.scala 135:26]
    node _GEN_18 = mux(_T_10, _T_12, timerReg) @[Flasher.scala 134:20 Flasher.scala 135:14 Flasher.scala 130:25]
    node timerSelect = _GEN_11
    node _GEN_19 = mux(timerSelect, UInt<3>("h5"), UInt<2>("h3")) @[Flasher.scala 138:24 Flasher.scala 139:16 Flasher.scala 141:16]
    node timerLoad = _GEN_10
    node _GEN_20 = mux(timerLoad, _GEN_19, _GEN_18) @[Flasher.scala 137:20]
    node light = _GEN_14
    io_light <= light @[Flasher.scala 145:12]
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_13) @[Flasher.scala 86:25 Flasher.scala 86:25]
    cntReg <= mux(reset, UInt<1>("h0"), _GEN_17) @[Flasher.scala 122:23 Flasher.scala 122:23]
    timerReg <= mux(reset, UInt<1>("h0"), _GEN_20) @[Flasher.scala 130:25 Flasher.scala 130:25]