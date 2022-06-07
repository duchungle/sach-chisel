circuit BundleVec :
  module BundleVec :
    input clock : Clock
    input reset : UInt<1>
    output io_chan_data : UInt<32>
    output io_chan_valid : UInt<1>
    output io_chan2_data : UInt<32>
    output io_chan2_valid : UInt<1>
    input io_idx : UInt<4>
    output io_array : UInt<4>
    input io_dIn : UInt<32>
    output io_dOut : UInt<32>
    output io_bvOut : UInt<8>
    output io_chreg_data : UInt<32>
    output io_chreg_valid : UInt<1>

    node _T = bits(io_idx, 1, 0)
    node v_0 = pad(UInt<1>("h1"), 4) @[BundleVec.scala 35:15 BundleVec.scala 39:8]
    node _GEN_0 = validif(eq(UInt<1>("h0"), _T), v_0) @[BundleVec.scala 47:12 BundleVec.scala 47:12]
    node v_1 = pad(UInt<2>("h3"), 4) @[BundleVec.scala 35:15 BundleVec.scala 40:8]
    node _GEN_1 = mux(eq(UInt<1>("h1"), _T), v_1, _GEN_0) @[BundleVec.scala 47:12 BundleVec.scala 47:12]
    node v_2 = pad(UInt<3>("h5"), 4) @[BundleVec.scala 35:15 BundleVec.scala 41:8]
    node _GEN_2 = mux(eq(UInt<2>("h2"), _T), v_2, _GEN_1) @[BundleVec.scala 47:12 BundleVec.scala 47:12]
    reg registerFile_0 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_0) @[BundleVec.scala 51:25]
    reg registerFile_1 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_1) @[BundleVec.scala 51:25]
    reg registerFile_2 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_2) @[BundleVec.scala 51:25]
    reg registerFile_3 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_3) @[BundleVec.scala 51:25]
    reg registerFile_4 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_4) @[BundleVec.scala 51:25]
    reg registerFile_5 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_5) @[BundleVec.scala 51:25]
    reg registerFile_6 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_6) @[BundleVec.scala 51:25]
    reg registerFile_7 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_7) @[BundleVec.scala 51:25]
    reg registerFile_8 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_8) @[BundleVec.scala 51:25]
    reg registerFile_9 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_9) @[BundleVec.scala 51:25]
    reg registerFile_10 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_10) @[BundleVec.scala 51:25]
    reg registerFile_11 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_11) @[BundleVec.scala 51:25]
    reg registerFile_12 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_12) @[BundleVec.scala 51:25]
    reg registerFile_13 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_13) @[BundleVec.scala 51:25]
    reg registerFile_14 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_14) @[BundleVec.scala 51:25]
    reg registerFile_15 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_15) @[BundleVec.scala 51:25]
    reg registerFile_16 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_16) @[BundleVec.scala 51:25]
    reg registerFile_17 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_17) @[BundleVec.scala 51:25]
    reg registerFile_18 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_18) @[BundleVec.scala 51:25]
    reg registerFile_19 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_19) @[BundleVec.scala 51:25]
    reg registerFile_20 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_20) @[BundleVec.scala 51:25]
    reg registerFile_21 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_21) @[BundleVec.scala 51:25]
    reg registerFile_22 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_22) @[BundleVec.scala 51:25]
    reg registerFile_23 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_23) @[BundleVec.scala 51:25]
    reg registerFile_24 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_24) @[BundleVec.scala 51:25]
    reg registerFile_25 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_25) @[BundleVec.scala 51:25]
    reg registerFile_26 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_26) @[BundleVec.scala 51:25]
    reg registerFile_27 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_27) @[BundleVec.scala 51:25]
    reg registerFile_28 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_28) @[BundleVec.scala 51:25]
    reg registerFile_29 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_29) @[BundleVec.scala 51:25]
    reg registerFile_30 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_30) @[BundleVec.scala 51:25]
    reg registerFile_31 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), registerFile_31) @[BundleVec.scala 51:25]
    reg channelReg_data : UInt<32>, clock with :
      reset => (UInt<1>("h0"), channelReg_data) @[BundleVec.scala 93:27]
    reg channelReg_valid : UInt<1>, clock with :
      reset => (UInt<1>("h0"), channelReg_valid) @[BundleVec.scala 93:27]
    node ch_data = pad(UInt<7>("h7b"), 32) @[BundleVec.scala 23:16 BundleVec.scala 24:11]
    node ch_valid = UInt<1>("h1") @[BundleVec.scala 23:16 BundleVec.scala 25:12]
    node _v_T = _GEN_2 @[BundleVec.scala 47:12]
    node vecBundle_0_data = ch_data @[BundleVec.scala 64:23 BundleVec.scala 68:18]
    node vecBundle_0_valid = ch_valid @[BundleVec.scala 64:23 BundleVec.scala 68:18]
    node vecBundle_1_data = ch_data @[BundleVec.scala 64:23 BundleVec.scala 68:18]
    node vecBundle_1_valid = ch_valid @[BundleVec.scala 64:23 BundleVec.scala 68:18]
    node vecBundle_2_data = ch_data @[BundleVec.scala 64:23 BundleVec.scala 68:18]
    node vecBundle_2_valid = ch_valid @[BundleVec.scala 64:23 BundleVec.scala 68:18]
    node vecBundle_3_data = ch_data @[BundleVec.scala 64:23 BundleVec.scala 68:18]
    node vecBundle_3_valid = ch_valid @[BundleVec.scala 64:23 BundleVec.scala 68:18]
    node vecBundle_4_data = ch_data @[BundleVec.scala 64:23 BundleVec.scala 68:18]
    node vecBundle_4_valid = ch_valid @[BundleVec.scala 64:23 BundleVec.scala 68:18]
    node vecBundle_5_data = ch_data @[BundleVec.scala 64:23 BundleVec.scala 68:18]
    node vecBundle_5_valid = ch_valid @[BundleVec.scala 64:23 BundleVec.scala 68:18]
    node vecBundle_6_data = ch_data @[BundleVec.scala 64:23 BundleVec.scala 68:18]
    node vecBundle_6_valid = ch_valid @[BundleVec.scala 64:23 BundleVec.scala 68:18]
    node vecBundle_7_data = ch_data @[BundleVec.scala 64:23 BundleVec.scala 68:18]
    node vecBundle_7_valid = ch_valid @[BundleVec.scala 64:23 BundleVec.scala 68:18]
    node bv_field = pad(UInt<4>("hd"), 8) @[BundleVec.scala 79:16 BundleVec.scala 80:12]
    node bv_vector_0 = pad(UInt<2>("h3"), 8) @[BundleVec.scala 79:16 BundleVec.scala 82:18]
    node bv_vector_1 = pad(UInt<2>("h3"), 8) @[BundleVec.scala 79:16 BundleVec.scala 82:18]
    node bv_vector_2 = pad(UInt<2>("h3"), 8) @[BundleVec.scala 79:16 BundleVec.scala 82:18]
    node bv_vector_3 = pad(UInt<2>("h3"), 8) @[BundleVec.scala 79:16 BundleVec.scala 82:18]
    node initVal_data = pad(UInt<1>("h0"), 32) @[BundleVec.scala 88:21 BundleVec.scala 90:16]
    node initVal_valid = UInt<1>("h0") @[BundleVec.scala 88:21 BundleVec.scala 91:17]
    io_chan_data <= ch_data @[BundleVec.scala 48:11]
    io_chan_valid <= ch_valid @[BundleVec.scala 48:11]
    io_chan2_data <= vecBundle_1_data @[BundleVec.scala 70:12]
    io_chan2_valid <= vecBundle_1_valid @[BundleVec.scala 70:12]
    io_array <= _v_T @[BundleVec.scala 47:12]
    io_dOut <= registerFile_1 @[BundleVec.scala 61:11]
    io_bvOut <= bv_field @[BundleVec.scala 85:12]
    io_chreg_data <= channelReg_data @[BundleVec.scala 99:12]
    io_chreg_valid <= channelReg_valid @[BundleVec.scala 99:12]
    registerFile_0 <= registerFile_0 @[BundleVec.scala 51:25]
    registerFile_1 <= io_dIn @[BundleVec.scala 57:21]
    registerFile_2 <= registerFile_2 @[BundleVec.scala 51:25]
    registerFile_3 <= registerFile_3 @[BundleVec.scala 51:25]
    registerFile_4 <= registerFile_4 @[BundleVec.scala 51:25]
    registerFile_5 <= registerFile_5 @[BundleVec.scala 51:25]
    registerFile_6 <= registerFile_6 @[BundleVec.scala 51:25]
    registerFile_7 <= registerFile_7 @[BundleVec.scala 51:25]
    registerFile_8 <= registerFile_8 @[BundleVec.scala 51:25]
    registerFile_9 <= registerFile_9 @[BundleVec.scala 51:25]
    registerFile_10 <= registerFile_10 @[BundleVec.scala 51:25]
    registerFile_11 <= registerFile_11 @[BundleVec.scala 51:25]
    registerFile_12 <= registerFile_12 @[BundleVec.scala 51:25]
    registerFile_13 <= registerFile_13 @[BundleVec.scala 51:25]
    registerFile_14 <= registerFile_14 @[BundleVec.scala 51:25]
    registerFile_15 <= registerFile_15 @[BundleVec.scala 51:25]
    registerFile_16 <= registerFile_16 @[BundleVec.scala 51:25]
    registerFile_17 <= registerFile_17 @[BundleVec.scala 51:25]
    registerFile_18 <= registerFile_18 @[BundleVec.scala 51:25]
    registerFile_19 <= registerFile_19 @[BundleVec.scala 51:25]
    registerFile_20 <= registerFile_20 @[BundleVec.scala 51:25]
    registerFile_21 <= registerFile_21 @[BundleVec.scala 51:25]
    registerFile_22 <= registerFile_22 @[BundleVec.scala 51:25]
    registerFile_23 <= registerFile_23 @[BundleVec.scala 51:25]
    registerFile_24 <= registerFile_24 @[BundleVec.scala 51:25]
    registerFile_25 <= registerFile_25 @[BundleVec.scala 51:25]
    registerFile_26 <= registerFile_26 @[BundleVec.scala 51:25]
    registerFile_27 <= registerFile_27 @[BundleVec.scala 51:25]
    registerFile_28 <= registerFile_28 @[BundleVec.scala 51:25]
    registerFile_29 <= registerFile_29 @[BundleVec.scala 51:25]
    registerFile_30 <= registerFile_30 @[BundleVec.scala 51:25]
    registerFile_31 <= registerFile_31 @[BundleVec.scala 51:25]
    channelReg_data <= mux(reset, initVal_data, UInt<1>("h1")) @[BundleVec.scala 93:27 BundleVec.scala 93:27 BundleVec.scala 96:19]
    channelReg_valid <= mux(reset, initVal_valid, UInt<1>("h1")) @[BundleVec.scala 93:27 BundleVec.scala 93:27 BundleVec.scala 97:20]