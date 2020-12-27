/*
	DESIGN NAME - 2'S COMPLEMENT CALCULATOR
    
    SPECIFICATION - WE HAVE A 4-BIT INPUT, AND A 4-BIT OUTPUT.
    				THE OUTPUT SIMPLY NEEDS TO BE THE COMPLEMENT VALUE
                    OF THE INPUT ASSUMING 2'S COMPLEMENT SYSTEM
                    
    TIPS FOR THE DESIGN - SIMPLY USE THE 2'S COMPLEMENT FORMULA
    					  


*/

module twocmp(a, out);
  input  [3:0] a;
  output [3:0] out;
  
  // Finish the twocmp design below -

  assign out = ~a + 1;
  
endmodule