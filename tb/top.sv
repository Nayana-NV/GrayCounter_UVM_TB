module top;

	// import gray_counter_pkg
    	import gray_counter_pkg::*;

	//import uvm_pkg.sv
	import uvm_pkg::*;
	`include "uvm_macros.svh"

    // Generate clock signal
	bit clock =1;  
	always 
	#5 clock=!clock;     

   // Instantiate router_if with clock as input
   gray_counter_if agt_vif(clock);
      
   // Instantiate rtl 
   gray_counter DUT(.clk(agt_vif.clock),.rst(agt_vif.reset),.gray_count(agt_vif.gray_count));
   // In initial block
   initial
	begin
		//set the virtual interface using the uvm_config_db
		uvm_config_db #(virtual gray_counter_if)::set(null,"*","agt_vif",agt_vif);


		// Call run_test
		run_test("base_test");
	end

endmodule

  
   
  
