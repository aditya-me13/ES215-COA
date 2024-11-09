module RegisterA(
    input [31:0] readData1,
    input clk,
    output reg [31:0] A
    );
    
    always @(posedge clk)
    begin 
        A <= readData1;
    end
endmodule