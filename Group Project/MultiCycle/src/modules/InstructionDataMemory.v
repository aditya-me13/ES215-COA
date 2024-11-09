// Done

module InstructionDataMemory #(parameter ADDRESS = 80)(
    input clk,
    input [9:0] address,
    input [31:0] writeData,
    input MemWrite,
    output [31:0] instruction
);

    // Signal to differentiate between instruction and data memory
    reg iORd;
    wire [31:0] instr_out, data_out;
    wire rsta_0, rsta_busy_0;
    wire rsta_1, rsta_busy_1;

    // Determine if the current address is for instruction or data memory
    always @(*) begin
        if (address < ADDRESS)
            iORd = 1;  // Instruction memory
        else
            iORd = 0;  // Data memory
    end

    // Instruction memory instantiation
    blk_mem_gen_0 instr_mem (
        .clka(clk),
        .ena(iORd),          // Enable if it's instruction memory
        .wea(1'b0),          // Read-only for instruction memory
        .addra(address),
        .dina(32'b0),
        .douta(instr_out)    // Output to instr_out
//        .rsta(rsta_0),
//        .rsta_busy(rsta_busy_0)
    );

    // Data memory instantiation
    blk_mem_gen_1 data_mem (
        .clka(clk),
        .ena(~iORd),         // Enable if it's data memory
        .wea(MemWrite),      // Write-enable controlled by MemWrite
        .addra(address - ADDRESS), // Adjust address for data memory
        .dina(writeData),
        .douta(data_out)     // Output to data_out
//        .rsta(rsta_1),
//        .rsta_busy(rsta_busy_1)
    );

    // Multiplexer to select output from either instruction or data memory
    assign instruction = iORd ? instr_out : data_out;

endmodule