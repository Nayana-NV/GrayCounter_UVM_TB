class gray_counter_agent extends uvm_agent;

   // Factory Registration
	`uvm_component_utils(gray_counter_agent)
 
   // Declare handle for configuration object
       
        gray_counter_agent_config agt_cfg;
	gray_counter_monitor monh;
	gray_counter_sequencer sequencer;
	gray_counter_driver drvh;

//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
  extern function new(string name = "gray_counter_agent", uvm_component parent = null);
  extern function void build_phase(uvm_phase phase);
  extern function void connect_phase(uvm_phase phase);
endclass : gray_counter_agent
//-----------------  constructor new method  -------------------//

       function gray_counter_agent::new(string name = "gray_counter_agent", 
                               uvm_component parent = null);
         super.new(name, parent);
       endfunction
     
  
//-----------------  build() phase method  -------------------//
       
	function void gray_counter_agent::build_phase(uvm_phase phase);
		super.build_phase(phase);
 

	if(!uvm_config_db#(gray_counter_agent_config)::get(this, "", "agt_cfg", agt_cfg))
		`uvm_fatal("gray_counter_agent","cannot get() agt_cfg from uvm_config_db. Have you set() it?")  

	  monh=gray_counter_monitor::type_id::create("monh",this);	
		if(agt_cfg.is_active==UVM_ACTIVE)
		begin
			drvh=gray_counter_driver::type_id::create("drvh",this);
			sequencer=gray_counter_sequencer::type_id::create("sequencer",this);
		end
	endfunction

//connect_phase

function void gray_counter_agent::connect_phase(uvm_phase phase);
if(agt_cfg.is_active==UVM_ACTIVE)
		begin	
			drvh.seq_item_port.connect(sequencer.seq_item_export);
  		end
endfunction

      

   

   


