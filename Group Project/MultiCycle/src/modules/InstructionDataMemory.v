module InstructionDataMemory #(parameter ADDRESS = 80)(
    input clk,
    input [9:0] address,
    input [31:0] writeData,
    input MemWrite,
    input [4:0] displayAddress,
    input readMode, 
    output [31:0] instruction,
    output [31:0] dataOut
);

    // Signal to differentiate between instruction and data memory
    reg iORd;
    wire [31:0] instr_out;
    wire [31:0] data_out;
    wire [7:0] instr_out0, instr_out1, instr_out2, instr_out3;
    wire [7:0] data_out0, data_out1, data_out2, data_out3;

    // Determine if the current address is for instruction or data memory
    always @(*) begin
        if (address < ADDRESS)
            iORd = 1;  // Instruction memory
        else
            iORd = 0;  // Data memory
    end

    // Instruction memory instantiation
    blk_mem_gen_0 instr_mem0 (
        .clka(clk),
        .ena(iORd),          // Enable if it's instruction memory
        .wea(1'b0),          // Read-only for instruction memory
        .addra(address),
        .dina(8'b0),
        .douta(instr_out0)    // Output to instr_out0
    );

    blk_mem_gen_0 instr_mem1 (
        .clka(clk),
        .ena(iORd),          // Enable if it's instruction memory
        .wea(1'b0),          // Read-only for instruction memory
        .addra(address+1),
        .dina(8'b0),
        .douta(instr_out1)    // Output to instr_out1
    );

    blk_mem_gen_0 instr_mem2 (
        .clka(clk),
        .ena(iORd),          // Enable if it's instruction memory
        .wea(1'b0),          // Read-only for instruction memory
        .addra(address+2),
        .dina(8'b0),
        .douta(instr_out2)    // Output to instr_out2
    );

    blk_mem_gen_0 instr_mem3 (
        .clka(clk),
        .ena(iORd),          // Enable if it's instruction memory
        .wea(1'b0),          // Read-only for instruction memory
        .addra(address+3),
        .dina(8'b0),
        .douta(instr_out3)    //Output to instr_out3
    );

    // Concatenate the four bytes to form the 8-bit instruction
    assign instr_out = {instr_out0, instr_out1, instr_out2, instr_out3};

    assign dataMemAddress0 = (readMode) ? 4*(displayAddress) : address - ADDRESS; 
    assign dataMemAddress1 = (readMode) ? 4*(displayAddress) + 1 : address - ADDRESS + 1;
    assign dataMemAddress2 = (readMode) ? 4*(displayAddress) + 2 : address - ADDRESS + 2;
    assign dataMemAddress3 = (readMode) ? 4*(displayAddress) + 3 : address - ADDRESS + 3;


    // Data memory instantiation
    blk_mem_gen_1 data_mem0 (
        .clka(clk),
        .ena(~iORd),         // Enable if it's data memory
        .wea(MemWrite),      // Write-enable controlled by MemWrite
        .addra(dataMemAddress0), // Adjust address for data memory
        .dina(writeData[31:24]),
        .douta(data_out0)     // Output to data_out0
    );

    blk_mem_gen_1 data_mem1 (
        .clka(clk),
        .ena(~iORd),         // Enable if it's data memory
        .wea(MemWrite),      // Write-enable controlled by MemWrite
        .addra(dataMemAddress1), // Adjust address for data memory
        .dina(writeData[23:16]),
        .douta(data_out1)     // Output to data_out1
    );

    blk_mem_gen_1 data_mem2 (
        .clka(clk),
        .ena(~iORd),         // Enable if it's data memory
        .wea(MemWrite),      // Write-enable controlled by MemWrite
        .addra(dataMemAddress2), // Adjust address for data memory
        .dina(writeData[15:8]),
        .douta(data_out2)     // Output to data_out2
    );

    blk_mem_gen_1 data_mem3 (
        .clka(clk),
        .ena(~iORd),         // Enable if it's data memory
        .wea(MemWrite),      // Write-enable controlled by MemWrite
        .addra(dataMemAddress3), // Adjust address for data memory
        .dina(writeData[7:0]),
        .douta(data_out3)     // Output to data_out3
    );

    // Concatenate the four bytes to form the 8-bit data
    assign data_out = {data_out0, data_out1, data_out2, data_out3};

    // Multiplexer to select output from either instruction or data memory
    assign instruction = iORd ? instr_out : data_out;

endmodule