// Module - DFF positive edge with asynchronous active low preset that sets it to 1

module dff_asyncpre(clk, d, q, preset);
  //INITIALIZE INPUTS AND OUTPUTS BASED ON MANUAL INSTRUCTIONS
  input clk, d, preset;
  output reg q;
  
  //ALWAYS BLOCK
  always @(posedge clk) begin
      
    //IF PRESET = 0 THEN SET Q = 1
    if(preset == 0) begin
        q <= 1'b1;
    end
    else begin
          
      //ADD D-FF FUNCTIONALITY
      q <= d;
    end
        
  //END ALWAYS posedge BLOCK
  end
    
endmodule