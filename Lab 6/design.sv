//GATE-LEVEL MODELLING OR STRUCTURAL MODELLING
//A strucutural model of a logic circuit is encapsulated by keywords 'MODULE' and 'ENDMODULE'

module one_bit_comparator(A, Z); //Module definition accomponied by it's port's

	//DECLARING PORT MODES: 
  	
  	input [3:0] A; 			//A 4-bit binary input   
	output Z; 				//A 1-bit binary output
  
  	//ANY INTERNAL WIRES THAT ESTABLISH CONNECTIVITY
  	
  	wire w1, w2, w3;
  
  	//DECLARE ANY EXTRA WIRES IF NECCESSARY:
  
	/*
    DECALRE/INSTANTIATE YOUR PRIMITIVES HERE:
  	
    example: nand g_1(out_1, in_1, in_2, in_3) - a 3-input 'NAND' named g_1 with the output as out_1.  
  
  	USING STRUCTURAL MODELLING IMPLEMENT THE SAME FUNCTION FROM Q4 ON LAB 5:
    NOTE: the terms A1, A2, A3 and A4 from lab 5 is represented as A[3], A[2], A[1] and A[0] respectively.
  	*/
  	
  /*

    A1 MSB A4 LSB --> A[3:0] --> A3 MSB A0 LSB
    A1 --> A[3]
    A2 --> A[2]
    A3 --> A[1]
    A4 --> A[0]
  
  */
  
  and a_0(w1, ~A[3], ~A[1], ~A[0]);
  and a_1(w2, A[3], ~A[2], ~A[1]);
  and a_2(w3, ~A[2], ~A[1], ~A[0]);
 
  or o_0(Z, w1, w2, w3);

endmodule 