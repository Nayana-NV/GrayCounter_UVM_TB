class gray_counter_driver extends uvm_driver #(gray_counter_xtn);

   // Factory Registration

	`uvm_component_utils(gray_counter_driver)
	virtual gray_counter_if.DRV_MP vif;
	gray_counter_agent_config agt_cfg;

//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
     	
	extern function new(string name ="gray_counter_driver",uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
	extern task send_to_dut(gray_counter_xtn req);
endclass

//-----------------  constructor new method  -------------------//
 // Define Constructor new() function
	function gray_counter_driver::new(string name ="gray_counter_driver",uvm_component parent);
		super.new(name,parent);
	endfunction

//-----------------  build() phase method  -------------------//
 	function void gray_counter_driver::build_phase(uvm_phase phase);
          super.build_phase(phase);

	if(!uvm_config_db#(gray_counter_agent_config)::get(this, "", "agt_cfg", agt_cfg))
		`uvm_fatal("gray_counter_driver","cannot get() agt_cfg from uvm_config_db. Have you set() it?")  

        endfunction

//connect phase

	function void gray_counter_driver::connect_phase(uvm_phase phase);
		vif = agt_cfg.vif;
	endfunction

//run_phase
	
	task gray_counter_driver::run_phase(uvm_phase phase);
		repeat(10)
			begin
				seq_item_port.get_next_item(req);
				send_to_dut(req);
				seq_item_port.item_done();
			end
	endtask 

//send_to_dut task

	task gray_counter_driver::send_to_dut(gray_counter_xtn req);
		`uvm_info("gray_counter_driver", $sformatf("printing from driver \n %s", req.sprint()),UVM_LOW)
		//req.print();
		vif.drv_cb.reset <= req.reset;
		@(vif.drv_cb);
	endtask
			

	


  


	


