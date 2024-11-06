module InstructionFetch (
    input clk,
    input reset,
    input branch_taken,      // Control signal to decide between next instruction and branch
    input [31:0] branch_target,   // Target address of the branch instruction
    output [31:0] instruction,   // Instruction to be executed
    output [31:0] pc_plus_4   // Address of the next instruction
);
    wire [31:0] pc_out, next_pc;  

    ProgramCounter pc_reg (   
        .clk(clk),
        .reset(reset),
        .next_pc(next_pc),
        .pc_out(pc_out)
    );

    // InstructionMemory instr_mem (
    //     .addr(pc_out),
    //     .instruction(instruction)
    // );

    InstructionMemory instr_mem (
    .clk(clk),
    .ena(ena),
    .PC(pc_out),
    .instruction(instruction)
    );

    NextPC next_pc_mux (
        .pc_plus_4(pc_out + 4),
        .branch_target(branch_target),
        .branch_taken(branch_taken),
        .next_pc(next_pc)
    );

    assign pc_plus_4 = pc_out + 4;
endmodule
