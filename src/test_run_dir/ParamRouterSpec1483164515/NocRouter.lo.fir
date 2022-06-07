circuit NocRouter :
  module NocRouter :
    input clock : Clock
    input reset : UInt<1>
    input io_inPort_0_data : UInt<16>
    input io_inPort_0_flag : UInt<1>
    input io_inPort_1_data : UInt<16>
    input io_inPort_1_flag : UInt<1>
    input io_address_0 : UInt<8>
    input io_address_1 : UInt<8>
    output io_outPort_0_data : UInt<16>
    output io_outPort_0_flag : UInt<1>
    output io_outPort_1_data : UInt<16>
    output io_outPort_1_flag : UInt<1>

    io_outPort_0_data <= io_inPort_1_data @[NocRouter.scala 22:17]
    io_outPort_0_flag <= io_inPort_1_flag @[NocRouter.scala 22:17]
    io_outPort_1_data <= io_inPort_0_data @[NocRouter.scala 23:17]
    io_outPort_1_flag <= io_inPort_0_flag @[NocRouter.scala 23:17]