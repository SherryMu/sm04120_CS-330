module tbInstruction_Fetch
(
);
  reg clk;
  reg reset;
  wire [31:0] Instruction;
  Instruction_Fetch InstF
  (
    .clk(clk),
    .reset(reset),
    .Instruction(Instruction)
  );
  initial
    begin
      clk = 1;
      reset = 0;
      
    end
    
  always
      #5 clk = ~clk;
      
endmodule