module SevenSegment(
    input clk,
    input [31:0] instruction,
    input lower_bytes,
    output reg [6:0] seg,      // Seven segment display segments (a to g)
    output reg [3:0] an        // Seven segment display anodes
);

    reg [15:0] display_value;   // Value to be displayed (4 hex digits)
    reg [3:0] digit;            // Current hex digit to display
    reg [1:0] digit_select;     // Digit selector
    reg [19:0] clk_div;         // Clock divider register

    // Clock divider logic to slow down the 100 MHz clock
    always @(posedge clk) begin
        clk_div <= clk_div + 1;
    end

    // Select upper or lower 4 bytes based on the control signal
    always @(*) begin
        if (lower_bytes)
            display_value = instruction[15:0];    // Lower 4 bytes
        else
            display_value = instruction[31:16];   // Upper 4 bytes
    end

    // 7-segment decoder for hexadecimal values (0-F)
    always @(*) begin
        case (digit)
            4'b0000: seg = 7'b0000001; // "0"     
            4'b0001: seg = 7'b1001111; // "1" 
            4'b0010: seg = 7'b0010010; // "2" 
            4'b0011: seg = 7'b0000110; // "3" 
            4'b0100: seg = 7'b1001100; // "4" 
            4'b0101: seg = 7'b0100100; // "5" 
            4'b0110: seg = 7'b0100000; // "6" 
            4'b0111: seg = 7'b0001111; // "7" 
            4'b1000: seg = 7'b0000000; // "8"     
            4'b1001: seg = 7'b0000100; // "9"
            4'b1010: seg = 7'b0000010; // "A"
            4'b1011: seg = 7'b1100000; // "B"
            4'b1100: seg = 7'b1110010; // "C"
            4'b1101: seg = 7'b1000010; // "D"
            4'b1110: seg = 7'b0110000; // "E"
            4'b1111: seg = 7'b0111000; // "F"
            default: seg = 7'b0000001; // "0"
        endcase
    end

    // Display multiplexer for the four hex digits
    always @(*) begin
        case (digit_select)
            2'b00: begin
                digit = display_value[3:0];
                an = 4'b1110;
            end
            2'b01: begin
                digit = display_value[7:4];
                an = 4'b1101;
            end
            2'b10: begin
                digit = display_value[11:8];
                an = 4'b1011;
            end
            2'b11: begin
                digit = display_value[15:12];
                an = 4'b0111;
            end
            default: begin
                digit = 4'hF;  // Display blank
                an = 4'b1111;
            end
        endcase
    end

    // Update digit selection using a faster clock signal
    always @(posedge clk_div[14]) begin  // Faster refresh rate for flicker-free display
        digit_select <= digit_select + 1;
    end

endmodule