circuit FunctionalMin :
  module FunctionalMin :
    input clock : Clock
    input reset : UInt<1>
    input io_in_0 : UInt<32>
    input io_in_1 : UInt<32>
    output io_min : UInt<32>
    output io_resA : UInt<32>
    output io_idxA : UInt<8>
    output io_resB : UInt<32>
    output io_idxB : UInt<8>
    output io_resC : UInt<32>
    output io_idxC : UInt<8>

    node _T = lt(io_in_0, io_in_1) @[functional.scala 61:44]
    node _T_1 = mux(_T, io_in_0, io_in_1) @[functional.scala 61:41]
    node vecTwo_0_v = io_in_0 @[functional.scala 70:20 functional.scala 72:17]
    node vecTwo_1_v = io_in_1 @[functional.scala 70:20 functional.scala 72:17]
    node _T_2 = lt(vecTwo_0_v, vecTwo_1_v) @[functional.scala 76:49]
    node _T_3_v = mux(_T_2, vecTwo_0_v, vecTwo_1_v) @[functional.scala 76:44]
    node vecTwo_0_idx = pad(UInt<1>("h0"), 8) @[functional.scala 70:20 functional.scala 73:19]
    node vecTwo_1_idx = pad(UInt<1>("h1"), 8) @[functional.scala 70:20 functional.scala 73:19]
    node _T_3_idx = mux(_T_2, vecTwo_0_idx, vecTwo_1_idx) @[functional.scala 76:44]
    node _T_4 = lt(io_in_0, io_in_1) @[functional.scala 82:33]
    node _T_5 = mux(_T_4, io_in_0, io_in_1) @[functional.scala 82:27]
    node _T_6 = lt(io_in_0, io_in_1) @[functional.scala 82:63]
    node _T_7 = mux(_T_6, UInt<1>("h0"), UInt<1>("h1")) @[functional.scala 82:57]
    node scalaVector_0_0 = io_in_0 @[MixedVec.scala 27:26 MixedVec.scala 30:9]
    node _WIRE_2_0_0 = scalaVector_0_0 @[functional.scala 95:24 functional.scala 95:24]
    node scalaVector_1_0 = io_in_1 @[MixedVec.scala 27:26 MixedVec.scala 30:9]
    node _WIRE_2_1_0 = scalaVector_1_0 @[functional.scala 95:24 functional.scala 95:24]
    node _T_8 = lt(_WIRE_2_0_0, _WIRE_2_1_0) @[functional.scala 96:36]
    node scalaVector_0_1 = UInt<8>("h0") @[MixedVec.scala 27:26 MixedVec.scala 30:9]
    node _WIRE_2_0_1 = scalaVector_0_1 @[functional.scala 95:24 functional.scala 95:24]
    node scalaVector_1_1 = UInt<8>("h1") @[MixedVec.scala 27:26 MixedVec.scala 30:9]
    node _WIRE_2_1_1 = scalaVector_1_1 @[functional.scala 95:24 functional.scala 95:24]
    node _T_9_1 = mux(_T_8, _WIRE_2_0_1, _WIRE_2_1_1) @[functional.scala 96:30]
    node _T_9_0 = mux(_T_8, _WIRE_2_0_0, _WIRE_2_1_0) @[functional.scala 96:30]
    node _WIRE_0 = _T_1 @[functional.scala 61:27 functional.scala 61:27]
    node _WIRE_1_0_v = _T_3_v @[functional.scala 76:30 functional.scala 76:30]
    node _WIRE_1_0_idx = _T_3_idx @[functional.scala 76:30 functional.scala 76:30]
    node _WIRE_3_0_1 = _T_9_1 @[functional.scala 96:16 functional.scala 96:16]
    node _WIRE_3_0_0 = _T_9_0 @[functional.scala 96:16 functional.scala 96:16]
    io_min <= _WIRE_0 @[functional.scala 99:10]
    io_resA <= _WIRE_1_0_v @[functional.scala 101:11]
    io_idxA <= _WIRE_1_0_idx @[functional.scala 102:11]
    io_resB <= _T_5 @[functional.scala 104:11]
    io_idxB <= _T_7 @[functional.scala 105:11]
    io_resC <= _WIRE_3_0_0 @[functional.scala 107:11]
    io_idxC <= _WIRE_3_0_1 @[functional.scala 108:11]