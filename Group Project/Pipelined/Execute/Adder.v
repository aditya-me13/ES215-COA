module SimpleAdder (
    input wire [31:0] PC,        // First 32-bit input (e.g., PC)
    input wire [31:0] immediate,        // Second 32-bit input (e.g., offset)
    output wire [31:0] out      // 32-bit sum output
);

    // Perform the addition
    assign out = PC + immediate;

endmodule
