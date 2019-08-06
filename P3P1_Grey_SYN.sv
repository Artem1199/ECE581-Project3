///////////////////////////////////////////////////
//Greycode Counter
//Artem Kulakevich - Project 1, problem 4
///////////////////////////////////////
`include "osu05_stdcells.v"
`timescale 1ns/1ns

module P1P4_BTG_n4_0 ( in, sel, out );
  input [3:0] in;
  output [3:0] out;
  input sel;
  wire   \in[3] , n1, n2, n3, n4, n5;
  assign out[3] = \in[3] ;
  assign \in[3]  = in[3];

  XOR2X1 U1 ( .A(n1), .B(n2), .Y(out[1]) );
  XOR2X1 U2 ( .A(in[2]), .B(in[1]), .Y(n2) );
  AND2X1 U3 ( .A(n3), .B(\in[3] ), .Y(n1) );
  XOR2X1 U4 ( .A(n4), .B(n5), .Y(out[0]) );
  XNOR2X1 U5 ( .A(in[1]), .B(in[0]), .Y(n5) );
  NAND2X1 U6 ( .A(out[2]), .B(n3), .Y(n4) );
  INVX1 U7 ( .A(sel), .Y(n3) );
  XOR2X1 U8 ( .A(in[2]), .B(\in[3] ), .Y(out[2]) );
endmodule


module P1P4_BTG_n4_1 ( in, sel, out );
  input [3:0] in;
  output [3:0] out;
  input sel;
  wire   \in[3] , n1, n2, n3, n4, n5;
  assign out[3] = \in[3] ;
  assign \in[3]  = in[3];

  XOR2X1 U1 ( .A(n1), .B(n2), .Y(out[1]) );
  XOR2X1 U2 ( .A(in[2]), .B(in[1]), .Y(n2) );
  AND2X1 U3 ( .A(n3), .B(\in[3] ), .Y(n1) );
  XOR2X1 U4 ( .A(n4), .B(n5), .Y(out[0]) );
  XNOR2X1 U5 ( .A(in[1]), .B(in[0]), .Y(n5) );
  NAND2X1 U6 ( .A(out[2]), .B(n3), .Y(n4) );
  INVX1 U7 ( .A(sel), .Y(n3) );
  XOR2X1 U8 ( .A(in[2]), .B(\in[3] ), .Y(out[2]) );
endmodule

module P3P1_B_adder_n4 ( A, B, S, Cout );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  output Cout;
  wire   \add_39/carry[3] , \add_39/carry[2] , n1;

  FAX1 \add_39/U1_1  ( .A(A[1]), .B(B[1]), .C(n1), .YC(\add_39/carry[2] ),
        .YS(S[1]) );
  FAX1 \add_39/U1_2  ( .A(A[2]), .B(B[2]), .C(\add_39/carry[2] ), .YC(
        \add_39/carry[3] ), .YS(S[2]) );
  FAX1 \add_39/U1_3  ( .A(A[3]), .B(B[3]), .C(\add_39/carry[3] ), .YC(Cout),
        .YS(S[3]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(S[0]) );
endmodule


module P1P4_BTG_n5 ( in, sel, out );
  input [4:0] in;
  output [4:0] out;
  input sel;
  wire   \in[4] , n1, n2, n3, n4, n5, n6;
  assign out[4] = \in[4] ;
  assign \in[4]  = in[4];

  MUX2X1 U1 ( .B(n1), .A(n2), .S(sel), .Y(out[2]) );
  XNOR2X1 U2 ( .A(in[2]), .B(in[3]), .Y(n2) );
  MUX2X1 U3 ( .B(n3), .A(n4), .S(sel), .Y(out[1]) );
  XNOR2X1 U4 ( .A(in[1]), .B(in[2]), .Y(n4) );
  MUX2X1 U5 ( .B(n5), .A(n6), .S(sel), .Y(out[0]) );
  XNOR2X1 U6 ( .A(in[0]), .B(in[1]), .Y(n6) );
  XOR2X1 U7 ( .A(n3), .B(in[0]), .Y(n5) );
  XOR2X1 U8 ( .A(n1), .B(in[1]), .Y(n3) );
  XNOR2X1 U9 ( .A(in[2]), .B(out[3]), .Y(n1) );
  XOR2X1 U10 ( .A(in[3]), .B(\in[4] ), .Y(out[3]) );
endmodule


module P3P1_Grey_Adder_NL ( GA, GB, GS, GCout );
  input [3:0] GA;
  input [3:0] GB;
  output [3:0] GS;
  output GCout;
  wire   Cout_Bin;
  wire   [3:0] GA_Bin;
  wire   [3:0] GB_Bin;
  wire   [3:0] S_Bin;

  P1P4_BTG_n4_0 GA_BTG ( .in(GA), .sel(1'b0), .out(GA_Bin) );
  P1P4_BTG_n4_1 GB_BTG ( .in(GB), .sel(1'b0), .out(GB_Bin) );
  P3P1_B_adder_n4 Adder1 ( .A(GA_Bin), .B(GB_Bin), .S(S_Bin), .Cout(Cout_Bin));
  P1P4_BTG_n5 GTB ( .in({Cout_Bin, S_Bin}), .sel(1'b1), .out({GCout, GS}) );
endmodule