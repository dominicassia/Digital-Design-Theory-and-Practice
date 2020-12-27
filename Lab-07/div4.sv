/*
	DESIGN NAME - DIVIDE BY 4 CALCULATOR
    
    SPECIFICATION - WE HAVE A 4-BIT INPUT, AND A 4-BIT OUTPUT.
    				THE OUTPUT IS INPUT DIVIDED BY 4
                    
    TIPS FOR THE DESIGN - THINK ABOUT OTHER IDEAS BESIDES USING
    					  THE DIVIDE / OPERATOR. DIVIDE OPERATOR IS
                          VERY EXPENSIVE IN HARDWARE. THINK ABOUT SHIFT
                          OPERATOR INSTEAD.


*/

module div4(a, out);
  input  [3:0] a;
  output [3:0] out;
  
  // Finish the div4 design below -

  assign out = a >> 2;
  
endmodule