// DONE

module SignExtend(
    input [15:0] instr,
    output [31:0] signImm
);
    assign signImm = {{16{instr[15]}}, instr};
endmodule