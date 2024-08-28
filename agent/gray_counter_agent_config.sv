class gray_counter_agent_config extends uvm_object;


	// UVM Factory Registration Macro
	`uvm_object_utils(gray_counter_agent_config)


	//------------------------------------------
	// Data Members
	//------------------------------------------

	uvm_active_passive_enum is_active = UVM_ACTIVE;
	virtual gray_counter_if vif;
	
	//------------------------------------------
	// Methods
	//------------------------------------------
	// Standard UVM Methods:
	extern function new(string name = "gray_counter_agent_config");

endclass: gray_counter_agent_config
//-----------------  constructor new method  -------------------//

function  gray_counter_agent_config::new(string name = "gray_counter_agent_config");
  super.new(name);
endfunction
