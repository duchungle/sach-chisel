circuit CombElseWhen :
  module CombElseWhen :
    input clock : Clock
    input reset : UInt<1>
    input io_cond : UInt<1>
    input io_cond2 : UInt<1>
    output io_out : UInt<4>

    node _GEN_0 = mux(io_cond2, UInt<2>("h2"), UInt<2>("h3")) @[Combinational.scala 105:23 Combinational.scala 106:7 Combinational.scala 108:7]
    node _GEN_1 = mux(io_cond, UInt<1>("h1"), _GEN_0) @[Combinational.scala 103:15 Combinational.scala 104:7]
    node w = _GEN_1 @[Combinational.scala 101:15]
    io_out <= w @[Combinational.scala 111:10]