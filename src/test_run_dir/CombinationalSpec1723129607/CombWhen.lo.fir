circuit CombWhen :
  module CombWhen :
    input clock : Clock
    input reset : UInt<1>
    input io_cond : UInt<1>
    output io_out : UInt<4>

    node _GEN_0 = mux(io_cond, UInt<2>("h3"), UInt<1>("h0")) @[Combinational.scala 45:15 Combinational.scala 46:7 Combinational.scala 44:5]
    node w = _GEN_0 @[Combinational.scala 42:15]
    io_out <= w @[Combinational.scala 49:10]