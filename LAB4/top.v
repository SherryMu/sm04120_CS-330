module top
(
	input clk, reset, rx,
	output tx, [3:0]q
);
	wire [7:0] w;
	assign w = {4'b0000, q};

	ripple_carry_counter r
	(
		.clk(clk),
		.reset(reset),
		.q(q)
	);
	
	uart_top ut0
	(
	   .clk(clk),
	   .reset(reset),
	   .data_to_tx(w),
	   .rx(rx),
	   .tx(tx)
	);
endmodule