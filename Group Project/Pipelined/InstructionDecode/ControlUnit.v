module ControlUnit (
    input [5:0] opcode,
    output reg RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite
    output reg [1:0] ALUOp
);
    always @(*) begin
        case (opcode)
            6'b000000: begin  // R-type
                RegDst = 1'b1;
                Branch = 1'b0;
                MemRead = 1'b0;
                MemtoReg = 1'b0;
                ALUOp = 2'b10;
                MemWrite = 1'b0;
                ALUSrc = 1'b0;
                RegWrite = 1'b1;
                alu_op = 2'b10;
            end
            // Additional cases for other opcodes (lw, sw, beq, j, etc.)
        endcase
    end
endmodule
