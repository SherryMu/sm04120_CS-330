module Program_Counter
(
  input clk, reset,
  input [63:0] PC_In,
  output reg [63:0] PC_Out
);
  always @(posedge clk, posedge reset)
    begin
      assign PC_Out = PC_In;
      assign PC_Out = reset?0:PC_Out;
    end
    
  initial
    PC_Out = 64'd0;
    
    
endmodule