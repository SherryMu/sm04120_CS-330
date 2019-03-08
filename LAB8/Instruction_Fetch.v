module Instruction_Fetch
(
  input clk, reset,
  output wire [31:0] Instruction
);

  wire [63:0] out;
  wire [63:0] PC_Out;
  Adder adder
  (
    .a(PC_Out),
    .b(64'd4),
    .out(out)
  );
  Program_Counter pc
  (
    .clk(clk),
    .reset(reset),
    .PC_In(out),
    .PC_Out(PC_Out)
  );
  Instruction_Memory im
  (
    .Inst_Address(PC_Out),
    .Instruction(Instruction)
  );
endmodule