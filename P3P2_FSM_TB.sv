// Test Bench for Vending Machine

module vending_test;
  
 logic clk;
 logic reset;
  logic [2:0]coin;
 logic empty;
 logic quarter;
 logic fifty;
 logic seventyfive;
 logic dollar;
 logic dispense;
 logic error;
  logic [4:0] data [18:0];
 integer k;
  
  // coins
  parameter [2:0] Zero			= 5'b000;
  parameter [2:0] Quarter  		= 5'b001;
  parameter [2:0] Fifty	  		= 5'b010;
  parameter [2:0] Dollar 		= 5'b100;

  VendingMoore UUT (
    .clk (clk),
    .reset (reset),
    .coin (coin),
    .empty (empty),
    .quarter (quarter),
    .fifty (fifty),
    .seventyfive (seventyfive),
    .dollar (dollar),
    .dispense (dispense),
    .error(error)
  );
  
  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end 
   initial begin
     
    $dumpvars;
    $dumpfile("file.vcd");
     coin = 0;
     
    reset = 1;
    #5 reset = 0;
    data = {
      		Quarter,// Quarter
      		Fifty,//  Fifty
      		Fifty,// fifty == Should dispense
      		Quarter,// Quarter
      		Fifty,// fifty
      		Fifty,// fifty == should dispsense
      		Quarter,// 
      		Zero, // Zero
      		Dollar,
      		Dollar, 
      		Quarter,
      		Zero,
      		Dollar,
      		Dollar,
      		Dollar,
      		Quarter,
      		Fifty,
      		Dollar,
      		Fifty
  			 }; 
  
     for ( k = 18; k >= 0; k--) begin
      
      #7 coin = data[k];
      
   end 
    
    #100 $finish;
  end 
  
  initial begin
    $monitor("coin = %b ,empty = %b, quarter = %b, fifty = %b, seventyfive = %b,dollar = %b, dispense = %b, error = %b ", coin,empty, quarter,fifty, seventyfive, dollar,dispense, error);
  end 
 
endmodule
    
