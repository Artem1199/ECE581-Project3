
module VendingMoore ( clk, reset, coin, empty, quarter, fifty, seventyfive, 
        dollar, dispense, error );
  input [2:0] coin;
  input clk, reset;
  output empty, quarter, fifty, seventyfive, dollar, dispense, error;
  wire   n6, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62;
  wire   [5:0] current_state;
  wire   [5:0] next_state;
  assign dispense = current_state[5];
  assign dollar = current_state[4];
  assign seventyfive = current_state[3];
  assign fifty = current_state[2];
  assign quarter = current_state[1];
  assign empty = current_state[0];

  DFFSR \current_state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(1'b1), .S(n6), .Q(current_state[0]) );
  DFFSR \current_state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n6), .S(1'b1), .Q(current_state[1]) );
  DFFSR \current_state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n6), .S(1'b1), .Q(current_state[2]) );
  DFFSR \current_state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(n6), .S(1'b1), .Q(current_state[3]) );
  DFFSR \current_state_reg[4]  ( .D(next_state[4]), .CLK(clk), .R(n6), .S(1'b1), .Q(current_state[4]) );
  DFFSR \current_state_reg[5]  ( .D(next_state[5]), .CLK(clk), .R(n6), .S(1'b1), .Q(current_state[5]) );
  NAND2X1 U44 ( .A(n35), .B(n36), .Y(next_state[5]) );
  AOI22X1 U45 ( .A(current_state[4]), .B(n37), .C(current_state[5]), .D(n38), 
        .Y(n36) );
  AOI22X1 U46 ( .A(current_state[3]), .B(n39), .C(current_state[1]), .D(n40), 
        .Y(n35) );
  NAND2X1 U47 ( .A(n41), .B(n42), .Y(next_state[4]) );
  MUX2X1 U48 ( .B(current_state[3]), .A(current_state[4]), .S(n43), .Y(n42) );
  AOI22X1 U49 ( .A(n40), .B(n44), .C(current_state[2]), .D(n39), .Y(n41) );
  OAI21X1 U50 ( .A(n45), .B(n46), .C(n47), .Y(next_state[3]) );
  AOI22X1 U51 ( .A(n48), .B(current_state[3]), .C(current_state[2]), .D(n37), 
        .Y(n47) );
  INVX1 U52 ( .A(current_state[1]), .Y(n46) );
  OAI21X1 U53 ( .A(n49), .B(n45), .C(n50), .Y(next_state[2]) );
  AOI22X1 U54 ( .A(n48), .B(current_state[2]), .C(current_state[1]), .D(n37), 
        .Y(n50) );
  OAI21X1 U55 ( .A(n49), .B(n43), .C(n51), .Y(next_state[1]) );
  NAND3X1 U56 ( .A(current_state[1]), .B(n52), .C(n48), .Y(n51) );
  NOR2X1 U57 ( .A(n37), .B(n39), .Y(n48) );
  INVX1 U58 ( .A(n45), .Y(n39) );
  INVX1 U59 ( .A(n43), .Y(n37) );
  NAND3X1 U60 ( .A(n53), .B(n54), .C(coin[0]), .Y(n43) );
  OAI21X1 U61 ( .A(n55), .B(n56), .C(n57), .Y(next_state[0]) );
  NAND3X1 U62 ( .A(n44), .B(n53), .C(n58), .Y(n57) );
  INVX1 U63 ( .A(n49), .Y(n44) );
  NOR2X1 U64 ( .A(current_state[0]), .B(current_state[5]), .Y(n49) );
  INVX1 U65 ( .A(current_state[0]), .Y(n56) );
  INVX1 U66 ( .A(n38), .Y(n55) );
  OAI22X1 U67 ( .A(n59), .B(n54), .C(n58), .D(n53), .Y(n38) );
  INVX1 U68 ( .A(coin[2]), .Y(n54) );
  INVX1 U69 ( .A(reset), .Y(n6) );
  OAI21X1 U70 ( .A(n60), .B(n45), .C(n61), .Y(error) );
  OAI21X1 U71 ( .A(current_state[2]), .B(n62), .C(n40), .Y(n61) );
  INVX1 U72 ( .A(n52), .Y(n40) );
  NAND3X1 U73 ( .A(n59), .B(n53), .C(coin[2]), .Y(n52) );
  INVX1 U74 ( .A(coin[1]), .Y(n53) );
  INVX1 U75 ( .A(coin[0]), .Y(n59) );
  OR2X1 U76 ( .A(current_state[3]), .B(current_state[4]), .Y(n62) );
  NAND2X1 U77 ( .A(n58), .B(coin[1]), .Y(n45) );
  NOR2X1 U78 ( .A(coin[2]), .B(coin[0]), .Y(n58) );
  INVX1 U79 ( .A(current_state[4]), .Y(n60) );
endmodule

