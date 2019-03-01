module topRegister
(
  input [31:0]instruction,
  output reg [63:0]ReadData1, ReadData2
);
  wire [4:0] rd, [4:0] rs1, [4:0] rs2;
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
    .reset(0),
    .WriteData(0)
  );