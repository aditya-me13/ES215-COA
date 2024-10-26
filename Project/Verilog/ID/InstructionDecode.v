module InstructionDecode (
    input [31:0] instruction,  // Instruction from IF stage
    output [5:0] opcode,       // Operation code
    output [4:0] rs, rt, rd,   // Register addresses
    output [15:0] immediate,   // Immediate value
    output [5:0] func,         // Function code
    output [25:0] jump_target  // Target address for jumps
);
    assign opcode = instruction[31:26];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];
    assign immediate = instruction[15:0];
    assign func = instruction[5:0];
    assign jump_target = instruction[25:0];
endmodule
