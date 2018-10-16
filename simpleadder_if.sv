interface simpleadder_if; 
	`include "simpleadder_defines.sv"
  logic sig_rst;
  logic sig_clock;
  logic [`LENGTH-1:0] sig_ina;
  logic [`LENGTH-1:0] sig_inb;
  logic sig_en_i;
  logic [`LENGTH:0] sig_out;
  logic sig_en_o;

  logic [1:0]operation;
endinterface
