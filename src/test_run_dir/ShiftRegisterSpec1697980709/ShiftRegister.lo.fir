circuit ShiftRegister :
  module ShiftRegister :
    input clock : Clock
    input reset : UInt<1>
    input io_din : UInt<1>
    output io_dout : UInt<1>
    input io_serIn : UInt<1>
    output io_paraOut : UInt<4>
    input io_d : UInt<4>
    input io_load : UInt<1>
    output io_serOut : UInt<1>

    reg shiftReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), shiftReg) @[ShiftRegister.scala 18:21]
    node hi = bits(shiftReg, 2, 0) @[ShiftRegister.scala 19:27]
    node _T = cat(hi, io_din) @[Cat.scala 30:58]
    node dout = bits(shiftReg, 3, 3) @[ShiftRegister.scala 20:22]
    reg outReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), outReg) @[ShiftRegister.scala 28:23]
    node lo = bits(outReg, 3, 1) @[ShiftRegister.scala 29:30]
    node _T_1 = cat(io_serIn, lo) @[Cat.scala 30:58]
    reg loadReg : UInt<4>, clock with :
      reset => (UInt<1>("h0"), loadReg) @[ShiftRegister.scala 36:24]
    node lo_1 = bits(loadReg, 3, 1) @[ShiftRegister.scala 40:32]
    node _T_2 = cat(UInt<1>("h0"), lo_1) @[Cat.scala 30:58]
    node _GEN_0 = mux(io_load, io_d, _T_2) @[ShiftRegister.scala 37:15 ShiftRegister.scala 38:13 ShiftRegister.scala 40:13]
    node serOut = bits(loadReg, 0, 0) @[ShiftRegister.scala 42:23]
    io_dout <= dout @[ShiftRegister.scala 48:11]
    io_paraOut <= outReg @[ShiftRegister.scala 47:14]
    io_serOut <= serOut @[ShiftRegister.scala 45:13]
    shiftReg <= _T @[ShiftRegister.scala 19:12]
    outReg <= mux(reset, UInt<4>("h0"), _T_1) @[ShiftRegister.scala 28:23 ShiftRegister.scala 28:23 ShiftRegister.scala 29:10]
    loadReg <= mux(reset, UInt<4>("h0"), _GEN_0) @[ShiftRegister.scala 36:24 ShiftRegister.scala 36:24]