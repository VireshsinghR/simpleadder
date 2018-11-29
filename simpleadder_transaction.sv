
import uvm_pkg::*;
`include "uvm_macros.svh"
class simpleadder_transaction extends uvm_sequence_item;
  `uvm_object_utils(simpleadder_transaction)
  
  rand bit [15:0]ina;
  rand bit [15:0]inb;
  rand bit [1:0]operation_sel;
  bit  [16:0]out;
  bit rst;


  constraint operation_c {
	//operation_sel inside {2'b01, 2'b10};
	operation_sel== 2'b10;
}

/*  constraint inputs {
	ina <=25;
	inb <=25;
  } */

  bit sig_en_i;
  bit sig_en_o;
  
  function new (string name="");
        super.new(name);
  endfunction
  
endclass
typedef uvm_sequencer#(simpleadder_transaction) simpleadder_sequencer;
