circuit DoubleBufferFifo :
  module DoubleBuffer :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1>
    input io_enq_valid : UInt<1>
    input io_enq_bits : UInt<16>
    input io_deq_ready : UInt<1>
    output io_deq_valid : UInt<1>
    output io_deq_bits : UInt<16>

    reg stateReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[fifo.scala 79:27]
    reg dataReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[fifo.scala 80:22]
    reg shadowReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), shadowReg) @[fifo.scala 81:24]
    node _T = eq(UInt<2>("h0"), stateReg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_enq_valid, UInt<2>("h1"), stateReg) @[fifo.scala 85:29 fifo.scala 86:20 fifo.scala 79:27]
    node _GEN_1 = mux(io_enq_valid, io_enq_bits, dataReg) @[fifo.scala 85:29 fifo.scala 87:19 fifo.scala 80:22]
    node _T_1 = eq(UInt<2>("h1"), stateReg) @[Conditional.scala 37:30]
    node _T_2 = eq(io_enq_valid, UInt<1>("h0")) @[fifo.scala 91:31]
    node _T_3 = and(io_deq_ready, _T_2) @[fifo.scala 91:28]
    node _GEN_2 = mux(_T_3, UInt<2>("h0"), stateReg) @[fifo.scala 91:46 fifo.scala 92:20 fifo.scala 79:27]
    node _T_4 = and(io_deq_ready, io_enq_valid) @[fifo.scala 94:28]
    node _GEN_3 = mux(_T_4, UInt<2>("h1"), _GEN_2) @[fifo.scala 94:45 fifo.scala 95:20]
    node _GEN_4 = mux(_T_4, io_enq_bits, dataReg) @[fifo.scala 94:45 fifo.scala 96:19 fifo.scala 80:22]
    node _T_5 = eq(io_deq_ready, UInt<1>("h0")) @[fifo.scala 98:15]
    node _T_6 = and(_T_5, io_enq_valid) @[fifo.scala 98:29]
    node _GEN_5 = mux(_T_6, UInt<2>("h2"), _GEN_3) @[fifo.scala 98:46 fifo.scala 99:20]
    node _GEN_6 = mux(_T_6, io_enq_bits, shadowReg) @[fifo.scala 98:46 fifo.scala 100:21 fifo.scala 81:24]
    node _T_7 = eq(UInt<2>("h2"), stateReg) @[Conditional.scala 37:30]
    node _GEN_7 = mux(io_deq_ready, shadowReg, dataReg) @[fifo.scala 104:29 fifo.scala 105:19 fifo.scala 80:22]
    node _GEN_8 = mux(io_deq_ready, UInt<2>("h1"), stateReg) @[fifo.scala 104:29 fifo.scala 106:20 fifo.scala 79:27]
    node _GEN_9 = mux(_T_7, _GEN_7, dataReg) @[Conditional.scala 39:67 fifo.scala 80:22]
    node _GEN_10 = mux(_T_7, _GEN_8, stateReg) @[Conditional.scala 39:67 fifo.scala 79:27]
    node _GEN_11 = mux(_T_1, _GEN_5, _GEN_10) @[Conditional.scala 39:67]
    node _GEN_12 = mux(_T_1, _GEN_4, _GEN_9) @[Conditional.scala 39:67]
    node _GEN_13 = mux(_T_1, _GEN_6, shadowReg) @[Conditional.scala 39:67 fifo.scala 81:24]
    node _GEN_14 = mux(_T, _GEN_0, _GEN_11) @[Conditional.scala 40:58]
    node _GEN_15 = mux(_T, _GEN_1, _GEN_12) @[Conditional.scala 40:58]
    node _GEN_16 = mux(_T, shadowReg, _GEN_13) @[Conditional.scala 40:58 fifo.scala 81:24]
    node _T_8 = eq(stateReg, UInt<2>("h0")) @[fifo.scala 112:31]
    node _T_9 = eq(stateReg, UInt<2>("h1")) @[fifo.scala 112:53]
    node _T_10 = or(_T_8, _T_9) @[fifo.scala 112:41]
    node _T_11 = eq(stateReg, UInt<2>("h1")) @[fifo.scala 113:31]
    node _T_12 = eq(stateReg, UInt<2>("h2")) @[fifo.scala 113:51]
    node _T_13 = or(_T_11, _T_12) @[fifo.scala 113:39]
    io_enq_ready <= _T_10 @[fifo.scala 112:18]
    io_deq_valid <= _T_13 @[fifo.scala 113:18]
    io_deq_bits <= dataReg @[fifo.scala 114:17]
    stateReg <= mux(reset, UInt<2>("h0"), _GEN_14) @[fifo.scala 79:27 fifo.scala 79:27]
    dataReg <= _GEN_15
    shadowReg <= _GEN_16

  module DoubleBufferFifo :
    input clock : Clock
    input reset : UInt<1>
    output io_enq_ready : UInt<1>
    input io_enq_valid : UInt<1>
    input io_enq_bits : UInt<16>
    input io_deq_ready : UInt<1>
    output io_deq_valid : UInt<1>
    output io_deq_bits : UInt<16>

    inst DoubleBuffer of DoubleBuffer @[fifo.scala 117:57]
    inst DoubleBuffer_1 of DoubleBuffer @[fifo.scala 117:57]
    io_enq_ready <= DoubleBuffer.io_enq_ready @[fifo.scala 122:10]
    io_deq_valid <= DoubleBuffer_1.io_deq_valid @[fifo.scala 123:10]
    io_deq_bits <= DoubleBuffer_1.io_deq_bits @[fifo.scala 123:10]
    DoubleBuffer.clock <= clock
    DoubleBuffer.reset <= reset
    DoubleBuffer.io_enq_valid <= io_enq_valid @[fifo.scala 122:10]
    DoubleBuffer.io_enq_bits <= io_enq_bits @[fifo.scala 122:10]
    DoubleBuffer.io_deq_ready <= DoubleBuffer_1.io_enq_ready @[fifo.scala 120:27]
    DoubleBuffer_1.clock <= clock
    DoubleBuffer_1.reset <= reset
    DoubleBuffer_1.io_enq_valid <= DoubleBuffer.io_deq_valid @[fifo.scala 120:27]
    DoubleBuffer_1.io_enq_bits <= DoubleBuffer.io_deq_bits @[fifo.scala 120:27]
    DoubleBuffer_1.io_deq_ready <= io_deq_ready @[fifo.scala 123:10]