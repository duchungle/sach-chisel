circuit Timer :
  module Timer :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<8>
    input io_load : UInt<1>
    output io_done : UInt<1>

    reg cntReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Timer.scala 13:23]
    node done = eq(cntReg, UInt<1>("h0")) @[Timer.scala 14:21]
    node _T = eq(done, UInt<1>("h0")) @[Timer.scala 19:16]
    node _T_1 = sub(cntReg, UInt<1>("h1")) @[Timer.scala 20:20]
    node _T_2 = tail(_T_1, 1) @[Timer.scala 20:20]
    node _GEN_0 = mux(_T, _T_2, UInt<1>("h0")) @[Timer.scala 19:23 Timer.scala 20:10]
    node _GEN_1 = mux(io_load, io_din, _GEN_0) @[Timer.scala 17:15 Timer.scala 18:10]
    node next = _GEN_1
    io_done <= done @[Timer.scala 26:11]
    cntReg <= mux(reset, UInt<8>("h0"), next) @[Timer.scala 13:23 Timer.scala 13:23 Timer.scala 22:10]