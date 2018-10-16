
class small_test extends simpleadder_test;
	//simpleadder_env sa_env;
  `uvm_component_utils(small_test)
  
     function new(string name, uvm_component parent);
          super.new(name, parent);
      //  `uvm_info("SMALL TEST", "new called", UVM_MEDIUM)
           factory.set_type_override_by_type(simpleadder_driver::get_type(), driver_override::get_type(), "*");
           endfunction: new
 	
     function void build_phase(uvm_phase phase);
          super.build_phase(phase);
//	  sa_env = simpleadder_env::type_id::create("sa_env", this);
     //  `uvm_info("SMALL TEST", "build phase called", UVM_MEDIUM)
     endfunction: build_phase
  
 // function print();
   // `uvm_info("SMALL TEST FUNCTION", "IN PRINT FUNCTION", UVM_MEDIUM)
    
  //endfunction

     task run_phase(uvm_phase phase);
     //  `uvm_info("SMALL TEST", "run task called", UVM_MEDIUM)
        small_seq sml_seq;
		
       sml_seq = small_seq::type_id::create("sml_seq", this);
        
	phase.raise_objection(this);
        sml_seq.start(sa_env.sa_agent.sa_seqr);
       phase.drop_objection(this);
     endtask: run_phase
endclass: small_test

