module Master (
    input clk,
    input pause,
    input reset,
    input lower_bytes,
    input [2:0] data_sel,
    output reg [6:0] seg,
    output reg [3:0] an
);

    // values to be fetched for the instruction display
    reg [31:0] PCOut;
    reg [31:0] instruction;
    reg [31:0] data;
    reg [31:0] readData1;
    reg [31:0] readData2;
    reg [31:0] ALUOut;

    // Final output to the display on seven segment
    reg [31:0] display_out;

    // values for clock divider and control
    reg slow_clk;
    reg [26:0] clk_divider;  // For 2-second delay, assuming 100MHz clock

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
    
    // Combinational logic for display output selection
    always @(*) begin
        case(data_sel)
            3'b000: display_out = PCOut;
            3'b001: display_out = instruction;
            3'b010: display_out = data;
            3'b011: display_out = readData1;
            3'b100: display_out = readData2;
            3'b101: display_out = ALUOut;
            default: display_out = 32'b0;
        endcase
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

    // Instantiate the instruction display module
    SevenSegment display (
        .clk(clk),                  // Main clock for fast refresh on display
        .instruction(display_out),  // Instruction fetched from instruction fetch
        .lower_bytes(lower_bytes),
        .seg(seg),
        .an(an)
    );

endmodule