module tbALU_64_bit
(
);
	reg [63:0]a;
	reg [63:0]b;
	reg [3:0]ALUOp;
	wire [63:0]Result;
	wire Zero;
	ALU_64_bit alu64
	(
	.a(a),
	.b(b),
	.ALUOp(ALUOp),
	.Result(Result),
	.Zero(Zero)
	);
	initial
	begin
	a = 64'h000000000000000F;
	b = 64'h000000000000000F;
	ALUOp = 4'h6;
	end
endmodule