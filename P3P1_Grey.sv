///////////////////////////////////////////////////
//Greycode Counter
//Artem Kulakevich - Project 1, problem 4
///////////////////////////////////////

`timescale 1ns/1ns

/*Grey to Binary Converter*/
module P1P4_BTG #(parameter n = 8) (input logic [n-1:0] in, input sel, output logic [n-1:0] out); //0 on //parameterized converter
 
 int i;
  int j;
   always_comb begin
     
     if (sel) begin //if sel = 1; convert from binary to greycode   
        out[n-1] = in[n-1]; //Make initial first bit match
        for(i = n-2; i >= 0; i = i-1)begin //check every bit after
        out[i] = in[i+1]^in[i]; //output the XOR equation from above
        end //end for
       
     end// if(sel)
     
     else begin
       out[n-1] = in[n-1];
     for (j = n-2; j >= 0; j = j-1)begin
       if (in[j] == 0)
         out[j] = out[j+1];
         else
           out[j] = ~out[j+1];
     end //for
     end //end else
     
  end//end always_comb
  
endmodule

module P3P1_B_adder #(parameter n = 8) (input logic[n-1:0] A, input logic[n-1:0] B, output logic [n-1:0] S, output logic Cout);
  
  assign {Cout, S} = A + B;
  
endmodule

module P3P1_Grey_Adder (input logic [3:0] GA, input logic [3:0] GB, output logic [3:0] GS, output logic GCout);
  
  logic [3:0] S_Bin; //hold binary value after addition
  logic Cout_Bin; //hold binary carry out
  logic [3:0] GA_Bin; //binary version of input value
  logic [3:0] GB_Bin; //binary version of input value  
 
  
  P1P4_BTG #(.n(4)) GA_BTG(GA[3:0], 1'b0, GA_Bin[3:0]); //Convert GA gray code into Binary
  P1P4_BTG #(.n(4)) GB_BTG(GB[3:0], 1'b0, GB_Bin[3:0]); //Convert GB gray code into binary
  	
  P3P1_B_adder #(.n(4)) Adder1(GA_Bin[3:0], GB_Bin[3:0], S_Bin[3:0], Cout_Bin);
  
  //Convert back to grey code
  
  P1P4_BTG #(.n(5)) GTB({Cout_Bin, S_Bin[3:0]}, 1'b1, {GCout,GS[3:0]});
  
endmodule
  
  
  
