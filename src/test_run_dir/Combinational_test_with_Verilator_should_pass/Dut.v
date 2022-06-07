module Dut(
  input   clock,
  input   reset,
  input   io_in,
  output  io_out
);
  assign io_out = ~io_in; // @[Snippets.scala 14:15]
endmodule
