;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit FunctionalAdd : 
  module FunctionalAdd : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in : UInt<10>[5], res : UInt<10>}
    
    node _T = add(io.in[0], io.in[1]) @[functional.scala 29:30]
    node _T_1 = tail(_T, 1) @[functional.scala 29:30]
    node _T_2 = add(io.in[2], io.in[3]) @[functional.scala 29:30]
    node _T_3 = tail(_T_2, 1) @[functional.scala 29:30]
    wire _WIRE : UInt<10>[3] @[functional.scala 29:27]
    _WIRE[0] <= _T_1 @[functional.scala 29:27]
    _WIRE[1] <= _T_3 @[functional.scala 29:27]
    _WIRE[2] <= io.in[4] @[functional.scala 29:27]
    node _T_4 = add(_WIRE[0], _WIRE[1]) @[functional.scala 29:30]
    node _T_5 = tail(_T_4, 1) @[functional.scala 29:30]
    wire _WIRE_1 : UInt<10>[2] @[functional.scala 29:27]
    _WIRE_1[0] <= _T_5 @[functional.scala 29:27]
    _WIRE_1[1] <= _WIRE[2] @[functional.scala 29:27]
    node _T_6 = add(_WIRE_1[0], _WIRE_1[1]) @[functional.scala 29:30]
    node _T_7 = tail(_T_6, 1) @[functional.scala 29:30]
    wire _WIRE_2 : UInt<10>[1] @[functional.scala 29:27]
    _WIRE_2[0] <= _T_7 @[functional.scala 29:27]
    io.res <= _WIRE_2[0] @[functional.scala 32:10]
    
