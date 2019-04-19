module EX_MEM
(
  input [1:0]wb_in,
  input [2:0]m_in,
  input [63:0]adder_out_in,
  input [63:0]alu_result_in,
  input mux_in,
  input [4:0] rd_in,
  input clk,
  
  output reg [1:0]wb_out,
  output reg [2:0]m_out,
  output reg [63:0]adder_out_out,
  output reg [63:0] alu_result_out,
  output reg mux_out,
  output reg [4:0] rd_out
);

always @(posedge clk)
begin
  wb_out = wb_in;
  m_out = m_in;
  adder_out_out = adder_out_in;
  alu_result_out = alu_result_in;
  mux_out = mux_in;
  rd_out = rd_in;
end
endmodule