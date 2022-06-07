circuit BubbleFifo :
  module FifoRegister :
    input clock : Clock
    input reset : UInt<1>
    input io_enq_write : UInt<1>
    output io_enq_full : UInt<1>
    input io_enq_din : UInt<8>
    input io_deq_read : UInt<1>
    output io_deq_empty : UInt<1>
    output io_deq_dout : UInt<8>

    reg stateReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), stateReg) @[BubbleFifo.scala 58:25]
    reg dataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), dataReg) @[BubbleFifo.scala 59:24]
    node _T = eq(stateReg, UInt<1>("h0")) @[BubbleFifo.scala 61:17]
    node _GEN_0 = mux(io_enq_write, UInt<1>("h1"), stateReg) @[BubbleFifo.scala 62:24 BubbleFifo.scala 63:16 BubbleFifo.scala 58:25]
    node _GEN_1 = mux(io_enq_write, io_enq_din, dataReg) @[BubbleFifo.scala 62:24 BubbleFifo.scala 64:15 BubbleFifo.scala 59:24]
    node _T_1 = eq(stateReg, UInt<1>("h1")) @[BubbleFifo.scala 66:23]
    node _GEN_2 = mux(io_deq_read, UInt<1>("h0"), stateReg) @[BubbleFifo.scala 67:23 BubbleFifo.scala 68:16 BubbleFifo.scala 58:25]
    node _GEN_3 = mux(io_deq_read, UInt<1>("h0"), dataReg) @[BubbleFifo.scala 67:23 BubbleFifo.scala 69:15 BubbleFifo.scala 59:24]
    node _GEN_4 = mux(_T_1, _GEN_2, stateReg) @[BubbleFifo.scala 66:33 BubbleFifo.scala 58:25]
    node _GEN_5 = mux(_T_1, _GEN_3, dataReg) @[BubbleFifo.scala 66:33 BubbleFifo.scala 59:24]
    node _GEN_6 = mux(_T, _GEN_0, _GEN_4) @[BubbleFifo.scala 61:28]
    node _GEN_7 = mux(_T, _GEN_1, _GEN_5) @[BubbleFifo.scala 61:28]
    node _T_2 = eq(stateReg, UInt<1>("h1")) @[BubbleFifo.scala 75:28]
    node _T_3 = eq(stateReg, UInt<1>("h0")) @[BubbleFifo.scala 76:29]
    io_enq_full <= _T_2 @[BubbleFifo.scala 75:15]
    io_deq_empty <= _T_3 @[BubbleFifo.scala 76:16]
    io_deq_dout <= dataReg @[BubbleFifo.scala 77:15]
    stateReg <= mux(reset, UInt<1>("h0"), _GEN_6) @[BubbleFifo.scala 58:25 BubbleFifo.scala 58:25]
    dataReg <= mux(reset, UInt<8>("h0"), _GEN_7) @[BubbleFifo.scala 59:24 BubbleFifo.scala 59:24]

  module BubbleFifo :
    input clock : Clock
    input reset : UInt<1>
    input io_enq_write : UInt<1>
    output io_enq_full : UInt<1>
    input io_enq_din : UInt<8>
    input io_deq_read : UInt<1>
    output io_deq_empty : UInt<1>
    output io_deq_dout : UInt<8>

    inst FifoRegister of FifoRegister @[BubbleFifo.scala 91:43]
    inst FifoRegister_1 of FifoRegister @[BubbleFifo.scala 91:43]
    inst FifoRegister_2 of FifoRegister @[BubbleFifo.scala 91:43]
    inst FifoRegister_3 of FifoRegister @[BubbleFifo.scala 91:43]
    node _T = not(FifoRegister.io_deq_empty) @[BubbleFifo.scala 94:36]
    node _T_1 = not(FifoRegister_1.io_enq_full) @[BubbleFifo.scala 95:31]
    node _T_2 = not(FifoRegister_1.io_deq_empty) @[BubbleFifo.scala 94:36]
    node _T_3 = not(FifoRegister_2.io_enq_full) @[BubbleFifo.scala 95:31]
    node _T_4 = not(FifoRegister_2.io_deq_empty) @[BubbleFifo.scala 94:36]
    node _T_5 = not(FifoRegister_3.io_enq_full) @[BubbleFifo.scala 95:31]
    io_enq_full <= FifoRegister.io_enq_full @[BubbleFifo.scala 97:10]
    io_deq_empty <= FifoRegister_3.io_deq_empty @[BubbleFifo.scala 98:10]
    io_deq_dout <= FifoRegister_3.io_deq_dout @[BubbleFifo.scala 98:10]
    FifoRegister.clock <= clock
    FifoRegister.reset <= reset
    FifoRegister.io_enq_write <= io_enq_write @[BubbleFifo.scala 97:10]
    FifoRegister.io_enq_din <= io_enq_din @[BubbleFifo.scala 97:10]
    FifoRegister.io_deq_read <= _T_1 @[BubbleFifo.scala 95:28]
    FifoRegister_1.clock <= clock
    FifoRegister_1.reset <= reset
    FifoRegister_1.io_enq_write <= _T @[BubbleFifo.scala 94:33]
    FifoRegister_1.io_enq_din <= FifoRegister.io_deq_dout @[BubbleFifo.scala 93:31]
    FifoRegister_1.io_deq_read <= _T_3 @[BubbleFifo.scala 95:28]
    FifoRegister_2.clock <= clock
    FifoRegister_2.reset <= reset
    FifoRegister_2.io_enq_write <= _T_2 @[BubbleFifo.scala 94:33]
    FifoRegister_2.io_enq_din <= FifoRegister_1.io_deq_dout @[BubbleFifo.scala 93:31]
    FifoRegister_2.io_deq_read <= _T_5 @[BubbleFifo.scala 95:28]
    FifoRegister_3.clock <= clock
    FifoRegister_3.reset <= reset
    FifoRegister_3.io_enq_write <= _T_4 @[BubbleFifo.scala 94:33]
    FifoRegister_3.io_enq_din <= FifoRegister_2.io_deq_dout @[BubbleFifo.scala 93:31]
    FifoRegister_3.io_deq_read <= io_deq_read @[BubbleFifo.scala 98:10]