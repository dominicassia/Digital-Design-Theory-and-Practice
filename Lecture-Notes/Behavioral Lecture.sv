// Behavioral Coding style

/*

Describe the system algorithmically
Often used in sequential circuits
Procedural blocks: initial and always
    initial --> only executes once at t=0
    always --> continually executes while agrees with sensitivity list

*/

// Initial block example ---
reg a,b,c;

initial begin
    a = 0;
    b = 1;
    c = 0;
end

// Always block example ---
input a,b;
output reg out; // define out as reg AND as output in same line

always @(a or b) begin
    out = a | b;        // Executes when variables in sensistivity list changes
end

// Sensistivity list example --- ** clk is a var to be defined
always @(posedge clk)   // Positive edge of the signal
always @(negedge clk)   // Negative edge of the signal
always @(*)

/*

Blocking vs nonblocking statements
    Blocking:
        '='.. a=0;
        Executed in sequence
        Used in combinatinal circuits
    Nonblocking:
        '<='.. a<=0;
        Executed in parallel
        Used in sequential circuits     

    ** dont mix these in one always block
*/

// Blocking example ---
input a;
reg b=0, c=1, d=1, e=0;
always @(a) begin
    c=b; // c=0 evaluated and assigned
    b=a; // b=a evaluated and assigned
    d=c; // d=0 evaluated and assigned
    e=d; // e=0 evaluated and assigned
end

// Nonblocking example --- ** RHS first, assign LHS at the end
input a;
reg b=0, c=1, d=1, e=0;
always @(a) begin
    c<=b; // c=0, next
    b<=a; // b=a, next
    e<=d; // e=1, next
    d<=c; // d=1, assign ALL at the same time ** if not in parallel, d would be the updated value of c
end

/*

Conditional Statements
    if & else if blocks

*/

// 2:1 mux with conditionals

module mux_2to1(a,b,sel,out);
input a,b,sel;
output reg out;
always @(*) begin       // whenever any input changes
    if( sel==1 )begin
        out=b;
    end
    else out=a;
end
endmodule

// 2:1 mux w/o conditionals

module mux_2to1(a, b ,sel, out);
    input a,b,sel;
    output reg out;
    always @(*) begin       // whenever any input changes
        case ( sel==1 ) begin
            1'b0 : out = a;     // When selector is zero, out=a
            1'b1 : out = b;     // When selector is one, out=b
            end     
            default: out = 1'b0;
        endcase
    end
endmodule

// Build 4:1 using two 2:1 muxes (using modeles within modules)

module mux_4to1(i0, i1, i2, i3, s0, s1, out);
    input i0, i1, i2, i3, s0, s1;
    output out;
    wire w1, w2;

    mux_2to1 m1(i0, i1, s1, out);                       // This notation also works, but its not as general and common as the next two
    mux_2to1 m2(.a(i2), .b(i3), .sel(s1), .out(w2));    // Replace the inputs and outputs
    mux_2to1 m3(.a(w1), .b(w2), .sel(s0), .out(out));   // Replace the inputs and outputs

endmodule

// Sequential circuits *Non-blocking (D Flip flop / a active high reset at pos edge of clock)

module dff(clk, d, rst, q);
    input clk, d, rst;
    output reg q;

    always @(posedge clk) begin
        
        if(rst == 1) // Active high reset
            q <= 0;
        else 
            q <= d;

    end

endmodule

// What is this module? -- Shift register!

module mysteryff(clk, d, q2);
    input clk, d;
    output reg q2;
    reg q;

    always @(negedge clk) begin
        
        q <= d;
        q2 <= q;

    end

endmodule

// Fuller Adder

module fulladder(a, b, cin, s, cout);
    input a, b, cin;
    output reg s;
    output reg cout;

    always @(*) begin
        
        {cout, sum} = a + b + cin  // two bit output
      // bit1, bit0

    end

endmodule