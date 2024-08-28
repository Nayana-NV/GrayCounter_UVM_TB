class gray_counter_monitor extends uvm_monitor;

  // Factory Registration
	`uvm_component_utils(gray_counter_monitor)

   	virtual gray_counter_if.MON_MP vif;
        gray_counter_agent_config agt_cfg;
	gray_counter_xtn xtn;
	uvm_analysis_port#(gray_counter_xtn) ap;

//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
extern function new(string name = "gray_counter_monitor", uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern task collect_data();
extern function void report_phase(uvm_phase phase);

endclass 
//-----------------  constructor new method  -------------------//
	function gray_counter_monitor::new(string name = "gray_counter_monitor", uvm_component parent);
		super.new(name,parent);
		ap = new("ap", this);
  	endfunction

//-----------------  build() phase method  -------------------//
 	function void gray_counter_monitor::build_phase(uvm_phase phase);
	uvm_top.print_topology();
          super.build_phase(phase);
	if(!uvm_config_db#(gray_counter_agent_config)::get(this, "", "agt_cfg", agt_cfg))
		`uvm_fatal("gray_counter_driver","cannot get() agt_cfg from uvm_config_db. Have you set() it?")  
        endfunction

//connect phase

	function void gray_counter_monitor::connect_phase(uvm_phase phase);
		vif = agt_cfg.vif;
	endfunction

//run_phase
	
	task gray_counter_monitor::run_phase(uvm_phase phase);
	repeat(10)
		begin 
			xtn = gray_counter_xtn::type_id::create("xtn",this);
			collect_data();
		end
	endtask

// collectdata

task gray_counter_monitor::collect_data();
		@(vif.mon_cb);	
		xtn.reset = vif.mon_cb.reset; 
		xtn.gray_count = vif.mon_cb.gray_count; 
	`uvm_info("gray_counter_monitor", $sformatf("printing from monitor \n %s", xtn.sprint()),UVM_LOW)
		//xtn.print();
		ap.write(xtn);
		
endtask


function void gray_counter_monitor::report_phase(uvm_phase phase);
`uvm_info("gray_counter_monitor", $sformatf("printing from monitor \n %s", xtn.sprint()),UVM_LOW)
endfunction











