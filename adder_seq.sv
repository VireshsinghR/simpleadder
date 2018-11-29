
class adder_seq extends simpleadder_sequence;
//class adder_seq extends uvm_sequence #(simpleadder_transaction);
  `uvm_object_utils(adder_seq)
  
  simpleadder_transaction sa_addr_tx;

 	constraint operation_c {
	sa_addr_tx.operation_sel == 2'b10 ;
}  
  
  function new (string name="");
        super.new(name);
  endfunction
 
  task body;
	 sa_addr_tx= simpleadder_transaction::type_id::create("sa_addr_tx");
    `uvm_info("ADDR SEQ", "body called", UVM_MEDIUM)
     
     
    repeat(5)
      begin
        start_item(sa_addr_tx);
        assert(sa_addr_tx.randomize with { /*operation_sel== 2'b11;*/ ina <100; inb < 100;  });
      // assert(sa_addr_tx.randomize);
	//$display("operation sel = %0d" , sa_addr_tx.operation_sel );
       // assert(sa_addr_tx.randomize);	
        finish_item(sa_addr_tx);	
      end
  endtask
endclass
