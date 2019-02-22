module tbALU_6_bit
(
);
  reg [5:0]a;
  reg [5:0]b;
  reg [3:0] ALUOp;
  reg CarryIn;
  wire CarryOut;
  wire [5:0]Result;
  topALU_6_bit alu6
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
      a = 6'b000101;
      b = 6'b000010;
      ALUOp = 4'h6;
      CarryIn = 1;
      #300 ALUOp = 4'h2;
      CarryIn = 0;
      #300 ALUOp = 4'h1;
    end
endmodule