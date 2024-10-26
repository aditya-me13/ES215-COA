module SignExtend (
    input [15:0] immediate,
    output [31:0] extended_immediate
);
    assign extended_immediate = { {16{immediate[15]}}, immediate };
endmodule
