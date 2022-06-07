circuit SequCounter :
  module SequCounter :
    input clock : Clock
    input reset : UInt<1>
    output io_out : UInt<4>
    input io_event : UInt<1>
    output io_eventCnt : UInt<4>
    output io_tick : UInt<1>
    output io_lowCnt : UInt<4>

    reg cntReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[Sequential.scala 78:23]
    node _T = add(cntReg, UInt<1>("h1")) @[Sequential.scala 80:20]
    node _T_1 = tail(_T, 1) @[Sequential.scala 80:20]
    reg cntEventsReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), cntEventsReg) @[Sequential.scala 86:29]
    node _T_2 = add(cntEventsReg, UInt<1>("h1")) @[Sequential.scala 88:34]
    node _T_3 = tail(_T_2, 1) @[Sequential.scala 88:34]
    node _GEN_0 = mux(io_event, _T_3, cntEventsReg) @[Sequential.scala 87:15 Sequential.scala 88:18 Sequential.scala 86:29]
    reg tickCounterReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), tickCounterReg) @[Sequential.scala 95:31]
    node tick = eq(tickCounterReg, UInt<3>("h4")) @[Sequential.scala 96:29]
    node _T_4 = add(tickCounterReg, UInt<1>("h1")) @[Sequential.scala 98:36]
    node _T_5 = tail(_T_4, 1) @[Sequential.scala 98:36]
    node _GEN_1 = mux(tick, UInt<1>("h0"), _T_5) @[Sequential.scala 99:15 Sequential.scala 100:20 Sequential.scala 98:18]
    reg lowFrequCntReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), lowFrequCntReg) @[Sequential.scala 105:31]
    node _T_6 = add(lowFrequCntReg, UInt<1>("h1")) @[Sequential.scala 107:38]
    node _T_7 = tail(_T_6, 1) @[Sequential.scala 107:38]
    node _GEN_2 = mux(tick, _T_7, lowFrequCntReg) @[Sequential.scala 106:15 Sequential.scala 107:20 Sequential.scala 105:31]
    io_out <= cntReg @[Sequential.scala 82:10]
    io_eventCnt <= cntEventsReg @[Sequential.scala 91:15]
    io_tick <= tick @[Sequential.scala 111:11]
    io_lowCnt <= lowFrequCntReg @[Sequential.scala 112:13]
    cntReg <= mux(reset, UInt<4>("h0"), _T_1) @[Sequential.scala 78:23 Sequential.scala 78:23 Sequential.scala 80:10]
    cntEventsReg <= mux(reset, UInt<4>("h0"), _GEN_0) @[Sequential.scala 86:29 Sequential.scala 86:29]
    tickCounterReg <= mux(reset, UInt<4>("h0"), _GEN_1) @[Sequential.scala 95:31 Sequential.scala 95:31]
    lowFrequCntReg <= mux(reset, UInt<4>("h0"), _GEN_2) @[Sequential.scala 105:31 Sequential.scala 105:31]