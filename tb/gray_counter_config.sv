class gray_counter_config extends uvm_object;


	// UVM Factory Registration Macro
	`uvm_object_utils(gray_counter_config)

	int no_of_agent;

	bit has_scoreboard = 0;
	bit has_agent = 1;

	gray_counter_agent_config agt_cfg;

	extern function new(string name = "gray_counter_config");

endclass: gray_counter_config
//-----------------  constructor new method  -------------------//

function gray_counter_config::new(string name = "gray_counter_config");
  super.new(name);
endfunction


