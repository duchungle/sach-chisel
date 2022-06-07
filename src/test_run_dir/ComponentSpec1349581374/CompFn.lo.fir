circuit CompFn :
  module CompFn :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<4>
    input io_b : UInt<4>
    output io_out : UInt<4>
    input io_c : UInt<4>
    input io_d : UInt<4>
    output io_out2 : UInt<4>
    input io_del : UInt<4>
    output io_out3 : UInt<4>

    node _T = add(io_a, io_b) @[components.scala 131:7]
    node x = tail(_T, 1) @[components.scala 131:7]
    node _T_1 = add(io_c, io_d) @[components.scala 131:7]
    node y = tail(_T_1, 1) @[components.scala 131:7]
    node _T_2 = sub(y, UInt<1>("h1")) @[components.scala 142:16]
    node _T_3 = tail(_T_2, 1) @[components.scala 142:16]
    reg REG : UInt<4>, clock with :
      reset => (UInt<1>("h0"), REG) @[components.scala 147:31]
    reg delOut : UInt<4>, clock with :
      reset => (UInt<1>("h0"), delOut) @[components.scala 147:31]
    io_out <= x @[components.scala 141:10]
    io_out2 <= _T_3 @[components.scala 142:11]
    io_out3 <= delOut @[components.scala 154:11]
    REG <= io_del @[components.scala 147:31]
    delOut <= REG @[components.scala 147:31]