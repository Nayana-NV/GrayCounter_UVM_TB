interface gray_counter_if(input bit clock);
  
	logic reset;
	logic[3:0] gray_count;

	//TB Modports and CBs
	
	// source Driver CB 
	clocking drv_cb @ (posedge clock);
		default input #1 output #1;
		output reset;
		input gray_count; 
	endclocking

	// Monitor CB
	clocking mon_cb @(posedge clock);
		default input #1 output #1;
		input reset;
		input gray_count; 	
	endclocking

	//source Driver MP
	modport DRV_MP (clocking drv_cb);
	//source Monitor MP
	modport MON_MP (clocking mon_cb);

endinterface

