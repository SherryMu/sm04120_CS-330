module tbData_Memory
(
);
  reg [63:0] Mem_Addr;
  reg [63:0] Write_Data;
  reg clk;
  reg MemWrite;
  reg MemRead;
  wire [63:0] Read_Data;
  Data_Memory dm
  (
    .Mem_Addr(Mem_Addr),
    .Write_Data(Write_Data),
    .clk(clk),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .Read_Data(Read_Data)
  );
  
  initial
    begin
      Mem_Addr = 64'b0;
      MemRead = 1;
      MemWrite = 0;
      clk = 0;
      Write_Data = 64'h0123456789ABCDEF;
      #100 MemWrite = 1;
      Mem_Addr = 64'b1000;
      clk=~clk;
      
    end
endmodule