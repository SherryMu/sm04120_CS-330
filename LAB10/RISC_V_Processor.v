module RISC_V_Processor
(
  input wire clk, reset
);

  wire Branch;
  wire MemRead;
  wire MemtoReg;
  wire [1:0] ALUOp;
  wire MemWrite;
  wire ALUSrc;
  wire RegWrite;

  wire [63:0] out1;
  wire [63:0] PC_Out;
  wire [31:0] Instruction;
  wire [63:0] out2;
  wire [63:0] out3;
  //assign out3 = 0;
  wire [63:0] imm_data;
  
  wire [63:0] Result;
  wire Zero;
  
  wire [63:0] WriteData;
  Adder add1
  (
    .a(PC_Out),
    .b(64'd4),
    .out(out1)
  );
  Adder add2
  (
    .a(PC_Out),
    .b({imm_data*2}),
    .out(out2)
  );
  Mux mux1
  (
    .a(out1),
    .b(out2),
    .sel(Branch & Zero),
    .data(out3)
  );
  Program_Counter pc
  (
    .clk(clk),
    .reset(reset),
    .PC_In(out3),
    .PC_Out(PC_Out)
  );
  Instruction_Memory im
  (
    .Inst_Address(PC_Out),
    .Instruction(Instruction)
  );
  wire [6:0] opcode;
  wire [4:0] rd;
  wire [2:0] funct3;
  wire [4:0] rs1;
  wire [4:0] rs2;
  wire [6:0] funct7;
  instructionParser ip
  (
    .instruction(Instruction),
    .opcode(opcode),
    .rd(rd),
    .funct3(funct3),
    .rs1(rs1),
    .rs2(rs2),
    .funct7(funct7)
  );
  
  
  Control_Unit cu
  (
    .Opcode(opcode),
    .Branch(Branch),
    .MemRead(MemRead),
    .MemtoReg(MemtoReg),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite),
    .ALUOp(ALUOp)
  );
  
  IDG idg
  (
    .instruction(Instruction),
    .imm_data(imm_data)
  );
  wire [63:0] ReadData1;
  wire [63:0] ReadData2;
  registerFile rf
  (
    .WriteData(WriteData),
    .RS1(rs1),
    .RS2(rs2),
    .RD(rd),
    .ReadData1(ReadData1),
    .ReadData2(ReadData2),
    .clk(clk),
    .reset(reset),
    .RegWrite(RegWrite)
  );
  wire [63:0] b;
  Mux mux2
  (
    .a(ReadData2),
    .b(imm_data),
    .sel(ALUSrc),
    .data(b)
  );
  wire [3:0] Operation;
  ALU_Control ac
  (
    .ALUOp(ALUOp),
    .Funct({Instruction[30],Instruction[14:12]}),
    .Operation(Operation)
  );
  
  ALU_64_bit alu
  (
    .a(ReadData1),
    .b(b),
    .ALUOp(Operation),
    .Result(Result),
    .Zero(Zero)
  );
  wire [63:0] Read_Data;
  Data_Memory dm
  (
    .Mem_Addr(Result),
    .Write_Data(ReadData2),
    .clk(clk),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .Read_Data(Read_Data)
  );
  
  Mux mux3
  (
    .b(Read_Data),
    .a(Result),
    .sel(MemtoReg),
    .data(WriteData)
  );
endmodule