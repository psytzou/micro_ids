////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1
//  \   \         Application : sch2verilog
//  /   /         Filename : detect7B.vf
// /___/   /\     Timestamp : 02/05/2026 05:20:07
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w "C:/Documents and Settings/student/wtut_sc/simu4t/L4/detect7B.sch" detect7B.vf
//Design Name: detect7B
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module detect7B(ce, 
                clk, 
                hwregA, 
                match_en, 
                mrst, 
                pipe1, 
                match, 
                pipe0);

    input ce;
    input clk;
    input [63:0] hwregA;
    input match_en;
    input mrst;
    input [71:0] pipe1;
   output match;
   output [71:0] pipe0;
   
   wire [111:0] XLXN_4;
   wire XLXN_12;
   wire XLXN_15;
   wire XLXN_17;
   wire match_DUMMY;
   wire [71:0] pipe0_DUMMY;
   
   assign match = match_DUMMY;
   assign pipe0[71:0] = pipe0_DUMMY[71:0];
   busmerge XLXI_2 (.da(pipe0_DUMMY[47:0]), 
                    .db(pipe0_DUMMY[63:0]), 
                    .q(XLXN_4[111:0]));
   reg9B XLXI_3 (.CE(ce), 
                 .CLK(clk), 
                 .CLR(XLXN_15), 
                 .d(pipe1[71:0]), 
                 .q(pipe0_DUMMY[71:0]));
   wordmatch XLXI_4 (.datacomp(hwregA[55:0]), 
                     .datain(XLXN_4[111:0]), 
                     .wildcard(hwregA[62:56]), 
                     .match(XLXN_12));
   AND3B1 XLXI_5 (.I0(match_DUMMY), 
                  .I1(XLXN_12), 
                  .I2(match_en), 
                  .O(XLXN_17));
   FD XLXI_6 (.C(clk), 
              .D(mrst), 
              .Q(XLXN_15));
   defparam XLXI_6.INIT = 1'b0;
   FDCE XLXI_7 (.C(clk), 
                .CE(XLXN_17), 
                .CLR(XLXN_15), 
                .D(XLXN_17), 
                .Q(match_DUMMY));
   defparam XLXI_7.INIT = 1'b0;
endmodule
