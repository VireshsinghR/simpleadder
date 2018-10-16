`include "simpleadder_if.sv"
//`include "testbench.sv"
`timescale 1ns/10ps  
module simpleadder (simpleadder_if dif);
 //import uvm_pkg::*;
  always @(posedge dif.sig_clock or dif.sig_rst == 1'b0) begin	// active low rst
	if (dif.sig_rst==1'b0) 
		begin
		dif.sig_out <= #1 0;
	//	dif.sig_out <=  0;
        	dif.sig_en_o <= #1 0;
		end
	else begin
      		if (dif.sig_en_i==1 )
			case(dif.operation)
				00: begin
				       	dif.sig_out <= #1 (dif.sig_ina + dif.sig_inb);
					dif.sig_en_o <= #1 1;
				    end
				01:begin
				       	dif.sig_out <= #1 (dif.sig_ina - dif.sig_inb);
					dif.sig_en_o <= #1 1;
				   end
			endcase
	   
	    				// clear 1 cycle after computing result
		else
				dif.sig_en_o <= #1 0;
      	    end
	   // dif.sig_en_o <= #1 0;
  end
endmodule
