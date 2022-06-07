;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit DrawMux6 : 
  module DrawMux6 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip sel : UInt<3>, dout : UInt<8>}
    
    wire dout : UInt
    dout <= UInt<1>("h00")
    node _T = eq(UInt<1>("h00"), io.sel) @[Conditional.scala 37:30]
    when _T : @[Conditional.scala 40:58]
      dout <= UInt<1>("h00") @[drawing.scala 43:20]
      skip @[Conditional.scala 40:58]
    else : @[Conditional.scala 39:67]
      node _T_1 = eq(UInt<1>("h01"), io.sel) @[Conditional.scala 37:30]
      when _T_1 : @[Conditional.scala 39:67]
        dout <= UInt<4>("h0b") @[drawing.scala 44:20]
        skip @[Conditional.scala 39:67]
      else : @[Conditional.scala 39:67]
        node _T_2 = eq(UInt<2>("h02"), io.sel) @[Conditional.scala 37:30]
        when _T_2 : @[Conditional.scala 39:67]
          dout <= UInt<5>("h016") @[drawing.scala 45:20]
          skip @[Conditional.scala 39:67]
        else : @[Conditional.scala 39:67]
          node _T_3 = eq(UInt<2>("h03"), io.sel) @[Conditional.scala 37:30]
          when _T_3 : @[Conditional.scala 39:67]
            dout <= UInt<6>("h021") @[drawing.scala 46:20]
            skip @[Conditional.scala 39:67]
          else : @[Conditional.scala 39:67]
            node _T_4 = eq(UInt<3>("h04"), io.sel) @[Conditional.scala 37:30]
            when _T_4 : @[Conditional.scala 39:67]
              dout <= UInt<6>("h02c") @[drawing.scala 47:20]
              skip @[Conditional.scala 39:67]
            else : @[Conditional.scala 39:67]
              node _T_5 = eq(UInt<3>("h05"), io.sel) @[Conditional.scala 37:30]
              when _T_5 : @[Conditional.scala 39:67]
                dout <= UInt<6>("h037") @[drawing.scala 48:20]
                skip @[Conditional.scala 39:67]
    io.dout <= dout @[drawing.scala 52:11]
    
