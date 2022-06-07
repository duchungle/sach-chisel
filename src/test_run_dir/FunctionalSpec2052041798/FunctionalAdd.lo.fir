circuit FunctionalAdd :
  module FunctionalAdd :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : UInt<10>
    input io_in_1 : UInt<10>
    input io_in_2 : UInt<10>
    input io_in_3 : UInt<10>
    input io_in_4 : UInt<10>
    output io_res : UInt<10>

    node _T = add(io_in_0, io_in_1) @[functional.scala 29:30]
    node _T_1 = tail(_T, 1) @[functional.scala 29:30]
    node _T_2 = add(io_in_2, io_in_3) @[functional.scala 29:30]
    node _T_3 = tail(_T_2, 1) @[functional.scala 29:30]
    node _WIRE__0 = _T_1 @[functional.scala 29:27 functional.scala 29:27]
    node _WIRE__1 = _T_3 @[functional.scala 29:27 functional.scala 29:27]
    node _T_4 = add(_WIRE__0, _WIRE__1) @[functional.scala 29:30]
    node _T_5 = tail(_T_4, 1) @[functional.scala 29:30]
    node _WIRE_1_0 = _T_5 @[functional.scala 29:27 functional.scala 29:27]
    node _WIRE__2 = io_in_4 @[functional.scala 29:27 functional.scala 29:27]
    node _WIRE_1_1 = _WIRE__2 @[functional.scala 29:27 functional.scala 29:27]
    node _T_6 = add(_WIRE_1_0, _WIRE_1_1) @[functional.scala 29:30]
    node _T_7 = tail(_T_6, 1) @[functional.scala 29:30]
    node _WIRE_2_0 = _T_7 @[functional.scala 29:27 functional.scala 29:27]
    io_res <= _WIRE_2_0 @[functional.scala 32:10]