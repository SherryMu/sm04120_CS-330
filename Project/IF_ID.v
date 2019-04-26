module IF_ID
(
  input [63:0]pc_in,
  input [31:0]im_in,
  input clk,
  input reset,
  output reg [63:0] pc_out,
  output reg [31:0] im_out
);

always @(posedge clk, posedge reset)
begin
  if (reset)
    begin
      pc_out = 0;
      im_out = 0;
    end
  else
    begin
      pc_out = pc_in;
      im_out = im_in;
  end
end
endmodule