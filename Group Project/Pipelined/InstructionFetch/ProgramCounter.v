module ProgramCounter(
    input clk,
    input reset,
    input [31:0] next_pc,  // Address of the next instruction
    output reg [31:0] pc_out  // Current PC value
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_out <= 0;  // Reset to initial PC value
        else
            pc_out <= next_pc;  // Load the next PC value
    end
endmodule
