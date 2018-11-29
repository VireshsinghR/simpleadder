//class small_seq extends simpleadder_sequence#(simpleadder_transaction);

class subtractor_seq extends simpleadder_sequence;
  `uvm_object_utils(subtractor_seq)
  
  simpleadder_transaction sa_subt_tx;

 constraint operation_c {
	sa_subt_tx.operation_sel == 2'b01 ;
} 
  
  function new (string name="");
        super.new(name);
    //`uvm_info("SMALL SEQ", "new called", UVM_MEDIUM)
  endfunction
 
  task body;
	   sa_subt_tx= simpleadder_transaction::type_id::create("sa_subt_tx");
     
    `uvm_info("SUBTRACTOR SEQ", "body called", UVM_MEDIUM)
    
    repeat(5)
      begin
       
        start_item(sa_subt_tx);
        assert(sa_subt_tx.randomize with {ina <20; inb < 10; });
       // assert(sa_subt_tx.randomize);	
        finish_item(sa_subt_tx);	
      end
  endtask
endclass

