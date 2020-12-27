//one_bit_comparator_TESTBENCH
`timescale 1 ns/1 ps 

module one_bit_comparator_tb;

    reg [3:0] A;
    wire Z;
  
    one_bit_comparator UUT (.A(A), .Z(Z));

    initial 
        begin
          $dumpfile("tb.vcd"); $dumpvars;
          $display(" _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _   ");
          
          A = 4'd0;

          #100 

          while(A < 4'b1111)
            begin
              #100              
              if(A == 0)
            	begin
              	if(Z == 1)
                	$display("TEST CASE 0 PASSED");
              	else
               		$display("TEST CASE 0 FAILED");
            	end
          	if(A == 1)
            	begin
              	if(Z == 0)
                	$display("TEST CASE 1 PASSED");
              	else
                	$display("TEST CASE 1 FAILED");
            	end
          	if(A == 2)
            	begin
              	if(Z == 0)
                	$display("TEST CASE 2 PASSED");
              	else
                	$display("TEST CASE 2 FAILED");
            	end         
          	if(A == 3)
            	begin
              	if(Z == 0)
                	$display("TEST CASE 3 PASSED");
              	else
                	$display("TEST CASE 3 FAILED");
            	end
          	if(A == 4)
            	begin
              	if(Z == 1)
                	$display("TEST CASE 4 PASSED");
              	else
                	$display("TEST CASE 4 FAILED");
            	end
          	if(A == 5)
            	begin
              	if(Z == 0)
                	$display("TEST CASE 5 PASSED");
              	else
                	$display("TEST CASE 5 FAILED");
            	end  
          	if(A == 6)
            	begin            
              	if(Z == 0)
                	$display("TEST CASE 6 PASSED");
              	else
                	$display("TEST CASE 6 FAILED");
            	end  
          	if(A == 7)
            	begin
              	if(Z == 0)
                	$display("TEST CASE 7 PASSED");
              	else
                	$display("TEST CASE 7 FAILED");
            	end  
          	if(A == 8)
            	begin
              	if(Z == 1)
                	$display("TEST CASE 8 PASSED");
              	else
                	$display("TEST CASE 8 FAILED");
            	end  
          if(A == 9)
            	begin
              	if(Z == 1)
                	$display("TEST CASE 9 PASSED");
              	else
                	$display("TEST CASE 9 FAILED");
            	end  
          if(A == 10)
            	begin
              	if(Z == 0)
                	$display("TEST CASE 10 PASSED");
              	else
                	$display("TEST CASE 10 FAILED");
            	end  
          if(A == 11)
            	begin
              	if(Z == 0)
                	$display("TEST CASE 11 PASSED");
              	else
                	$display("TEST CASE 11 FAILED");
            	end  
          if(A == 12)
            	begin
              	if(Z == 0)
                	$display("TEST CASE 12 PASSED");
              	else
                	$display("TEST CASE 12 FAILED");
             	end 
          if(A == 13)
            	begin
              	if(Z == 0)
                	$display("TEST CASE 13 PASSED");
              	else
                	$display("TEST CASE 13 FAILED");
            	end  
          if(A == 14)
            	begin
              	if(Z == 0)
                	$display("TEST CASE 14 PASSED");
              	else
                	$display("TEST CASE 14 FAILED");
            	end  
              #100 A = A + 4'd1;
            end
      
          A = 4'd15;
          #100 
          if(A == 15)
            	begin
              	if(Z == 0)
                	$display("TEST CASE 15 PASSED");
              	else
                	$display("TEST CASE 15 FAILED");
            	end  
         	$display(" _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _   ");	
        end

  
endmodule
