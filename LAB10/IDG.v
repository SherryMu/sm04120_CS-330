module IDG
(
  input [31:0] instruction,
  output reg [63:0] imm_data
);
always @ (instruction)
begin
  if (instruction[6:5] == 2'b00)
    begin
      imm_data = {{52{instruction[31]}},instruction[31:20]};
    end
  else if (instruction[6:5] == 2'b01)
    begin
      imm_data = {{52{instruction[31]}},instruction[31:25],instruction[11:7]};
    end
  else if (instruction[6] == 1'b1)
    begin
      imm_data = {{52{instruction[31]}},instruction[7],instruction[30:25],instruction[11:8],1'b0};
    end 
end  
endmodule