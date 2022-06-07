circuit CombWireDefault :
  module CombWireDefault :
    input clock : Clock
    input reset : UInt<1>
    input io_cond : UInt<1>
    output io_out : UInt<4>

    node _GEN_0 = mux(io_cond, UInt<2>("h3"), UInt<1>("h0")) @[Combinational.scala 124:15 Combinational.scala 125:7]
    node w = _GEN_0
    io_out <= w @[Combinational.scala 129:10]