
module VendingMoore ( clk, reset, coin, empty, quarter, fifty, seventyfive, 
        dollar, dispense, error );
  input [2:0] coin;
  input clk, reset;
  output empty, quarter, fifty, seventyfive, dollar, dispense, error;
  wire   n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103;
  wire   [4:0] current_state;
  assign dollar = current_state[4];
  assign seventyfive = current_state[3];
  assign f
module VendingMoore ( clk, reset, coin, empty, quarter, fifty, seventyfive, 
        dollar, dispense, error );
  input [2:0] coin;
  input clk, reset;
  output empty, quarter, fifty, seventyfive, dollar, dispense, error;
  wire   n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103;
  wire   [4:0] current_state;
  assign dollar = current_state[4];
  assign seventyfive = current_state[3];
  assign fifty = current_state[2];
  assign quarter = current_state[1];
  assign empty = current_state[0];

  DFFSR \current_state_reg[4]  ( .D(n69), .CLK(clk), .R(n73), .S(1'b1), .Q(
        current_state[4]) );
  DFFSR \current_state_reg[0]  ( .D(n72), .CLK(clk), .R(1'b1), .S(n73), .Q(
        current_state[0]) );
  DFFSR \current_state_reg[1]  ( .D(n71), .CLK(clk), .R(n73), .S(1'b1), .Q(
        current_state[1]) );
  DFFSR \current_state_reg[2]  ( .D(n103), .CLK(clk), .R(n73), .S(1'b1), .Q(
        current_state[2]) );
  DFFSR \current_state_reg[3]  ( .D(n70), .CLK(clk), .R(n73), .S(1'b1), .Q(
        current_state[3]) );
  OR2X2 U83 ( .A(current_state[3]), .B(current_state[4]), .Y(n101) );
  INVX2 U84 ( .A(reset), .Y(n73) );
  INVX2 U85 ( .A(n98), .Y(n74) );
  INVX2 U86 ( .A(n97), .Y(n75) );
  INVX2 U87 ( .A(n84), .Y(n76) );
  INVX2 U88 ( .A(coin[2]), .Y(n77) );
  INVX2 U89 ( .A(n99), .Y(n78) );
  INVX2 U90 ( .A(coin[1]), .Y(n79) );
  INVX2 U91 ( .A(coin[0]), .Y(n80) );
  INVX2 U92 ( .A(current_state[4]), .Y(n81) );
  INVX2 U93 ( .A(current_state[0]), .Y(n82) );
  INVX2 U94 ( .A(current_state[1]), .Y(n83) );
  OAI21X1 U95 ( .A(n84), .B(n82), .C(n85), .Y(n103) );
  AOI22X1 U96 ( .A(current_state[2]), .B(n75), .C(current_state[1]), .D(n74), 
        .Y(n85) );
  OAI21X1 U97 ( .A(n86), .B(n82), .C(n87), .Y(n72) );
  NOR2X1 U98 ( .A(error), .B(dispense), .Y(n87) );
  AOI21X1 U99 ( .A(coin[0]), .B(coin[1]), .C(n88), .Y(n86) );
  XOR2X1 U100 ( .A(coin[2]), .B(n89), .Y(n88) );
  OAI21X1 U101 ( .A(n83), .B(n90), .C(n91), .Y(n71) );
  NAND3X1 U102 ( .A(n92), .B(current_state[0]), .C(n93), .Y(n91) );
  XNOR2X1 U103 ( .A(n93), .B(n92), .Y(n90) );
  XOR2X1 U104 ( .A(coin[1]), .B(n77), .Y(n92) );
  AOI21X1 U105 ( .A(coin[1]), .B(coin[2]), .C(n80), .Y(n93) );
  OAI21X1 U106 ( .A(n83), .B(n84), .C(n94), .Y(n70) );
  AOI22X1 U107 ( .A(current_state[3]), .B(n75), .C(n74), .D(current_state[2]), 
        .Y(n94) );
  NAND2X1 U108 ( .A(n95), .B(n96), .Y(n69) );
  AOI22X1 U109 ( .A(current_state[4]), .B(n75), .C(current_state[3]), .D(n74), 
        .Y(n96) );
  NAND3X1 U110 ( .A(n98), .B(n84), .C(n99), .Y(n97) );
  AOI22X1 U111 ( .A(n76), .B(current_state[2]), .C(n78), .D(current_state[0]), 
        .Y(n95) );
  OAI21X1 U112 ( .A(n84), .B(n81), .C(n100), .Y(error) );
  OAI21X1 U113 ( .A(current_state[2]), .B(n10ifty = current_state[2];
  assign quarter = current_state[1];
  assign empty = current_state[0];

  DFFSR \current_state_reg[4]  ( .D(n69), .CLK(clk), .R(n73), .S(1'b1), .Q(
        current_state[4]) );
  DFFSR \current_state_reg[0]  ( .D(n72), .CLK(clk), .R(1'b1), .S(n73), .Q(
        current_state[0]) );
  DFFSR \current_state_reg[1]  ( .D(n71), .CLK(clk), .R(n73), .S(1'b1), .Q(
        current_state[1]) );
  DFFSR \current_state_reg[2]  ( .D(n103), .CLK(clk), .R(n73), .S(1'b1), .Q(
        current_state[2]) );
  DFFSR \current_state_reg[3]  ( .D(n70), .CLK(clk), .R(n73), .S(1'b1), .Q(
        current_state[3]) );
  OR2X2 U83 ( .A(current_state[3]), .B(current_state[4]), .Y(n101) );
  INVX2 U84 ( .A(reset), .Y(n73) );
  INVX2 U85 ( .A(n98), .Y(n74) );
  INVX2 U86 ( .A(n97), .Y(n75) );
  INVX2 U87 ( .A(n84), .Y(n76) );
  INVX2 U88 ( .A(coin[2]), .Y(n77) );
  INVX2 U89 ( .A(n99), .Y(n78) );
  INVX2 U90 ( .A(coin[1]), .Y(n79) );
  INVX2 U91 ( .A(coin[0]), .Y(n80) );
  INVX2 U92 ( .A(current_state[4]), .Y(n81) );
  INVX2 U93 ( .A(current_state[0]), .Y(n82) );
  INVX2 U94 ( .A(current_state[1]), .Y(n83) );
  OAI21X1 U95 ( .A(n84), .B(n82), .C(n85), .Y(n103) );
  AOI22X1 U96 ( .A(current_state[2]), .B(n75), .C(current_state[1]), .D(n74), 
        .Y(n85) );
  OAI21X1 U97 ( .A(n86), .B(n82), .C(n87), .Y(n72) );
  NOR2X1 U98 ( .A(error), .B(dispense), .Y(n87) );
  AOI21X1 U99 ( .A(coin[0]), .B(coin[1]), .C(n88), .Y(n86) );
  XOR2X1 U100 ( .A(coin[2]), .B(n89), .Y(n88) );
module VendingMoore ( clk, reset, coin, empty, quarter, fifty, seventyfive, 
        dollar, dispense, error );
  input [2:0] coin;
  input clk, reset;
  output empty, quarter, fifty, seventyfive, dollar, dispense, error;
  wire   n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103;
  wire   [4:0] current_state;
  assign dollar = current_state[4];
  assign seventyfive = current_state[3];
  assign fifty = current_state[2];
  assign quarter = current_state[1];
  assign empty = current_state[0];

  DFFSR \current_state_reg[4]  ( .D(n69), .CLK(clk), .R(n73), .S(1'b1), .Q(
        current_state[4]) );
  DFFSR \current_state_reg[0]  ( .D(n72), .CLK(clk), .R(1'b1), .S(n73), .Q(
        current_state[0]) );
  DFFSR \current_state_reg[1]  ( .D(n71), .CLK(clk), .R(n73), .S(1'b1), .Q(
        current_state[1]) );
  DFFSR \current_state_reg[2]  ( .D(n103), .CLK(clk), .R(n73), .S(1'b1), .Q(
        current_state[2]) );
  DFFSR \current_state_reg[3]  ( .D(n70), .CLK(clk), .R(n73), .S(1'b1), .Q(
        current_state[3]) );
  OR2X2 U83 ( .A(current_state[3]), .B(current_state[4]), .Y(n101) );
  INVX2 U84 ( .A(reset), .Y(n73) );
  INVX2 U85 ( .A(n98), .Y(n74) );
  INVX2 U86 ( .A(n97), .Y(n75) );
  INVX2 U87 ( .A(n84), .Y(n76) );
  INVX2 U88 ( .A(coin[2]), .Y(n77) );
  INVX2 U89 ( .A(n99), .Y(n78) );
  INVX2 U90 ( .A(coin[1]), .Y(n79) );
  INVX2 U91 ( .A(coin[0]), .Y(n80) );
  INVX2 U92 ( .A(current_state[4]), .Y(n81) );
  INVX2 U93 ( .A(current_state[0]), .Y(n82) );
  INVX2 U94 ( .A(current_state[1]), .Y(n83) );
  OAI21X1 U95 ( .A(n84), .B(n82), .C(n85), .Y(n103) );
  AOI22X1 U96 ( .A(current_state[2]), .B(n75), .C(current_state[1]), .D(n74), 
        .Y(n85) );
  OAI21X1 U97 ( .A(n86), .B(n82), .C(n87), .Y(n72) );
  NOR2X1 U98 ( .A(error), .B(dispense), .Y(n87) );
  AOI21X1 U99 ( .A(coin[0]), .B(coin[1]), .C(n88), .Y(n86) );
  XOR2X1 U100 ( .A(coin[2]), .B(n89), .Y(n88) );
  OAI21X1 U101 ( .A(n83), .B(n90), .C(n91), .Y(n71) );
  NAND3X1 U102 ( .A(n92), .B(current_state[0]), .C(n93), .Y(n91) );
  XNOR2X1 U103 ( .A(n93), .B(n92), .Y(n90) );
  XOR2X1 U104 ( .A(coin[1]), .B(n77), .Y(n92) );
  AOI21X1 U105 ( .A(coin[1]), .B(coin[2]), .C(n80), .Y(n93) );
  OAI21X1 U106 ( .A(n83), .B(n84), .C(n94), .Y(n70) );
  AOI22X1 U107 ( .A(current_state[3]), .B(n75), .C(n74), .D(current_state[2]), 
        .Y(n94) );
  NAND2X1 U108 ( .A(n95), .B(n96), .Y(n69) );
  AOI22X1 U109 ( .A(current_state[4]), .B(n75), .C(current_state[3]), .D(n74), 
        .Y(n96) );
  NAND3X1 U110 ( .A(n98), .B(n84), .C(n99), .Y(n97) );
  AOI22X1 U111 ( .A(n76), .B(current_state[2]), .C(n78), .D(current_state[0]), 
        .Y(n95) );
  OAI21X1 U112 ( .A(n84), .B(n81), .C(n100), .Y(error) );
  OAI21X1 U113 ( .A(current_state[2]), .B(n10
  OAI21X1 U101 ( .A(n83), .B(n90), .C(n91), .Y(n71) );
  NAND3X1 U102 ( .A(n92), .B(current_state[0]), .C(n93), .Y(n91) );
  XNOR2X1 U103 ( .A(n93), .B(n92), .Y(n90) );
  XOR2X1 U104 ( .A(coin[1]), .B(n77), .Y(n92) );
  AOI21X1 U105 ( .A(coin[1]), .B(coin[2]), .C(n80), .Y(n93) );
  OAI21X1 U106 ( .A(n83), .B(n84), .C(n94), .Y(n70) );
  AOI22X1 U107 ( .A(current_state[3]), .B(n75), .C(n74), .D(current_state[2]), 
        .Y(n94) );
  NAND2X1 U108 ( .A(n95), .B(n96), .Y(n69) );
  AOI22X1 U109 ( .A(current_state[4]), .B(n75), .C(current_state[3]), .D(n74), 
        .Y(n96) );
  NAND3X1 U110 ( .A(n98), .B(n84), .C(n99), .Y(n97) );
  AOI22X1 U111 ( .A(n76), .B(current_state[2]), .C(n78), .D(current_state[0]), 
        .Y(n95) );
  OAI21X1 U112 ( .A(n84), .B(n81), .C(n100), .Y(error) );
  OAI21X1 U113 ( .A(current_state[2]), .B(n101), .C(n78), .Y(n100) );
  OAI21X1 U114 ( .A(n83), .B(n99), .C(n102), .Y(dispense) );
  AOI22X1 U115 ( .A(current_state[4]), .B(n74), .C(current_state[3]), .D(n76), 
        .Y(n102) );
  NAND3X1 U116 ( .A(n80), .B(n77), .C(coin[1]), .Y(n84) );
  NAND3X1 U117 ( .A(n79), .B(n77), .C(coin[0]), .Y(n98) );
  NAND2X1 U118 ( .A(coin[2]), .B(n89), .Y(n99) );
  NOR2X1 U119 ( .A(coin[1]), .B(coin[0]), .Y(n89) );
endmodule

