`include "osu05_stdcells.v"
module trafficlight_NL ( .ns_light({\ns_light[2] , \ns_light[1] , \ns_light[0] }), 
    .ew_light({\ew_light[2] , \ew_light[1] , \ew_light[0] }), ew_sensor, 
        emgcy_sensor, reset_n, clk );
  input ew_sensor, emgcy_sensor, reset_n, clk;
  output \ns_light[2] , \ns_light[1] , \ns_light[0] , \ew_light[2] ,
         \ew_light[1] , \ew_light[0] ;
  wire   ns_reset, ew_reset, N18, N19, n18, n44, n45, n46, n47, n50, n51, n53,
         n54, n55, n56, n58, n60, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86;
  wire   [1:0] ns_green_timer;
  wire   [1:0] ew_green_timer;
  wire   [2:0] ns_next;
  wire   [2:0] ew_next;

  DFFPOSX1 \ns_counter/out_reg[1]  ( .D(n18), .CLK(clk), .Q(ns_green_timer[1])
         );
  DFFSR \ns_light_reg[2]  ( .D(ns_next[2]), .CLK(clk), .R(reset_n), .S(1'b1), 
        .Q(\ns_light[2] ) );
  DFFSR \ns_light_reg[1]  ( .D(ns_next[1]), .CLK(clk), .R(1'b1), .S(reset_n), 
        .Q(\ns_light[1] ) );
  DFFSR \ns_light_reg[0]  ( .D(ns_next[0]), .CLK(clk), .R(1'b1), .S(reset_n), 
        .Q(\ns_light[0] ) );
  DFFSR ns_reset_reg ( .D(N18), .CLK(clk), .R(1'b1), .S(reset_n), .Q(ns_reset)
         );
  DFFPOSX1 \ns_counter/out_reg[0]  ( .D(n46), .CLK(clk), .Q(ns_green_timer[0])
         );
  DFFPOSX1 \ew_counter/out_reg[1]  ( .D(n45), .CLK(clk), .Q(ew_green_timer[1])
         );
  DFFPOSX1 \ew_counter/out_reg[0]  ( .D(n44), .CLK(clk), .Q(ew_green_timer[0])
         );
  DFFSR \ew_light_reg[0]  ( .D(ew_next[0]), .CLK(clk), .R(1'b1), .S(reset_n), 
        .Q(\ew_light[0] ) );
  DFFSR \ew_light_reg[2]  ( .D(ew_next[2]), .CLK(clk), .R(reset_n), .S(1'b1), 
        .Q(\ew_light[2] ) );
  DFFSR \ew_light_reg[1]  ( .D(ew_next[1]), .CLK(clk), .R(reset_n), .S(1'b1), 
        .Q(\ew_light[1] ) );
  DFFSR ew_reset_reg ( .D(N19), .CLK(clk), .R(1'b1), .S(reset_n), .Q(ew_reset)
         );
  OAI21X1 U57 ( .A(ns_green_timer[0]), .B(ns_green_timer[1]), .C(1'b1), .Y(n63) );
  OAI21X1 U58 ( .A(n63), .B(ns_reset), .C(1'b1), .Y(n18) );
  OAI21X1 U59 ( .A(n81), .B(n60), .C(1'b1), .Y(ew_next[2]) );
  OAI21X1 U60 ( .A(n84), .B(n56), .C(1'b1), .Y(ns_next[2]) );
  OAI21X1 U61 ( .A(ns_next[0]), .B(n82), .C(1'b1), .Y(n50) );
  OAI21X1 U62 ( .A(1'b0), .B(\ns_light[0] ), .C(n58), .Y(n66) );
  OAI21X1 U63 ( .A(1'b0), .B(n69), .C(n83), .Y(n53) );
  OAI21X1 U64 ( .A(1'b0), .B(ew_sensor), .C(n47), .Y(n69) );
  INVX1 U65 ( .A(n84), .Y(n47) );
  OAI21X1 U68 ( .A(ew_next[2]), .B(ew_next[1]), .C(n50), .Y(n51) );
  OAI21X1 U69 ( .A(ew_next[0]), .B(n51), .C(n83), .Y(N19) );
  AOI21X1 U71 ( .A(\ns_light[0] ), .B(n53), .C(\ns_light[2] ), .Y(n54) );
  AOI22X1 U72 ( .A(n84), .B(n68), .C(n54), .D(\ns_light[1] ), .Y(n55) );
  OAI21X1 U73 ( .A(emgcy_sensor), .B(n67), .C(n55), .Y(ns_next[0]) );
  INVX1 U74 ( .A(n68), .Y(n56) );
  INVX1 U76 ( .A(\ns_light[2] ), .Y(n58) );
  INVX1 U78 ( .A(n80), .Y(n60) );
  INVX2 U81 ( .A(\ns_light[1] ), .Y(n65) );
  INVX2 U82 ( .A(ew_green_timer[1]), .Y(n86) );
  INVX1 U83 ( .A(n74), .Y(n75) );
  INVX1 U84 ( .A(n76), .Y(n79) );
  INVX1 U85 ( .A(\ew_light[0] ), .Y(n78) );
  INVX1 U86 ( .A(\ew_light[1] ), .Y(n71) );
  INVX2 U87 ( .A(emgcy_sensor), .Y(n83) );
  NOR2X1 U88 ( .A(\ew_light[2] ), .B(n71), .Y(n76) );
  NOR2X1 U89 ( .A(emgcy_sensor), .B(n69), .Y(n80) );
  NOR2X1 U90 ( .A(ns_next[2]), .B(ns_next[1]), .Y(n82) );
  NOR2X1 U91 ( .A(\ns_light[1] ), .B(n66), .Y(n68) );
  INVX1 U92 ( .A(\ns_light[0] ), .Y(n64) );
  NAND3X1 U93 ( .A(\ns_light[2] ), .B(n65), .C(n64), .Y(n67) );
  OAI21X1 U94 ( .A(n66), .B(n65), .C(n67), .Y(ns_next[1]) );
  NAND2X1 U95 ( .A(ns_green_timer[0]), .B(ns_green_timer[1]), .Y(n84) );
  OAI21X1 U97 ( .A(n82), .B(ns_next[0]), .C(n83), .Y(N18) );
  INVX1 U98 ( .A(\ew_light[2] ), .Y(n70) );
  NAND3X1 U99 ( .A(\ew_light[0] ), .B(n71), .C(n70), .Y(n81) );
  NAND3X1 U100 ( .A(\ew_light[2] ), .B(n71), .C(n78), .Y(n77) );
  AOI21X1 U101 ( .A(ew_green_timer[1]), .B(ew_green_timer[0]), .C(emgcy_sensor), .Y(n72) );
  OAI21X1 U102 ( .A(n72), .B(n78), .C(n76), .Y(n73) );
  OAI21X1 U103 ( .A(emgcy_sensor), .B(n77), .C(n73), .Y(n74) );
  OAI21X1 U104 ( .A(n80), .B(n81), .C(n75), .Y(ew_next[0]) );
  OAI21X1 U105 ( .A(n79), .B(n78), .C(n77), .Y(ew_next[1]) );
  AOI21X1 U106 ( .A(ns_green_timer[0]), .B(n84), .C(ns_reset), .Y(n46) );
  INVX1 U107 ( .A(ew_green_timer[0]), .Y(n85) );
  AOI21X1 U108 ( .A(n86), .B(n85), .C(ew_reset), .Y(n45) );
  AOI21X1 U109 ( .A(ew_green_timer[0]), .B(n86), .C(ew_reset), .Y(n44) );
endmodule

