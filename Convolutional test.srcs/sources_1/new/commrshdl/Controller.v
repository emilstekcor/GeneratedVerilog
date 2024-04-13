// -------------------------------------------------------------
// 
// File Name: C:\Users\kyle\Desktop\Convolutional test\Convolutional test.srcs\sources_1\new\commrshdl\Controller.v
// Created: 2024-04-11 15:44:49
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Controller
// Source Path: commrshdl/conv subsystem/LTE Convolutional Encoder1/Controller
// Hierarchy Level: 1
// Model version: 9.83
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Controller
          (clk,
           reset_x,
           enb,
           dataIn,
           startIn,
           endIn,
           validIn,
           dataOut,
           ramAddr,
           ramWrEn,
           startOut,
           endOut,
           validOut);


  input   clk;
  input   reset_x;
  input   enb;
  input   signed [3:0] dataIn;  // sfix4_E14
  input   startIn;
  input   endIn;
  input   validIn;
  output  signed [3:0] dataOut;  // sfix4_E14
  output  [9:0] ramAddr;  // ufix10
  output  ramWrEn;
  output  startOut;
  output  endOut;
  output  validOut;


  reg signed [3:0] dataOut_1;  // sfix4_E14
  reg [9:0] ramAddr_1;  // ufix10
  reg  ramWrEn_1;
  reg  startOut_1;
  reg  endOut_1;
  reg  validOut_1;
  reg [1:0] encoderStateReg;  // ufix2
  reg [9:0] ramAddrReg;  // ufix10
  reg [9:0] ramAddrEndReg;  // ufix10
  reg  ramWrEnReg;
  reg [1:0] encoderStateReg_next;  // ufix2
  reg [9:0] ramAddrReg_next;  // ufix10
  reg [9:0] ramAddrEndReg_next;  // ufix10
  reg  ramWrEnReg_next;
  reg [9:0] ramAddrEndReg_temp;  // ufix10


  always @(posedge clk)
    begin : Controller_1_process
      if (reset_x == 1'b1) begin
        encoderStateReg <= 2'b00;
        ramAddrReg <= 10'b0000000000;
        ramAddrEndReg <= 10'b0000000000;
        ramWrEnReg <= 1'b0;
      end
      else begin
        if (enb) begin
          encoderStateReg <= encoderStateReg_next;
          ramAddrReg <= ramAddrReg_next;
          ramAddrEndReg <= ramAddrEndReg_next;
          ramWrEnReg <= ramWrEnReg_next;
        end
      end
    end

  always @(dataIn, encoderStateReg, endIn, ramAddrEndReg, ramAddrReg, ramWrEnReg, startIn,
       validIn) begin
    ramAddrEndReg_temp = ramAddrEndReg;
    encoderStateReg_next = encoderStateReg;
    ramAddrReg_next = ramAddrReg;
    // states
    // waiting for start
    // streaming input and writing into RAM
    // last input bit
    // stream data out of RAM through encoder
    // current state of decoder
    // buffer write address
    // value at which rd_addr counter should stop counting
    // buffer write enable
    // assign outputs
    startOut_1 = (encoderStateReg == 2'b11) && (ramAddrReg == 10'b0000000000);
    endOut_1 = (encoderStateReg == 2'b11) && (ramAddrReg == ramAddrEndReg);
    //     ready         = (encoderStateReg == ENC_IDLE);
    //----------------------------------------------------------------------------------------------
    // synchronous logic
    //----------------------------------------------------------------------------------------------
    ramWrEnReg_next = validIn && (startIn || (encoderStateReg == 2'b01));
    if (encoderStateReg == 2'b10) begin
      ramAddrEndReg_temp = ramAddrReg;
    end
    case ( encoderStateReg)
      2'b00 :
        begin
          if (validIn && startIn) begin
            encoderStateReg_next = 2'b01;
            ramAddrReg_next = 10'b0000000000;
          end
        end
      2'b01 :
        begin
          if (validIn) begin
            if (endIn) begin
              encoderStateReg_next = 2'b10;
              ramAddrReg_next = ramAddrReg + 10'b0000000001;
            end
            else if (startIn) begin
              encoderStateReg_next = 2'b01;
              ramAddrReg_next = 10'b0000000000;
            end
            else begin
              encoderStateReg_next = 2'b01;
              ramAddrReg_next = ramAddrReg + 10'b0000000001;
            end
          end
        end
      2'b10 :
        begin
          //             encoderStateReg(:) = ENC_STREAM_OUT;
          ramAddrReg_next = 10'b0000000000;
          if (validIn && startIn) begin
            encoderStateReg_next = 2'b01;
          end
          else begin
            encoderStateReg_next = 2'b11;
          end
        end
      2'b11 :
        begin
          if (validIn && startIn) begin
            ramAddrReg_next = 10'b0000000000;
            encoderStateReg_next = 2'b01;
          end
          else if (ramAddrReg == ramAddrEndReg_temp) begin
            encoderStateReg_next = 2'b00;
            ramAddrReg_next = 10'b0000000000;
          end
          else begin
            encoderStateReg_next = 2'b11;
            ramAddrReg_next = ramAddrReg + 10'b0000000001;
          end
        end
    endcase
    dataOut_1 = dataIn;
    ramAddr_1 = ramAddrReg;
    ramWrEn_1 = ramWrEnReg;
    validOut_1 = encoderStateReg == 2'b11;
    ramAddrEndReg_next = ramAddrEndReg_temp;
  end



  assign dataOut = dataOut_1;

  assign ramAddr = ramAddr_1;

  assign ramWrEn = ramWrEn_1;

  assign startOut = startOut_1;

  assign endOut = endOut_1;

  assign validOut = validOut_1;

endmodule  // Controller
