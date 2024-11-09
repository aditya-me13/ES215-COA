// Done

module RegisterFile(
    input clk,
    input regWrite,
    input [4:0] regAddress1,
    input [4:0] regAddress2,
    input [4:0] regAddress3,
    input [31:0] writeData,
    output reg [31:0] readData1,
    output reg [31:0] readData2
);
    reg [31:0] registers [31:0];
    
    integer i;
    initial begin
        registers[0] = 0;
        for (i = 1; i < 32; i = i + 1) begin
            registers[i] = 0;
        end
    end
    
    // $0 register - always contains 0, cant be changed
    initial begin
        registers[0]=0;
    end

    always @(*) begin
        readData1 = registers[regAddress1];
        readData2 = registers[regAddress2];
    end

    always @(posedge clk) begin
        if (regWrite)
            registers[regAddress3] <= writeData;
    end
endmodule