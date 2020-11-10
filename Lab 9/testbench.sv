// Code your testbench here
// or browse Examples
module lfsr_tb;
  
  	reg clk, preset_tb;
  	wire [3:0] q_tb;
  
  lfsr DUT(.clk(clk), .preset(preset_tb), .q(q_tb));
    
	always #10 clk = ~clk;

	initial
	begin
        $dumpfile("dump.vcd"); $dumpvars;
      
      	clk <= 1'b1;
		preset_tb <= 1'b0;
      	
      	#5 preset_tb <= 1'b1;
      
    
      
      	
      	#500 $finish;
		
	end
endmodule