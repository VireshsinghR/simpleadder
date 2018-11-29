
import uvm_pkg::*;
`include "uvm_macros.svh"
class simpleadder_sequence extends uvm_sequence #(simpleadder_transaction);
   `uvm_object_utils(simpleadder_sequence)
 simpleadder_transaction sa_tx;

  constraint operation_c {
	//sa_tx.operation_sel inside {2'b01, 2'b10};
	sa_tx.operation_sel== 2'b10;
}

  function new (string name="");
        super.new(name);
  endfunction
 
  task body;

    repeat(15)
      begin
      
        sa_tx= simpleadder_transaction::type_id::create("sa_tx");
        start_item(sa_tx);
        assert(sa_tx.randomize);
        finish_item(sa_tx);	
      end 
  endtask
endclass
//typedef uvm_sequencer#(simpleadder_transaction) simpleadder_sequencer;
