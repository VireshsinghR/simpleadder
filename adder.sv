module adder (	   input sig_addr_clock, sig_addr_rst,
                   input [`LENGTH-1:0]sig_addr_ina, sig_addr_inb, 
                   input en_addr,
                   output logic [`LENGTH:0] sig_addr_out);

  always @(posedge sig_addr_clock , negedge sig_addr_rst)
    begin
	    if (sig_addr_rst==0)
		    sig_addr_out<= 0;
      else if(en_addr)
        begin
          sig_addr_out<=  (sig_addr_ina + sig_addr_inb);
          $display("addition res of %0d - %0d= %0d", sig_addr_ina, sig_addr_inb, sig_addr_out);
        end
      //else
      //  sig_addr_out <=  0;
    end
  
endmodule

