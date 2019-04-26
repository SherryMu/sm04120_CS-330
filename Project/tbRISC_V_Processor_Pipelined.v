module tbRISC_V_Processor_Pipelined
(
);

reg clk;
reg reset;

RISC_V_Processor_Pipelined r5pp
(
  .clk(clk),
  .reset(reset)
);


initial
begin
  clk = 1'b0;
  reset = 1'b1;
  #1 reset = 1'b0;
end

always
begin
  
  #20 clk = ~clk;
end


endmodule
