circuit ForwardingMemory :
  module ForwardingMemory :
    input clock : Clock
    input reset : UInt<1>
    input io_rdAddr : UInt<10>
    output io_rdData : UInt<8>
    input io_wrEna : UInt<1>
    input io_wrData : UInt<8>
    input io_wrAddr : UInt<10>

    mem mem : @[Memory.scala 33:24]
      data-type => UInt<8>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => memData
      writer => MPORT
      read-under-write => undefined
    reg wrDataReg : UInt<8>, clock with :
      reset => (UInt<1>("h0"), wrDataReg) @[Memory.scala 35:26]
    node _T = eq(io_wrAddr, io_rdAddr) @[Memory.scala 36:40]
    node _T_1 = and(_T, io_wrEna) @[Memory.scala 36:54]
    reg doForwardReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), doForwardReg) @[Memory.scala 36:29]
    node _GEN_0 = validif(io_wrEna, io_wrAddr) @[Memory.scala 40:18]
    node _GEN_1 = validif(io_wrEna, clock) @[Memory.scala 40:18]
    node _GEN_2 = mux(io_wrEna, UInt<1>("h1"), UInt<1>("h0")) @[Memory.scala 40:18 Memory.scala 33:24]
    node _GEN_3 = validif(io_wrEna, UInt<1>("h1")) @[Memory.scala 40:18]
    node _GEN_4 = validif(io_wrEna, io_wrData) @[Memory.scala 40:18]
    node _T_2 = mux(doForwardReg, wrDataReg, mem.memData.data) @[Memory.scala 44:19]
    io_rdData <= _T_2 @[Memory.scala 44:13]
    mem.memData.addr <= io_rdAddr @[Memory.scala 38:25]
    mem.memData.en <= UInt<1>("h1") @[Memory.scala 38:25]
    mem.memData.clk <= clock @[Memory.scala 38:25]
    mem.MPORT.addr <= _GEN_0
    mem.MPORT.en <= _GEN_2
    mem.MPORT.clk <= _GEN_1
    mem.MPORT.data <= _GEN_4
    mem.MPORT.mask <= _GEN_3
    wrDataReg <= io_wrData @[Memory.scala 35:26]
    doForwardReg <= _T_1 @[Memory.scala 36:29]