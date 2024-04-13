// -------------------------------------------------------------
// 
// File Name: C:\Users\kyle\Desktop\Convolutional test\Convolutional test.srcs\sources_1\new\commrshdl\Set_Reset_Flip_Flop.v
// Created: 2024-04-11 05:14:43
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Set_Reset_Flip_Flop
// Source Path: commrshdl/Source/Set-Reset Flip-Flop
// Hierarchy Level: 1
// Model version: 9.77
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Set_Reset_Flip_Flop
          (clk,
           reset_x,
           enb,
           Set,
           Reset,
           Q);


  input   clk;
  input   reset_x;
  input   enb;
  input   Set;
  input   Reset;
  output  Q;


  wire Discrete_out1;


  Discrete u_Discrete (.clk(clk),
                       .reset_x(reset_x),
                       .enb(enb),
                       .Set(Set),
                       .Reset(Reset),
                       .Q(Discrete_out1)
                       );

  assign Q = Discrete_out1;

endmodule  // Set_Reset_Flip_Flop
