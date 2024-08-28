package gray_counter_pkg;


//import uvm_pkg.sv
	import uvm_pkg::*;
//include uvm_macros.sv
	`include "uvm_macros.svh"

`include "gray_counter_xtn.sv"
`include "gray_counter_agent_config.sv"
`include "gray_counter_config.sv"
`include "gray_counter_driver.sv"
`include "gray_counter_monitor.sv"
`include "gray_counter_sequencer.sv"
`include "gray_counter_agent.sv"
`include "gray_counter_seqs.sv"

`include "gray_counter_tb.sv"

`include "test.sv"
endpackage
