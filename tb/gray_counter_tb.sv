class gray_counter_tb extends uvm_env;

        
    // Factory Registration
    `uvm_component_utils(gray_counter_tb)

	gray_counter_agent agt[];
	gray_counter_agent_config agt_cfg;
    	gray_counter_config envh_cfg;
	//------------------------------------------
	// Methods
	//------------------------------------------

	// Standard UVM Methods:
	extern function new(string name = "gray_counter_tb", uvm_component parent);
	extern function void build_phase(uvm_phase phase);

endclass: gray_counter_tb
	
//-----------------  constructor new method  -------------------//
// Define Constructor new() function
function gray_counter_tb::new(string name = "gray_counter_tb", uvm_component parent);
	super.new(name,parent);
endfunction

//-----------------  build phase method  -------------------//

function void gray_counter_tb::build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(!uvm_config_db#(gray_counter_config)::get(this, "", "envh_cfg", envh_cfg))
		`uvm_fatal("gray_counter_tb","cannot get() envh_cfg from uvm_config_db. Have you set() it?")  

   	agt= new[envh_cfg.no_of_agent];
	foreach(agt[i])
		begin
			agt[i] = gray_counter_agent::type_id::create($sformatf("agt[%0d]",i), this);
			uvm_config_db#(gray_counter_agent_config)::set(this, $sformatf("agt[%0d]*",i), "agt_cfg", envh_cfg.agt_cfg);
		end
endfunction


