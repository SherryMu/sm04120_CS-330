module tbALU_1_bit
(
);
  reg a;
  reg b;
  reg [3:0] ALUOp;
  reg CarryIn;
  wire CarryOut;
  wire Result;
  
  ALU_1_bit alu1
  (
    .a(a),
    .b(b),
    .ALUOp(ALUOp),
    .CarryIn(CarryIn),
    .CarryOut(CarryOut),
    .Result(Result)
  );
  initial
    begin
      a = 1;
      b = 1;
      ALUOp = 4'h0;
      CarryIn = 1;
      #300 a = 0;
      ALUOp = 4'h6;
      #300 ALUOp = 4'h2;
      CarryIn = 0;
      
    end
endmodule