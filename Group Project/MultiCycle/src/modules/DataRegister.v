module DataRegister(
    input [31:0] instruction,
    input clk,
    output reg [31:0] data
    );
    
    always @(posedge clk)
    begin 
        data <= instruction;
    end
endmodule