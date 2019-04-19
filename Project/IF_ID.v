module IF_ID
(
  input [63:0]pc_in,
  input [31:0]im_in,
  input clk,
  
  output reg [63:0] pc_out,
  output reg [31:0] im_out
);

always @(posedge clk)
begin
  pc_out = pc_in;
  im_out = im_in;
end
endmodule