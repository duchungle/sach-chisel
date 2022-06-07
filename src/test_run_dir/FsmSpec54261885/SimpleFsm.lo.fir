circuit SimpleFsm :
  module SimpleFsm :
    input clock : Clock
    input reset : UInt<1>
    input io_badEvent : UInt<1>
    input io_clear : UInt<1>
    output io_ringBell : UInt<1>

    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[SimpleFsm.scala 16:25]
    node _T = eq(UInt<2>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_badEvent, UInt<2>("h1"), stateReg) @[SimpleFsm.scala 21:25 SimpleFsm.scala 22:18 SimpleFsm.scala 16:25]
    node _T_1 = eq(UInt<2>("h1"), stateReg) @[Conditional.scala 37:30]
    node _GEN_1 = mux(io_clear, UInt<2>("h0"), stateReg) @[SimpleFsm.scala 28:29 SimpleFsm.scala 29:18 SimpleFsm.scala 16:25]
    node _GEN_2 = mux(io_badEvent, UInt<2>("h2"), _GEN_1) @[SimpleFsm.scala 26:25 SimpleFsm.scala 27:18]
    node _T_2 = eq(UInt<2>("h2"), stateReg) @[Conditional.scala 37:30]
    node _GEN_3 = mux(_T_2, _GEN_1, stateReg) @[Conditional.scala 39:67 SimpleFsm.scala 16:25]
    node _GEN_4 = mux(_T_1, _GEN_2, _GEN_3) @[Conditional.scala 39:67]
    node _GEN_5 = mux(_T, _GEN_0, _GEN_4) @[Conditional.scala 40:58]
    node _T_3 = eq(stateReg, UInt<2>("h2")) @[SimpleFsm.scala 40:27]
    io_ringBell <= _T_3 @[SimpleFsm.scala 40:15]
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_5) @[SimpleFsm.scala 16:25 SimpleFsm.scala 16:25]