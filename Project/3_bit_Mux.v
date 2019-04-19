module three_bit_Mux
(
  input [1:0]sel,
  input [63:0]a,
  input [63:0]b,
  input [63:0]c,
  output reg [63:0]data
);

always @(*)
begin
			case({sel})
				2'b00: data <= a;
				2'b01: data <= b;
				2'b10: data <= c;
			endcase
		end
endmodule