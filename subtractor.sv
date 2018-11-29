module subtractor (input sig_sub_clock, sig_sub_rst,
                   input [`LENGTH-1:0]sig_sub_ina, sig_sub_inb, 
                   input en_sub,
                   output logic [`LENGTH:0] sig_sub_out);

  always @(posedge sig_sub_clock , negedge sig_sub_rst)
    begin
	    if (sig_sub_rst==0)
	    begin
		    sig_sub_out<= 0;
	    end


     else if(en_sub)
        begin
          sig_sub_out<=  (sig_sub_ina - sig_sub_inb);
          $display("subtraction res of %0d - %0d= %0d", sig_sub_ina, sig_sub_inb, sig_sub_out);
        end
      //else
       // sig_sub_out <=  17'bx;
    end
  
endmodule
