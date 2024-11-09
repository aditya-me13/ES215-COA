module PCRegister(
    input clk,
    input reset,
    input PCEn,
    input [31:0] PCIn,
    output reg [31:0] PCOut
    );
    
    always @(posedge clk) begin
    if (PCEn)
        PCOut <= PCIn;
    end
    
    always @(posedge clk) begin
        if(reset) begin
            PCOut <= 0;
        end
    end
    
endmodule