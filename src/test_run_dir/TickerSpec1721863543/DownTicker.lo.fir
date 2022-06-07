circuit DownTicker :
  module DownTicker :
    input clock : Clock
    input reset : UInt<1>
    output io_tick : UInt<1>

    reg cntReg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Ticker.scala 32:23]
    node _T = sub(cntReg, UInt<1>("h1")) @[Ticker.scala 34:20]
    node _T_1 = tail(_T, 1) @[Ticker.scala 34:20]
    node _T_2 = eq(cntReg, UInt<1>("h0")) @[Ticker.scala 35:15]
    node _GEN_0 = mux(_T_2, UInt<3>("h6"), _T_1) @[Ticker.scala 35:24 Ticker.scala 36:12 Ticker.scala 34:10]
    node _T_3 = eq(cntReg, UInt<3>("h6")) @[Ticker.scala 39:21]
    io_tick <= _T_3 @[Ticker.scala 39:11]
    cntReg <= mux(reset, UInt<3>("h6"), _GEN_0) @[Ticker.scala 32:23 Ticker.scala 32:23]