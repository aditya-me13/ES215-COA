module ALUControl (
    input [1:0] alu_op,
    input [5:0] func,
    output reg [3:0] alu_control
);
    always @(*) begin
        case (alu_op)
            2'b10: begin  // R-type
                case (func)
                    6'b100000: alu_control = 4'b0010;  // ADD
                    6'b100010: alu_control = 4'b0110;  // SUB
                    // More R-type functions like AND, OR
                endcase
            end
            // Additional cases for other alu_op values
        endcase
    end
endmodule
