circuit NerdCounter :
  module NerdCounter :
    input clock : Clock
    input reset : UInt<1>
    output io_cnt : UInt<8>
    output io_tick : UInt<1>

    reg cntReg : SInt<8>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Counter.scala 99:23]
    node _T = sub(cntReg, asSInt(UInt<2>("h1"))) @[Counter.scala 102:20]
    node _T_1 = tail(_T, 1) @[Counter.scala 102:20]
    node _T_2 = asSInt(_T_1) @[Counter.scala 102:20]
    node _T_3 = bits(cntReg, 7, 7) @[Counter.scala 103:14]
    node _GEN_0 = mux(_T_3, asSInt(UInt<8>("hb")), _T_2) @[Counter.scala 103:19 Counter.scala 104:12 Counter.scala 102:10]
    node _GEN_1 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Counter.scala 103:19 Counter.scala 105:13 Counter.scala 100:11]
    node _T_4 = asUInt(cntReg) @[Counter.scala 109:26]
    io_cnt <= _T_4 @[Counter.scala 109:10]
    io_tick <= _GEN_1
    cntReg <= mux(reset, asSInt(UInt<8>("hb")), _GEN_0) @[Counter.scala 99:23 Counter.scala 99:23]