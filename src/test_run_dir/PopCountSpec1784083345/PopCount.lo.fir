circuit PopCount :
  module PopCountFSM :
    input clock : Clock
    input reset : UInt<1>
    input io_dinValid : UInt<1>
    output io_dinReady : UInt<1>
    output io_popCntValid : UInt<1>
    input io_popCntReady : UInt<1>
    output io_load : UInt<1>
    input io_done : UInt<1>

    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[PopCount.scala 16:25]
    node _T = eq(UInt<2>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_dinValid, UInt<1>("h1"), UInt<1>("h0")) @[PopCount.scala 26:25 PopCount.scala 27:17 PopCount.scala 18:11]
    node _GEN_1 = mux(io_dinValid, UInt<2>("h1"), stateReg) @[PopCount.scala 26:25 PopCount.scala 28:18 PopCount.scala 16:25]
    node _T_1 = eq(UInt<2>("h1"), stateReg) @[Conditional.scala 37:30]
    node _GEN_2 = mux(io_done, UInt<2>("h2"), stateReg) @[PopCount.scala 32:21 PopCount.scala 33:18 PopCount.scala 16:25]
    node _T_2 = eq(UInt<2>("h2"), stateReg) @[Conditional.scala 37:30]
    node _GEN_3 = mux(io_popCntReady, UInt<2>("h0"), stateReg) @[PopCount.scala 38:28 PopCount.scala 39:18 PopCount.scala 16:25]
    node _GEN_4 = mux(_T_2, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 PopCount.scala 37:22 PopCount.scala 21:18]
    node _GEN_5 = mux(_T_2, _GEN_3, stateReg) @[Conditional.scala 39:67 PopCount.scala 16:25]
    node _GEN_6 = mux(_T_1, _GEN_2, _GEN_5) @[Conditional.scala 39:67]
    node _GEN_7 = mux(_T_1, UInt<1>("h0"), _GEN_4) @[Conditional.scala 39:67 PopCount.scala 21:18]
    node _GEN_8 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 40:58 PopCount.scala 25:19 PopCount.scala 20:15]
    node _GEN_9 = mux(_T, _GEN_0, UInt<1>("h0")) @[Conditional.scala 40:58 PopCount.scala 18:11]
    node _GEN_10 = mux(_T, _GEN_1, _GEN_6) @[Conditional.scala 40:58]
    node _GEN_11 = mux(_T, UInt<1>("h0"), _GEN_7) @[Conditional.scala 40:58 PopCount.scala 21:18]
    io_dinReady <= _GEN_8
    io_popCntValid <= _GEN_11
    io_load <= _GEN_9
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_10) @[PopCount.scala 16:25 PopCount.scala 16:25]

  module PopCountDataPath :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<8>
    input io_load : UInt<1>
    output io_popCnt : UInt<4>
    output io_done : UInt<1>

    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[PopCount.scala 55:24]
    reg popCntReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), popCntReg) @[PopCount.scala 56:26]
    reg counterReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), counterReg) @[PopCount.scala 57:26]
    node _T = bits(dataReg, 7, 1) @[PopCount.scala 59:28]
    node _T_1 = cat(UInt<1>("h0"), _T) @[PopCount.scala 59:18]
    node _T_2 = bits(dataReg, 0, 0) @[PopCount.scala 60:35]
    node _T_3 = add(popCntReg, _T_2) @[PopCount.scala 60:26]
    node _T_4 = tail(_T_3, 1) @[PopCount.scala 60:26]
    node done = eq(counterReg, UInt<1>("h0")) @[PopCount.scala 62:25]
    node _T_5 = eq(done, UInt<1>("h0")) @[PopCount.scala 63:9]
    node _T_6 = sub(counterReg, UInt<1>("h1")) @[PopCount.scala 64:30]
    node _T_7 = tail(_T_6, 1) @[PopCount.scala 64:30]
    node _GEN_0 = mux(_T_5, _T_7, counterReg) @[PopCount.scala 63:16 PopCount.scala 64:16 PopCount.scala 57:26]
    node _GEN_1 = mux(io_load, io_din, _T_1) @[PopCount.scala 67:17 PopCount.scala 68:13 PopCount.scala 59:11]
    node _GEN_2 = mux(io_load, UInt<1>("h0"), _T_4) @[PopCount.scala 67:17 PopCount.scala 69:15 PopCount.scala 60:13]
    node _GEN_3 = mux(io_load, UInt<4>("h8"), _GEN_0) @[PopCount.scala 67:17 PopCount.scala 70:16]
    node _T_8 = asUInt(reset) @[PopCount.scala 74:9]
    node _T_9 = eq(_T_8, UInt<1>("h0")) @[PopCount.scala 74:9]
    io_popCnt <= bits(popCntReg, 3, 0) @[PopCount.scala 76:13]
    io_done <= done @[PopCount.scala 77:11]
    dataReg <= mux(reset, UInt<8>("h0"), _GEN_1) @[PopCount.scala 55:24 PopCount.scala 55:24]
    popCntReg <= mux(reset, UInt<8>("h0"), _GEN_2) @[PopCount.scala 56:26 PopCount.scala 56:26]
    counterReg <= mux(reset, UInt<4>("h0"), _GEN_3) @[PopCount.scala 57:26 PopCount.scala 57:26]
    printf(clock, and(and(UInt<1>("h1"), _T_9), UInt<1>("h1")), "%x %d\n", dataReg, popCntReg) @[PopCount.scala 74:9]

  module PopCount :
    input clock : Clock
    input reset : UInt<1>
    input io_dinValid : UInt<1>
    output io_dinReady : UInt<1>
    input io_din : UInt<8>
    output io_popCntValid : UInt<1>
    input io_popCntReady : UInt<1>
    output io_popCnt : UInt<4>

    inst fsm of PopCountFSM @[PopCount.scala 93:19]
    inst data of PopCountDataPath @[PopCount.scala 94:20]
    io_dinReady <= fsm.io_dinReady @[PopCount.scala 97:15]
    io_popCntValid <= fsm.io_popCntValid @[PopCount.scala 98:18]
    io_popCnt <= data.io_popCnt @[PopCount.scala 102:13]
    fsm.clock <= clock
    fsm.reset <= reset
    fsm.io_dinValid <= io_dinValid @[PopCount.scala 96:19]
    fsm.io_popCntReady <= io_popCntReady @[PopCount.scala 99:22]
    fsm.io_done <= data.io_done @[PopCount.scala 104:15]
    data.clock <= clock
    data.reset <= reset
    data.io_din <= io_din @[PopCount.scala 101:15]
    data.io_load <= fsm.io_load @[PopCount.scala 103:16]