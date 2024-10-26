module RegisterFile (
    input clk,
    input reg_write,               // Control signal to write to the register file
    input [4:0] read_reg1, read_reg2, write_reg,  // Register addresses
    input [31:0] write_data,       // Data to write
    output [31:0] read_data1, read_data2  // Data read from registers
);
    reg [31:0] registers [31:0];   // 32 registers, 32-bit wide

    // Read operation (asynchronous)
    assign read_data1 = registers[read_reg1];
    assign read_data2 = registers[read_reg2];

    // Write operation (synchronous)
    always @(posedge clk) begin
        if (reg_write) begin
            registers[write_reg] <= write_data;
        end
    end
endmodule
