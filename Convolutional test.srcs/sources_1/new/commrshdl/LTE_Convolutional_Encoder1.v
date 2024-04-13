`timescale 1ns / 1ps

module tb_LTE_Convolutional_System;

  reg clk;
  reg reset_x;
  reg enb;
  reg signed [3:0] dataIn;
  reg ctrlIn_start;
  reg ctrlIn_end;
  reg ctrlIn_valid;
  wire ce_out;
  wire dataOut_0;
  wire dataOut_1;
  wire dataOut_2;
  wire ctrlOut_start;
  wire ctrlOut_end;
  wire ctrlOut_valid;
  
  wire data1;
  wire ctrl1_start;
  wire ctrl1_end;
  wire ctrl1_valid;

  // Instances of the encoder and decoder
  LTE_Convolutional_Encoder1 encoder (
    .clk(clk),
    .reset_x(reset_x),
    .clk_enable(enb),
    .dataIn(dataIn),
    .ctrlIn_start(ctrlIn_start),
    .ctrlIn_end(ctrlIn_end),
    .ctrlIn_valid(ctrlIn_valid),
    .ce_out(ce_out),
    .dataOut_0(dataOut_0),
    .dataOut_1(dataOut_1),
    .dataOut_2(dataOut_2),
    .ctrlOut_start(ctrlOut_start),
    .ctrlOut_end(ctrlOut_end),
    .ctrlOut_valid(ctrlOut_valid)
  );

  LTE_Convolutional_Decoder decoder (
    .clk(clk),
    .reset_x(reset_x),
    .enb(enb),
    .data_0(dataOut_0),
    .data_1(dataOut_1),
    .data_2(dataOut_2),
    .ctrl_start(ctrlOut_start),
    .ctrl_end(ctrlOut_end),
    .ctrl_valid(ctrlOut_valid),
    .data1(data1),
    .ctrl1_start(ctrl1_start),
    .ctrl1_end(ctrl1_end),
    .ctrl1_valid(ctrl1_valid)
  );

  // Clock generation
  always #5 clk = ~clk;  // Generate a 100MHz clock

  integer i;  // Loop counter for Verilog

  // Initial block for reset and sending random test pattern
  initial begin
    clk = 0;
    reset_x = 1;  // Assert reset
    enb = 0;
    dataIn = 0;
    ctrlIn_start = 0;
    ctrlIn_end = 0;
    ctrlIn_valid = 0;

    // Reset the system
    #10 reset_x = 0;  // Deassert reset
    #20 reset_x = 1;
    #20 enb = 1;  // Enable system operation

    ctrlIn_valid = 1;  // Enable valid input
    for (i = 0; i < 1000; i++) begin
        ctrlIn_start = (i == 0);  // Signal start only on the first packet
        ctrlIn_end = (i == 999);  // Signal end only on the last packet
        dataIn = $random % 16 - 8;  // Generate random data in the range -8 to 7
        #10;  // Duration of one clock cycle
    end

    ctrlIn_valid = 0;  // Turn off valid signal after last data
    #20;
    enb = 0;  // Disable system after sending data

    // Finish simulation
    #100;
    $finish;
  end

  // Monitoring outputs
  initial begin
    $monitor("Time = %t, Encoder Output = %b %b %b, Decoder Output = %b", $time, dataOut_0, dataOut_1, dataOut_2, data1);
  end

endmodule

