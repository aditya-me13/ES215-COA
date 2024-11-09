// Done

module ALU(
    input [31:0] operand1,
    input [31:0] operand2,
    input [2:0] ALUControl,
    output reg [31:0] ALUResult,
    output reg Zero
);
    
    always @(*) begin
       
        case(ALUControl)
            4'b000: ALUResult = operand1 & operand2;           // BITWISE AND
            4'b001: ALUResult = operand1 | operand2;           // BITWISE OR
            4'b010: ALUResult = operand1 + operand2;           // ADD
            4'b110: ALUResult = operand1 - operand2;           // SUB
            4'b111: ALUResult = (operand1 < operand2) ? 1 : 0; // SLT
            default: ALUResult = 0;
        endcase
        
        if (ALUResult == 0)
            Zero = 1;
        else
            Zero = 0;
    end
    
endmodule