module ControlUnit (
    input [5:0] opcode,
    input [5:0] func,
    output reg reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, jump,
    output reg [1:0] alu_op
);
    always @(*) begin
        case (opcode)
            6'b000000: begin  // R-type
                reg_dst = 1;
                alu_src = 0;
                mem_to_reg = 0;
                reg_write = 1;
                mem_read = 0;
                mem_write = 0;
                branch = 0;
                jump = 0;
                alu_op = 2'b10;  // R-type ALU operation
            end
            // Additional cases for other opcodes (lw, sw, beq, j, etc.)
        endcase
    end
endmodule
