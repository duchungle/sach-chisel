circuit Flasher :
  module Flasher :
    input clock : Clock
    input reset : UInt<1>
    input io_start : UInt<1>
    output io_light : UInt<1>

    node start = bits(io_start, 0, 0) @[Flasher.scala 13:24]
    reg stateReg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[Flasher.scala 18:25]
    node _T = eq(UInt<3>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(start, UInt<3>("h1"), stateReg) @[Flasher.scala 34:20 Flasher.scala 34:31 Flasher.scala 18:25]
    node _T_1 = eq(UInt<3>("h1"), stateReg) @[Conditional.scala 37:30]
    reg timerReg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), timerReg) @[Flasher.scala 61:25]
    node _T_6 = eq(timerReg, UInt<1>("h0")) @[Flasher.scala 62:25]
    node timerDone = _T_6 @[Flasher.scala 25:23 Flasher.scala 62:13]
    node _GEN_1 = mux(timerDone, UInt<3>("h2"), stateReg) @[Flasher.scala 39:24 Flasher.scala 39:35 Flasher.scala 18:25]
    node _T_2 = eq(UInt<3>("h2"), stateReg) @[Conditional.scala 37:30]
    node _GEN_2 = mux(timerDone, UInt<3>("h3"), stateReg) @[Flasher.scala 42:24 Flasher.scala 42:35 Flasher.scala 18:25]
    node _T_3 = eq(UInt<3>("h3"), stateReg) @[Conditional.scala 37:30]
    node _GEN_3 = mux(timerDone, UInt<3>("h4"), stateReg) @[Flasher.scala 47:24 Flasher.scala 47:35 Flasher.scala 18:25]
    node _T_4 = eq(UInt<3>("h4"), stateReg) @[Conditional.scala 37:30]
    node _GEN_4 = mux(timerDone, UInt<3>("h5"), stateReg) @[Flasher.scala 50:24 Flasher.scala 50:35 Flasher.scala 18:25]
    node _T_5 = eq(UInt<3>("h5"), stateReg) @[Conditional.scala 37:30]
    node _GEN_5 = mux(timerDone, UInt<3>("h0"), stateReg) @[Flasher.scala 55:24 Flasher.scala 55:35 Flasher.scala 18:25]
    node _GEN_6 = mux(_T_5, UInt<1>("h0"), UInt<1>("h1")) @[Conditional.scala 39:67 Flasher.scala 53:19]
    node _GEN_7 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 Flasher.scala 54:13]
    node _GEN_8 = mux(_T_5, _GEN_5, stateReg) @[Conditional.scala 39:67 Flasher.scala 18:25]
    node _GEN_9 = mux(_T_4, _GEN_4, _GEN_8) @[Conditional.scala 39:67]
    node _GEN_10 = mux(_T_4, UInt<1>("h1"), _GEN_6) @[Conditional.scala 39:67]
    node _GEN_11 = mux(_T_4, UInt<1>("h0"), _GEN_7) @[Conditional.scala 39:67]
    node _GEN_12 = mux(_T_3, UInt<1>("h0"), _GEN_10) @[Conditional.scala 39:67 Flasher.scala 45:19]
    node _GEN_13 = mux(_T_3, UInt<1>("h1"), _GEN_11) @[Conditional.scala 39:67 Flasher.scala 46:13]
    node _GEN_14 = mux(_T_3, _GEN_3, _GEN_9) @[Conditional.scala 39:67]
    node _GEN_15 = mux(_T_2, _GEN_2, _GEN_14) @[Conditional.scala 39:67]
    node _GEN_16 = mux(_T_2, UInt<1>("h1"), _GEN_12) @[Conditional.scala 39:67]
    node _GEN_17 = mux(_T_2, UInt<1>("h0"), _GEN_13) @[Conditional.scala 39:67]
    node _GEN_18 = mux(_T_1, UInt<1>("h0"), _GEN_16) @[Conditional.scala 39:67 Flasher.scala 37:19]
    node _GEN_19 = mux(_T_1, UInt<1>("h1"), _GEN_17) @[Conditional.scala 39:67 Flasher.scala 38:13]
    node _GEN_20 = mux(_T_1, _GEN_1, _GEN_15) @[Conditional.scala 39:67]
    node _GEN_21 = mux(_T, UInt<1>("h1"), timerDone) @[Conditional.scala 40:58 Flasher.scala 32:17 Flasher.scala 27:13]
    node _GEN_22 = mux(_T, UInt<1>("h1"), _GEN_18) @[Conditional.scala 40:58 Flasher.scala 33:19]
    node _GEN_23 = mux(_T, _GEN_0, _GEN_20) @[Conditional.scala 40:58]
    node _GEN_24 = mux(_T, UInt<1>("h0"), _GEN_19) @[Conditional.scala 40:58]
    node _T_7 = eq(timerDone, UInt<1>("h0")) @[Flasher.scala 65:8]
    node _T_8 = sub(timerReg, UInt<1>("h1")) @[Flasher.scala 66:26]
    node _T_9 = tail(_T_8, 1) @[Flasher.scala 66:26]
    node _GEN_25 = mux(_T_7, _T_9, timerReg) @[Flasher.scala 65:20 Flasher.scala 66:14 Flasher.scala 61:25]
    node timerSelect = _GEN_22
    node _GEN_26 = mux(timerSelect, UInt<3>("h5"), UInt<2>("h3")) @[Flasher.scala 69:24 Flasher.scala 70:16 Flasher.scala 72:16]
    node timerLoad = _GEN_21
    node _GEN_27 = mux(timerLoad, _GEN_26, _GEN_25) @[Flasher.scala 68:20]
    node light = _GEN_24
    io_light <= light @[Flasher.scala 77:12]
    stateReg <= mux(reset, UInt<3>("h0"), _GEN_23) @[Flasher.scala 18:25 Flasher.scala 18:25]
    timerReg <= mux(reset, UInt<1>("h0"), _GEN_27) @[Flasher.scala 61:25 Flasher.scala 61:25]