module tbIDG
(
);
  reg [31:0]inst;
  wire [63:0]imm_data;
   
  IDG idg
  (
    .instruction(inst),
    .imm_data(imm_data)
  );
  
  initial
  begin
    inst = {24'h0ACADE, 8'b10011111};
  #300 inst = {24'hDEAFAF, 8'b10111111};
  #300 inst = {24'hFADEAF, 8'b11111111};
  end
endmodule