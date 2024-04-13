// -------------------------------------------------------------
// 
// File Name: C:\Users\kyle\Desktop\Convolutional test\Convolutional test.srcs\sources_1\new\commrshdl\conv_subsystem_tb.v
// Created: 2024-04-11 04:39:49
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 1
// Target subsystem base rate: 1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: conv_subsystem_tb
// Source Path: 
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module conv_subsystem_tb;



  reg  clk;
  reg  reset_x;
  wire clk_enable;
  wire signed [3:0] rawData_enc_data_in;  // sfix4_E14
  wire dec_valid_out_done;  // ufix1
  wire rdEnb;
  wire dec_valid_out_done_enb;  // ufix1
  reg [11:0] dec_data_out_addr;  // ufix12
  wire dec_valid_out_lastAddr;  // ufix1
  wire resetn;
  reg  check4_done;  // ufix1
  wire dec_end_out_done;  // ufix1
  wire dec_end_out_done_enb;  // ufix1
  wire dec_end_out_lastAddr;  // ufix1
  reg  check3_done;  // ufix1
  wire dec_start_out_done;  // ufix1
  wire dec_start_out_done_enb;  // ufix1
  wire dec_start_out_lastAddr;  // ufix1
  reg  check2_done;  // ufix1
  wire dec_data_out_done;  // ufix1
  wire dec_data_out_done_enb;  // ufix1
  wire dec_data_out_active;  // ufix1
  reg [11:0] Source_out1_addr;  // ufix12
  wire [11:0] Source_out4_addr_delay_1;  // ufix12
  reg  tb_enb_delay;
  reg signed [31:0] fp_enc_valid_in;  // sfix32
  reg  rawData_enc_valid_in;
  reg signed [31:0] status_enc_valid_in;  // sfix32
  reg  holdData_enc_valid_in;
  reg  enc_valid_in_offset;
  wire enc_valid_in;
  wire [11:0] Source_out3_addr_delay_1;  // ufix12
  reg signed [31:0] fp_enc_end_in;  // sfix32
  reg  rawData_enc_end_in;
  reg signed [31:0] status_enc_end_in;  // sfix32
  reg  holdData_enc_end_in;
  reg  enc_end_in_offset;
  wire enc_end_in;
  wire Source_out1_active;  // ufix1
  wire Source_out1_enb;  // ufix1
  wire [11:0] Source_out2_addr_delay_1;  // ufix12
  reg signed [31:0] fp_enc_start_in;  // sfix32
  reg  rawData_enc_start_in;
  reg signed [31:0] status_enc_start_in;  // sfix32
  reg  holdData_enc_start_in;
  reg  enc_start_in_offset;
  wire enc_start_in;
  reg signed [3:0] holdData_enc_data_in;  // sfix4_E14
  reg signed [3:0] enc_data_in_offset;  // sfix4_E14
  wire signed [3:0] enc_data_in_1;  // sfix4_E14
  wire snkDone;
  wire snkDonen;
  wire tb_enb;
  wire ce_out;
  wire dec_data_out;
  wire dec_start_out;
  wire dec_end_out;
  wire dec_valid_out;
  wire dec_data_out_enb;  // ufix1
  wire dec_data_out_lastAddr;  // ufix1
  reg  check1_done;  // ufix1
  wire dec_data_out_expected_1;
  wire dec_data_out_ref;
  reg  dec_data_out_testFailure;  // ufix1
  wire [11:0] dec_start_out_addr_delay_1;  // ufix12
  reg signed [31:0] fp_dec_start_out_expected;  // sfix32
  reg  dec_start_out_expected;
  reg signed [31:0] status_dec_start_out_expected;  // sfix32
  wire dec_start_out_ref;
  reg  dec_start_out_testFailure;  // ufix1
  wire [11:0] dec_end_out_addr_delay_1;  // ufix12
  reg signed [31:0] fp_dec_end_out_expected;  // sfix32
  reg  dec_end_out_expected;
  reg signed [31:0] status_dec_end_out_expected;  // sfix32
  wire dec_end_out_ref;
  reg  dec_end_out_testFailure;  // ufix1
  wire [11:0] dec_valid_out_addr_delay_1;  // ufix12
  reg signed [31:0] fp_dec_valid_out_expected;  // sfix32
  reg  dec_valid_out_expected;
  reg signed [31:0] status_dec_valid_out_expected;  // sfix32
  wire dec_valid_out_ref;
  reg  dec_valid_out_testFailure;  // ufix1
  wire testFailure;  // ufix1

  function real absReal(input real num);
  begin
    if (num < 0)
      absReal = -num;
    else
      absReal = num;
  end
  endfunction

  function real floatHalfToReal;
  input [15:0] x;
  reg [63:0] conv;

  begin
    conv[63] = x[15]; // sign 
    if (x[14:10] == 5'b0) // exp 
      conv[62:52] = 11'b0; 
    else
      conv[62:52] = 1023 + (x[14:10] - 15);
    conv[51:42] = x[9:0]; // mantissa 
    conv[41:0] = 42'b0;
    if (((x[14:10] == 5'h1F) && (x[9:0] != 10'h0))) // check for NaN 
    begin
      conv[63] = 1'b0;
      conv[62:52] = 11'h7FF;
      conv[51:0] = 52'h0;
    end
    floatHalfToReal = $bitstoreal(conv);
  end
  endfunction

  function real floatSingleToReal;
  input [31:0] x;
  reg [63:0] conv;

  begin
    conv[63] = x[31]; // sign 
    if (x[30:23] == 8'b0) // exp 
      conv[62:52] = 11'b0; 
    else
      conv[62:52] = 1023 + (x[30:23] - 127);
    conv[51:29] = x[22:0]; // mantissa 
    conv[28:0] = 29'b0;
    if (((x[30:23] == 8'hFF) && (x[22:0] != 23'h0))) // check for NaN 
    begin
      conv[63] = 1'b0;
      conv[62:52] = 11'h7FF;
      conv[51:0] = 52'h0;
    end
    floatSingleToReal = $bitstoreal(conv);
  end
  endfunction

  function real floatDoubleToReal;
  input [63:0] x;
  reg [63:0] conv;

  begin
    conv[63:0] = x[63:0]; 
    if (((x[62:52] == 11'h7FF) && (x[51:0] != 52'h0))) // check for NaN 
    begin
      conv[63] = 1'b0;
      conv[62:52] = 11'h7FF;
      conv[51:0] = 52'h0;
    end
    floatDoubleToReal = $bitstoreal(conv);
  end
  endfunction

  function isFloatEpsEqual(input real a, input real b, input real eps);
  real absdiff;

  begin
    absdiff = absReal(a - b);
    if (absdiff < eps) // absolute error check 
      isFloatEpsEqual = 1;
    else if (a == b) // check infinities 
      isFloatEpsEqual = 1; 
    else if (a*b == 0.0) // either is zero 
      isFloatEpsEqual = (absdiff < eps);
    else if (absReal(a) < absReal(b)) // relative error check
      isFloatEpsEqual = absdiff/absReal(b) < eps;
    else
      isFloatEpsEqual = absdiff/absReal(a) < eps;
  end
  endfunction
  function isFloatHalfEpsEqual;
  input [15:0] x;
  input [15:0] y;
  input real eps;
  real a, b;
  real absdiff;

  begin
    a = floatHalfToReal(x);
    b = floatHalfToReal(y);
    isFloatHalfEpsEqual = isFloatEpsEqual(a, b, eps);
  end
  endfunction
  function isFloatSingleEpsEqual;
  input [31:0] x;
  input [31:0] y;
  input real eps;
  real a, b;
  real absdiff;

  begin
    a = floatSingleToReal(x);
    b = floatSingleToReal(y);
    isFloatSingleEpsEqual = isFloatEpsEqual(a, b, eps);
  end
  endfunction
  function isFloatDoubleEpsEqual;
  input [63:0] x;
  input [63:0] y;
  input real eps;
  real a, b;
  real absdiff;

  begin
    a = floatDoubleToReal(x);
    b = floatDoubleToReal(y);
    isFloatDoubleEpsEqual = isFloatEpsEqual(a, b, eps);
  end
  endfunction

  // Data source for enc_data_in
  assign rawData_enc_data_in = 4'sb0000;



  assign dec_valid_out_done_enb = dec_valid_out_done & rdEnb;



  assign dec_valid_out_lastAddr = dec_data_out_addr >= 12'b100000110100;



  assign dec_valid_out_done = dec_valid_out_lastAddr & resetn;



  // Delay to allow last sim cycle to complete
  always @(posedge clk)
    begin : checkDone_4
      if (reset_x) begin
        check4_done <= 0;
      end
      else begin
        if (dec_valid_out_done_enb) begin
          check4_done <= dec_valid_out_done;
        end
      end
    end

  assign dec_end_out_done_enb = dec_end_out_done & rdEnb;



  assign dec_end_out_lastAddr = dec_data_out_addr >= 12'b100000110100;



  assign dec_end_out_done = dec_end_out_lastAddr & resetn;



  // Delay to allow last sim cycle to complete
  always @(posedge clk)
    begin : checkDone_3
      if (reset_x) begin
        check3_done <= 0;
      end
      else begin
        if (dec_end_out_done_enb) begin
          check3_done <= dec_end_out_done;
        end
      end
    end

  assign dec_start_out_done_enb = dec_start_out_done & rdEnb;



  assign dec_start_out_lastAddr = dec_data_out_addr >= 12'b100000110100;



  assign dec_start_out_done = dec_start_out_lastAddr & resetn;



  // Delay to allow last sim cycle to complete
  always @(posedge clk)
    begin : checkDone_2
      if (reset_x) begin
        check2_done <= 0;
      end
      else begin
        if (dec_start_out_done_enb) begin
          check2_done <= dec_start_out_done;
        end
      end
    end

  assign dec_data_out_done_enb = dec_data_out_done & rdEnb;



  assign dec_data_out_active = dec_data_out_addr != 12'b100000110100;



  assign #1 Source_out4_addr_delay_1 = Source_out1_addr;

  // Data source for enc_valid_in
  initial
    begin : enc_valid_in_fileread
      fp_enc_valid_in = $fopen("enc_valid_in.dat", "r");
      status_enc_valid_in = $rewind(fp_enc_valid_in);
    end

  always @(Source_out4_addr_delay_1, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_enc_valid_in <= 1'bx;
      end
      else if (rdEnb == 1) begin
        status_enc_valid_in = $fscanf(fp_enc_valid_in, "%h", rawData_enc_valid_in);
      end
    end

  // holdData reg for Source_out4
  always @(posedge clk)
    begin : stimuli_Source_out4
      if (reset_x) begin
        holdData_enc_valid_in <= 1'bx;
      end
      else begin
        holdData_enc_valid_in <= rawData_enc_valid_in;
      end
    end

  always @(rawData_enc_valid_in or rdEnb)
    begin : stimuli_Source_out4_1
      if (rdEnb == 1'b0) begin
        enc_valid_in_offset <= holdData_enc_valid_in;
      end
      else begin
        enc_valid_in_offset <= rawData_enc_valid_in;
      end
    end

  assign #2 enc_valid_in = enc_valid_in_offset;

  assign #1 Source_out3_addr_delay_1 = Source_out1_addr;

  // Data source for enc_end_in
  initial
    begin : enc_end_in_fileread
      fp_enc_end_in = $fopen("enc_end_in.dat", "r");
      status_enc_end_in = $rewind(fp_enc_end_in);
    end

  always @(Source_out3_addr_delay_1, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_enc_end_in <= 1'bx;
      end
      else if (rdEnb == 1) begin
        status_enc_end_in = $fscanf(fp_enc_end_in, "%h", rawData_enc_end_in);
      end
    end

  // holdData reg for Source_out3
  always @(posedge clk)
    begin : stimuli_Source_out3
      if (reset_x) begin
        holdData_enc_end_in <= 1'bx;
      end
      else begin
        holdData_enc_end_in <= rawData_enc_end_in;
      end
    end

  always @(rawData_enc_end_in or rdEnb)
    begin : stimuli_Source_out3_1
      if (rdEnb == 1'b0) begin
        enc_end_in_offset <= holdData_enc_end_in;
      end
      else begin
        enc_end_in_offset <= rawData_enc_end_in;
      end
    end

  assign #2 enc_end_in = enc_end_in_offset;

  assign Source_out1_active = Source_out1_addr != 12'b100000110100;



  assign Source_out1_enb = Source_out1_active & (rdEnb & tb_enb_delay);



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 2100
  always @(posedge clk)
    begin : Source_process
      if (reset_x == 1'b1) begin
        Source_out1_addr <= 12'b000000000000;
      end
      else begin
        if (Source_out1_enb) begin
          if (Source_out1_addr >= 12'b100000110100) begin
            Source_out1_addr <= 12'b000000000000;
          end
          else begin
            Source_out1_addr <= Source_out1_addr + 12'b000000000001;
          end
        end
      end
    end



  assign #1 Source_out2_addr_delay_1 = Source_out1_addr;

  // Data source for enc_start_in
  initial
    begin : enc_start_in_fileread
      fp_enc_start_in = $fopen("enc_start_in.dat", "r");
      status_enc_start_in = $rewind(fp_enc_start_in);
    end

  always @(Source_out2_addr_delay_1, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_enc_start_in <= 1'bx;
      end
      else if (rdEnb == 1) begin
        status_enc_start_in = $fscanf(fp_enc_start_in, "%h", rawData_enc_start_in);
      end
    end

  // holdData reg for Source_out2
  always @(posedge clk)
    begin : stimuli_Source_out2
      if (reset_x) begin
        holdData_enc_start_in <= 1'bx;
      end
      else begin
        holdData_enc_start_in <= rawData_enc_start_in;
      end
    end

  always @(rawData_enc_start_in or rdEnb)
    begin : stimuli_Source_out2_1
      if (rdEnb == 1'b0) begin
        enc_start_in_offset <= holdData_enc_start_in;
      end
      else begin
        enc_start_in_offset <= rawData_enc_start_in;
      end
    end

  assign #2 enc_start_in = enc_start_in_offset;

  // holdData reg for Source_out1
  always @(posedge clk)
    begin : stimuli_Source_out1
      if (reset_x) begin
        holdData_enc_data_in <= 4'bx;
      end
      else begin
        holdData_enc_data_in <= rawData_enc_data_in;
      end
    end

  always @(rawData_enc_data_in or rdEnb)
    begin : stimuli_Source_out1_1
      if (rdEnb == 1'b0) begin
        enc_data_in_offset <= holdData_enc_data_in;
      end
      else begin
        enc_data_in_offset <= rawData_enc_data_in;
      end
    end

  assign #2 enc_data_in_1 = enc_data_in_offset;

  assign snkDonen =  ~ snkDone;



  assign resetn =  ~ reset_x;



  assign tb_enb = resetn & snkDonen;



  // Delay inside enable generation: register depth 1
  always @(posedge clk)
    begin : u_enable_delay
      if (reset_x) begin
        tb_enb_delay <= 0;
      end
      else begin
        tb_enb_delay <= tb_enb;
      end
    end

  assign rdEnb = (snkDone == 1'b0 ? tb_enb_delay :
              1'b0);



  assign #2 clk_enable = rdEnb;

  initial
    begin : reset_x_gen
      reset_x <= 1'b1;
      # (20);
      @ (posedge clk)
      # (2);
      reset_x <= 1'b0;
    end

  always 
    begin : clk_gen
      clk <= 1'b1;
      # (5);
      clk <= 1'b0;
      # (5);
      if (snkDone == 1'b1) begin
        clk <= 1'b1;
        # (5);
        clk <= 1'b0;
        # (5);
        $stop;
      end
    end

  conv_subsystem u_conv_subsystem (.clk(clk),
                                   .reset_x(reset_x),
                                   .clk_enable(clk_enable),
                                   .enc_data_in(enc_data_in_1),  // sfix4_E14
                                   .enc_start_in(enc_start_in),
                                   .enc_end_in(enc_end_in),
                                   .enc_valid_in(enc_valid_in),
                                   .ce_out(ce_out),
                                   .dec_data_out(dec_data_out),
                                   .dec_start_out(dec_start_out),
                                   .dec_end_out(dec_end_out),
                                   .dec_valid_out(dec_valid_out)
                                   );

  assign dec_data_out_enb = ce_out & dec_data_out_active;



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 2100
  always @(posedge clk)
    begin : c_2_process
      if (reset_x == 1'b1) begin
        dec_data_out_addr <= 12'b000000000000;
      end
      else begin
        if (dec_data_out_enb) begin
          if (dec_data_out_addr >= 12'b100000110100) begin
            dec_data_out_addr <= 12'b000000000000;
          end
          else begin
            dec_data_out_addr <= dec_data_out_addr + 12'b000000000001;
          end
        end
      end
    end



  assign dec_data_out_lastAddr = dec_data_out_addr >= 12'b100000110100;



  assign dec_data_out_done = dec_data_out_lastAddr & resetn;



  // Delay to allow last sim cycle to complete
  always @(posedge clk)
    begin : checkDone_1
      if (reset_x) begin
        check1_done <= 0;
      end
      else begin
        if (dec_data_out_done_enb) begin
          check1_done <= dec_data_out_done;
        end
      end
    end

  assign snkDone = check4_done & (check3_done & (check1_done & check2_done));



  // Data source for dec_data_out_expected
  assign dec_data_out_expected_1 = 1'b0;



  assign dec_data_out_ref = dec_data_out_expected_1;

  always @(posedge clk)
    begin : dec_data_out_checker
      if (reset_x == 1'b1) begin
        dec_data_out_testFailure <= 1'b0;
      end
      else begin
        if (ce_out == 1'b1 && dec_data_out !== dec_data_out_ref) begin
          dec_data_out_testFailure <= 1'b1;
          $display("ERROR in dec_data_out at time %t : Expected '%h' Actual '%h'", $time, dec_data_out_ref, dec_data_out);
        end
      end
    end

  assign #1 dec_start_out_addr_delay_1 = dec_data_out_addr;

  // Data source for dec_start_out_expected
  initial
    begin : dec_start_out_expected_fileread
      fp_dec_start_out_expected = $fopen("dec_start_out_expected.dat", "r");
      status_dec_start_out_expected = $rewind(fp_dec_start_out_expected);
    end

  always @(dec_start_out_addr_delay_1, ce_out, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        dec_start_out_expected <= 1'bx;
      end
      else if (ce_out == 1) begin
        status_dec_start_out_expected = $fscanf(fp_dec_start_out_expected, "%h", dec_start_out_expected);
      end
    end

  assign dec_start_out_ref = dec_start_out_expected;

  always @(posedge clk)
    begin : dec_start_out_checker
      if (reset_x == 1'b1) begin
        dec_start_out_testFailure <= 1'b0;
      end
      else begin
        if (ce_out == 1'b1 && dec_start_out !== dec_start_out_ref) begin
          dec_start_out_testFailure <= 1'b1;
          $display("ERROR in dec_start_out at time %t : Expected '%h' Actual '%h'", $time, dec_start_out_ref, dec_start_out);
        end
      end
    end

  assign #1 dec_end_out_addr_delay_1 = dec_data_out_addr;

  // Data source for dec_end_out_expected
  initial
    begin : dec_end_out_expected_fileread
      fp_dec_end_out_expected = $fopen("dec_end_out_expected.dat", "r");
      status_dec_end_out_expected = $rewind(fp_dec_end_out_expected);
    end

  always @(dec_end_out_addr_delay_1, ce_out, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        dec_end_out_expected <= 1'bx;
      end
      else if (ce_out == 1) begin
        status_dec_end_out_expected = $fscanf(fp_dec_end_out_expected, "%h", dec_end_out_expected);
      end
    end

  assign dec_end_out_ref = dec_end_out_expected;

  always @(posedge clk)
    begin : dec_end_out_checker
      if (reset_x == 1'b1) begin
        dec_end_out_testFailure <= 1'b0;
      end
      else begin
        if (ce_out == 1'b1 && dec_end_out !== dec_end_out_ref) begin
          dec_end_out_testFailure <= 1'b1;
          $display("ERROR in dec_end_out at time %t : Expected '%h' Actual '%h'", $time, dec_end_out_ref, dec_end_out);
        end
      end
    end

  assign #1 dec_valid_out_addr_delay_1 = dec_data_out_addr;

  // Data source for dec_valid_out_expected
  initial
    begin : dec_valid_out_expected_fileread
      fp_dec_valid_out_expected = $fopen("dec_valid_out_expected.dat", "r");
      status_dec_valid_out_expected = $rewind(fp_dec_valid_out_expected);
    end

  always @(dec_valid_out_addr_delay_1, ce_out, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        dec_valid_out_expected <= 1'bx;
      end
      else if (ce_out == 1) begin
        status_dec_valid_out_expected = $fscanf(fp_dec_valid_out_expected, "%h", dec_valid_out_expected);
      end
    end

  assign dec_valid_out_ref = dec_valid_out_expected;

  always @(posedge clk)
    begin : dec_valid_out_checker
      if (reset_x == 1'b1) begin
        dec_valid_out_testFailure <= 1'b0;
      end
      else begin
        if (ce_out == 1'b1 && dec_valid_out !== dec_valid_out_ref) begin
          dec_valid_out_testFailure <= 1'b1;
          $display("ERROR in dec_valid_out at time %t : Expected '%h' Actual '%h'", $time, dec_valid_out_ref, dec_valid_out);
        end
      end
    end

  assign testFailure = dec_valid_out_testFailure | (dec_end_out_testFailure | (dec_data_out_testFailure | dec_start_out_testFailure));



  always @(posedge clk)
    begin : completed_msg
      if (snkDone == 1'b1) begin
        if (testFailure == 1'b0) begin
          $display("**************TEST COMPLETED (PASSED)**************");
        end
        else begin
          $display("**************TEST COMPLETED (FAILED)**************");
        end
      end
    end

endmodule  // conv_subsystem_tb

