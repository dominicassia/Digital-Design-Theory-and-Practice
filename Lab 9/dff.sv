// Module - DFF positive edge with asynchronous active low preset that sets it to 1

module dff_asyncpre(clk, d, q, preset);
  //INITIALIZE INPUTS AND OUTPUTS BASED ON MANUAL INSTRUCTIONS
  input clk, d, preset;
  output reg q;
  
  //ALWAYS BLOCK
  always @(posedge clk) begin
      
      //IF PRESET = 0 THEN SET Q = 1
    if(preset == 0) begin
        assign q = 1;
    end
      
      //ADD D-FF FUNCTIONALITY
      assign q = d;

      //OR

      //case(d)
        //1'b0: q = 0;
        //1'b1: q = 1;
    
  //END ALWAYS posedge BLOCK
  end
    
endmodule