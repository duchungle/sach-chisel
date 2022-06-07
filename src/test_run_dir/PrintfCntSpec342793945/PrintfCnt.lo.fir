circuit PrintfCnt :
  module PrintfCnt :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<4>

    reg cnt : UInt<4>, clock with :
      reset => (UInt<1>("h0"), cnt) @[PrintfCnt.scala 8:20]
    node _T = add(cnt, UInt<1>("h1")) @[PrintfCnt.scala 9:14]
    node _T_1 = tail(_T, 1) @[PrintfCnt.scala 9:14]
    node _T_2 = bits(reset, 0, 0) @[PrintfCnt.scala 11:9]
    node _T_3 = eq(_T_2, UInt<1>("h0")) @[PrintfCnt.scala 11:9]
    io_out <= cnt @[PrintfCnt.scala 13:10]
    cnt <= mux(reset, UInt<4>("h0"), _T_1) @[PrintfCnt.scala 8:20 PrintfCnt.scala 8:20 PrintfCnt.scala 9:7]
    printf(clock, and(and(UInt<1>("h1"), _T_3), UInt<1>("h1")), "printf: %d\n", cnt) @[PrintfCnt.scala 11:9]