;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit DrawAcc : 
  module DrawAcc : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip din : UInt<8>, flip sel : UInt<3>, dout : UInt<8>}
    
    reg regAcc : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[drawing.scala 18:23]
    node _T = eq(UInt<1>("h00"), io.sel) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      regAcc <= regAcc @[drawing.scala 21:22]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_1 = eq(UInt<1>("h01"), io.sel) @[Conditional.scala 37:30]
      when _T_1 : @[Conditional.scala 39:67]
        regAcc <= UInt<1>("h00") @[drawing.scala 22:22]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_2 = eq(UInt<2>("h02"), io.sel) @[Conditional.scala 37:30]
        when _T_2 : @[Conditional.scala 39:67]
          node _T_3 = add(regAcc, io.din) @[drawing.scala 23:32]
          node _T_4 = tail(_T_3, 1) @[drawing.scala 23:32]
          regAcc <= _T_4 @[drawing.scala 23:22]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_5 = eq(UInt<2>("h03"), io.sel) @[Conditional.scala 37:30]
          when _T_5 : @[Conditional.scala 39:67]
            node _T_6 = sub(regAcc, io.din) @[drawing.scala 24:32]
            node _T_7 = tail(_T_6, 1) @[drawing.scala 24:32]
            regAcc <= _T_7 @[drawing.scala 24:22]
            skip @[Conditional.scala 39:67]
    io.dout <= regAcc @[drawing.scala 28:11]
    
