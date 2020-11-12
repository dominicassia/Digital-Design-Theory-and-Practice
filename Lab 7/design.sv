/*
	DESIGN NAME - TOP LEVEL DESIGN
    
    SPECIFICATION - WE HAVE A 4-BIT INPUT, A 2-BIT SELECTOR INPUT,
    				AND A 4-BIT OUTPUT. WE WILL DESIGN THE BLOCK DIAGRAM
                    AS SHOWN IN THE PDF.
                    
    TIPS FOR THE DESIGN - THIS TOP LEVEL DESIGN SHOULD BASICALLY BE JUST
    					  INSTANTIATIONS OF THE OTHER DESIGNS.
                          
    TIPS FOR THE RCA INST - SINCE THE RCA TAKES TWO 2-BIT INPUTS, WE WILL USE A[1:0] FOR
    						THE FIRST INPUT TO IT AND A[3:2] FOR THE SECOND INPUT TO IT.
    						
*/

`include "rca2.sv"
`include "oddeven.sv"
`include "div4.sv"
`include "twocmp.sv"
`include "mux_4to1.sv"

module top(a, sel, out);
  input  [3:0] a;
  input  [1:0] sel;
  output [3:0] out;
  
  // Declare any additional wires below
  wire [3:0] rcaout, oddevenout, div4out, twocompout;
  
  // Instantiate all the modules that you need below
  rca2 		r(.a(a[1:0]), .b(a[3:2]), .out(rcaout));
  oddeven 	o(.a(a), .out(oddevenout));
  div4 		d(.a(a), .out(div4out));
  twocmp 	t(.a(a), .out(twocompout));
  
  mux_4to1 	m(.a(rcaout), .b(oddevenout), .c(div4out), .d(twocompout), .sel(sel), .out(out));
  
endmodule