class gray_counter_xtn extends uvm_sequence_item;

`uvm_object_utils(gray_counter_xtn)

rand bit reset;
bit [3:0]gray_count;


constraint random_reset {reset dist {1:=0, 0:=10};}

extern function new(string name = "gray_counter_xtn");
extern function void do_print(uvm_printer printer);

endclass

//constructor

	function gray_counter_xtn::new(string name = "gray_counter_xtn");
		super.new(name);
	endfunction:new

//do_print method

function void  gray_counter_xtn::do_print (uvm_printer printer);
    	super.do_print(printer);

   
    //                   srting name   		bitstream value    
   	printer.print_field( "reset", 		this.reset,	    	1,		 UVM_DEC		);
	printer.print_field( "gray_count", 		this.gray_count,    	4,		 UVM_DEC		);
    	
endfunction:do_print








