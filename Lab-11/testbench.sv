module gameboy_tb;

	reg  CLOCK, RESET;
  	reg [1:0] X;
  	wire [2:0]Z;

  	gameboy DUT( .clock(CLOCK), .x(X), .reset(RESET), .z(Z));
  
  	parameter Kick = 0, Punch = 1, Jump = 2, Duck = 3, Run = 4;
  
    parameter Fight = 0, React = 1, A = 2, B = 3;
  
  	always @ (Z) begin
      case (Z)
			Kick: begin
              $display("Kick");
              $display("\\_O__");
              $display("  \\__      __");
              $display("  |  \\__  /00\\ ");
              $display(" /       /    \\", "\n");
            end
			Punch: begin
              $display("Punch");
              $display("    _______");
              $display("---'   ____)");
              $display("      (_____)   __");
              $display("      (_____)  /00\\ ");
              $display("---.__(___)   /    \\", "\n");
            end
			Jump: begin
              $display("Jump",);
              $display("    \\O");
              $display("     |\\_");
              $display("    /-\\");
              $display("  /      \\");
              $display("     __");
              $display("    |__|", "\n");
            end
			Duck: begin
              $display("Duck");
              $display("(____)");
              $display(" (__)");
              $display("  (_)");
              $display("    ");
              $display("  __0");
              $display(" /  \\", "\n");
            end
        	Run: begin
              $display("Run");
              $display("   __O");
              $display("  / /\\_,");
              $display("___/\\ ");
              $display("    /_", "\n");
            end
		endcase
	end

	
    always #10 CLOCK = ~CLOCK;                   
                       
    initial
	begin
		$dumpfile("dump.vcd"); $dumpvars;
   	
     	CLOCK = 1;
   		RESET = 1;
		
      $display("BEGIN GAME","\n");
 		#20 RESET = 0;
      #20 if (Z != Run) begin
        $display("XXXXXXXX GAME OVER XXXXXXXXX");
        $finish;
      end
      
      $display("INCOMING ENEMY GET READY TO FIGHT ..","\n");
      	#20 X = Fight;
      
      $display("ATTACK!","\n");
      	#20 X = A;
      #20 if (Z != Kick) begin
        $display("XXXXXXXX GAME OVER XXXXXXXXX", "\n");
        $finish;
      end
        #20 X = B;
      #20 if (Z != Punch) begin
        $display("XXXXXXXX GAME OVER XXXXXXXXX");
        $finish;
      end
      	#20 X = A;
      #20 if (Z != Kick) begin
        $display("XXXXXXXX GAME OVER XXXXXXXXX");
        $finish;
      end
      	#20 X = B;
      #20 if (Z != Punch) begin
        $display("XXXXXXXX GAME OVER XXXXXXXXX");
        $finish;
      end
      
      #20 $display("ENEMY DEFEATED .. CONTINUE TRAVELING","\n");
      	X = Fight;
      #10 X = A;
      #10 if (Z != Run) begin
        $display("XXXXXXXX GAME OVER XXXXXXXXX");
        $finish;
      end
      
      #20 $display("ENTERING JUNGLE GET READY TO REACT TO DANGERS ..","\n");
      	X = React;
      	
      #20 $display("INCOMING TREE STUMP","\n");
      	X = A;
      #20 if (Z != Jump) begin
        $display("XXXXXXXX GAME OVER XXXXXXXXX");
        $finish;
      end
      
      #20 $display("INCOMING BEE HIVES ABOVE","\n");
      	X = B;
      #20 if (Z != Duck) begin
        $display("XXXXXXXX GAME OVER XXXXXXXXX");
        $finish;
      end
      
      #20 $display("INCOMING TREE STUMP","\n");
      	X = A;
      #20 if (Z != Jump) begin
        $display("XXXXXXXX GAME OVER XXXXXXXXX");
        $finish;
      end
      
      #20 $display("EXITED JUNGLE SAFELY .. CONTINUE TRAVELING","\n");
		X = React;
      #10 X = B;
      #20 if (Z != Run) begin
        $display("XXXXXXXX GAME OVER XXXXXXXXX");
        $finish;
      end
      
      #20 $display("***** WINNER ******");
		#20 $finish;
	end
        


endmodule