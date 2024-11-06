module InstructionMemory (
    input wire clk,              // Clock signal
    input wire ena,              // Enable signal for memory
    input wire [31:0] PC,        // Program Counter input
    output reg [31:0] instruction // 32-bit instruction output
);

    // Internal wires to hold each byte of the instruction
    wire [7:0] byte0, byte1, byte2, byte3;

    // Instantiate the blk_mem_gen module
    blk_mem_gen_0 instr_mem (
        .clka(clk),
        .ena(ena),
        .wea(1'b0),                    // Read-only, so write enable is 0
        .addra(PC[31:0]),              // Address for the first byte (byte 0)
        .dina(8'b0),                   // No data input since it's read-only
        .douta(byte0)                  // First byte output
    );

    blk_mem_gen_0 instr_mem1 (
        .clka(clk),
        .ena(ena),
        .wea(1'b0),
        .addra(PC + 1),                // Address for the second byte (byte 1)
        .dina(8'b0),
        .douta(byte1)                  // Second byte output
    );

    blk_mem_gen_0 instr_mem2 (
        .clka(clk),
        .ena(ena),
        .wea(1'b0),
        .addra(PC + 2),                // Address for the third byte (byte 2)
        .dina(8'b0),
        .douta(byte2)                  // Third byte output
    );

    blk_mem_gen_0 instr_mem3 (
        .clka(clk),
        .ena(ena),
        .wea(1'b0),
        .addra(PC + 3),                // Address for the fourth byte (byte 3)
        .dina(8'b0),
        .douta(byte3)                  // Fourth byte output
    );

    // Concatenate the four bytes to form the 32-bit instruction
    always @(posedge clk) begin
        if (ena) begin
            instruction <= {byte3, byte2, byte1, byte0};
        end
    end

endmodule
