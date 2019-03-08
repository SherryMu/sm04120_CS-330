module tbInstruction_Memory
(
);
  reg [63:0]Inst_Address;
  wire [31:0]Instruction;
  
  Instruction_Memory im
  (
    .Inst_Address(Inst_Address),
    .Instruction(Instruction)
  );
  
  initial
    begin
      Inst_Address = 64'b0;
      #50 Inst_Address = 64'b100;
    end
endmodule