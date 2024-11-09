module ControlUnit(
    input wire clk,
    input wire reset,
    input wire [5:0] opcode,      // 6-bit opcode from the instruction
    input wire [5:0] funct,
    output reg IorD,
    output reg ALUSrcA,
    output reg [1:0] ALUSrcB,
    output reg [2:0] ALUControl,
    output reg [1:0] PCSrc,
    output reg IRWrite,
    output reg PCWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg RegDst,
    output reg MemtoReg,
    output reg RegWrite,
    output reg Branch
);
    // State encoding
    parameter FETCH = 4'b0000, DECODE = 4'b0001, MEMADR = 4'b0010,
                MEMREAD = 4'b0011, MEMWRITEBACK = 4'b0100, MEMWRITE = 4'b0101,
                EXECUTE = 4'b0110, ALUWRITEBACK = 4'b0111, BRANCH = 4'b1000,
                ADDI_EXECUTE = 4'b1001, ADDI_WRITEBACK = 4'b1010, JUMP = 4'b1011;

    reg [3:0] state, next_state;
    reg [1:0] ALUOp;

    always @(*) begin
        case (ALUOp)
            2'b00: ALUControl = 3'b010;  // LW/SW: Add operation
            2'b01: ALUControl = 3'b110;  // BEQ: Subtract operation
            2'b10: begin                 // R-type instructions
                case (funct)
                    6'b100000: ALUControl = 3'b010; // ADD
                    6'b100010: ALUControl = 3'b110; // SUB
                    6'b100100: ALUControl = 3'b000; // AND
                    6'b100101: ALUControl = 3'b001; // OR
                    6'b101010: ALUControl = 3'b111; // SLT
                    default:   ALUControl = 3'b010; // Undefined function
                endcase
            end
            default: ALUControl = 3'b010; // Undefined ALUOp
        endcase
    end

    // State transition logic (sequential)
    always @(posedge clk or posedge reset) begin
        if (reset) 
            state <= FETCH;
        else
            state <= next_state;
    end

    // Next state logic (combinational)
    always @(*) begin
        case (state)
            FETCH: next_state = DECODE;
            DECODE: begin
                case (opcode)
                    6'b100011, 6'b101011: next_state = MEMADR;     // LW or SW
                    6'b000000: next_state = EXECUTE;               // R-type
                    6'b000100: next_state = BRANCH;                // BEQ
                    6'b001000: next_state = ADDI_EXECUTE;          // ADDI
                    6'b000010: next_state = JUMP;                  // J
                    default: next_state = FETCH;                   // Default to fetch
                endcase
            end
            MEMADR: begin
                if (opcode == 6'b100011) // LW
                    next_state = MEMREAD;
                else if (opcode == 6'b101011) // SW
                    next_state = MEMWRITE;
                else
                    next_state = FETCH;
            end
            MEMREAD: next_state = MEMWRITEBACK;
            MEMWRITEBACK: next_state = FETCH;
            MEMWRITE: next_state = FETCH;
            EXECUTE: next_state = ALUWRITEBACK;
            ALUWRITEBACK: next_state = FETCH;
            BRANCH: next_state = FETCH;
            ADDI_EXECUTE: next_state = ADDI_WRITEBACK;
            ADDI_WRITEBACK: next_state = FETCH;
            JUMP: next_state = FETCH;
            default: next_state = FETCH;
        endcase
    end

    // Output logic (combinational) based on current state
    always @(*) begin
        // Default values for control signals
        IorD = 0;
        ALUSrcA = 0;
        ALUSrcB = 2'b00;
        ALUOp = 2'b00;
        PCSrc = 2'b00;
        IRWrite = 0;
        PCWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        RegDst = 0;
        MemtoReg = 0;
        RegWrite = 0;
        Branch = 0;

        case (state)
            FETCH: begin
                MemRead = 1;
                IRWrite = 1;
                ALUSrcB = 2'b01;
                PCWrite = 1;
            end
            DECODE: begin
                ALUSrcB = 2'b11;
            end
            MEMADR: begin
                ALUSrcA = 1;
                ALUSrcB = 2'b10;
                ALUOp = 2'b00;
            end
            MEMREAD: begin
                IorD = 1;
                MemRead = 1;
            end
            MEMWRITEBACK: begin
                RegDst = 0;
                MemtoReg = 1;
                RegWrite = 1;
            end
            MEMWRITE: begin
                IorD = 1;
                MemWrite = 1;
            end
            EXECUTE: begin
                ALUSrcA = 1;
                ALUOp = 2'b10;
            end
            ALUWRITEBACK: begin
                RegDst = 1;
                MemtoReg = 0;
                RegWrite = 1;
            end
            BRANCH: begin
                ALUSrcA = 1;
                ALUOp = 2'b01;
                PCSrc = 2'b01;
                Branch = 1;
            end
            ADDI_EXECUTE: begin
                ALUSrcA = 1;
                ALUSrcB = 2'b10;
                ALUOp = 2'b00;
            end
            ADDI_WRITEBACK: begin
                RegDst = 0;
                MemtoReg = 0;
                RegWrite = 1;
            end
            JUMP: begin
                PCSrc = 2'b10;
                PCWrite = 1;
            end
        endcase
    end
endmodule