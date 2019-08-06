// Testbench for Full_Adder
//Artem Kulakevich - Project 2, problem 2
`timescale 1ns/10ps

module P2P2_taffic_TB;	// No need for Ports

  logic [2:0] NS_LIGHT;
  logic [2:0] EW_LIGHT;
  logic EW_SENSOR;
  logic EMGCY_SENSOR;
  logic RESET_N;
  logic CLK;
	
	logic [2:0] NS_LIGHT_NL;
	logic [2:0] EW_LIGHT_NL;

	


  // Instantiate the module to be tested
  
trafficlight TL1(.ns_light(NS_LIGHT[2:0]), .ew_light(EW_LIGHT [2:0]), .ew_sensor(EW_SENSOR), .emgcy_sensor(EMGCY_SENSOR), .reset_n(RESET_N), .clk(CLK));
trafficlight_NL TL2(.ns_light(NS_LIGHT_NL[2:0]), .ew_light(EW_LIGHT_NL [2:0]), .ew_sensor(EW_SENSOR), .emgcy_sensor(EMGCY_SENSOR), .reset_n(RESET_N), .clk(CLK));
   
  initial begin	   // initial block
    
	CLK = 0; RESET_N = 0; EW_SENSOR = 0; EMGCY_SENSOR = 0;
	#10;
	   #20 RESET_N = 1;

	#60 EW_SENSOR = 1;
	#60 EW_SENSOR = 0;
	#60 EMGCY_SENSOR = 1;
	#60 EMGCY_SENSOR = 0;
	#60 EW_SENSOR = 1;
	#60 EW_SENSOR = 0;
	#380 EW_SENSOR = 1;
	#60 EW_SENSOR = 0;
	#160 EMGCY_SENSOR = 1;
	#60 EMGCY_SENSOR = 0;
	#40 EW_SENSOR = 1;
	#60 EW_SENSOR = 0;
	#100 EMGCY_SENSOR = 1; EW_SENSOR = 1;
	#60 EMGCY_SENSOR = 0; EW_SENSOR = 0;
	#100 EW_SENSOR = 1;
	#60 EW_SENSOR = 0;
	#20 EMGCY_SENSOR = 1; EW_SENSOR = 1;
	#60 EMGCY_SENSOR = 0; EW_SENSOR = 0;
	#100 EMGCY_SENSOR = 1;
	#60 EMGCY_SENSOR = 0;
	
	#100 $finish;


  end
  
    always #20 CLK =  ~CLK;
  

endmodule
