module NextPC (
    input [31:0] pc_plus_4,
    input [31:0] branch_target,
    input branch_taken,  // Control signal to decide between next instruction and branch
    output [31:0] next_pc
);
    assign next_pc = branch_taken ? branch_target : pc_plus_4;
endmodule
