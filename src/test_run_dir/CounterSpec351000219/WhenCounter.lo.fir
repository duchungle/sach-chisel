circuit WhenCounter :
  module WhenCounter :
    input clock : Clock
    input reset : UInt<1>
    output io_cnt : UInt<8>
    output io_tick : UInt<1>

    reg cntReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Counter.scala 29:23]
    node _T = add(cntReg, UInt<1>("h1")) @[Counter.scala 31:20]
    node _T_1 = tail(_T, 1) @[Counter.scala 31:20]
    node _T_2 = eq(cntReg, UInt<3>("h6")) @[Counter.scala 32:15]
    node _GEN_0 = mux(_T_2, UInt<1>("h0"), _T_1) @[Counter.scala 32:22 Counter.scala 33:12 Counter.scala 31:10]
    node _T_3 = eq(cntReg, UInt<3>("h6")) @[Counter.scala 37:21]
    io_cnt <= cntReg @[Counter.scala 38:10]
    io_tick <= _T_3 @[Counter.scala 37:11]
    cntReg <= mux(reset, UInt<8>("h0"), _GEN_0) @[Counter.scala 29:23 Counter.scala 29:23]