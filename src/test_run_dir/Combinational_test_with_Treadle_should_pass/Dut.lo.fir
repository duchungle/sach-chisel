circuit Dut :
  module Dut :
    input clock : Clock
    input reset : UInt<1>
    input io_in : UInt<1>
    output io_out : UInt<1>

    node _T = eq(io_in, UInt<1>("h0")) @[Snippets.scala 14:15]
    io_out <= _T @[Snippets.scala 14:12]