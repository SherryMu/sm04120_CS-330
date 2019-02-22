module  topALU_6_bit
(
  input [5:0] a,
  input  [5:0] b,
  input [3:0] ALUOp,
  input CarryIn,
  output wire CarryOut,
  output wire [5:0]Result
);
  wire temp1, temp2, temp3, temp4, temp5;
  ALU_1_bit alu0
  (
    .a(a[0]),
    .b(b[0]),
    .ALUOp(ALUOp),
    .CarryIn(CarryIn),
    .CarryOut(temp1),
    .Result(Result[0])
  );
  ALU_1_bit alu1
  (
    .a(a[1]),
    .b(b[1]),
    .ALUOp(ALUOp),
    .CarryIn(temp1),
    .CarryOut(temp2),
    .Result(Result[1])
  );
  wire CarryOut2;
  ALU_1_bit alu2
  (
    .a(a[2]),
    .b(b[2]),
    .ALUOp(ALUOp),
    .CarryIn(temp2),
    .CarryOut(temp3),
    .Result(Result[2])
  );
  wire CarryOut3;
  ALU_1_bit alu3
  (
    .a(a[3]),
    .b(b[3]),
    .ALUOp(ALUOp),
    .CarryIn(temp3),
    .CarryOut(temp4),
    .Result(Result[3])
  );
  wire CarryOut4;
  ALU_1_bit alu4
  (
    .a(a[4]),
    .b(b[4]),
    .ALUOp(ALUOp),
    .CarryIn(temp4),
    .CarryOut(temp5),
    .Result(Result[4])
  );
  wire CarryOut5;
  ALU_1_bit alu5
  (
    .a(a[5]),
    .b(b[5]),
    .ALUOp(ALUOp),
    .CarryIn(temp5),
    .CarryOut(CarryOut),
    .Result(Result[5])
  );
  
endmodule