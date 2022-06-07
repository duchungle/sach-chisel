;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Timer : 
  module Timer : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip din : UInt<8>, flip load : UInt<1>, done : UInt<1>}
    
    reg cntReg : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[Timer.scala 13:23]
    node done = eq(cntReg, UInt<1>("h00")) @[Timer.scala 14:21]
    wire next : UInt
    next <= UInt<1>("h00")
    when io.load : @[Timer.scala 17:15]
      next <= io.din @[Timer.scala 18:10]
      skip @[Timer.scala 17:15]
    else : @[Timer.scala 19:23]
      node _T = eq(done, UInt<1>("h00")) @[Timer.scala 19:16]
      when _T : @[Timer.scala 19:23]
        node _T_1 = sub(cntReg, UInt<1>("h01")) @[Timer.scala 20:20]
        node _T_2 = tail(_T_1, 1) @[Timer.scala 20:20]
        next <= _T_2 @[Timer.scala 20:10]
        skip @[Timer.scala 19:23]
    cntReg <= next @[Timer.scala 22:10]
    io.done <= done @[Timer.scala 26:11]
    
