;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit PopCount : 
  module PopCountFSM : 
    input clock : Clock
    input reset : Reset
    output io : {flip dinValid : UInt<1>, dinReady : UInt<1>, popCntValid : UInt<1>, flip popCntReady : UInt<1>, load : UInt<1>, flip done : UInt<1>}
    
    reg stateReg : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[PopCount.scala 16:25]
    io.load <= UInt<1>("h00") @[PopCount.scala 18:11]
    io.dinReady <= UInt<1>("h00") @[PopCount.scala 20:15]
    io.popCntValid <= UInt<1>("h00") @[PopCount.scala 21:18]
    node _T = eq(UInt<2>("h00"), stateReg) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      io.dinReady <= UInt<1>("h01") @[PopCount.scala 25:19]
      when io.dinValid : @[PopCount.scala 26:25]
        io.load <= UInt<1>("h01") @[PopCount.scala 27:17]
        stateReg <= UInt<2>("h01") @[PopCount.scala 28:18]
        skip @[PopCount.scala 26:25]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_1 = eq(UInt<2>("h01"), stateReg) @[Conditional.scala 37:30]
      when _T_1 : @[Conditional.scala 39:67]
        when io.done : @[PopCount.scala 32:21]
          stateReg <= UInt<2>("h02") @[PopCount.scala 33:18]
          skip @[PopCount.scala 32:21]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_2 = eq(UInt<2>("h02"), stateReg) @[Conditional.scala 37:30]
        when _T_2 : @[Conditional.scala 39:67]
          io.popCntValid <= UInt<1>("h01") @[PopCount.scala 37:22]
          when io.popCntReady : @[PopCount.scala 38:28]
            stateReg <= UInt<2>("h00") @[PopCount.scala 39:18]
            skip @[PopCount.scala 38:28]
          skip @[Conditional.scala 39:67]
    
  module PopCountDataPath : 
    input clock : Clock
    input reset : Reset
    output io : {flip din : UInt<8>, flip load : UInt<1>, popCnt : UInt<4>, done : UInt<1>}
    
    reg dataReg : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[PopCount.scala 55:24]
    reg popCntReg : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[PopCount.scala 56:26]
    reg counterReg : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[PopCount.scala 57:26]
    node _T = bits(dataReg, 7, 1) @[PopCount.scala 59:28]
    node _T_1 = cat(UInt<1>("h00"), _T) @[PopCount.scala 59:18]
    dataReg <= _T_1 @[PopCount.scala 59:11]
    node _T_2 = bits(dataReg, 0, 0) @[PopCount.scala 60:35]
    node _T_3 = add(popCntReg, _T_2) @[PopCount.scala 60:26]
    node _T_4 = tail(_T_3, 1) @[PopCount.scala 60:26]
    popCntReg <= _T_4 @[PopCount.scala 60:13]
    node done = eq(counterReg, UInt<1>("h00")) @[PopCount.scala 62:25]
    node _T_5 = eq(done, UInt<1>("h00")) @[PopCount.scala 63:9]
    when _T_5 : @[PopCount.scala 63:16]
      node _T_6 = sub(counterReg, UInt<1>("h01")) @[PopCount.scala 64:30]
      node _T_7 = tail(_T_6, 1) @[PopCount.scala 64:30]
      counterReg <= _T_7 @[PopCount.scala 64:16]
      skip @[PopCount.scala 63:16]
    when io.load : @[PopCount.scala 67:17]
      dataReg <= io.din @[PopCount.scala 68:13]
      popCntReg <= UInt<1>("h00") @[PopCount.scala 69:15]
      counterReg <= UInt<4>("h08") @[PopCount.scala 70:16]
      skip @[PopCount.scala 67:17]
    node _T_8 = asUInt(reset) @[PopCount.scala 74:9]
    node _T_9 = eq(_T_8, UInt<1>("h00")) @[PopCount.scala 74:9]
    when _T_9 : @[PopCount.scala 74:9]
      printf(clock, UInt<1>(1), "%x %d\n", dataReg, popCntReg) @[PopCount.scala 74:9]
      skip @[PopCount.scala 74:9]
    io.popCnt <= popCntReg @[PopCount.scala 76:13]
    io.done <= done @[PopCount.scala 77:11]
    
  module PopCount : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip dinValid : UInt<1>, dinReady : UInt<1>, flip din : UInt<8>, popCntValid : UInt<1>, flip popCntReady : UInt<1>, popCnt : UInt<4>}
    
    inst fsm of PopCountFSM @[PopCount.scala 93:19]
    fsm.clock <= clock
    fsm.reset <= reset
    inst data of PopCountDataPath @[PopCount.scala 94:20]
    data.clock <= clock
    data.reset <= reset
    fsm.io.dinValid <= io.dinValid @[PopCount.scala 96:19]
    io.dinReady <= fsm.io.dinReady @[PopCount.scala 97:15]
    io.popCntValid <= fsm.io.popCntValid @[PopCount.scala 98:18]
    fsm.io.popCntReady <= io.popCntReady @[PopCount.scala 99:22]
    data.io.din <= io.din @[PopCount.scala 101:15]
    io.popCnt <= data.io.popCnt @[PopCount.scala 102:13]
    data.io.load <= fsm.io.load @[PopCount.scala 103:16]
    fsm.io.done <= data.io.done @[PopCount.scala 104:15]
    
