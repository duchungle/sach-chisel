circuit FunctionCounter :
  module FunctionCounter :
    input clock : Clock
    input reset : UInt<1>
    output io_cnt : UInt<8>
    output io_tick : UInt<1>

    reg count10 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), count10) @[Counter.scala 77:25]
    node _T = eq(count10, UInt<4>("ha")) @[Counter.scala 78:26]
    node _T_1 = add(count10, UInt<1>("h1")) @[Counter.scala 78:47]
    node _T_2 = tail(_T_1, 1) @[Counter.scala 78:47]
    node _T_3 = mux(_T, UInt<1>("h0"), _T_2) @[Counter.scala 78:18]
    reg count99 : UInt<8>, clock with :
      reset => (UInt<1>("h0"), count99) @[Counter.scala 77:25]
    node _T_4 = eq(count99, UInt<7>("h63")) @[Counter.scala 78:26]
    node _T_5 = add(count99, UInt<1>("h1")) @[Counter.scala 78:47]
    node _T_6 = tail(_T_5, 1) @[Counter.scala 78:47]
    node _T_7 = mux(_T_4, UInt<1>("h0"), _T_6) @[Counter.scala 78:18]
    reg testCounter : UInt<8>, clock with :
      reset => (UInt<1>("h0"), testCounter) @[Counter.scala 77:25]
    node _T_8 = eq(testCounter, UInt<3>("h7")) @[Counter.scala 78:26]
    node _T_9 = add(testCounter, UInt<1>("h1")) @[Counter.scala 78:47]
    node _T_10 = tail(_T_9, 1) @[Counter.scala 78:47]
    node _T_11 = mux(_T_8, UInt<1>("h0"), _T_10) @[Counter.scala 78:18]
    node _T_12 = eq(testCounter, UInt<3>("h7")) @[Counter.scala 89:26]
    io_cnt <= testCounter @[Counter.scala 90:10]
    io_tick <= _T_12 @[Counter.scala 89:11]
    count10 <= mux(reset, UInt<8>("h0"), _T_3) @[Counter.scala 77:25 Counter.scala 77:25 Counter.scala 78:12]
    count99 <= mux(reset, UInt<8>("h0"), _T_7) @[Counter.scala 77:25 Counter.scala 77:25 Counter.scala 78:12]
    testCounter <= mux(reset, UInt<8>("h0"), _T_11) @[Counter.scala 77:25 Counter.scala 77:25 Counter.scala 78:12]