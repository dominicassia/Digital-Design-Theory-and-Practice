/*
	DESIGN NAME - 4-TO-1 MUX
    
    SPECIFICATION - WE HAVE FOUR 4-BIT INPUTS AS THE 4 INPUTS TO THE MUX
    				AND A 4-BIT OUTPUT AS THE OUTPUT FROM THE MUX. WE ALSO
                    HAVE A 2-BIT SELECTOR INPUT FOR THE MUX.
                    
    TIPS FOR THE DESIGN - THIS MUX IS A BIT DIFFERENT IN THE SENSE THAT
    					  IT TAKES 4-BIT INPUTS AS EACH OF THE FOUR INPUTS
                          TO THE MUX VS THE USUAL 1-BIT INPUTS. YOU CAN
                          MAKE USE OF BEHAVIORAL MODELLING FOR THIS. MAKE
                          SURE YOU TAKE CARE OF ALL THE CASES OF THE SELECTOR.


*/

module mux_4to1(a, b, c, d, sel, out);
  input  [3:0] a, b, c, d;
  input  [1:0] sel;
  output reg [3:0] out; // The reg here will depend on your design. If you do not require it, you can remove it.
  
  // Finish the mux_4to1 design below
  
  always @(*) begin
    case(sel)
      2'b00: out = a;
      2'b01: out = b;
      2'b10: out = c;
      2'b11: out = d;
      default: out = 4'b0;
    endcase
  end
endmodule