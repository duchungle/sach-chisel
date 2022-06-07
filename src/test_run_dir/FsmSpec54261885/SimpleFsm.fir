;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit SimpleFsm : 
  module SimpleFsm : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip badEvent : UInt<1>, flip clear : UInt<1>, ringBell : UInt<1>}
    
    reg stateReg : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[SimpleFsm.scala 16:25]
    node _T = eq(UInt<2>("h00"), stateReg) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      when io.badEvent : @[SimpleFsm.scala 21:25]
        stateReg <= UInt<2>("h01") @[SimpleFsm.scala 22:18]
        skip @[SimpleFsm.scala 21:25]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_1 = eq(UInt<2>("h01"), stateReg) @[Conditional.scala 37:30]
      when _T_1 : @[Conditional.scala 39:67]
        when io.badEvent : @[SimpleFsm.scala 26:25]
          stateReg <= UInt<2>("h02") @[SimpleFsm.scala 27:18]
          skip @[SimpleFsm.scala 26:25]
        else : @[SimpleFsm.scala 28:29]
          when io.clear : @[SimpleFsm.scala 28:29]
            stateReg <= UInt<2>("h00") @[SimpleFsm.scala 29:18]
            skip @[SimpleFsm.scala 28:29]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_2 = eq(UInt<2>("h02"), stateReg) @[Conditional.scala 37:30]
        when _T_2 : @[Conditional.scala 39:67]
          when io.clear : @[SimpleFsm.scala 33:23]
            stateReg <= UInt<2>("h00") @[SimpleFsm.scala 34:18]
            skip @[SimpleFsm.scala 33:23]
          skip @[Conditional.scala 39:67]
    node _T_3 = eq(stateReg, UInt<2>("h02")) @[SimpleFsm.scala 40:27]
    io.ringBell <= _T_3 @[SimpleFsm.scala 40:15]
    
