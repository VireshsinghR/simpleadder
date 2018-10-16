//`include "uvm_macros.svh"
`include "uvm_pkg.sv"
import uvm_pkg::*;
//`include "my_testbench_pkg.svh"
`include "simpleadder_defines.sv"
`include "simpleadder_if.sv"
`include "design.sv"
 `include "simpleadder_transaction.sv"
 `include "simpleadder_seq.sv"
  `include "simpleadder_driver.sv"
  `include "driver_override.sv"
  `include "simpleadder_agent.sv"
  `include "simpleadder_env.sv"
  `include "simpleadder_test.sv"
  `include "small_seq.sv"
 `include "small_test.sv"

module simpleadder_tb_top;
  //import uvm_pkg ::*;
  //import my_testbench_pkg::*;
  
  simpleadder_if vif();
  simpleadder dut (vif);
	
  initial begin
    vif.sig_clock=1'b1;
    
	vif.sig_rst=1'b1;
	#20 vif.sig_rst=1'b0;
    `uvm_info("id1", "Reset applied", UVM_MEDIUM)
	#20 vif.sig_rst=1'b1;
    `uvm_info("id1", "Reset released", UVM_MEDIUM)
   //forever #5 vif.sig_clock=~vif.sig_clock;    //commeting here since clk hast to start running before reset,[caught in assertions]  
  end

  initial begin
  	forever #5 vif.sig_clock=~vif.sig_clock;
  end

  //`include "simpleadder_test.sv"
  initial begin
	uvm_config_db #(virtual simpleadder_if)::set(uvm_root::get(), "uvm_test_top", "simpleadder_if", vif);
   run_test("simpleadder_test");
  //  run_test("small_test");
	#100;
    
    
  end
  
endmodule

