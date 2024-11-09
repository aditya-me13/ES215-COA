module SlowClockDivider(
    input clk_in,           // Fast clock input
    output reg clk_out = 0  // Slow clock output, initialize to 0
);
    reg [31:0] count = 0;
    parameter DIVISOR = 50000000; // Set to 50,000,000 for 1 Hz output with 50 MHz input clock

    always @(posedge clk_in) begin
        if (count >= (DIVISOR - 1)) begin
            count <= 0;
            clk_out <= ~clk_out; // Toggle output clock
        end else begin
            count <= count + 1;
        end
    end
endmodule
