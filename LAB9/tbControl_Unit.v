module tbControl_Unit
(
);
reg [6:0]Opcode;
wire Branch;
wire MemRead;
wire MemtoReg;
wire MemWrite;
wire ALUSrc;
wire RegWrite;
wire [1:0] ALUOp;

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

initial
begin
  Opcode = 7'b0110011;
  #10 Opcode = 7'b0000011;
  #10 Opcode = 7'b0100011;
  #10 Opcode = 7'b1100011;
end
endmodule