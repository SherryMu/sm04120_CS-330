module tbRegister
(
);
  reg [63:0]WriteData;
  reg [4:0]RS1,RS2,RD;
  reg clk, reset, RegWrite;
  wire [63:0] ReadData1, ReadData2;
  
  registerFile re
  (
    .WriteData(WriteData),
    .RS1(RS1),
    .RS2(RS2),
    .RD(RD),
    .clk(clk),
    .reset(reset),
    .RegWrite(RegWrite),
    .ReadData1(ReadData1),
    .ReadData2(ReadData2)
  );
  
  initial
    begin
      clk = 1'b0;
      reset = 1'b0;
      RS1 = 5'b00011;
      RS2 = 5'b00010;
      RD = 5'b00011;
      WriteData = 64'h0000000000000004;
      RegWrite = 1'b0;
      #10 clk = ~clk;
      RegWrite = ~RegWrite;
      WriteData = ~WriteData;
      RS1 = RD;
      #10 reset = ~reset;
      RegWrite=~RegWrite;
      clk = ~clk;
      #10 reset = ~reset;
      RegWrite=~RegWrite;
      clk = ~clk;
      RD = 0;
      RS1=RD;
      
    end 
endmodule