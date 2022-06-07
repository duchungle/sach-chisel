;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit ShiftRegister : 
  module ShiftRegister : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip din : UInt<1>, dout : UInt<1>, flip serIn : UInt<1>, paraOut : UInt<4>, flip d : UInt<4>, flip load : UInt<1>, serOut : UInt<1>}
    
    reg shiftReg : UInt<4>, clock @[ShiftRegister.scala 18:21]
    node hi = bits(shiftReg, 2, 0) @[ShiftRegister.scala 19:27]
    node _T = cat(hi, io.din) @[Cat.scala 30:58]
    shiftReg <= _T @[ShiftRegister.scala 19:12]
    node dout = bits(shiftReg, 3, 3) @[ShiftRegister.scala 20:22]
    reg outReg : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[ShiftRegister.scala 28:23]
    node lo = bits(outReg, 3, 1) @[ShiftRegister.scala 29:30]
    node _T_1 = cat(io.serIn, lo) @[Cat.scala 30:58]
    outReg <= _T_1 @[ShiftRegister.scala 29:10]
    reg loadReg : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[ShiftRegister.scala 36:24]
    when io.load : @[ShiftRegister.scala 37:15]
      loadReg <= io.d @[ShiftRegister.scala 38:13]
      skip @[ShiftRegister.scala 37:15]
    else : @[ShiftRegister.scala 39:5]
      node lo_1 = bits(loadReg, 3, 1) @[ShiftRegister.scala 40:32]
      node _T_2 = cat(UInt<1>("h00"), lo_1) @[Cat.scala 30:58]
      loadReg <= _T_2 @[ShiftRegister.scala 40:13]
      skip @[ShiftRegister.scala 39:5]
    node serOut = bits(loadReg, 0, 0) @[ShiftRegister.scala 42:23]
    io.serOut <= serOut @[ShiftRegister.scala 45:13]
    io.paraOut <= outReg @[ShiftRegister.scala 47:14]
    io.dout <= dout @[ShiftRegister.scala 48:11]
    
