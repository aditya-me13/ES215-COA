module Master (
    input clk,
    input pause,
    input reset,
    input lower_bytes,
    input [2:0] data_sel,
    output [6:0] seg,
    output [3:0] an
);

    // values to be fetched for the instruction display
    wire [31:0] PCOut;
    wire [31:0] instruction;
    wire [31:0] data;
    wire [31:0] readData1;
    wire [31:0] readData2;
    wire [31:0] ALUOut;

    // Final output to the display on seven segment
    wire [31:0] display_out;

    // values for clock divider and control
    reg slow_clk;
    reg [26:0] clk_divider;  // For 2-second delay, assuming 100MHz clock
    reg flag;

    // Clock divider to generate a 2-second delay clock
    always @(posedge clk) begin
        if(pause)
            slow_clk <= slow_clk;
        else if (reset) begin
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
        .v_PCOut(PCOut),
        .v_instr(instruction),
        .v_data(data),
        .v_A(readData1),
        .v_B(readData2),
        .v_ALUOut(ALUOut)
    );

    assign display_out = (data_sel == 3'b000) ? PCOut :
                        (data_sel == 3'b001) ? instruction :
                        (data_sel == 3'b010) ? data :
                        (data_sel == 3'b011) ? readData1 :
                        (data_sel == 3'b100) ? readData2 :
                        (data_sel == 3'b101) ? ALUOut :
                        32'b0;
                        
    // Instantiate the instruction display module
    SevenSegment display (
        .clk(clk),                  // Main clock for fast refresh on display
        .instruction(display_out),  // Instruction fetched from instruction fetch
        .lower_bytes(lower_bytes),
        .seg(seg),
        .an(an)
    );

endmodule