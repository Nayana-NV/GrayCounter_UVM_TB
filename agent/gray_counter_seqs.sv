class base_seq extends uvm_sequence #(gray_counter_xtn);  
	
  // Factory registration using `uvm_object_utils

	`uvm_object_utils(base_seq) 
//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
        extern function new(string name ="base_seq");
	extern task body();
	endclass
//-----------------  constructor new method  -------------------//
	function base_seq::new(string name ="base_seq");
		super.new(name);
	endfunction


task base_seq::body();
	for(int i = 0; i < 10; i++)
	begin
		req=gray_counter_xtn::type_id::create("req");
		start_item(req);
		assert(req.randomize());
		finish_item(req);
	end
	endtask

