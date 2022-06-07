circuit CombOther :
  module CombOther :
    input clock : Clock
    input reset : UInt<1>
    input io_cond : UInt<1>
    output io_out : UInt<4>

    node _GEN_0 = mux(io_cond, UInt<1>("h1"), UInt<2>("h2")) @[Combinational.scala 81:15 Combinational.scala 82:7 Combinational.scala 84:7]
    node w = _GEN_0 @[Combinational.scala 79:15]
    io_out <= w @[Combinational.scala 87:10]