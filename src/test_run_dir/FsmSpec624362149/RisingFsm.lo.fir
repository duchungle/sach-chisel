circuit RisingFsm :
  module RisingFsm :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<1>
    output io_risingEdge : UInt<1>

    reg stateReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[RisingFsm.scala 15:25]
    node _T = eq(UInt<1>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_din, UInt<1>("h1"), stateReg) @[RisingFsm.scala 23:20 RisingFsm.scala 24:18 RisingFsm.scala 15:25]
    node _GEN_1 = mux(io_din, UInt<1>("h1"), UInt<1>("h0")) @[RisingFsm.scala 23:20 RisingFsm.scala 25:23 RisingFsm.scala 18:17]
    node _T_1 = eq(UInt<1>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_2 = eq(io_din, UInt<1>("h0")) @[RisingFsm.scala 29:12]
    node _GEN_2 = mux(_T_2, UInt<1>("h0"), stateReg) @[RisingFsm.scala 29:21 RisingFsm.scala 30:18 RisingFsm.scala 15:25]
    node _GEN_3 = mux(_T_1, _GEN_2, stateReg) @[Conditional.scala 39:67 RisingFsm.scala 15:25]
    node _GEN_4 = mux(_T, _GEN_0, _GEN_3) @[Conditional.scala 40:58]
    node _GEN_5 = mux(_T, _GEN_1, UInt<1>("h0")) @[Conditional.scala 40:58 RisingFsm.scala 18:17]
    io_risingEdge <= _GEN_5
    stateReg <= mux(reset, UInt<1>("h0"), _GEN_4) @[RisingFsm.scala 15:25 RisingFsm.scala 15:25]