module Master(
    input clock,
    input [2:0] switch,
    input enable,
    input lower_enable,
    output [6:0] seg,
    output [3:0] an
    );

    wire [31:0] ins;
    
    topmodule tp(
    .clk(clock),
    .switch(switch),
    .ena(enable),
    .data_out(ins)
    );
    
    instruction_display is(
    .clk(clock),
    .instruction(ins),
    .lower_bytes(lower_enable),
    .seg(seg),
    .an(an)
    );
    
endmodule
