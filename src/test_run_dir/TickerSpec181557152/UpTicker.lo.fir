circuit UpTicker :
  module UpTicker :
    input clock : Clock
    input reset : UInt<1>
    output io_tick : UInt<1>

    reg cntReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Ticker.scala 16:23]
    node _T = add(cntReg, UInt<1>("h1")) @[Ticker.scala 18:20]
    node _T_1 = tail(_T, 1) @[Ticker.scala 18:20]
    node _T_2 = eq(cntReg, UInt<3>("h4")) @[Ticker.scala 19:15]
    node _GEN_0 = mux(_T_2, UInt<1>("h0"), _T_1) @[Ticker.scala 19:22 Ticker.scala 20:12 Ticker.scala 18:10]
    node _T_3 = eq(cntReg, UInt<3>("h4")) @[Ticker.scala 23:21]
    io_tick <= _T_3 @[Ticker.scala 23:11]
    cntReg <= mux(reset, UInt<8>("h0"), _GEN_0) @[Ticker.scala 16:23 Ticker.scala 16:23]