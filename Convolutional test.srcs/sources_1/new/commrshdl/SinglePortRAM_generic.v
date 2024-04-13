// -------------------------------------------------------------
// 
// File Name: C:\Users\kyle\Desktop\Convolutional test\Convolutional test.srcs\sources_1\new\commrshdl\SinglePortRAM_generic.v
// Created: 2024-04-11 15:44:49
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: SinglePortRAM_generic
// Source Path: commrshdl/conv subsystem/LTE Convolutional Encoder1/SinglePortRAM_generic
// Hierarchy Level: 1
// Model version: 9.83
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module SinglePortRAM_generic
          (clk,
           enb,
           din,
           addr,
           we,
           dout);

  parameter integer AddrWidth  = 1;
  parameter integer DataWidth  = 1;

  input   clk;
  input   enb;
  input   signed [DataWidth - 1:0] din;  // parameterized width
  input   [AddrWidth - 1:0] addr;  // parameterized width
  input   we;  // ufix1
  output  signed [DataWidth - 1:0] dout;  // parameterized width


  reg  [DataWidth - 1:0] ram [2**AddrWidth - 1:0];
  reg  [DataWidth - 1:0] data_int;
  integer i;

  initial begin
    for (i=0; i<=2**AddrWidth - 1; i=i+1) begin
      ram[i] = 0;
    end
    data_int = 0;
  end


  always @(posedge clk)
    begin : SinglePortRAM_generic_process
      if (enb == 1'b1) begin
        if (we == 1'b1) begin
          ram[addr] <= din;
        end
        data_int <= ram[addr];
      end
    end

  assign dout = data_int;

endmodule  // SinglePortRAM_generic
