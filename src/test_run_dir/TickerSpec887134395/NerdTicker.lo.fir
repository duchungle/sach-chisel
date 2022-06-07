circuit NerdTicker :
  module NerdTicker :
    input clock : Clock
    input reset : UInt<1>
    output io_tick : UInt<1>

    reg cntReg : SInt<8>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Ticker.scala 49:23]
    node _T = sub(cntReg, asSInt(UInt<2>("h1"))) @[Ticker.scala 52:20]
    node _T_1 = tail(_T, 1) @[Ticker.scala 52:20]
    node _T_2 = asSInt(_T_1) @[Ticker.scala 52:20]
    node _T_3 = bits(cntReg, 7, 7) @[Ticker.scala 53:14]
    node _GEN_0 = mux(_T_3, asSInt(UInt<8>("h9")), _T_2) @[Ticker.scala 53:19 Ticker.scala 54:12 Ticker.scala 52:10]
    node _GEN_1 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Ticker.scala 53:19 Ticker.scala 55:13 Ticker.scala 50:11]
    io_tick <= _GEN_1
    cntReg <= mux(reset, asSInt(UInt<8>("h9")), _GEN_0) @[Ticker.scala 49:23 Ticker.scala 49:23]