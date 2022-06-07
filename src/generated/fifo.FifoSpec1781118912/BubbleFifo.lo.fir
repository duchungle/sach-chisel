circuit BubbleFifo :
  module Buffer :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1>
    input io_enq_valid : UInt<1>
    input io_enq_bits : UInt<16>
    input io_deq_ready : UInt<1>
    output io_deq_valid : UInt<1>
    output io_deq_bits : UInt<16>

    reg fullReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), fullReg) @[fifo.scala 43:26]
    reg dataReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[fifo.scala 44:22]
    node _GEN_0 = mux(io_deq_ready, UInt<1>("h0"), fullReg) @[fifo.scala 47:27 fifo.scala 48:17 fifo.scala 43:26]
    node _GEN_1 = mux(io_enq_valid, UInt<1>("h1"), fullReg) @[fifo.scala 51:27 fifo.scala 52:17 fifo.scala 43:26]
    node _GEN_2 = mux(io_enq_valid, io_enq_bits, dataReg) @[fifo.scala 51:27 fifo.scala 53:17 fifo.scala 44:22]
    node _GEN_3 = mux(fullReg, _GEN_0, _GEN_1) @[fifo.scala 46:20]
    node _GEN_4 = mux(fullReg, dataReg, _GEN_2) @[fifo.scala 46:20 fifo.scala 44:22]
    node _T = eq(fullReg, UInt<1>("h0")) @[fifo.scala 57:21]
    io_enq_ready <= _T @[fifo.scala 57:18]
    io_deq_valid <= fullReg @[fifo.scala 58:18]
    io_deq_bits <= dataReg @[fifo.scala 59:17]
    fullReg <= mux(reset, UInt<1>("h0"), _GEN_3) @[fifo.scala 43:26 fifo.scala 43:26]
    dataReg <= _GEN_4

  module BubbleFifo :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1>
    input io_enq_valid : UInt<1>
    input io_enq_bits : UInt<16>
    input io_deq_ready : UInt<1>
    output io_deq_valid : UInt<1>
    output io_deq_bits : UInt<16>

    inst Buffer of Buffer @[fifo.scala 62:51]
    inst Buffer_1 of Buffer @[fifo.scala 62:51]
    inst Buffer_2 of Buffer @[fifo.scala 62:51]
    inst Buffer_3 of Buffer @[fifo.scala 62:51]
    io_enq_ready <= Buffer.io_enq_ready @[fifo.scala 67:10]
    io_deq_valid <= Buffer_3.io_deq_valid @[fifo.scala 68:10]
    io_deq_bits <= Buffer_3.io_deq_bits @[fifo.scala 68:10]
    Buffer.clock <= clock
    Buffer.reset <= reset
    Buffer.io_enq_valid <= io_enq_valid @[fifo.scala 67:10]
    Buffer.io_enq_bits <= io_enq_bits @[fifo.scala 67:10]
    Buffer.io_deq_ready <= Buffer_1.io_enq_ready @[fifo.scala 64:27]
    Buffer_1.clock <= clock
    Buffer_1.reset <= reset
    Buffer_1.io_enq_valid <= Buffer.io_deq_valid @[fifo.scala 64:27]
    Buffer_1.io_enq_bits <= Buffer.io_deq_bits @[fifo.scala 64:27]
    Buffer_1.io_deq_ready <= Buffer_2.io_enq_ready @[fifo.scala 64:27]
    Buffer_2.clock <= clock
    Buffer_2.reset <= reset
    Buffer_2.io_enq_valid <= Buffer_1.io_deq_valid @[fifo.scala 64:27]
    Buffer_2.io_enq_bits <= Buffer_1.io_deq_bits @[fifo.scala 64:27]
    Buffer_2.io_deq_ready <= Buffer_3.io_enq_ready @[fifo.scala 64:27]
    Buffer_3.clock <= clock
    Buffer_3.reset <= reset
    Buffer_3.io_enq_valid <= Buffer_2.io_deq_valid @[fifo.scala 64:27]
    Buffer_3.io_enq_bits <= Buffer_2.io_deq_bits @[fifo.scala 64:27]
    Buffer_3.io_deq_ready <= io_deq_ready @[fifo.scala 68:10]