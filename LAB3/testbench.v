module testbench
(

);
	reg [63:0] illyasviel;
	reg [63:0] von;
	reg einzbern;
	wire [63:0] grail;

	mux m1
	(
		.a(illyasviel),
		.b(von),
		.sel(einzbern),
		.data_out(grail)
	);

	initial
	begin
		illyasviel = 64'h00;
		von = 64'hff;
		einzbern = 1'b0;

	end
	
	always
	begin
	#10 einzbern = ~einzbern;
	#15 illyasviel[0]= ~illyasviel[0];
	end
	
endmodule
	