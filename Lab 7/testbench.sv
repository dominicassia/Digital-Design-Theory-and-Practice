module top_tb;
  reg [3:0] a_tb;
  reg [1:0] sel_tb;
  wire [3:0] out_tb;

  top dut(.a(a_tb), .sel(sel_tb), .out(out_tb));
  
  initial begin
    $dumpfile("tb.vcd"); $dumpvars;
    
    a_tb = 4'b1110;
    sel_tb = 2'b00;
    
    #100
    
    a_tb = 4'b0101;
    sel_tb = 2'b01;
    
    #100
    
    a_tb = 4'b1000;
    sel_tb = 2'b10;
    
    #100
    
    a_tb = 4'b0000;
    sel_tb = 2'b11;
    
    #100
    
    a_tb = 4'b0010;
    sel_tb = 2'b00;
    
    
  end
  
endmodule