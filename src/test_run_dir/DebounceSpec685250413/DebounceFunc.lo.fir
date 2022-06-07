circuit DebounceFunc :
  module DebounceFunc :
    input clock : Clock
    input reset : UInt<1>
    input io_btnU : UInt<1>
    input io_sw : UInt<8>
    output io_led : UInt<8>

    reg REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), REG) @[Debounce.scala 72:38]
    reg btnSync : UInt<1>, clock with :
      reset => (UInt<1>("h0"), btnSync) @[Debounce.scala 72:30]
    reg REG_1 : UInt<7>, clock with :
      reset => (UInt<1>("h0"), REG_1) @[Debounce.scala 77:22]
    node tick = eq(REG_1, UInt<7>("h63")) @[Debounce.scala 78:20]
    node _T = add(REG_1, UInt<1>("h1")) @[Debounce.scala 79:31]
    node _T_1 = tail(_T, 1) @[Debounce.scala 79:31]
    node _T_2 = mux(tick, UInt<1>("h0"), _T_1) @[Debounce.scala 79:15]
    reg btnDeb : UInt<1>, clock with :
      reset => (UInt<1>("h0"), btnDeb) @[Debounce.scala 94:19]
    node _GEN_0 = mux(tick, btnSync, btnDeb) @[Debounce.scala 95:15 Debounce.scala 96:12 Debounce.scala 94:19]
    reg REG_2 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), REG_2) @[Debounce.scala 84:22]
    node hi = bits(REG_2, 1, 0) @[Debounce.scala 86:21]
    node _T_3 = cat(hi, btnDeb) @[Cat.scala 30:58]
    node _GEN_1 = mux(tick, _T_3, REG_2) @[Debounce.scala 85:14 Debounce.scala 86:11 Debounce.scala 84:22]
    node _T_4 = bits(REG_2, 2, 2) @[Debounce.scala 88:9]
    node _T_5 = bits(REG_2, 1, 1) @[Debounce.scala 88:18]
    node _T_6 = and(_T_4, _T_5) @[Debounce.scala 88:13]
    node _T_7 = bits(REG_2, 2, 2) @[Debounce.scala 88:29]
    node _T_8 = bits(REG_2, 0, 0) @[Debounce.scala 88:38]
    node _T_9 = and(_T_7, _T_8) @[Debounce.scala 88:33]
    node _T_10 = or(_T_6, _T_9) @[Debounce.scala 88:23]
    node _T_11 = bits(REG_2, 1, 1) @[Debounce.scala 88:49]
    node _T_12 = bits(REG_2, 0, 0) @[Debounce.scala 88:58]
    node _T_13 = and(_T_11, _T_12) @[Debounce.scala 88:53]
    node btnClean = or(_T_10, _T_13) @[Debounce.scala 88:43]
    reg REG_3 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), REG_3) @[Debounce.scala 74:37]
    node _T_14 = eq(REG_3, UInt<1>("h0")) @[Debounce.scala 74:29]
    node risingEdge = and(btnClean, _T_14) @[Debounce.scala 74:27]
    reg reg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), reg) @[Debounce.scala 104:20]
    node _T_15 = add(reg, UInt<1>("h1")) @[Debounce.scala 106:16]
    node _T_16 = tail(_T_15, 1) @[Debounce.scala 106:16]
    node _GEN_2 = mux(risingEdge, _T_16, reg) @[Debounce.scala 105:21 Debounce.scala 106:9 Debounce.scala 104:20]
    io_led <= reg @[Debounce.scala 109:10]
    REG <= io_btnU @[Debounce.scala 72:38]
    btnSync <= REG @[Debounce.scala 72:30]
    REG_1 <= mux(reset, UInt<7>("h0"), _T_2) @[Debounce.scala 77:22 Debounce.scala 77:22 Debounce.scala 79:9]
    btnDeb <= _GEN_0
    REG_2 <= mux(reset, UInt<3>("h0"), _GEN_1) @[Debounce.scala 84:22 Debounce.scala 84:22]
    REG_3 <= btnClean @[Debounce.scala 74:37]
    reg <= mux(reset, UInt<8>("h0"), _GEN_2) @[Debounce.scala 104:20 Debounce.scala 104:20]