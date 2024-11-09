module InstructionRegister(
    input [31:0] instruction,
    input clk,
    input IRWrite,
    output reg [31:0] instr
    );
    
    always @(posedge clk)
    begin if(IRWrite)
        instr <= instruction;
    end
endmodule