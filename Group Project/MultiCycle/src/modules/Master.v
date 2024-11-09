module Master (
    input clk,
    input reset,
    input lower_bytes,
    output [6:0] seg,
    output [3:0] an
);

    wire [31:0] instruction;
    reg slow_clk;
    reg [26:0] clk_divider;  // For 2-second delay, assuming 100MHz clock

    // Clock divider to generate a 2-second delay clock
    always @(posedge clk) begin
        if (reset) begin
            clk_divider <= 0;
            slow_clk <= 0;
        end else if (clk_divider == 100_000_000) begin  // Toggle every 1 second
            slow_clk <= ~slow_clk;
            clk_divider <= 0;
        end else begin
            clk_divider <= clk_divider + 1;
        end
    end
    
    // Initialize the TopModule
    TopModule tp(
        .slow_clk(slow_clk),
        .reset(reset),
        .view(instruction)
    );

    // Instantiate the instruction display module
    SevenSegment display (
        .clk(clk),                  // Main clock for fast refresh on display
        .instruction(instruction),  // Instruction fetched from instruction fetch
        .lower_bytes(lower_bytes),
        .seg(seg),
        .an(an)
    );

endmodule