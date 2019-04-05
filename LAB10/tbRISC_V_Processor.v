module tbRISC_V_Processor
  (
  );
  reg clk;
  reg reset;
  RISC_V_Processor rvp
  (
    .clk(clk),
    .reset(reset)
  );
  
  initial
  begin
    clk = 0;
    reset = 0;
  end
  always
  #100 clk = ~clk;
endmodule