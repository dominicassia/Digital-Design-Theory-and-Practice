module gameboy( input clock, reset, input [1:0] x, output reg [2:0] z );
	
	// Declare state register
	reg  [1:0] state;
	// Declare states
	parameter IDLE = 0, FIGHT = 1, REACT = 2;
  	// Declare Actions
  	parameter Kick = 3'b000, Punch = 3'b001, Jump = 3'b010, Duck = 3'b011, Run = 3'b100;
  	// Declare Buttons
  	parameter Fight = 0, React = 1, A = 2, B = 3;

    // State Block
    always @(posedge clock or posedge reset) begin
    
        // Reset --> IDLE
        if (reset)
            state <= IDLE;
        else begin
			// State switch
            case(state)
                IDLE:
                    if (x == React)         // <Press> React
                        state <= REACT;     // REACT MODE
                    else if (x == Fight)    // <Press> Fight
                        state <= FIGHT;     // FIGHT MODE
                    else
                        state <= IDLE;      // <Press> A or B --> IDLE
                FIGHT:
                    if (x == Fight)         // <Press> Fight
                        state <= IDLE;      // IDLE MODE
                REACT:
                    if (x == React)         // <Press> React
                        state <= IDLE;      // IDLE MODE    
                default: state <= IDLE;
            endcase
        end
    end

    // Output Block
    always @(posedge clock, x) begin
		// State Switch
        case (state)
            IDLE:
                if (x == React || x == Fight)       // <Press> React or Fight
                    z = 3'bx;                       // Don't care
                else if (x == A || x == B)          // <Press> A or B
                    z = Run;                        // RUN
            FIGHT:
                if (x == Fight)         // <Press> Fight
                    z = Run;            // RUN
                else if (x == A)        // <Press> A
                    z = Kick;           // KICK
                else if (x == B)        // <Press> B
                    z = Punch;          // PUNCH
            REACT:
                if (x == React)         // <Press> React
                    z = Run;            // RUN
                else if (x == A)        // <Press> A
                    z = Jump;           // JUMP
                else if (x == B)        // <Press> B
                    z = Duck;           // DUCK
            default: z = Run;
        endcase
    end
endmodule
