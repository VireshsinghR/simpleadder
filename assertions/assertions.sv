`include "bind_assertions.sv"
module adder_assertions(input logic clk,
			input logic rst,
			input logic [`LENGTH:0]out,
			input logic [1:0]operation
	       	);
	
	assert property (@(posedge clk) $fell(rst) |=> out == 17'b0) $display("running assertions");  
  else `uvm_error ("DUT ASSERTION", $sformatf("out is not 0 after RST, its value is: 0x%0x", $sampled(out)))

	assert property (@(posedge clk) $fell(rst) |=> operation == 2'bxx) $display("running operation assertion");
	else `uvm_error("TB ASSERTION", "operation not xx at Reset")

	 endmodule
