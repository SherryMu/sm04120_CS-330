module top_control
(
  input [6:0]Opcode,
  output wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite,
  output wire [1:0] ALUOp,
  input [3:0] Funct,
  output wire [3:0] Operation
);

Control_Unit cu
(
  .Opcode(Opcode),
  .Branch(Branch),
  .MemRead(MemRead),
  .MemtoReg(MemtoReg),
  .MemWrite(MemWrite),
  .ALUSrc(ALUSrc),
  .RegWrite(RegWrite),
  .ALUOp(ALUOp)
);

ALU_Control ac
(
  .ALUOp(ALUOp),
  .Funct(Funct),
  .Operation(Operation)
);
endmodule
