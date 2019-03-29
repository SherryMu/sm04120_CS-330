module registerFile
(
  input [63:0]WriteData,
  input [4:0]RS1, [4:0]RS2, [4:0]RD,
  input RegWrite, clk, reset,
  output wire [63:0] ReadData1, ReadData2
);
  reg [63:0]Regs[31:0];
  integer index;
  initial
     begin
      for(index = 0; index < 32; index  = index+1)
       begin
        Regs[index] = {index};
       end
   end
  
    always @ (posedge clk)
      begin
        if (RegWrite == 1 & RD!=0)
          Regs[RD] = {WriteData};
      end
      
      
        
    assign ReadData1 = reset?0:Regs[RS1];
    assign ReadData2 = reset?0:Regs[RS2];
    
    
endmodule


















/*
initial
    begin
      regs[0] = {$random, $random};
      regs[1] = {$random, $random};
      regs[2] = {$random, $random};
      regs[3] = {$random, $random};
      regs[4] = {$random, $random};
      regs[5] = {$random, $random};
      regs[6] = {$random, $random};
      regs[7] = {$random, $random};
      regs[8] = {$random, $random};
      regs[9] = {$random, $random};
      regs[10] = {$random, $random};
      regs[11] = {$random, $random};
      regs[12] = {$random, $random};
      regs[13] = {$random, $random};
      regs[14] = {$random, $random};
      regs[15] = {$random, $random};
      regs[16] = {$random, $random};
      regs[17] = {$random, $random};
      regs[18] = {$random, $random};
      regs[19] = {$random, $random};
      regs[20] = {$random, $random};
      regs[21] = {$random, $random};
      regs[22] = {$random, $random};
      regs[23] = {$random, $random};
      regs[24] = {$random, $random};
      regs[25] = {$random, $random};
      regs[26] = {$random, $random};
      regs[27] = {$random, $random};
      regs[28] = {$random, $random};
      regs[29] = {$random, $random};
      regs[30] = {$random, $random};
      regs[31] = {$random, $random};
    end*/