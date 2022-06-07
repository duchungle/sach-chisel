;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit ParamFunc : 
  module ParamFunc : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip selA : UInt<1>, resA : UInt<5>, flip selB : UInt<1>, resB : {d : UInt<10>, b : UInt<1>}}
    
    wire resA : UInt
    resA <= UInt<4>("h0a")
    when io.selA : @[ParamFunc.scala 23:16]
      resA <= UInt<3>("h05") @[ParamFunc.scala 24:11]
      skip @[ParamFunc.scala 23:16]
    wire tVal : {d : UInt<10>, b : UInt<1>} @[ParamFunc.scala 57:18]
    tVal.b <= UInt<1>("h01") @[ParamFunc.scala 58:10]
    tVal.d <= UInt<6>("h02a") @[ParamFunc.scala 59:10]
    wire fVal : {d : UInt<10>, b : UInt<1>} @[ParamFunc.scala 60:18]
    fVal.b <= UInt<1>("h00") @[ParamFunc.scala 61:10]
    fVal.d <= UInt<4>("h0d") @[ParamFunc.scala 62:10]
    wire resB : {d : UInt<10>, b : UInt<1>}
    resB.b <= fVal.b
    resB.d <= fVal.d
    when io.selB : @[ParamFunc.scala 23:16]
      resB.b <= tVal.b @[ParamFunc.scala 24:11]
      resB.d <= tVal.d @[ParamFunc.scala 24:11]
      skip @[ParamFunc.scala 23:16]
    io.resA <= resA @[ParamFunc.scala 69:11]
    io.resB.b <= resB.b @[ParamFunc.scala 70:11]
    io.resB.d <= resB.d @[ParamFunc.scala 70:11]
    
