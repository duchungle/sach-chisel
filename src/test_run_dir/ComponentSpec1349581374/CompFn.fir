;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit CompFn : 
  module CompFn : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<4>, flip b : UInt<4>, out : UInt<4>, flip c : UInt<4>, flip d : UInt<4>, out2 : UInt<4>, flip del : UInt<4>, out3 : UInt<4>}
    
    node _T = add(io.a, io.b) @[components.scala 131:7]
    node x = tail(_T, 1) @[components.scala 131:7]
    node _T_1 = add(io.c, io.d) @[components.scala 131:7]
    node y = tail(_T_1, 1) @[components.scala 131:7]
    io.out <= x @[components.scala 141:10]
    node _T_2 = sub(y, UInt<1>("h01")) @[components.scala 142:16]
    node _T_3 = tail(_T_2, 1) @[components.scala 142:16]
    io.out2 <= _T_3 @[components.scala 142:11]
    reg REG : UInt, clock @[components.scala 147:31]
    REG <= io.del @[components.scala 147:31]
    reg delOut : UInt, clock @[components.scala 147:31]
    delOut <= REG @[components.scala 147:31]
    io.out3 <= delOut @[components.scala 154:11]
    
