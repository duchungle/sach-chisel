circuit DeviceUnderTestPrintf :
  module DeviceUnderTestPrintf :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<2>
    input io_b : UInt<2>
    output io_out : UInt<2>

    node _T = and(io_a, io_b) @[testing.scala 26:18]
    node _T_1 = bits(reset, 0, 0) @[testing.scala 27:9]
    node _T_2 = eq(_T_1, UInt<1>("h0")) @[testing.scala 27:9]
    io_out <= _T @[testing.scala 26:10]
    printf(clock, and(and(UInt<1>("h1"), _T_2), UInt<1>("h1")), "dut: %d %d %d\n", io_a, io_b, io_out) @[testing.scala 27:9]