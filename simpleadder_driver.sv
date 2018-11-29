import uvm_pkg::*;
`include "uvm_macros.svh"
class simpleadder_driver extends uvm_driver #(simpleadder_transaction);
  `uvm_component_utils(simpleadder_driver)
  virtual simpleadder_if vif;
  
  function new (string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    //void'(uvm_resource_db#(virtual simpleadder_if)::read_by_name(.scope("ifs"), .name("simpleadder_if"), .val(vif)));
	if (!uvm_config_db #(virtual simpleadder_if)::get(null, "uvm_test_top", "simpleadder_if", vif))
		`uvm_error("Driver","Interface not found")
  endfunction
  
  task run_phase(uvm_phase phase);
   begin
    simpleadder_transaction sa_tx;
    
    vif.sig_ina = 16'b0;
    vif.sig_inb = 16'b0;
    //vif.sig_en_i = 1'b0;
   // vif.operation = 2'bxx; 
   // vif.operation = 2'b00; 
    forever 
      begin
		
		seq_item_port.get_next_item(sa_tx);
		@(negedge vif.sig_clock);
		vif.sig_ina = #0 sa_tx.ina;
		vif.sig_inb = #0 sa_tx.inb;
		vif.sig_en_i = #0 1'b1;
		vif.operation = #0 sa_tx.operation_sel; 
		
		@(negedge vif.sig_clock);
		vif.sig_ina = #0 0;
		vif.sig_inb = #0 0;
		vif.sig_en_i = #0 1'b0;
		//vif.operation = #0 2'bxx; 
		seq_item_port.item_done();
      end	
    end
   endtask

   task reset_phase(uvm_phase phase);
  	phase.raise_objection(this);
  vif.sig_rst = 1'b1;
  #5;
  vif.sig_rst = 1'b0;
  vif.operation = 2'bxx;
  #20 vif.sig_rst = 1'b1;
  phase.drop_objection(this);
endtask: reset_phase 

endclass : simpleadder_driver
  

