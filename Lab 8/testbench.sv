module SR_to_JK_conversion_tb;
  
  	reg j_tb,k_tb,clock,reset;
  	wire q_tb,qbar_tb;
  
  	SR_to_JK_conversion DUT(.J(j_tb),.K(k_tb),.clock(clock),.reset(reset),.Q(q_tb),.Qbar(qbar_tb));
    
	always #10 clock = ~clock;

	initial
	begin
        $dumpfile("dump.vcd"); $dumpvars;
      
      	clock <= 1'b1;
		reset <= 1'b1; 
      
      	#100 
      	reset <= 1'b0; 
      
      	$display("#########################################");
      	$display(" SR FLIP FLOP TO JK FLIP FLOP CONVERSION");
      	$display("#########################################");
     	
      	$display ("J\tK\tQ\tQbar   PASS/FAIL");
      	
      	#100 {j_tb,k_tb} <= 2'b00; #30
      	if ( q_tb === 1'b0 ) 
          $display ("%d\t%d\t%d\t%d\t PASS",j_tb,k_tb,q_tb,qbar_tb);
        else
          $display ("%d\t%d\t%d\t%d\t FAIL",j_tb,k_tb,q_tb,qbar_tb);
      
      
      #100 {j_tb,k_tb} <= 2'b01; #30
      	if ( q_tb === 1'b0 ) 
          $display ("%d\t%d\t%d\t%d\t PASS",j_tb,k_tb,q_tb,qbar_tb);
        else
          $display ("%d\t%d\t%d\t%d\t FAIL",j_tb,k_tb,q_tb,qbar_tb);
      
      	
      #100 {j_tb,k_tb} <= 2'b10; #30
      	if ( q_tb === 1'b1 ) 
          $display ("%d\t%d\t%d\t%d\t PASS",j_tb,k_tb,q_tb,qbar_tb);
        else
          $display ("%d\t%d\t%d\t%d\t FAIL",j_tb,k_tb,q_tb,qbar_tb);
      	
      	
      #100 {j_tb,k_tb} <= 2'b11; #30
      	if ( q_tb === ~qbar_tb ) 
          $display ("%d\t%d\t%d\t%d\t PASS",j_tb,k_tb,q_tb,qbar_tb);
        else
          $display ("%d\t%d\t%d\t%d\t FAIL",j_tb,k_tb,q_tb,qbar_tb);
      
      	$display("#########################################");
      
      	#300 reset <= 1'b1; 

      	#1000 $finish;
		
	end
endmodule