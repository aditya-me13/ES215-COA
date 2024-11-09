
module topmodule (
    input clk,
    input [2:0] switch,       // Switch input to select address (3 switches for 8 addresses)
    input ena,               // Enable signal
    output reg [31:0] data_out // Data output
);

// Instantiate the Block Memory Generator
wire [31:0] mem_out; // Internal memory output
blk_mem_gen_1 bram_inst (
    .clka(clk),          // Clock input  
    .ena(ena),        // Enable input
    .wea(1'b0),          // Write enable (not used for read)
    .addra(switch),      // Address input from switches
    .dina(8'b0),         // Data input (not used for read)
    .douta(mem_out)      // Data output from memory
);

// Output the data from memory to the output register
always @(posedge clk) begin
    if (ena) begin
        data_out <= mem_out; // Assign memory output to data output
    end
end

endmodule
