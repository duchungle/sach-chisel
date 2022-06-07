;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit PrintfCnt : 
  module PrintfCnt : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : UInt}
    
    reg cnt : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[PrintfCnt.scala 8:20]
    node _T = add(cnt, UInt<1>("h01")) @[PrintfCnt.scala 9:14]
    node _T_1 = tail(_T, 1) @[PrintfCnt.scala 9:14]
    cnt <= _T_1 @[PrintfCnt.scala 9:7]
    node _T_2 = bits(reset, 0, 0) @[PrintfCnt.scala 11:9]
    node _T_3 = eq(_T_2, UInt<1>("h00")) @[PrintfCnt.scala 11:9]
    when _T_3 : @[PrintfCnt.scala 11:9]
      printf(clock, UInt<1>(1), "printf: %d\n", cnt) @[PrintfCnt.scala 11:9]
      skip @[PrintfCnt.scala 11:9]
    io.out <= cnt @[PrintfCnt.scala 13:10]
    
