class simpleadder_test extends uvm_test;
	simpleadder_env sa_env;
     `uvm_component_utils(simpleadder_test)

 
     function new(string name, uvm_component parent);
          super.new(name, parent);
	  
     endfunction: new 
 
     function void build_phase(uvm_phase phase);
          super.build_phase(phase);
       sa_env = simpleadder_env::type_id::create("sa_env", this);
     endfunction: build_phase
 // function print();
   // `uvm_info("SIMPLEADDER TEST FUNCTION", "IN PRINT FUNCTION", UVM_MEDIUM)
    
 // endfunction

     task run_phase(uvm_phase phase);
        simpleadder_sequence sa_seq;
		
	sa_seq = simpleadder_sequence::type_id::create("sa_seq", this);
        
	phase.raise_objection(this);
        //assert(sa_seq.randomize());
        sa_seq.start(sa_env.sa_agent.sa_seqr);
        phase.drop_objection(this);
     endtask: run_phase
endclass: simpleadder_test


