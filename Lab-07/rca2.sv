/*
	DESIGN NAME - 2-BIT RIPPLE CARRY ADDER
    
    SPECIFICATION - USE A FULL ADDER DESIGN TO BUILD A 2-BIT RIPPLE CARRY ADDER DESIGN
    				USE TWO 2-BIT INPUTS AND A SINGLE 4 BIT OUTPUT FOR SUM AND CARRY OUT
					THE 4-BIT OUTPUT OUT SHOULD HAVE A 0 AS ITS MSB, AND THE REST OF THE
                    3 BITS WILL BE CARRY_OUT AND 2 BITS OF SUM.
                    SO, OUT[0] IS S[0], OUT[1] IS S[1], OUT[2] IS COUT, AND OUT[3] IS 0
    				ALSO, USE 0 AS THE INITIAL CARRY IN TO THE RCA
       				
*/

module rca2(a, b, out);
  input  [1:0] a, b;
  output [3:0] out;
  
  // Declare any wires that you may need for interconnects below -
  wire c1;
  
  // I did the assignment of 0 to the out's MSB for you below -
  assign out[3] = 1'b0;
  
  // Finish the other full_add module instantiation below -
  // The first one is done for you
  
  full_add f1(.a(a[0]), .b(b[0]), .cin(1'b0), .s(out[0]), .cout(c1));
  full_add f2(.a(a[1]), .b(b[1]), .cin(c1), .s(out[1]), .cout(out[2]));

  
endmodule


/*
	DESIGN NAME - FULL ADDER 
    
    SPECIFICATION - WE HAVE 1-BIT INPUTS A, B AND CIN AS THE FULL ADDER INPUTS
    				AND 1-BIT OUTPUTS S AND COUT AS THE FULL ADDER OUTPUTS.
                    YOU NEED TO DESIGN A BASIC FULL ADDER MODULE.		
*/

module full_add(a, b, cin, s, cout);
  input  a, b, cin;
  output s, cout;
  
  // Finish the full adder design below -
  
  assign {cout, s} = a + b + cin;
  
endmodule