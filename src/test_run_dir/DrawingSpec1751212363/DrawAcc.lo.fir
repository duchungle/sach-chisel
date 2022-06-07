circuit DrawAcc :
  module DrawAcc :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<8>
    input io_sel : UInt<3>
    output io_dout : UInt<8>

    reg regAcc : UInt<8>, clock with :
      reset => (UInt<1>("h0"), regAcc) @[drawing.scala 18:23]
    node _T = eq(UInt<1>("h0"), io_sel) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<1>("h1"), io_sel) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<2>("h2"), io_sel) @[Conditional.scala 37:30]
    node _T_3 = add(regAcc, io_din) @[drawing.scala 23:32]
    node _T_4 = tail(_T_3, 1) @[drawing.scala 23:32]
    node _T_5 = eq(UInt<2>("h3"), io_sel) @[Conditional.scala 37:30]
    node _T_6 = sub(regAcc, io_din) @[drawing.scala 24:32]
    node _T_7 = tail(_T_6, 1) @[drawing.scala 24:32]
    node _GEN_0 = mux(_T_5, _T_7, regAcc) @[Conditional.scala 39:67 drawing.scala 24:22 drawing.scala 18:23]
    node _GEN_1 = mux(_T_2, _T_4, _GEN_0) @[Conditional.scala 39:67 drawing.scala 23:22]
    node _GEN_2 = mux(_T_1, UInt<1>("h0"), _GEN_1) @[Conditional.scala 39:67 drawing.scala 22:22]
    node _GEN_3 = mux(_T, regAcc, _GEN_2) @[Conditional.scala 40:58 drawing.scala 21:22]
    io_dout <= regAcc @[drawing.scala 28:11]
    regAcc <= mux(reset, UInt<8>("h0"), _GEN_3) @[drawing.scala 18:23 drawing.scala 18:23]