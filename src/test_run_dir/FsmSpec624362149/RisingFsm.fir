;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit RisingFsm : 
  module RisingFsm : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip din : UInt<1>, risingEdge : UInt<1>}
    
    reg stateReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[RisingFsm.scala 15:25]
    io.risingEdge <= UInt<1>("h00") @[RisingFsm.scala 18:17]
    node _T = eq(UInt<1>("h00"), stateReg) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      when io.din : @[RisingFsm.scala 23:20]
        stateReg <= UInt<1>("h01") @[RisingFsm.scala 24:18]
        io.risingEdge <= UInt<1>("h01") @[RisingFsm.scala 25:23]
        skip @[RisingFsm.scala 23:20]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_1 = eq(UInt<1>("h01"), stateReg) @[Conditional.scala 37:30]
      when _T_1 : @[Conditional.scala 39:67]
        node _T_2 = eq(io.din, UInt<1>("h00")) @[RisingFsm.scala 29:12]
        when _T_2 : @[RisingFsm.scala 29:21]
          stateReg <= UInt<1>("h00") @[RisingFsm.scala 30:18]
          skip @[RisingFsm.scala 29:21]
        skip @[Conditional.scala 39:67]
    
