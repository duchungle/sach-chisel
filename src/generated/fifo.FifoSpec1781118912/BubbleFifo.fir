;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit BubbleFifo : 
  module Buffer : 
    input clock : Clock
    input reset : Reset
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}}
    
    reg fullReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[fifo.scala 43:26]
    reg dataReg : UInt<16>, clock @[fifo.scala 44:22]
    when fullReg : @[fifo.scala 46:20]
      when io.deq.ready : @[fifo.scala 47:27]
        fullReg <= UInt<1>("h00") @[fifo.scala 48:17]
        skip @[fifo.scala 47:27]
      skip @[fifo.scala 46:20]
    else : @[fifo.scala 50:18]
      when io.enq.valid : @[fifo.scala 51:27]
        fullReg <= UInt<1>("h01") @[fifo.scala 52:17]
        dataReg <= io.enq.bits @[fifo.scala 53:17]
        skip @[fifo.scala 51:27]
      skip @[fifo.scala 50:18]
    node _T = eq(fullReg, UInt<1>("h00")) @[fifo.scala 57:21]
    io.enq.ready <= _T @[fifo.scala 57:18]
    io.deq.valid <= fullReg @[fifo.scala 58:18]
    io.deq.bits <= dataReg @[fifo.scala 59:17]
    
  module Buffer_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}}
    
    reg fullReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[fifo.scala 43:26]
    reg dataReg : UInt<16>, clock @[fifo.scala 44:22]
    when fullReg : @[fifo.scala 46:20]
      when io.deq.ready : @[fifo.scala 47:27]
        fullReg <= UInt<1>("h00") @[fifo.scala 48:17]
        skip @[fifo.scala 47:27]
      skip @[fifo.scala 46:20]
    else : @[fifo.scala 50:18]
      when io.enq.valid : @[fifo.scala 51:27]
        fullReg <= UInt<1>("h01") @[fifo.scala 52:17]
        dataReg <= io.enq.bits @[fifo.scala 53:17]
        skip @[fifo.scala 51:27]
      skip @[fifo.scala 50:18]
    node _T = eq(fullReg, UInt<1>("h00")) @[fifo.scala 57:21]
    io.enq.ready <= _T @[fifo.scala 57:18]
    io.deq.valid <= fullReg @[fifo.scala 58:18]
    io.deq.bits <= dataReg @[fifo.scala 59:17]
    
  module Buffer_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}}
    
    reg fullReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[fifo.scala 43:26]
    reg dataReg : UInt<16>, clock @[fifo.scala 44:22]
    when fullReg : @[fifo.scala 46:20]
      when io.deq.ready : @[fifo.scala 47:27]
        fullReg <= UInt<1>("h00") @[fifo.scala 48:17]
        skip @[fifo.scala 47:27]
      skip @[fifo.scala 46:20]
    else : @[fifo.scala 50:18]
      when io.enq.valid : @[fifo.scala 51:27]
        fullReg <= UInt<1>("h01") @[fifo.scala 52:17]
        dataReg <= io.enq.bits @[fifo.scala 53:17]
        skip @[fifo.scala 51:27]
      skip @[fifo.scala 50:18]
    node _T = eq(fullReg, UInt<1>("h00")) @[fifo.scala 57:21]
    io.enq.ready <= _T @[fifo.scala 57:18]
    io.deq.valid <= fullReg @[fifo.scala 58:18]
    io.deq.bits <= dataReg @[fifo.scala 59:17]
    
  module Buffer_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}}
    
    reg fullReg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[fifo.scala 43:26]
    reg dataReg : UInt<16>, clock @[fifo.scala 44:22]
    when fullReg : @[fifo.scala 46:20]
      when io.deq.ready : @[fifo.scala 47:27]
        fullReg <= UInt<1>("h00") @[fifo.scala 48:17]
        skip @[fifo.scala 47:27]
      skip @[fifo.scala 46:20]
    else : @[fifo.scala 50:18]
      when io.enq.valid : @[fifo.scala 51:27]
        fullReg <= UInt<1>("h01") @[fifo.scala 52:17]
        dataReg <= io.enq.bits @[fifo.scala 53:17]
        skip @[fifo.scala 51:27]
      skip @[fifo.scala 50:18]
    node _T = eq(fullReg, UInt<1>("h00")) @[fifo.scala 57:21]
    io.enq.ready <= _T @[fifo.scala 57:18]
    io.deq.valid <= fullReg @[fifo.scala 58:18]
    io.deq.bits <= dataReg @[fifo.scala 59:17]
    
  module BubbleFifo : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip enq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}, deq : {flip ready : UInt<1>, valid : UInt<1>, bits : UInt<16>}}
    
    inst Buffer of Buffer @[fifo.scala 62:51]
    Buffer.clock <= clock
    Buffer.reset <= reset
    inst Buffer_1 of Buffer_1 @[fifo.scala 62:51]
    Buffer_1.clock <= clock
    Buffer_1.reset <= reset
    inst Buffer_2 of Buffer_2 @[fifo.scala 62:51]
    Buffer_2.clock <= clock
    Buffer_2.reset <= reset
    inst Buffer_3 of Buffer_3 @[fifo.scala 62:51]
    Buffer_3.clock <= clock
    Buffer_3.reset <= reset
    Buffer_1.io.enq.bits <= Buffer.io.deq.bits @[fifo.scala 64:27]
    Buffer_1.io.enq.valid <= Buffer.io.deq.valid @[fifo.scala 64:27]
    Buffer.io.deq.ready <= Buffer_1.io.enq.ready @[fifo.scala 64:27]
    Buffer_2.io.enq.bits <= Buffer_1.io.deq.bits @[fifo.scala 64:27]
    Buffer_2.io.enq.valid <= Buffer_1.io.deq.valid @[fifo.scala 64:27]
    Buffer_1.io.deq.ready <= Buffer_2.io.enq.ready @[fifo.scala 64:27]
    Buffer_3.io.enq.bits <= Buffer_2.io.deq.bits @[fifo.scala 64:27]
    Buffer_3.io.enq.valid <= Buffer_2.io.deq.valid @[fifo.scala 64:27]
    Buffer_2.io.deq.ready <= Buffer_3.io.enq.ready @[fifo.scala 64:27]
    Buffer.io.enq.bits <= io.enq.bits @[fifo.scala 67:10]
    Buffer.io.enq.valid <= io.enq.valid @[fifo.scala 67:10]
    io.enq.ready <= Buffer.io.enq.ready @[fifo.scala 67:10]
    io.deq.bits <= Buffer_3.io.deq.bits @[fifo.scala 68:10]
    io.deq.valid <= Buffer_3.io.deq.valid @[fifo.scala 68:10]
    Buffer_3.io.deq.ready <= io.deq.ready @[fifo.scala 68:10]
    
