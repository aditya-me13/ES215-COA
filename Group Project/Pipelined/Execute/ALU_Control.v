module ALUControl (
    input wire [5:0] funct,         // 6-bit function code from the instruction
    input wire [1:0] ALU_op,        // 2-bit ALU operation signal from control unit
    output reg [3:0] ALU_control    // 4-bit ALU control signal for ALU
);

    always @(*) begin
        case (ALU_op)
            2'b00: ALU_control = 4'b0010; // Load/store instructions (ADD)
            2'b01: ALU_control = 4'b0110; // Branch instructions (SUB)
            2'b10: begin                  // R-type instructions
                case (funct)
                    6'b100000: ALU_control = 4'b0010; // ADD
                    6'b100010: ALU_control = 4'b0110; // SUB
                    6'b100100: ALU_control = 4'b0000; // AND
                    6'b100101: ALU_control = 4'b0001; // OR
                    6'b100111: ALU_control = 4'b1100; // NOR
                    6'b100110: ALU_control = 4'b0011; // XOR
                    6'b000000: ALU_control = 4'b0011; // SLL (Shift Left Logical)
                    6'b000010: ALU_control = 4'b0100; // SRL (Shift Right Logical)
                    6'b101010: ALU_control = 4'b0111; // SLT (Set on Less Than)
                    default:   ALU_control = 4'b0000; // Default (No operation)
                endcase
            end
            default: ALU_control = 4'b0000; // Default (No operation)
        endcase
    end
endmodule
