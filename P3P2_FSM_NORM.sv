// Moore Finite State Machine 
// Vending Machine that does not give change

module VendingMoore (
  					clk, 
  					reset, 
 					coin,
  					empty,
 					quarter,
					fifty,
					seventyfive,
					dollar,
					dispense,
					error);
  
  input logic clk; // clock
  input logic reset; // reset
  input logic  [2:0] coin; 
  // outputs
  output logic empty;
  output logic quarter;
  output logic fifty;
  output logic seventyfive;
  output logic dollar;
  output logic dispense;
  output logic error;

  // coins
  parameter [2:0] Zero			= 5'b000;
  parameter [2:0] Quarter  		= 5'b001;
  parameter [2:0] Fifty	  		= 5'b010;
  parameter [2:0] Dollar 		= 5'b100;
  
  // states
  typedef enum logic [5:0] { // explicit enum definition
    EMPTY = 		6'b000001,
   	QUARTER = 		6'b000010,
    FIFTY = 		6'b000100,
    SEVENTYFIVE = 	6'b001000,
    DOLLAR =		6'b010000,
  	DISPENSE =		6'b100000} states_t;
  
  states_t current_state, next_state;
  
  always_ff @(posedge clk, posedge reset)
    
    if (reset) current_state <= EMPTY; // reset to empty
  
	else 	   current_state <= next_state; 
  
  always_comb begin: set_next_state
   	next_state = EMPTY; // default for each branch below  
    error = 0;
    unique case (current_state)
      
    EMPTY: case (coin) // empty state
       Zero			: next_state = EMPTY; // no money
       Quarter		: next_state = QUARTER; // one quarter
       Fifty		: next_state = FIFTY;// 50 cents
       Dollar		: next_state = DOLLAR;// 1 dollar
       default		: next_state = EMPTY;// empty
      endcase
     
    // A quarter paid***********************************
    QUARTER: case (coin) // for a quarter
      Quarter  		: next_state = FIFTY;
      Fifty			: next_state = SEVENTYFIVE;
      Dollar		: next_state = DISPENSE;
      default 		: next_state = QUARTER;
    endcase
      
    // Fifty cents  paid *******************************
    FIFTY: case (coin) // for fifty cents
      Quarter		: next_state = SEVENTYFIVE; // 50 + 25
      Fifty			: next_state = DOLLAR;// 50 + 50 
      Dollar		: begin next_state = FIFTY; error = 1; end
      default		: next_state = FIFTY;// else stay at 50
    endcase

    // Seventy five cents paid**************************
      SEVENTYFIVE: case (coin)
        Quarter		: next_state = DOLLAR; // 75 + 25
        Fifty		: next_state = DISPENSE; // 75 + 50
        Dollar		: begin next_state = SEVENTYFIVE; error = 1; end
        default		: next_state = SEVENTYFIVE;
      endcase

    // One Dollar****************************************
    DOLLAR: case (coin) // for 1 dollar
      Quarter		:next_state = DISPENSE; // 1.00 + 25  = dispense
      Fifty		:begin next_state = DOLLAR; error = 1; end
      Dollar		:begin next_state = DOLLAR; error = 1; end
     default		:next_state = DOLLAR;// for other values stay 1
    endcase
    
//********************************************************  	
      DISPENSE: case (coin)
        Zero		: next_state = EMPTY;
        Quarter		: next_state = QUARTER; // while dispensing adding a quarter
        Fifty		: next_state = FIFTY; // while dispensing adding 50
        Dollar		: next_state = DOLLAR; // while dispensing adding a dollar
      default		: next_state = DISPENSE; // if no coin go to empty
      endcase
    endcase      
  end: set_next_state
  
  always_comb begin: set_outputs
    {empty, quarter,fifty,seventyfive,dollar,dispense} = 0;
    
    unique case (current_state)
    
	EMPTY		:	empty 		= 1'b1;
	QUARTER		: 	quarter 	= 1'b1;
    FIFTY  		:	fifty		= 1'b1;
    SEVENTYFIVE		:	seventyfive = 1'b1;
    DOLLAR		:	dollar		= 1'b1;
    DISPENSE		:	dispense	= 1'b1;
      
    endcase
    
  end: set_outputs
    
endmodule
