module ALU (
    input wire [31:0] srcA,          // First operand
    input wire [31:0] srcB,          // Second operand
    input wire [3:0] alu_control,    // ALU control signal
    output reg [31:0] alu_result,    // Result of the operation
    output reg zero                  // Zero flag
);

    always @(*) begin
        case (alu_control)
            4'b0000: alu_result = srcA + srcB;     // ADD
            4'b0001: alu_result = srcA - srcB;     // SUBTRACT
            4'b0010: alu_result = srcA & srcB;     // AND
            4'b0011: alu_result = srcA | srcB;     // OR
            4'b0100: alu_result = srcA ^ srcB;     // XOR
            4'b0101: alu_result = srcA << srcB[4:0]; // SHIFT LEFT
            4'b0110: alu_result = srcA >> srcB[4:0]; // SHIFT RIGHT
            4'b0111: alu_result = (srcA < srcB) ? 1 : 0; // SLT (Set on Less Than)
            default: alu_result = 32'b0;           // Default case
        endcase

        // Set zero flag
        zero = (alu_result == 32'b0) ? 1'b1 : 1'b0;
    end
endmodule
