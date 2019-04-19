module Forwarding_Unit
(
  input [4:0]rd_from_mem,
  input [4:0]rd_from_wb,
  input Regwrite_from_mem,
  input Regwrite_from_wb,
  input [4:0]rs1_from_ex,
  input [4:0]rs2_from_ex,
  
  output reg [1:0]mux_to_rs1,
  output reg [1:0]mux_to_rs2
);

always @ ( rd_from_mem, rd_from_wb, Regwrite_from_mem, Regwrite_from_wb, rs1_from_ex, rs2_from_ex )
begin
  if ((Regwrite_from_mem == 1'b1) && (rd_from_mem != 5'b0) && (rd_from_mem == rs1_from_ex))
    begin
      mux_to_rs1 = 2'b10;
    end
  else if ((Regwrite_from_wb == 1'b1) && (rd_from_mem != 5'b0) && (rd_from_mem == rs1_from_ex))
    begin
      mux_to_rs1 = 2'b01;
    end
  else
    begin
      mux_to_rs1 = 2'b0;
    end
      
  if ((Regwrite_from_mem == 1'b1) && (rd_from_mem != 5'b0) && (rd_from_mem == rs2_from_ex))
    begin
      mux_to_rs2 = 2'b10;
    end
  else if ((Regwrite_from_wb == 1'b1) && (rd_from_mem != 5'b0) && (rd_from_mem == rs2_from_ex))
    begin
      mux_to_rs2 = 2'b01;
    end
  else
    begin
      mux_to_rs2 = 2'b0;
    end
          
end

endmodule