module tbALU_Control
(
);
reg [1:0] ALUOp;
reg [3:0] Funct;
wire [3:0] Operation;

ALU_Control ac
(
  .ALUOp(ALUOp),
  .Funct(Funct),
  .Operation(Operation)
);

initial
begin
  ALUOp = 00;
  Funct = 0000;
  #10 Funct = 4'b1000;
  #10 ALUOp = 4'b01;
  #10 Funct = 4'b0000;
  #10 ALUOp = 4'b10;
  #10 Funct = 4'b1000;
  #10 Funct = 4'b0111;
  #10 Funct = 4'b0110;
end
endmodule