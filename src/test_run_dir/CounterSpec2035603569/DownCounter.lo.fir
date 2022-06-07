circuit DownCounter :
  module DownCounter :
    input clock : Clock
    input reset : UInt<1>
    output io_cnt : UInt<8>
    output io_tick : UInt<1>

    reg cntReg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Counter.scala 60:23]
    node _T = sub(cntReg, UInt<1>("h1")) @[Counter.scala 62:20]
    node _T_1 = tail(_T, 1) @[Counter.scala 62:20]
    node _T_2 = eq(cntReg, UInt<1>("h0")) @[Counter.scala 63:15]
    node _GEN_0 = mux(_T_2, UInt<3>("h6"), _T_1) @[Counter.scala 63:24 Counter.scala 64:12 Counter.scala 62:10]
    node _T_3 = eq(cntReg, UInt<3>("h6")) @[Counter.scala 68:21]
    io_cnt <= cntReg @[Counter.scala 69:10]
    io_tick <= _T_3 @[Counter.scala 68:11]
    cntReg <= mux(reset, UInt<3>("h6"), _GEN_0) @[Counter.scala 60:23 Counter.scala 60:23]