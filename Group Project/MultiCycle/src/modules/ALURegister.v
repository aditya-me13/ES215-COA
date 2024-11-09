module ALURegister(
    input [31:0] ALUResult,
    input clk,
    output reg [31:0] ALUOut
    );
    
    always @(posedge clk)
    begin 
        ALUOut <= ALUResult;
    end
endmodule