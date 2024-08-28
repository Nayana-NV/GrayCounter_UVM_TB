class base_test extends uvm_test;

   // Factory Registration
	`uvm_component_utils(base_test)
	gray_counter_tb envh;
	gray_counter_config envh_cfg;
	gray_counter_agent_config agt_cfg;
	base_seq base_seqh;
	
    int no_of_agent = 1;
 
	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods:
	extern function new(string name = "base_test" , uvm_component parent);
	extern function void build_phase(uvm_phase phase);
	extern task run_phase(uvm_phase phase);
   
 endclass
//-----------------  constructor new method  -------------------//
// Define Constructor new() function
function base_test::new(string name = "base_test" , uvm_component parent);
	super.new(name,parent);
endfunction
   
//-----------------  build() phase method  -------------------//
            
function void base_test::build_phase(uvm_phase phase);
			agt_cfg=gray_counter_agent_config::type_id::create("agt_cfg");
			if(!uvm_config_db #(virtual gray_counter_if)::get(this,"","agt_vif",agt_cfg.vif))
			`uvm_fatal("base_test","cannot get()interface agt_vif from uvm_config_db. Have you set() it?")  
			agt_cfg.is_active=UVM_ACTIVE;
    
	envh_cfg=gray_counter_config::type_id::create("envh_cfg",this);
	envh_cfg.agt_cfg = agt_cfg;
	envh_cfg.no_of_agent=no_of_agent;
	
	uvm_config_db #(gray_counter_config)::set(this,"*","envh_cfg",envh_cfg);
	super.build_phase(phase);
	envh = gray_counter_tb::type_id::create("envh", this);
endfunction


//run phase

	task base_test::run_phase(uvm_phase phase);
	//raise objection
    	phase.raise_objection(this);
		base_seqh = base_seq::type_id::create("base_seqh");
   		base_seqh.start(envh.agt[0].sequencer);
   	 phase.drop_objection(this);
	
	endtask

