circuit Debounce :
  module Debounce :
    input clock : Clock
    input reset : UInt<1>
    input io_btnU : UInt<1>
    input io_sw : UInt<8>
    output io_led : UInt<8>

    reg REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), REG) @[Debounce.scala 14:32]
    reg btnSync : UInt<1>, clock with :
      reset => (UInt<1>("h0"), btnSync) @[Debounce.scala 14:24]
    reg btnDebReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), btnDebReg) @[Debounce.scala 26:22]
    reg cntReg : UInt<32>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Debounce.scala 28:23]
    node tick = eq(cntReg, UInt<7>("h63")) @[Debounce.scala 29:21]
    node _T = add(cntReg, UInt<1>("h1")) @[Debounce.scala 31:20]
    node _T_1 = tail(_T, 1) @[Debounce.scala 31:20]
    node _GEN_0 = mux(tick, UInt<1>("h0"), _T_1) @[Debounce.scala 32:15 Debounce.scala 33:12 Debounce.scala 31:10]
    node _GEN_1 = mux(tick, btnSync, btnDebReg) @[Debounce.scala 32:15 Debounce.scala 34:15 Debounce.scala 26:22]
    reg shiftReg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), shiftReg) @[Debounce.scala 39:25]
    node hi = bits(shiftReg, 1, 0) @[Debounce.scala 42:29]
    node _T_2 = cat(hi, btnDebReg) @[Cat.scala 30:58]
    node _GEN_2 = mux(tick, _T_2, shiftReg) @[Debounce.scala 40:15 Debounce.scala 42:14 Debounce.scala 39:25]
    node _T_3 = bits(shiftReg, 2, 2) @[Debounce.scala 45:27]
    node _T_4 = bits(shiftReg, 1, 1) @[Debounce.scala 45:41]
    node _T_5 = and(_T_3, _T_4) @[Debounce.scala 45:31]
    node _T_6 = bits(shiftReg, 2, 2) @[Debounce.scala 45:57]
    node _T_7 = bits(shiftReg, 0, 0) @[Debounce.scala 45:71]
    node _T_8 = and(_T_6, _T_7) @[Debounce.scala 45:61]
    node _T_9 = or(_T_5, _T_8) @[Debounce.scala 45:46]
    node _T_10 = bits(shiftReg, 1, 1) @[Debounce.scala 45:87]
    node _T_11 = bits(shiftReg, 0, 0) @[Debounce.scala 45:101]
    node _T_12 = and(_T_10, _T_11) @[Debounce.scala 45:91]
    node btnClean = or(_T_9, _T_12) @[Debounce.scala 45:76]
    reg REG_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), REG_1) @[Debounce.scala 49:39]
    node _T_13 = eq(REG_1, UInt<1>("h0")) @[Debounce.scala 49:31]
    node risingEdge = and(btnClean, _T_13) @[Debounce.scala 49:29]
    reg reg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg) @[Debounce.scala 53:20]
    node _T_14 = add(reg, UInt<1>("h1")) @[Debounce.scala 55:16]
    node _T_15 = tail(_T_14, 1) @[Debounce.scala 55:16]
    node _GEN_3 = mux(risingEdge, _T_15, reg) @[Debounce.scala 54:21 Debounce.scala 55:9 Debounce.scala 53:20]
    io_led <= reg @[Debounce.scala 59:10]
    REG <= io_btnU @[Debounce.scala 14:32]
    btnSync <= REG @[Debounce.scala 14:24]
    btnDebReg <= _GEN_1
    cntReg <= mux(reset, UInt<32>("h0"), _GEN_0) @[Debounce.scala 28:23 Debounce.scala 28:23]
    shiftReg <= mux(reset, UInt<3>("h0"), _GEN_2) @[Debounce.scala 39:25 Debounce.scala 39:25]
    REG_1 <= btnClean @[Debounce.scala 49:39]
    reg <= mux(reset, UInt<8>("h0"), _GEN_3) @[Debounce.scala 53:20 Debounce.scala 53:20]