module counter_fsm
(
	input  clock, x, reset,
	output reg z
);

  // Declare State Register and States
  reg [1:0]state;
  parameter S0=0, S1=1, S2=2, S3=3;
  
  // Output Always Block
  always @(state) begin
    
    // Even State -> Z=0
    // Odd  State -> Z=1
    case (state)
      S0: z = 1'b0;	// 0: Even -> Z=0
      S1: z = 1'b1;	// 1: Odd  -> Z=1
      S2: z = 1'b0;	// 0: Even -> Z=0
      S3: z = 1'b1;	// 1: Odd  -> Z=1
      default: z = 1'b0;
    endcase
    
  end
	
  // Next State Always Block
    always @(posedge clock or posedge reset) begin
    
      // Reset=1 -> Go to S0
      if (reset)
        state <= S0;        
     
      else        
        // X=0 -> Up
        // X=1 -> Down

        case (state)
          
          // STATE 0
          S0:
            if (x)
              state <= S3; // Down 	0->3
            else
              state <= S1; // Up	0->1
          
          // STATE 1
          S1:
            if (x)
              state <= S0; // Down	1->0
            else
              state <= S2; // Up	1->2
          
          // STATE 2
          S2:
            if (x)
              state <= S1; // Down	2->1
            else
              state <= S3; // Up	2->3
          
          // STATE 3
          S3:
            if (x)
              state <= S2; // Down	3->2
            else	
              state <= S0; // Up	3->0  
          
        endcase
      end
endmodule
