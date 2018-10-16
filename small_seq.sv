//class small_seq extends simpleadder_sequence#(simpleadder_transaction);

class small_seq extends simpleadder_sequence;
  `uvm_object_utils(small_seq)
  
  simpleadder_transaction sa_small_tx;
 constraint operation_c {
	sa_small_tx.operation_sel <= 2'b00 ;
} 
  
  function new (string name="");
        super.new(name);
    //`uvm_info("SMALL SEQ", "new called", UVM_MEDIUM)
  endfunction
 
  task body;
    `uvm_info("SMALL SEQ", "body called", UVM_MEDIUM)
     sa_small_tx= simpleadder_transaction::type_id::create("sa_small_tx");
     
    repeat(5)
      begin
       
        start_item(sa_small_tx);
        assert(sa_small_tx.randomize with {ina < 10; inb < 10; operation_sel< 2'b10; });
       // assert(sa_small_tx.randomize);	
        finish_item(sa_small_tx);	
      end
  endtask
endclass

