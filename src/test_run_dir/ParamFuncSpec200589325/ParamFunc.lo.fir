circuit ParamFunc :
  module ParamFunc :
    input clock : Clock
    input reset : UInt<1>
    input io_selA : UInt<1>
    output io_resA : UInt<5>
    input io_selB : UInt<1>
    output io_resB_d : UInt<10>
    output io_resB_b : UInt<1>

    node _GEN_0 = mux(io_selA, UInt<3>("h5"), UInt<4>("ha")) @[ParamFunc.scala 23:16 ParamFunc.scala 24:11]
    node tVal_b = UInt<1>("h1") @[ParamFunc.scala 57:18 ParamFunc.scala 58:10]
    node fVal_b = UInt<1>("h0") @[ParamFunc.scala 60:18 ParamFunc.scala 61:10]
    node _GEN_1 = mux(io_selB, tVal_b, fVal_b) @[ParamFunc.scala 23:16 ParamFunc.scala 24:11]
    node tVal_d = pad(UInt<6>("h2a"), 10) @[ParamFunc.scala 57:18 ParamFunc.scala 59:10]
    node fVal_d = pad(UInt<4>("hd"), 10) @[ParamFunc.scala 60:18 ParamFunc.scala 62:10]
    node _GEN_2 = mux(io_selB, tVal_d, fVal_d) @[ParamFunc.scala 23:16 ParamFunc.scala 24:11]
    node resA = _GEN_0
    node resB_d = _GEN_2
    node resB_b = _GEN_1
    io_resA <= resA @[ParamFunc.scala 69:11]
    io_resB_d <= resB_d @[ParamFunc.scala 70:11]
    io_resB_b <= resB_b @[ParamFunc.scala 70:11]