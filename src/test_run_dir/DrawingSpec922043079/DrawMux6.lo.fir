circuit DrawMux6 :
  module DrawMux6 :
    input clock : Clock
    input reset : UInt<1>
    input io_sel : UInt<3>
    output io_dout : UInt<8>

    node _T = eq(UInt<1>("h0"), io_sel) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<1>("h1"), io_sel) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<2>("h2"), io_sel) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<2>("h3"), io_sel) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<3>("h4"), io_sel) @[Conditional.scala 37:30]
    node _T_5 = eq(UInt<3>("h5"), io_sel) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_5, UInt<6>("h37"), UInt<1>("h0")) @[Conditional.scala 39:67 drawing.scala 48:20]
    node _GEN_1 = mux(_T_4, UInt<6>("h2c"), _GEN_0) @[Conditional.scala 39:67 drawing.scala 47:20]
    node _GEN_2 = mux(_T_3, UInt<6>("h21"), _GEN_1) @[Conditional.scala 39:67 drawing.scala 46:20]
    node _GEN_3 = mux(_T_2, UInt<5>("h16"), _GEN_2) @[Conditional.scala 39:67 drawing.scala 45:20]
    node _GEN_4 = mux(_T_1, UInt<4>("hb"), _GEN_3) @[Conditional.scala 39:67 drawing.scala 44:20]
    node _GEN_5 = mux(_T, UInt<1>("h0"), _GEN_4) @[Conditional.scala 40:58 drawing.scala 43:20]
    node dout = _GEN_5
    io_dout <= dout @[drawing.scala 52:11]