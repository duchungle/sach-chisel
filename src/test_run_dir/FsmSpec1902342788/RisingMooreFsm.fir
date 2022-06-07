;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit RisingMooreFsm : 
  module RisingMooreFsm : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip din : UInt<1>, risingEdge : UInt<1>}
    
    reg stateReg : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[RisingMooreFsm.scala 15:25]
    node _T = eq(UInt<2>("h00"), stateReg) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      when io.din : @[RisingMooreFsm.scala 20:20]
        stateReg <= UInt<2>("h01") @[RisingMooreFsm.scala 21:18]
        skip @[RisingMooreFsm.scala 20:20]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_1 = eq(UInt<2>("h01"), stateReg) @[Conditional.scala 37:30]
      when _T_1 : @[Conditional.scala 39:67]
        when io.din : @[RisingMooreFsm.scala 25:20]
          stateReg <= UInt<2>("h02") @[RisingMooreFsm.scala 26:18]
          skip @[RisingMooreFsm.scala 25:20]
        else : @[RisingMooreFsm.scala 27:20]
          stateReg <= UInt<2>("h00") @[RisingMooreFsm.scala 28:18]
          skip @[RisingMooreFsm.scala 27:20]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_2 = eq(UInt<2>("h02"), stateReg) @[Conditional.scala 37:30]
        when _T_2 : @[Conditional.scala 39:67]
          node _T_3 = eq(io.din, UInt<1>("h00")) @[RisingMooreFsm.scala 32:12]
          when _T_3 : @[RisingMooreFsm.scala 32:21]
            stateReg <= UInt<2>("h00") @[RisingMooreFsm.scala 33:18]
            skip @[RisingMooreFsm.scala 32:21]
          skip @[Conditional.scala 39:67]
    node _T_4 = eq(stateReg, UInt<2>("h01")) @[RisingMooreFsm.scala 39:29]
    io.risingEdge <= _T_4 @[RisingMooreFsm.scala 39:17]
    
