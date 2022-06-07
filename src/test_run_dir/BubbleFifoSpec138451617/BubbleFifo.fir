;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit BubbleFifo : 
  module FifoRegister : 
    input clock : Clock
    input reset : Reset
    output io : {enq : {flip write : UInt<1>, full : UInt<1>, flip din : UInt<8>}, deq : {flip read : UInt<1>, empty : UInt<1>, dout : UInt<8>}}
    
    reg stateReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[BubbleFifo.scala 58:25]
    reg dataReg : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[BubbleFifo.scala 59:24]
    node _T = eq(stateReg, UInt<1>("h00")) @[BubbleFifo.scala 61:17]
    when _T : @[BubbleFifo.scala 61:28]
      when io.enq.write : @[BubbleFifo.scala 62:24]
        stateReg <= UInt<1>("h01") @[BubbleFifo.scala 63:16]
        dataReg <= io.enq.din @[BubbleFifo.scala 64:15]
        skip @[BubbleFifo.scala 62:24]
      skip @[BubbleFifo.scala 61:28]
    else : @[BubbleFifo.scala 66:33]
      node _T_1 = eq(stateReg, UInt<1>("h01")) @[BubbleFifo.scala 66:23]
      when _T_1 : @[BubbleFifo.scala 66:33]
        when io.deq.read : @[BubbleFifo.scala 67:23]
          stateReg <= UInt<1>("h00") @[BubbleFifo.scala 68:16]
          dataReg <= UInt<1>("h00") @[BubbleFifo.scala 69:15]
          skip @[BubbleFifo.scala 67:23]
        skip @[BubbleFifo.scala 66:33]
      else : @[BubbleFifo.scala 71:15]
        skip @[BubbleFifo.scala 71:15]
    node _T_2 = eq(stateReg, UInt<1>("h01")) @[BubbleFifo.scala 75:28]
    io.enq.full <= _T_2 @[BubbleFifo.scala 75:15]
    node _T_3 = eq(stateReg, UInt<1>("h00")) @[BubbleFifo.scala 76:29]
    io.deq.empty <= _T_3 @[BubbleFifo.scala 76:16]
    io.deq.dout <= dataReg @[BubbleFifo.scala 77:15]
    
  module FifoRegister_1 : 
    input clock : Clock
    input reset : Reset
    output io : {enq : {flip write : UInt<1>, full : UInt<1>, flip din : UInt<8>}, deq : {flip read : UInt<1>, empty : UInt<1>, dout : UInt<8>}}
    
    reg stateReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[BubbleFifo.scala 58:25]
    reg dataReg : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[BubbleFifo.scala 59:24]
    node _T = eq(stateReg, UInt<1>("h00")) @[BubbleFifo.scala 61:17]
    when _T : @[BubbleFifo.scala 61:28]
      when io.enq.write : @[BubbleFifo.scala 62:24]
        stateReg <= UInt<1>("h01") @[BubbleFifo.scala 63:16]
        dataReg <= io.enq.din @[BubbleFifo.scala 64:15]
        skip @[BubbleFifo.scala 62:24]
      skip @[BubbleFifo.scala 61:28]
    else : @[BubbleFifo.scala 66:33]
      node _T_1 = eq(stateReg, UInt<1>("h01")) @[BubbleFifo.scala 66:23]
      when _T_1 : @[BubbleFifo.scala 66:33]
        when io.deq.read : @[BubbleFifo.scala 67:23]
          stateReg <= UInt<1>("h00") @[BubbleFifo.scala 68:16]
          dataReg <= UInt<1>("h00") @[BubbleFifo.scala 69:15]
          skip @[BubbleFifo.scala 67:23]
        skip @[BubbleFifo.scala 66:33]
      else : @[BubbleFifo.scala 71:15]
        skip @[BubbleFifo.scala 71:15]
    node _T_2 = eq(stateReg, UInt<1>("h01")) @[BubbleFifo.scala 75:28]
    io.enq.full <= _T_2 @[BubbleFifo.scala 75:15]
    node _T_3 = eq(stateReg, UInt<1>("h00")) @[BubbleFifo.scala 76:29]
    io.deq.empty <= _T_3 @[BubbleFifo.scala 76:16]
    io.deq.dout <= dataReg @[BubbleFifo.scala 77:15]
    
  module FifoRegister_2 : 
    input clock : Clock
    input reset : Reset
    output io : {enq : {flip write : UInt<1>, full : UInt<1>, flip din : UInt<8>}, deq : {flip read : UInt<1>, empty : UInt<1>, dout : UInt<8>}}
    
    reg stateReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[BubbleFifo.scala 58:25]
    reg dataReg : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[BubbleFifo.scala 59:24]
    node _T = eq(stateReg, UInt<1>("h00")) @[BubbleFifo.scala 61:17]
    when _T : @[BubbleFifo.scala 61:28]
      when io.enq.write : @[BubbleFifo.scala 62:24]
        stateReg <= UInt<1>("h01") @[BubbleFifo.scala 63:16]
        dataReg <= io.enq.din @[BubbleFifo.scala 64:15]
        skip @[BubbleFifo.scala 62:24]
      skip @[BubbleFifo.scala 61:28]
    else : @[BubbleFifo.scala 66:33]
      node _T_1 = eq(stateReg, UInt<1>("h01")) @[BubbleFifo.scala 66:23]
      when _T_1 : @[BubbleFifo.scala 66:33]
        when io.deq.read : @[BubbleFifo.scala 67:23]
          stateReg <= UInt<1>("h00") @[BubbleFifo.scala 68:16]
          dataReg <= UInt<1>("h00") @[BubbleFifo.scala 69:15]
          skip @[BubbleFifo.scala 67:23]
        skip @[BubbleFifo.scala 66:33]
      else : @[BubbleFifo.scala 71:15]
        skip @[BubbleFifo.scala 71:15]
    node _T_2 = eq(stateReg, UInt<1>("h01")) @[BubbleFifo.scala 75:28]
    io.enq.full <= _T_2 @[BubbleFifo.scala 75:15]
    node _T_3 = eq(stateReg, UInt<1>("h00")) @[BubbleFifo.scala 76:29]
    io.deq.empty <= _T_3 @[BubbleFifo.scala 76:16]
    io.deq.dout <= dataReg @[BubbleFifo.scala 77:15]
    
  module FifoRegister_3 : 
    input clock : Clock
    input reset : Reset
    output io : {enq : {flip write : UInt<1>, full : UInt<1>, flip din : UInt<8>}, deq : {flip read : UInt<1>, empty : UInt<1>, dout : UInt<8>}}
    
    reg stateReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[BubbleFifo.scala 58:25]
    reg dataReg : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[BubbleFifo.scala 59:24]
    node _T = eq(stateReg, UInt<1>("h00")) @[BubbleFifo.scala 61:17]
    when _T : @[BubbleFifo.scala 61:28]
      when io.enq.write : @[BubbleFifo.scala 62:24]
        stateReg <= UInt<1>("h01") @[BubbleFifo.scala 63:16]
        dataReg <= io.enq.din @[BubbleFifo.scala 64:15]
        skip @[BubbleFifo.scala 62:24]
      skip @[BubbleFifo.scala 61:28]
    else : @[BubbleFifo.scala 66:33]
      node _T_1 = eq(stateReg, UInt<1>("h01")) @[BubbleFifo.scala 66:23]
      when _T_1 : @[BubbleFifo.scala 66:33]
        when io.deq.read : @[BubbleFifo.scala 67:23]
          stateReg <= UInt<1>("h00") @[BubbleFifo.scala 68:16]
          dataReg <= UInt<1>("h00") @[BubbleFifo.scala 69:15]
          skip @[BubbleFifo.scala 67:23]
        skip @[BubbleFifo.scala 66:33]
      else : @[BubbleFifo.scala 71:15]
        skip @[BubbleFifo.scala 71:15]
    node _T_2 = eq(stateReg, UInt<1>("h01")) @[BubbleFifo.scala 75:28]
    io.enq.full <= _T_2 @[BubbleFifo.scala 75:15]
    node _T_3 = eq(stateReg, UInt<1>("h00")) @[BubbleFifo.scala 76:29]
    io.deq.empty <= _T_3 @[BubbleFifo.scala 76:16]
    io.deq.dout <= dataReg @[BubbleFifo.scala 77:15]
    
  module BubbleFifo : 
    input clock : Clock
    input reset : UInt<1>
    output io : {enq : {flip write : UInt<1>, full : UInt<1>, flip din : UInt<8>}, deq : {flip read : UInt<1>, empty : UInt<1>, dout : UInt<8>}}
    
    inst FifoRegister of FifoRegister @[BubbleFifo.scala 91:43]
    FifoRegister.clock <= clock
    FifoRegister.reset <= reset
    inst FifoRegister_1 of FifoRegister_1 @[BubbleFifo.scala 91:43]
    FifoRegister_1.clock <= clock
    FifoRegister_1.reset <= reset
    inst FifoRegister_2 of FifoRegister_2 @[BubbleFifo.scala 91:43]
    FifoRegister_2.clock <= clock
    FifoRegister_2.reset <= reset
    inst FifoRegister_3 of FifoRegister_3 @[BubbleFifo.scala 91:43]
    FifoRegister_3.clock <= clock
    FifoRegister_3.reset <= reset
    FifoRegister_1.io.enq.din <= FifoRegister.io.deq.dout @[BubbleFifo.scala 93:31]
    node _T = not(FifoRegister.io.deq.empty) @[BubbleFifo.scala 94:36]
    FifoRegister_1.io.enq.write <= _T @[BubbleFifo.scala 94:33]
    node _T_1 = not(FifoRegister_1.io.enq.full) @[BubbleFifo.scala 95:31]
    FifoRegister.io.deq.read <= _T_1 @[BubbleFifo.scala 95:28]
    FifoRegister_2.io.enq.din <= FifoRegister_1.io.deq.dout @[BubbleFifo.scala 93:31]
    node _T_2 = not(FifoRegister_1.io.deq.empty) @[BubbleFifo.scala 94:36]
    FifoRegister_2.io.enq.write <= _T_2 @[BubbleFifo.scala 94:33]
    node _T_3 = not(FifoRegister_2.io.enq.full) @[BubbleFifo.scala 95:31]
    FifoRegister_1.io.deq.read <= _T_3 @[BubbleFifo.scala 95:28]
    FifoRegister_3.io.enq.din <= FifoRegister_2.io.deq.dout @[BubbleFifo.scala 93:31]
    node _T_4 = not(FifoRegister_2.io.deq.empty) @[BubbleFifo.scala 94:36]
    FifoRegister_3.io.enq.write <= _T_4 @[BubbleFifo.scala 94:33]
    node _T_5 = not(FifoRegister_3.io.enq.full) @[BubbleFifo.scala 95:31]
    FifoRegister_2.io.deq.read <= _T_5 @[BubbleFifo.scala 95:28]
    FifoRegister.io.enq.din <= io.enq.din @[BubbleFifo.scala 97:10]
    io.enq.full <= FifoRegister.io.enq.full @[BubbleFifo.scala 97:10]
    FifoRegister.io.enq.write <= io.enq.write @[BubbleFifo.scala 97:10]
    io.deq.dout <= FifoRegister_3.io.deq.dout @[BubbleFifo.scala 98:10]
    io.deq.empty <= FifoRegister_3.io.deq.empty @[BubbleFifo.scala 98:10]
    FifoRegister_3.io.deq.read <= io.deq.read @[BubbleFifo.scala 98:10]
    
