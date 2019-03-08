module tbtopRegister
(
);
  reg [31:0]instruction;
  wire [63:0] ReadData1;
  wire [63:0] ReadData2;
  
  topRegister treg
  (
  .instruction(instruction),
  .ReadData1(ReadData1),
  .ReadData2(ReadData2)
  );
  
  
  initial
    begin
      instruction = 32'b1111111_00010_00011_111_00011_1111111;
      #100 instruction = 32'b1111111_11111_00000_111_00011_1111111;
    end
endmodule