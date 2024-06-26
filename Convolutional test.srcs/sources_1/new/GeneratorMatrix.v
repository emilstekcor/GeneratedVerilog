// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\commrshdl\GeneratorMatrix.v
// Created: 2024-04-11 04:03:31
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: GeneratorMatrix
// Source Path: commrshdl/conv subsystem/LTE Convolutional Encoder1/GeneratorMatrix
// Hierarchy Level: 2
// Model version: 9.74
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module GeneratorMatrix
          (clk,
           reset_x,
           enb,
           dataIn,
           en,
           dataOut_0,
           dataOut_1,
           dataOut_2);


  input   clk;
  input   reset_x;
  input   enb;
  input   signed [3:0] dataIn;  // sfix4_E14
  input   en;
  output  dataOut_0;  // ufix1
  output  dataOut_1;  // ufix1
  output  dataOut_2;  // ufix1


  reg  [2:0] dataOut_3;  // ufix1 [3]
  reg  [6:0] shiftReg;  // ufix1 [7]
  reg  [6:0] shiftReg_next;  // ufix1 [7]
  reg  [6:0] shiftRegNext;  // ufix1 [7]
  reg  prodAB;  // ufix1
  reg signed [31:0] k;  // int32
  reg  [2:0] dataOut;  // ufix1 [3]
  reg signed [31:0] l;  // int32
  reg  [20:0] a0;  // ufix1 [21]
  reg  xor_temp;  // ufix1


  always @(posedge clk)
    begin : GeneratorMatrix_1_process
      if (reset_x == 1'b1) begin
        shiftReg <= {7{1'b0}};
      end
      else begin
        if (enb) begin
          shiftReg <= shiftReg_next;
        end
      end
    end

  always @* begin
    a0[0] = 1'b1;
    a0[1] = 1'b1;
    a0[2] = 1'b1;
    a0[3] = 1'b0;
    a0[4] = 1'b1;
    a0[5] = 1'b1;
    a0[6] = 1'b1;
    a0[7] = 1'b1;
    a0[8] = 1'b1;
    a0[9] = 1'b1;
    a0[10] = 1'b1;
    a0[11] = 1'b0;
    a0[12] = 1'b0;
    a0[13] = 1'b0;
    a0[14] = 1'b1;
    a0[15] = 1'b1;
    a0[16] = 1'b0;
    a0[17] = 1'b0;
    a0[18] = 1'b1;
    a0[19] = 1'b1;
    a0[20] = 1'b1;
    xor_temp = 1'b0;
    prodAB = 1'b0;
    // current state of decoder
    // shift register
    shiftRegNext = shiftReg;
    if (en) begin
      shiftRegNext[0] = 1'b0;
      shiftRegNext[32'sd6:32'sd1] = shiftReg[32'sd5:32'sd0];
    end
    // compute function output

    for(l = 32'sd0; l <= 32'sd2; l = l + 32'sd1) begin
      xor_temp = 1'b0;

      for(k = 32'sd0; k <= 32'sd6; k = k + 32'sd1) begin
        if (shiftRegNext[k] == 1'b1) begin
          prodAB = a0[l + (32'sd3 * k)];
        end
        else begin
          prodAB = 1'b0;
        end
        xor_temp = xor_temp ^ prodAB;
      end

      dataOut[l] = xor_temp;
    end

    shiftReg_next = shiftRegNext;
    dataOut_3 = dataOut;
  end



  assign dataOut_0 = dataOut_3[0];

  assign dataOut_1 = dataOut_3[1];

  assign dataOut_2 = dataOut_3[2];

endmodule  // GeneratorMatrix

