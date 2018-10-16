vlib work
vmap work work
vlog  -cuname pkg_name -mfcu design.sv testbench.sv F:/STUFF/Adder/assertions/assertions.sv +incdir+F:/VLSIGURU/Prac/uvm/uvm-1.1b/src +incdir+F:/STUFF/Adder/assertions
vsim -novopt pkg_name work.adder_assertions work.simpleadder_tb_top -sv_lib C:/questasim_10.2c/uvm-1.1b/win32/uvm_dpi +UVM_TESTNAME=small_test
#vsim -novopt work.simpleadder_tb_top -sv_lib C:/questasim_10.2c/uvm-1.1b/win32/uvm_dpi +UVM_TESTNAME=small_test
#vsim -novopt work.simpleadder_tb_top -sv_lib C:/questasim_10.2c/uvm-1.1b/win32/uvm_dpi +UVM_TESTNAME=simpleadder_test

add wave -position insertpoint  \
sim:/simpleadder_tb_top/vif/sig_rst \
sim:/simpleadder_tb_top/vif/sig_out \
sim:/simpleadder_tb_top/vif/sig_inb \
sim:/simpleadder_tb_top/vif/sig_ina \
sim:/simpleadder_tb_top/vif/sig_en_o \
sim:/simpleadder_tb_top/vif/sig_en_i \
sim:/simpleadder_tb_top/vif/sig_clock \
sim:/simpleadder_tb_top/vif/operation


