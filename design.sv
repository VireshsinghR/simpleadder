`include "simpleadder_if.sv"
`include "subtractor.sv"
//`include "testbench.sv"
//`timescale 1ns/10ps  
module simpleadder (simpleadder_if dif);
 //import uvm_pkg::*;


wire wire_oper_sel_sub;
wire wire_oper_sel_add;

reg [`LENGTH:0] reg_sub_out;
reg [`LENGTH:0] reg_add_out;

reg [`LENGTH-1:0] wire_ina;
reg [`LENGTH-1:0] wire_inb;

assign wire_oper_sel_sub = dif.operation[0];
assign wire_oper_sel_add = dif.operation[1];

assign wire_ina = dif.sig_ina;
assign wire_inb = dif.sig_inb;

subtractor subt (	.sig_sub_rst(dif.sig_rst),
                 	.sig_sub_clock(dif.sig_clock),
			.en_sub(wire_oper_sel_sub),
			//.sig_sub_ina(dif.sig_ina),
			.sig_sub_ina(wire_ina),
			//.sig_sub_inb(dif.sig_inb),
			.sig_sub_inb(wire_inb),
			.sig_sub_out(reg_sub_out)
                  );

adder addr (		.sig_addr_rst(dif.sig_rst),
                 	.sig_addr_clock(dif.sig_clock),
			.en_addr(wire_oper_sel_add),
			.sig_addr_ina(dif.sig_ina),
			.sig_addr_inb(dif.sig_inb),
			.sig_addr_out(reg_add_out)
                  );


  always @(posedge dif.sig_clock)
begin

	  case (dif.operation)
		  2'b01: 	begin	dif.sig_out = reg_sub_out; $display("in 01"); end
		  2'b10:	begin	dif.sig_out = reg_add_out; $display("in 10"); end
		  default: begin	dif.sig_out = 17'bx; $display("in default"); end
	 endcase

  end

endmodule
