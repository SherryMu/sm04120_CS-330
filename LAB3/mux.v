module mux
(
	input [63:0] a, [63:0] b,
	input sel,
	output reg [63:0] data_out 
);
	always @(posedge sel or negedge sel)
	begin
		case ({sel})
			1'b0 : data_out <= b;
			default : data_out <= a;
		endcase
	end
endmodule