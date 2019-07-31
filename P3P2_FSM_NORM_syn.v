
module VendingMoore ( clk, reset, coin, empty, quarter, fifty, seventyfive, 
        dollar, dispense, error );
  input [2:0] coin;
  input clk, reset;
  output empty, quarter, fifty, seventyfive, dollar, dispense, error;
  wire   n69, n70, n71, n72, n103, n65, n96, n97, n98, n99, n100, n101, n102,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125;
  wire   [4:0] current_state;
  assign dollar = current_state[4];
  assign seventyfive = current_state[3];
  assign fifty = current_state[2];
  assign quarter = current_state[1];
  assign empty = current_state[0];

  DFFSR \current_state_reg[4]  ( .D(n69), .CLK(clk), .R(n65), .S(1'b1), .Q(
        current_state[4]) );
  DFFSR \current_state_reg[0]  ( .D(n72), .CLK(clk), .R(1'b1), .S(n65), .Q(
        current_state[0]) );
  DFFSR \current_state_reg[1]  ( .D(n71), .CLK(clk), .R(n65), .S(1'b1), .Q(
        current_state[1]) );
  DFFSR \current_state_reg[2]  ( .D(n103), .CLK(clk), .R(n65), .S(1'b1), .Q(
        current_state[2]) );
  DFFSR \current_state_reg[3]  ( .D(n70), .CLK(clk), .R(n65), .S(1'b1), .Q(
        current_state[3]) );
  OAI21X1 U77 ( .A(n96), .B(n97), .C(n98), .Y(n72) );
  NOR2X1 U78 ( .A(error), .B(dispense), .Y(n98) );
  AOI21X1 U79 ( .A(coin[0]), .B(coin[1]), .C(n99), .Y(n96) );
  XOR2X1 U80 ( .A(coin[2]), .B(n100), .Y(n99) );
  OAI21X1 U81 ( .A(n101), .B(n102), .C(n104), .Y(n71) );
  NAND3X1 U82 ( .A(n105), .B(current_state[0]), .C(n106), .Y(n104) );
  XNOR2X1 U83 ( .A(n106), .B(n105), .Y(n102) );
  XOR2X1 U84 ( .A(coin[1]), .B(n107), .Y(n105) );
  AOI21X1 U85 ( .A(coin[2]), .B(coin[1]), .C(n108), .Y(n106) );
  OAI21X1 U86 ( .A(n109), .B(n101), .C(n110), .Y(n70) );
  AOI22X1 U87 ( .A(n111), .B(current_state[3]), .C(current_state[2]), .D(n112), 
        .Y(n110) );
  NAND2X1 U88 ( .A(n113), .B(n114), .Y(n69) );
  AOI22X1 U89 ( .A(n111), .B(current_state[4]), .C(current_state[3]), .D(n112), 
        .Y(n114) );
  AOI22X1 U90 ( .A(current_state[2]), .B(n115), .C(current_state[0]), .D(n116), 
        .Y(n113) );
  INVX1 U91 ( .A(reset), .Y(n65) );
  OAI21X1 U92 ( .A(n109), .B(n97), .C(n117), .Y(n103) );
  AOI22X1 U93 ( .A(current_state[2]), .B(n111), .C(current_state[1]), .D(n112), 
        .Y(n117) );
  INVX1 U94 ( .A(n118), .Y(n111) );
  NAND3X1 U95 ( .A(n109), .B(n119), .C(n120), .Y(n118) );
  INVX1 U96 ( .A(current_state[0]), .Y(n97) );
  OAI21X1 U97 ( .A(n109), .B(n121), .C(n122), .Y(error) );
  OAI21X1 U98 ( .A(current_state[2]), .B(n123), .C(n116), .Y(n122) );
  INVX1 U99 ( .A(n119), .Y(n116) );
  OR2X1 U100 ( .A(current_state[3]), .B(current_state[4]), .Y(n123) );
  INVX1 U101 ( .A(current_state[4]), .Y(n121) );
  OAI21X1 U102 ( .A(n119), .B(n101), .C(n124), .Y(dispense) );
  AOI22X1 U103 ( .A(n112), .B(current_state[4]), .C(current_state[3]), .D(n115), .Y(n124) );
  INVX1 U104 ( .A(n109), .Y(n115) );
  NAND3X1 U105 ( .A(n108), .B(n107), .C(coin[1]), .Y(n109) );
  INVX1 U106 ( .A(coin[0]), .Y(n108) );
  INVX1 U107 ( .A(n120), .Y(n112) );
  NAND3X1 U108 ( .A(n125), .B(n107), .C(coin[0]), .Y(n120) );
  INVX1 U109 ( .A(coin[2]), .Y(n107) );
  INVX1 U110 ( .A(coin[1]), .Y(n125) );
  INVX1 U111 ( .A(current_state[1]), .Y(n101) );
  NAND2X1 U112 ( .A(coin[2]), .B(n100), .Y(n119) );
  NOR2X1 U113 ( .A(coin[1]), .B(coin[0]), .Y(n100) );
endmodule

