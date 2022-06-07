circuit RisingMooreFsm :
  module RisingMooreFsm :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<1>
    output io_risingEdge : UInt<1>

    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[RisingMooreFsm.scala 15:25]
    node _T = eq(UInt<2>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_din, UInt<2>("h1"), stateReg) @[RisingMooreFsm.scala 20:20 RisingMooreFsm.scala 21:18 RisingMooreFsm.scala 15:25]
    node _T_1 = eq(UInt<2>("h1"), stateReg) @[Conditional.scala 37:30]
    node _GEN_1 = mux(io_din, UInt<2>("h2"), UInt<2>("h0")) @[RisingMooreFsm.scala 25:20 RisingMooreFsm.scala 26:18 RisingMooreFsm.scala 28:18]
    node _T_2 = eq(UInt<2>("h2"), stateReg) @[Conditional.scala 37:30]
    node _T_3 = eq(io_din, UInt<1>("h0")) @[RisingMooreFsm.scala 32:12]
    node _GEN_2 = mux(_T_3, UInt<2>("h0"), stateReg) @[RisingMooreFsm.scala 32:21 RisingMooreFsm.scala 33:18 RisingMooreFsm.scala 15:25]
    node _GEN_3 = mux(_T_2, _GEN_2, stateReg) @[Conditional.scala 39:67 RisingMooreFsm.scala 15:25]
    node _GEN_4 = mux(_T_1, _GEN_1, _GEN_3) @[Conditional.scala 39:67]
    node _GEN_5 = mux(_T, _GEN_0, _GEN_4) @[Conditional.scala 40:58]
    node _T_4 = eq(stateReg, UInt<2>("h1")) @[RisingMooreFsm.scala 39:29]
    io_risingEdge <= _T_4 @[RisingMooreFsm.scala 39:17]
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_5) @[RisingMooreFsm.scala 15:25 RisingMooreFsm.scala 15:25]