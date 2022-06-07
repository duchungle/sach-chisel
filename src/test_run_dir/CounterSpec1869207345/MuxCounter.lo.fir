circuit MuxCounter :
  module MuxCounter :
    input clock : Clock
    input reset : UInt<1>
    output io_cnt : UInt<8>
    output io_tick : UInt<1>

    reg cntReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Counter.scala 46:23]
    node _T = eq(cntReg, UInt<3>("h4")) @[Counter.scala 48:24]
    node _T_1 = add(cntReg, UInt<1>("h1")) @[Counter.scala 48:43]
    node _T_2 = tail(_T_1, 1) @[Counter.scala 48:43]
    node _T_3 = mux(_T, UInt<1>("h0"), _T_2) @[Counter.scala 48:16]
    node _T_4 = eq(cntReg, UInt<3>("h4")) @[Counter.scala 51:21]
    io_cnt <= cntReg @[Counter.scala 52:10]
    io_tick <= _T_4 @[Counter.scala 51:11]
    cntReg <= mux(reset, UInt<8>("h0"), _T_3) @[Counter.scala 46:23 Counter.scala 46:23 Counter.scala 48:10]