;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Sequential : 
  module Sequential : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip d : UInt<4>, q : UInt<4>, flip d2 : UInt<4>, q2 : UInt<4>, flip d3 : UInt<4>, q3 : UInt<4>, flip ena : UInt<1>, q4 : UInt<4>, q5 : UInt<4>, flip riseIn : UInt<1>, riseOut : UInt<1>}
    
    reg q : UInt, clock @[Sequential.scala 20:18]
    q <= io.d @[Sequential.scala 20:18]
    io.q <= q @[Sequential.scala 22:8]
    reg delayReg : UInt<4>, clock @[Sequential.scala 26:21]
    delayReg <= io.d2 @[Sequential.scala 28:12]
    io.q2 <= delayReg @[Sequential.scala 30:9]
    reg valReg : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Sequential.scala 34:23]
    valReg <= io.d3 @[Sequential.scala 36:10]
    io.q3 <= valReg @[Sequential.scala 38:9]
    reg enableReg : UInt<4>, clock @[Sequential.scala 42:22]
    when io.ena : @[Sequential.scala 44:17]
      enableReg <= io.d3 @[Sequential.scala 45:15]
      skip @[Sequential.scala 44:17]
    io.q4 <= enableReg @[Sequential.scala 48:9]
    reg resetEnableReg : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[Sequential.scala 51:31]
    when io.ena : @[Sequential.scala 53:17]
      resetEnableReg <= io.d3 @[Sequential.scala 54:20]
      skip @[Sequential.scala 53:17]
    io.q5 <= resetEnableReg @[Sequential.scala 57:9]
    reg REG : UInt, clock @[Sequential.scala 61:34]
    REG <= io.riseIn @[Sequential.scala 61:34]
    node _T = eq(REG, UInt<1>("h00")) @[Sequential.scala 61:26]
    node risingEdge = and(io.riseIn, _T) @[Sequential.scala 61:24]
    io.riseOut <= risingEdge @[Sequential.scala 63:14]
    
