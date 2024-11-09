module RegisterB(
    input [31:0] readData2,
    input clk,
    output reg [31:0] B
    );
    
    always @(posedge clk)
    begin 
        B <= readData2;
    end
endmodule