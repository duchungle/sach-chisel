circuit Memory :
  module Memory :
    input clock : Clock
    input reset : UInt<1>
    input io_rdAddr : UInt<10>
    output io_rdData : UInt<8>
    input io_wrEna : UInt<1>
    input io_wrData : UInt<8>
    input io_wrAddr : UInt<10>

    mem mem : @[Memory.scala 13:24]
      data-type => UInt<8>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => MPORT
      writer => MPORT_1
      read-under-write => undefined
    node _GEN_0 = validif(io_wrEna, io_wrAddr) @[Memory.scala 17:18]
    node _GEN_1 = validif(io_wrEna, clock) @[Memory.scala 17:18]
    node _GEN_2 = mux(io_wrEna, UInt<1>("h1"), UInt<1>("h0")) @[Memory.scala 17:18 Memory.scala 13:24]
    node _GEN_3 = validif(io_wrEna, UInt<1>("h1")) @[Memory.scala 17:18]
    node _GEN_4 = validif(io_wrEna, io_wrData) @[Memory.scala 17:18]
    io_rdData <= mem.MPORT.data @[Memory.scala 15:13]
    mem.MPORT.addr <= io_rdAddr @[Memory.scala 15:24]
    mem.MPORT.en <= UInt<1>("h1") @[Memory.scala 15:24]
    mem.MPORT.clk <= clock @[Memory.scala 15:24]
    mem.MPORT_1.addr <= _GEN_0
    mem.MPORT_1.en <= _GEN_2
    mem.MPORT_1.clk <= _GEN_1
    mem.MPORT_1.data <= _GEN_4
    mem.MPORT_1.mask <= _GEN_3