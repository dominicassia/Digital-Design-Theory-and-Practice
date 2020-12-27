module counter_fsm_tb;

	reg  CLOCK, X, RESET;
	wire Z;

  	counter_fsm DUT( .clock(CLOCK), .x(X), .reset(RESET), .z(Z));

	
    always #10 CLOCK = ~CLOCK;                   
                       
    initial
	begin
		$dumpfile("dump.vcd"); $dumpvars;
   	
     	CLOCK = 1;
   		RESET = 1;	
   			
   		#10 RESET = 0;
		
      $display("DOWN COUNTING","\n");
 		#10 X = 1;
      	$display("STATE = ", DUT.state, " INPUT = ", X, ", OUTPUT = ", Z);
      
      	#20 $display("STATE = ", DUT.state, " INPUT = ", X, ", OUTPUT = ", Z);
      
      	#20 $display("STATE = ", DUT.state, " INPUT = ", X, ", OUTPUT = ", Z);
      
        #20 $display("STATE = ", DUT.state, " INPUT = ", X, ", OUTPUT = ", Z, "\n");
      
      $display("UP COUNTING","\n");
      	#140 X = 0;
      	$display("STATE = ", DUT.state, " INPUT = ", X, ", OUTPUT = ", Z);
      
      	#20 $display("STATE = ", DUT.state, " INPUT = ", X, ", OUTPUT = ", Z);
      
      	#20 $display("STATE = ", DUT.state, " INPUT = ", X, ", OUTPUT = ", Z);
      
      	#20 $display("STATE = ", DUT.state, " INPUT = ", X, ", OUTPUT = ", Z);
     	
      	#80 X = 1;

		#300 $finish;
	end
        


endmodule