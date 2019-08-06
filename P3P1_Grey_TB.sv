// Testbench for Binary to Gray Code
// Artem Kulakevich
`timescale 1ns/1ns
module P1P4_BTG_testbench;    // No need for Ports
  //Grey_adder connection
  logic [3:0] GA;
  logic [3:0] GB;
  logic [3:0] GS;
  logic GCout;
  
  P3P1_Grey_Adder_NL GreyAdder(GA[3:0], GB[3:0], GS[3:0], GCout);
 
  initial begin   	// initial block
	$dumpfile("Test_BG.vcd"); //required for EDA playground
	$dumpfile("dump.vcd"); //required for EDA playground
    $dumpvars(1, GreyAdder);

    GA = 0; GB = 0;
    #10 GA = 4'b0110; GB = 4'b0111;
    #10 GA = 4; GB = 5;
    #10 GA = 0; GB = 0;
    #10 GA = 1; GB = 1;
    #10 GA = 15; GB = 15;
    #10 GA = 9; GB = 9;
    
    
  	#10 $finish;  
  end    
endmodule
