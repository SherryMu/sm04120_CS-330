module EX_MEM
(
  input [1:0]wb_in,
  input [2:0]m_in,
  input [63:0]adder_out_in,
  input [63:0]alu_result_in,
  input [63:0]mux_in,
  input [4:0]rd_in,
  input clk,
  input Zero,
  input reset,
  output reg [1:0]wb_out,
  output reg [2:0]m_out,
  output reg [63:0]adder_out_out,
  output reg [63:0]alu_result_out,
  output reg [63:0]mux_out,
  output reg [4:0] rd_out,
  output reg Zero_out
);

always @(posedge clk, posedge reset)
begin
  if (reset)
    begin
      wb_out = 0;
      m_out = 0;
      adder_out_out = 0;
      alu_result_out = 0;
      mux_out = 0;
      rd_out = 0;
      Zero_out = 0;
    end
  else
    begin
      wb_out = wb_in;
      m_out = m_in;
      adder_out_out = adder_out_in;
      alu_result_out = alu_result_in;
      mux_out = mux_in;
      rd_out = rd_in;
      Zero_out = Zero;
    end
end
endmodule