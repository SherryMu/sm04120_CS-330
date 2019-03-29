module Mux
(
	input [63:0] a,
	input [63:0] b,
	input sel,
	output reg [63:0] data
);
	always @ (sel or a or b)
		begin
			case({sel})
				1'b0: data <= a;
				1'b1: data <= b;
			endcase
		end

endmodule