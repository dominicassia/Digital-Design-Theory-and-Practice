/*
	IMPLEMENT THE FUNCTIONALITY OF A JK FLIP FLOP USING A SR FLIP FLOP
    
 	NOTE : USE NON-BLOCKING ASSINGMENTS FOR SEQUENTIAL DESIGN.
*/

`include "SR_FF.sv"


module SR_to_JK_conversion(J,K,clock,reset,Q,Qbar);
	
	
  //DECLARE INPUTS
  input J, K, clock, reset;
    
  //DECLARE OUTPUT REGISTERS
  output reg Q, Qbar;
  
  //INSTANTIATE SR FLIP FLOP : IMPLEMENT JK FLIP FLOP FUNCTIONALITY 
  
  SR_FF s1(.S(J && ~Q),.R(K && Q),.reset(reset),.clock(clock),.Q(Q),.Qbar(Qbar));
  
endmodule