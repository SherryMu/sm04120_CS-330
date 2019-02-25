module ALU_64_bit
(
	input [63:0]a, [62:0]b,
	input [3:0]ALUOp,
	output reg [63:0]Result,
	output reg Zero
	
);
	wire mux1out;
  	assign mux1out = ALUOp[3]?~a:a;
  	wire mux2out;
  	assign mux2out = ALUOp[2]?~b:b;
	always @(*)
		begin
			case({ALUOp[1:0]})
				2'b00 : Result <= mux1out & mux2out;
				2'b01 : Result <= mux2out | mux2out;
				default Result <= mux1out + mux2out;		
			endcase
		Zero = ~Result?1:0;
		end

endmodule