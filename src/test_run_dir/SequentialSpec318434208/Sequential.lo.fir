circuit Sequential :
  module Sequential :
    input clock : Clock
    input reset : UInt<1>
    input io_d : UInt<4>
    output io_q : UInt<4>
    input io_d2 : UInt<4>
    output io_q2 : UInt<4>
    input io_d3 : UInt<4>
    output io_q3 : UInt<4>
    input io_ena : UInt<1>
    output io_q4 : UInt<4>
    output io_q5 : UInt<4>
    input io_riseIn : UInt<1>
    output io_riseOut : UInt<1>

    reg q : UInt<4>, clock with :
      reset => (UInt<1>("h0"), q) @[Sequential.scala 20:18]
    reg delayReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), delayReg) @[Sequential.scala 26:21]
    reg valReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), valReg) @[Sequential.scala 34:23]
    reg enableReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), enableReg) @[Sequential.scala 42:22]
    node _GEN_0 = mux(io_ena, io_d3, enableReg) @[Sequential.scala 44:17 Sequential.scala 45:15 Sequential.scala 42:22]
    reg resetEnableReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), resetEnableReg) @[Sequential.scala 51:31]
    node _GEN_1 = mux(io_ena, io_d3, resetEnableReg) @[Sequential.scala 53:17 Sequential.scala 54:20 Sequential.scala 51:31]
    reg REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), REG) @[Sequential.scala 61:34]
    node _T = eq(REG, UInt<1>("h0")) @[Sequential.scala 61:26]
    node risingEdge = and(io_riseIn, _T) @[Sequential.scala 61:24]
    io_q <= q @[Sequential.scala 22:8]
    io_q2 <= delayReg @[Sequential.scala 30:9]
    io_q3 <= valReg @[Sequential.scala 38:9]
    io_q4 <= enableReg @[Sequential.scala 48:9]
    io_q5 <= resetEnableReg @[Sequential.scala 57:9]
    io_riseOut <= risingEdge @[Sequential.scala 63:14]
    q <= io_d @[Sequential.scala 20:18]
    delayReg <= io_d2 @[Sequential.scala 28:12]
    valReg <= mux(reset, UInt<4>("h0"), io_d3) @[Sequential.scala 34:23 Sequential.scala 34:23 Sequential.scala 36:10]
    enableReg <= _GEN_0
    resetEnableReg <= mux(reset, UInt<4>("h0"), _GEN_1) @[Sequential.scala 51:31 Sequential.scala 51:31]
    REG <= io_riseIn @[Sequential.scala 61:34]