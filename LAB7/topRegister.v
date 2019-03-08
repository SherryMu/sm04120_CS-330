module topRegister
(
  input [31:0]instruction,
  output wire [63:0]ReadData1, ReadData2
);
  wire [6:0] opcode;
  wire [4:0] rd;
  wire [2:0] funct3;
  wire [4:0] rs1;
  wire [4:0] rs2;
  wire [6:0] funct7;
  instructionParser insp
  (
  .instruction(instruction),
  .opcode(opcode),
  .rd(rd),
  .funct3(funct3),
  .rs1(rs1),
  .rs2(rs2),
  .funct7(funct7)
  );
  
  registerFile re
  (
    .RS1(rs1),
    .RS2(rs2),
    .RD(rd),
    .reset(1'b0),
    .WriteData(64'b0),
    .RegWrite(1'b0),
    .clk(1'b0),
    .ReadData1(ReadData1),
    .ReadData2(ReadData2)
  );
endmodule