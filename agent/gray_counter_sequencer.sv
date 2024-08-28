class gray_counter_sequencer extends uvm_sequencer #(gray_counter_xtn);

// Factory registration using `uvm_component_utils
	`uvm_component_utils(gray_counter_sequencer)

//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
	extern function new(string name = "gray_counter_sequencer",uvm_component parent);
	endclass
//-----------------  constructor new method  -------------------//
	function gray_counter_sequencer::new(string name="gray_counter_sequencer",uvm_component parent);
		super.new(name,parent);
	endfunction



