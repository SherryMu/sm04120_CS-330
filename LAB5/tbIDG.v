module tbIDG
(
);
  reg inst;
  wire imm_data;
   
  IDG idg
  (
    .instruction(inst)
    .imm_data(imm_data)
  );
  
  initial
  begin
    instruction = {24'hFACADE, 8'b10011111} ;
    #300 instruction = {24'DEAFEAF}