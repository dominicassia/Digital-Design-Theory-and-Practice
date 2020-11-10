// Top level module - Design a 4-bit LFSR as per the block diagram on the lab pdf

`include "dff.sv"

module lfsr(clk, preset, q);
  //INITIALIZE INPUTS AND OUTPUTS BASED ON MANUAL INSTRUCTIONS
  input preset, clk;
  output [3:0] q;
  
  //CREATE THE 4 D-FF SHIFT REGISTER
  dff_asyncpre d0(.clk(clk), .d( (q[0] && ~q[3]) + (q[3] && ~q[0]) ), .q(q[0]), .preset(preset));
  dff_asyncpre d1(.clk(clk), .d(q[0]), .q(q[1]), .preset(preset));
  dff_asyncpre d2(.clk(clk), .d(q[1]), .q(q[2]), .preset(preset));
  dff_asyncpre d3(.clk(clk), .d(q[2]), .q(q[3]), .preset(preset));
  
endmodule