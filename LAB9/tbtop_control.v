module tbtop_control
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
reg [3:0] Funct;
wire [3:0] Operation;
top_control tc
(
  .Opcode(Opcode),
  .Branch(Branch),
  .MemRead(MemRead),
  .MemtoReg(MemtoReg),
  .MemWrite(MemWrite),
  .ALUSrc(ALUSrc),
  .RegWrite(RegWrite),
  .ALUOp(ALUOp),
  .Funct(Funct),
  .Operation(Operation)
);
initial
begin
  Opcode = 7'b0110011;
  Funct = 4'b0000;
  #10 Funct = 4'b1000;
  #10 Funct = 4'b0111;
  #10 Funct = 4'b0110;
  #10 Opcode = 7'b0000011;
  #10 Opcode = 7'b1100011;
end
endmodule