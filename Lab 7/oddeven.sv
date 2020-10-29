/*
	DESIGN NAME - ODD EVEN CALCULATOR
    
    SPECIFICATION - WE HAVE A 4-BIT INPUT, AND THE OUTPUT NEEDS TO BE
    				A 0 IF THE INPUT IS EVEN, OR A 1 IF THE INPUT IS ODD.
           			NOTE THAT WE ARE USING A 4-BIT OUTPUT FOR CONSISTENCY.
                    SO, THE OUTPUT WILL EITHER BE 0000 OR 0001
                    
    TIPS FOR THE DESIGN - LOOK CAREFULLY AT THE LSB OF THE INPUT, AND SEE
    				      IF IT IS AN EVEN OR AN ODD NUMBER DEPENDING ON
                          THE LSB. OBSERVE A FEW BINARY EXAMPLES.
                          TRY NOT TO USE THE MODULUS % OPERATOR.


*/

module oddeven(a, out);
  input  [3:0] a;
  output reg [3:0] out;
  
  // Finish the oddeven design below
  always @(*) begin
    if (a[0] == 0)begin
   	 	assign out = 4'b0000;
    end
  	else begin
     	assign out = 4'b0001;
    end
  end
endmodule