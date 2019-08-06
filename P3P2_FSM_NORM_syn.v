
module VendingMoore ( clk, reset, coin, empty, quarter, fifty, seventyfive, 
        dollar, dispense, error );
  input [2:0] coin;
  input clk, reset;
  output empty, quarter, fifty, seventyfive, dollar, dispense, error;
  wire   n2, n4, n5, n7, n8, n10, n12, n46, n47, n48, n49, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72;
  wire   [5:0] current_state;
  wire   [5:0] next_state;
  assign dispense = current_state[5];
  assign dollar = current_state[4];
  assign seventyfive = current_state[3];
  assign fifty = current_state[2];
  assign quarter = current_state[1];
  assign empty = current_state[0];

  DFFSR \current_state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(1'b1), .S(
        n12), .Q(current_state[0]) );
  DFFSR \current_state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n12), .S(
        1'b1), .Q(current_state[1]) );
  DFFSR \current_state_reg[2]  ( .D(n8), .CLK(clk), .R(1'b1), .S(n12), .Q(n10)
         );
  DFFSR \current_state_reg[3]  ( .D(n5), .CLK(clk), .R(1'b1), .S(n12), .Q(n7)
         );
  DFFSR \current_state_reg[4]  ( .D(n2), .CLK(clk), .R(1'b1), .S(n12), .Q(n4)
         );
  DFFSR \current_state_reg[5]  ( .D(next_state[5]), .CLK(clk), .R(n12), .S(
        1'b1), .Q(current_state[5]) );
  OAI21X1 U54 ( .A(current_state[2]), .B(current_state[3]), .C(1'b1), .Y(n46)
         );
  OAI21X1 U55 ( .A(1'b0), .B(current_state[0]), .C(n60), .Y(n51) );
  INVX1 U57 ( .A(n69), .Y(n47) );
  OAI21X1 U58 ( .A(n66), .B(n47), .C(current_state[4]), .Y(n48) );
  OAI21X1 U59 ( .A(n69), .B(n46), .C(n48), .Y(error) );
  OAI21X1 U60 ( .A(current_state[0]), .B(current_state[5]), .C(n52), .Y(n49)
         );
  OAI21X1 U62 ( .A(coin[2]), .B(n49), .C(n51), .Y(next_state[0]) );
  INVX1 U63 ( .A(reset), .Y(n12) );
  INVX1 U64 ( .A(n72), .Y(n67) );
  INVX1 U65 ( .A(n65), .Y(n66) );
  INVX1 U66 ( .A(coin[0]), .Y(n54) );
  INVX2 U67 ( .A(n4), .Y(current_state[4]) );
  INVX1 U68 ( .A(n10), .Y(current_state[2]) );
  INVX1 U69 ( .A(n7), .Y(current_state[3]) );
  INVX2 U70 ( .A(coin[1]), .Y(n56) );
  INVX2 U71 ( .A(coin[2]), .Y(n55) );
  NOR2X1 U72 ( .A(n67), .B(n66), .Y(n63) );
  NOR2X1 U73 ( .A(current_state[5]), .B(current_state[0]), .Y(n70) );
  NOR2X1 U74 ( .A(coin[1]), .B(coin[0]), .Y(n52) );
  NAND2X1 U75 ( .A(coin[2]), .B(n52), .Y(n69) );
  NAND3X1 U77 ( .A(coin[1]), .B(n54), .C(n55), .Y(n65) );
  OAI21X1 U78 ( .A(coin[1]), .B(coin[0]), .C(coin[2]), .Y(n53) );
  OAI21X1 U79 ( .A(n54), .B(n56), .C(n53), .Y(n60) );
  NAND3X1 U80 ( .A(coin[0]), .B(n56), .C(n55), .Y(n72) );
  NAND3X1 U81 ( .A(current_state[1]), .B(n63), .C(n69), .Y(n57) );
  OAI21X1 U82 ( .A(n70), .B(n72), .C(n57), .Y(next_state[1]) );
  INVX1 U83 ( .A(current_state[1]), .Y(n58) );
  OAI22X1 U84 ( .A(n7), .B(n65), .C(n69), .D(n58), .Y(n59) );
  AOI21X1 U85 ( .A(current_state[5]), .B(n60), .C(n59), .Y(n61) );
  OAI21X1 U86 ( .A(n4), .B(n72), .C(n61), .Y(next_state[5]) );
  AOI22X1 U87 ( .A(n66), .B(n70), .C(n63), .D(n10), .Y(n62) );
  OAI21X1 U88 ( .A(current_state[1]), .B(n72), .C(n62), .Y(n8) );
  AOI22X1 U89 ( .A(n67), .B(n10), .C(n7), .D(n63), .Y(n64) );
  OAI21X1 U90 ( .A(current_state[1]), .B(n65), .C(n64), .Y(n5) );
  AOI22X1 U91 ( .A(n67), .B(current_state[3]), .C(n66), .D(current_state[2]), 
        .Y(n68) );
  OAI21X1 U92 ( .A(n70), .B(n69), .C(n68), .Y(n71) );
  AOI21X1 U93 ( .A(current_state[4]), .B(n72), .C(n71), .Y(n2) );
endmodule

