bind simpleadder adder_assertions adder_assertions_inst(
	.clk(dif.sig_clock),
	.rst(dif.sig_rst),
	.out(dif.sig_out),
        .operation(dif.operation)	
	);
	
