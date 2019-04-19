module Instruction_Memory
(
  input [63:0] Inst_Address,
  output reg [31:0] Instruction
);
  reg [7:0]Instruction_Memory[15:0];
  initial
    begin
        Instruction_Memory[0] = 8'b10000011;
        Instruction_Memory[1] = 8'b00110100;
        Instruction_Memory[2] = 8'b10000101;
        Instruction_Memory[3] = 8'b00000010;
        Instruction_Memory[4] = 8'b10110011;
        Instruction_Memory[5] = 8'b10000100;
        Instruction_Memory[6] = 8'b10011010;
        Instruction_Memory[7] = 8'b00000000;
        Instruction_Memory[8] = 8'b10010011;
        Instruction_Memory[9] = 8'b10000100;
        Instruction_Memory[10] = 8'b00010100;
        Instruction_Memory[11] = 8'b00000000;
        Instruction_Memory[12] = 8'b00100011;
        Instruction_Memory[13] = 8'b00110100;
        Instruction_Memory[14] = 8'b10010101;
        Instruction_Memory[15] = 8'b00000010;
    end
    
    always @(Inst_Address)
    begin
      Instruction = {Instruction_Memory[Inst_Address[3:0]+3],Instruction_Memory[Inst_Address[3:0]+2],Instruction_Memory[Inst_Address[3:0]+1],Instruction_Memory[Inst_Address[3:0]]};
    end
endmodule