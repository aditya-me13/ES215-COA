// mux to select between instruction/data using signal IorD
// mux to select input for regAddress3 using signal RegDst
// mux to select between ALUOut and data using signal MemToReg
// mux to select between PCOut and A using ALUSrcA
// mux to select second operand for ALU using ALUSrcB
// mux to select value for next PC (input of PCRegister module) using signal PCSrc

module TopModule(
    input slow_clk,      // Input clock (fast)
    input reset,     // Reset signal for the Program Counter
    output reg [31:0] v_PCOut,
    output reg [31:0] v_instr,
    output reg [31:0] v_data,
    output reg [31:0] v_A,
    output reg [31:0] v_B,
    output reg [31:0] v_ALUOut
);    
    // Control Signals
    wire PCEn;
    wire PCWrite;
    wire Branch;
    wire PCSrc;
    wire ALUSrcA;
    wire RegWrite;
    wire MemtoReg;
    wire RegDst;
    wire IRWrite;
    wire MemWrite;
    wire IorD;
    wire [2:0] ALUControl;
    wire [1:0] ALUSrcB;
    
    // Data Wires
    wire [31:0] PCIn;
    wire [31:0] PCOut;
    wire [31:0] Adr;
    wire [31:0] instruction; 
    wire [31:0] instr;
    wire [31:0] data;
    wire [4:0] regAddress3;
    wire [31:0] writeData;
    wire [31:0] readData1;
    wire [31:0] readData2;
    wire [31:0] signImm;
    wire [31:0] A;
    wire [31:0] B;
    wire [31:0] SrcA;
    wire [31:0] shiftedImm;
    wire [31:0] SrcB;
    
    
    // ALU Output
    wire [31:0] ALUResult;
    wire [31:0] ALUOut;
    wire Zero;

    

    PCRegister pcregister(
        .clk(slow_clk),
        .reset(reset),
        .PCEn(PCEn),
        .PCIn(PCIn),
        .PCOut(PCOut)
    );

    assign Adr = IorD ? ALUOut : PCOut;
        
    InstructionDataMemory instrDM (
        .clk(slow_clk),
        .address(Adr[9:0]),
        .writeData(writeData),
        .MemWrite(MemWrite),
        .instruction(instruction)
    );
    
    InstructionRegister IR(
        .clk(slow_clk),
        .IRWrite(IRWrite),
        .instruction(instruction),
        .instr(instr)
    );

    DataRegister DR(
        .clk(slow_clk),
        .instruction(instruction),
        .data(data)
    );

    ControlUnit controlunit(
        .clk(slow_clk),
        .reset(reset),
        .opcode(instr[31:26]),
        .funct(instr[5:0]),
        .IorD(IorD),
        .ALUSrcA(ALUSrcA),
        .ALUSrcB(ALUSrcB),
        .ALUControl(ALUControl),
        .PCSrc(PCSrc),
        .IRWrite(IRWrite),
        .PCWrite(PCWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .RegDst(RegDst),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .Branch(Branch)
    );

    assign regAddress3 = RegDst ? instr[15:11] : instr[20:16];
    assign writeData = MemtoReg ? data : ALUOut;

    RegisterFile registerfile(
        .clk(slow_clk),
        .regAddress1(instr[25:21]),
        .regAddress2(instr[20:16]),
        .regAddress3(regAddress3),
        .writeData(writeData),
        .regWrite(RegWrite),
        .readData1(readData1),
        .readData2(readData2)
    );

    SignExtend signextend(
        .instr(instr[15:0]),
        .signImm(signImm)
    );

    RegisterA registera(
        .clk(slow_clk),
        .readData1(readData1),
        .A(A)
    );

    RegisterB registerb(
        .clk(slow_clk),
        .readData2(readData2),
        .B(B)
    );

    assign SrcA = ALUSrcA ? A : PCOut;

    ShiftLeft shiftleft(
        .in(signImm),
        .out(shiftedImm)
    );

    assign SrcB = (ALUSrcB == 2'b00) ? B : 
                (ALUSrcB == 2'b01) ? 4 :
                (ALUSrcB == 2'b10) ? signImm :
                shiftedImm;   

    ALU alu(
        .operand1(SrcA),
        .operand2(SrcB),
        .ALUControl(ALUControl),
        .ALUResult(ALUResult),
        .Zero(Zero)
    );

    ALURegister aluregister(
        .clk(slow_clk),
        .ALUResult(ALUResult),
        .ALUOut(ALUOut)
    );

    assign PCIn = PCSrc ? ALUOut : ALUResult;
    assign PCEn = (Zero & Branch) | PCWrite;
        
    always @(*) begin
        v_PCOut = PCOut;
        v_instr = instr;
        v_data = data;
        v_A = A;
        v_B = B;
        v_ALUOut = ALUOut;
    end  
    
endmodule