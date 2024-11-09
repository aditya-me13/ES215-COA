module ShiftLeft2 (
    input wire [31:0] in,       // 32-bit input
    output wire [31:0] out      // 32-bit output after shifting left by 2
);

    // Shift the input left by 2 bits
    assign out = in << 2;

endmodule
