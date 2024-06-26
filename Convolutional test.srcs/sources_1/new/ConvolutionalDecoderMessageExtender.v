// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\commrshdl\ConvolutionalDecoderMessageExtender.v
// Created: 2024-04-11 04:03:31
// 
// Generated by MATLAB 23.2, HDL Coder 23.2, and Simulink 23.2
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: ConvolutionalDecoderMessageExtender
// Source Path: 
// Hierarchy Level: 2
// Model version: 9.74
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module ConvolutionalDecoderMessageExtender
          (clk,
           reset_x,
           enb,
           data_0,
           data_1,
           data_2,
           ctrl_start,
           ctrl_end,
           ctrl_valid,
           varargout_1_0,
           varargout_1_1,
           varargout_1_2,
           varargout_2,
           varargout_3,
           varargout_4,
           varargout_5);


  input   clk;
  input   reset_x;
  input   enb;
  input   data_0;  // boolean
  input   data_1;  // boolean
  input   data_2;  // boolean
  input   ctrl_start;
  input   ctrl_end;
  input   ctrl_valid;
  output  varargout_1_0;  // boolean
  output  varargout_1_1;  // boolean
  output  varargout_1_2;  // boolean
  output  varargout_2;
  output  varargout_3;
  output  varargout_4;
  output  varargout_5;


  wire [2:0] dataSplit;  // ufix1 [3]
  wire [2:0] dataInFi;  // ufix1 [3]
  wire [2:0] dataIn;  // boolean [3]
  wire [2:0] data;  // boolean [3]
  reg  [2:0] obj_messageExtender_dataIn;  // boolean [3]
  wire [2:0] obj_messageExtender_dataIn_1;  // boolean [3]
  wire [2:0] dataIn_1;  // boolean [3]
  wire [2:0] dataInFi_1;  // ufix1 [3]
  wire [2:0] ramDataIn;  // ufix3
  wire tmp;
  wire tmp_1;
  wire tmp_2;
  wire [1:0] fsmNext_state;  // ufix2
  wire [1:0] fsmNext_state_1;  // ufix2
  wire [1:0] fsmNext_state_2;  // ufix2
  wire [1:0] fsmNext_state_3;  // ufix2
  wire [1:0] fsmNext_state_4;  // ufix2
  wire [1:0] tmp_3;  // ufix2
  wire [1:0] tmp_4;  // ufix2
  wire [1:0] fsmNext_state_5;  // ufix2
  reg [6:0] obj_messageExtender_fsm_extCount;  // ufix7
  wire [6:0] tmp_5;  // ufix7
  reg [1:0] obj_messageExtender_fsm_state;  // ufix2
  reg [6:0] tmp_6;  // ufix7
  wire [6:0] tmp_7;  // ufix7
  wire tmp_8;
  wire [1:0] tmp_9;  // ufix2
  reg [1:0] tmp_10;  // ufix2
  wire [1:0] tmp_11;  // ufix2
  wire tmp_12;
  wire [9:0] fsmNext_addr;  // ufix10
  wire [9:0] fsmNext_addr_1;  // ufix10
  reg [9:0] obj_messageExtender_fsm_addr;  // ufix10
  wire [9:0] tmp_13;  // ufix10
  wire [9:0] tmp_14;  // ufix10
  wire [9:0] tmp_15;  // ufix10
  reg [9:0] obj_messageExtender_fsm_endAddr;  // ufix10
  reg [9:0] tmp_16;  // ufix10
  wire [9:0] tmp_17;  // ufix10
  wire tmp_18;
  wire [9:0] tmp_19;  // ufix10
  reg [9:0] tmp_20;  // ufix10
  wire [9:0] tmp_21;  // ufix10
  wire tmp_22;
  wire fsmNext_wrEn;
  wire fsmNext_wrEn_1;
  wire tmp_23;
  reg  tmp_24;
  wire fsmNext_wrEn_2;
  wire tmp_25;
  reg  obj_messageExtender_fsm_wrEn;
  wire [2:0] ramDataOut;  // ufix3
  reg  [2:0] dataSplit_1;  // ufix1 [3]
  reg  [2:0] obj_messageExtender_dataOut;  // boolean [3]
  wire [2:0] obj_messageExtender_dataOut_1;  // boolean [3]
  wire [2:0] varargout_1;  // boolean [3]
  wire [2:0] varargout_1_3;  // boolean [3]
  wire tmp_26;
  wire fsmNext_startOut;
  wire fsmNext_startOut_1;
  wire tmp_27;
  reg  tmp_28;
  wire fsmNext_startOut_2;
  wire tmp_29;
  reg  obj_messageExtender_fsm_startOut;
  wire tmp_30;
  wire tmp_31;
  wire fsmNext_endExtOut;
  wire fsmNext_endExtOut_1;
  wire tmp_32;
  wire fsmNext_endExtOut_2;
  wire fsmNext_endExtOut_3;
  wire tmp_33;
  reg  tmp_34;
  wire fsmNext_endExtOut_4;
  wire tmp_35;
  reg  obj_messageExtender_fsm_endExtOut;
  wire tmp_36;
  wire fsmNext_validOut;
  wire fsmNext_validOut_1;
  wire tmp_37;
  reg  tmp_38;
  wire fsmNext_validOut_2;
  wire tmp_39;
  reg  obj_messageExtender_fsm_validOut;
  wire tmp_40;
  wire tmp_41;
  wire [10:0] p152tmp_1;  // ufix11
  wire [10:0] p152tmp_2;  // ufix11
  wire fsmNext_endMsgOut;
  wire fsmNext_endMsgOut_1;
  wire fsmNext_endMsgOut_2;
  wire tmp_42;
  wire tmp_43;
  reg  tmp_44;
  wire fsmNext_endMsgOut_3;
  wire tmp_45;
  reg  obj_messageExtender_fsm_endMsgOut;
  reg  [3:0] obj_messageExtender_ctrlDelay;  // boolean [4]
  reg  [3:0] tmp_46;  // boolean [4]
  wire tmp_47;
  reg  obj_messageExtender_startOut;
  wire tmp_48;
  reg  obj_messageExtender_endExtOut;
  wire tmp_49;
  reg  obj_messageExtender_validOut;
  wire tmp_50;
  reg  obj_messageExtender_endMsgOut;
  reg [6:0] p75_tmp;  // ufix7
  reg [1:0] p81_tmp;  // ufix2
  reg [9:0] p77_tmp;  // ufix10
  reg [9:0] p79_tmp;  // ufix10
  reg  p65_tmp;
  reg  p73_tmp;
  reg  p71_tmp;
  reg  p69_tmp;
  reg  p67_tmp;


  assign dataSplit = {3{1'b0}};



  assign dataInFi = {3{1'b0}};



  assign dataIn = {3{1'b0}};



  assign data[0] = data_0;
  assign data[1] = data_1;
  assign data[2] = data_2;

  assign obj_messageExtender_dataIn_1 = data;



  always @(posedge clk)
    begin : obj_messageExtender_dataIn_reg_process
      if (reset_x == 1'b1) begin
        obj_messageExtender_dataIn <= {3{1'b0}};
      end
      else begin
        if (enb) begin
          obj_messageExtender_dataIn <= obj_messageExtender_dataIn_1;
        end
      end
    end



  assign dataIn_1 = obj_messageExtender_dataIn;




  genvar t_02;
  generate
    for(t_02 = 32'sd0; t_02 <= 32'sd2; t_02 = t_02 + 32'sd1) begin:dataInFi_1_gen
      assign dataInFi_1[t_02] = dataIn_1[t_02];
    end
  endgenerate




  assign ramDataIn = {dataInFi_1[0], dataInFi_1[1], dataInFi_1[2]};



  assign tmp = ctrl_valid && ctrl_start;



  assign tmp_1 = ctrl_valid && ctrl_start;



  assign tmp_2 = ctrl_valid && ctrl_start;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp147
  assign fsmNext_state = 2'b11;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp147
  assign fsmNext_state_1 = 2'b00;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp119
  assign fsmNext_state_2 = 2'b01;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp156
  assign fsmNext_state_3 = 2'b01;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp156
  assign fsmNext_state_4 = 2'b10;



  // HDL code generation from MATLAB function: SystemCore_stepImpl
  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp119
  assign tmp_3 = (ctrl_end == 1'b0 ? fsmNext_state_3 :
              fsmNext_state_4);



  assign tmp_4 = (ctrl_valid == 1'b0 ? fsmNext_state_2 :
              tmp_3);



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp59
  assign fsmNext_state_5 = 2'b01;



  assign tmp_5 = obj_messageExtender_fsm_extCount + 7'b0000001;



  always @(obj_messageExtender_fsm_extCount, obj_messageExtender_fsm_state, tmp_5) begin
    case ( obj_messageExtender_fsm_state)
      2'b01 :
        begin
          p75_tmp = obj_messageExtender_fsm_extCount;
        end
      2'b10 :
        begin
          p75_tmp = 7'b0000000;
        end
      2'b11 :
        begin
          p75_tmp = tmp_5;
        end
      default :
        begin
          p75_tmp = 7'b0000000;
        end
    endcase
    tmp_6 = p75_tmp;
  end



  assign tmp_7 = (tmp_2 == 1'b0 ? tmp_6 :
              obj_messageExtender_fsm_extCount);



  always @(posedge clk)
    begin : obj_messageExtender_fsm_extCount_reg_process
      if (reset_x == 1'b1) begin
        obj_messageExtender_fsm_extCount <= 7'b0000000;
      end
      else begin
        if (enb) begin
          obj_messageExtender_fsm_extCount <= tmp_7;
        end
      end
    end



  assign tmp_8 = obj_messageExtender_fsm_extCount == 7'b1001110;



  assign tmp_9 = (tmp_8 == 1'b0 ? fsmNext_state :
              fsmNext_state_1);



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp59
  always @(obj_messageExtender_fsm_state, tmp_4, tmp_9) begin
    case ( obj_messageExtender_fsm_state)
      2'b01 :
        begin
          p81_tmp = tmp_4;
        end
      2'b10 :
        begin
          p81_tmp = 2'b11;
        end
      2'b11 :
        begin
          p81_tmp = tmp_9;
        end
      default :
        begin
          p81_tmp = 2'b00;
        end
    endcase
    tmp_10 = p81_tmp;
  end



  assign tmp_11 = (tmp_1 == 1'b0 ? tmp_10 :
              fsmNext_state_5);



  always @(posedge clk)
    begin : obj_messageExtender_fsm_state_reg_process
      if (reset_x == 1'b1) begin
        obj_messageExtender_fsm_state <= 2'b00;
      end
      else begin
        if (enb) begin
          obj_messageExtender_fsm_state <= tmp_11;
        end
      end
    end



  assign tmp_12 = ctrl_valid && ctrl_start;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp138
  assign fsmNext_addr = 10'b0000000000;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp54
  assign fsmNext_addr_1 = 10'b0000000000;



  assign tmp_13 = obj_messageExtender_fsm_addr + 10'b0000000001;



  assign tmp_14 = (ctrl_valid == 1'b0 ? obj_messageExtender_fsm_addr :
              tmp_13);



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp138
  assign tmp_15 = obj_messageExtender_fsm_addr + 10'b0000000001;



  always @(obj_messageExtender_fsm_addr, obj_messageExtender_fsm_endAddr,
       obj_messageExtender_fsm_state) begin
    case ( obj_messageExtender_fsm_state)
      2'b01 :
        begin
          p77_tmp = obj_messageExtender_fsm_endAddr;
        end
      2'b10 :
        begin
          p77_tmp = obj_messageExtender_fsm_addr;
        end
      2'b11 :
        begin
          p77_tmp = obj_messageExtender_fsm_endAddr;
        end
      default :
        begin
          p77_tmp = obj_messageExtender_fsm_endAddr;
        end
    endcase
    tmp_16 = p77_tmp;
  end



  assign tmp_17 = (tmp_12 == 1'b0 ? tmp_16 :
              obj_messageExtender_fsm_endAddr);



  always @(posedge clk)
    begin : obj_messageExtender_fsm_endAddr_reg_process
      if (reset_x == 1'b1) begin
        obj_messageExtender_fsm_endAddr <= 10'b0000000000;
      end
      else begin
        if (enb) begin
          obj_messageExtender_fsm_endAddr <= tmp_17;
        end
      end
    end



  assign tmp_18 = obj_messageExtender_fsm_addr == obj_messageExtender_fsm_endAddr;



  assign tmp_19 = (tmp_18 == 1'b0 ? tmp_15 :
              fsmNext_addr);



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp54
  always @(obj_messageExtender_fsm_addr, obj_messageExtender_fsm_state, tmp_14, tmp_19) begin
    case ( obj_messageExtender_fsm_state)
      2'b01 :
        begin
          p79_tmp = tmp_14;
        end
      2'b10 :
        begin
          p79_tmp = 10'b0000000000;
        end
      2'b11 :
        begin
          p79_tmp = tmp_19;
        end
      default :
        begin
          p79_tmp = obj_messageExtender_fsm_addr;
        end
    endcase
    tmp_20 = p79_tmp;
  end



  assign tmp_21 = (tmp == 1'b0 ? tmp_20 :
              fsmNext_addr_1);



  always @(posedge clk)
    begin : obj_messageExtender_fsm_addr_reg_process
      if (reset_x == 1'b1) begin
        obj_messageExtender_fsm_addr <= 10'b0000000000;
      end
      else begin
        if (enb) begin
          obj_messageExtender_fsm_addr <= tmp_21;
        end
      end
    end



  assign tmp_22 = ctrl_valid && ctrl_start;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp122
  assign fsmNext_wrEn = 1'b0;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp122
  assign fsmNext_wrEn_1 = 1'b1;



  assign tmp_23 = (ctrl_valid == 1'b0 ? fsmNext_wrEn :
              fsmNext_wrEn_1);



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp23
  always @(obj_messageExtender_fsm_state, tmp_23) begin
    case ( obj_messageExtender_fsm_state)
      2'b01 :
        begin
          p65_tmp = tmp_23;
        end
      2'b10 :
        begin
          p65_tmp = 1'b0;
        end
      2'b11 :
        begin
          p65_tmp = 1'b0;
        end
      default :
        begin
          p65_tmp = 1'b0;
        end
    endcase
    tmp_24 = p65_tmp;
  end



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp23
  assign fsmNext_wrEn_2 = 1'b1;



  assign tmp_25 = (tmp_22 == 1'b0 ? tmp_24 :
              fsmNext_wrEn_2);



  always @(posedge clk)
    begin : obj_messageExtender_fsm_wrEn_reg_process
      if (reset_x == 1'b1) begin
        obj_messageExtender_fsm_wrEn <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_messageExtender_fsm_wrEn <= tmp_25;
        end
      end
    end



  SinglePortRAM_generic_block #(.AddrWidth(10),
                                .DataWidth(3)
                                )
                              u_singlePortRam (.clk(clk),
                                               .enb(enb),
                                               .din(ramDataIn),
                                               .addr(obj_messageExtender_fsm_addr),
                                               .we(obj_messageExtender_fsm_wrEn),
                                               .dout(ramDataOut)
                                               );

  always @(ramDataOut) begin
    dataSplit_1[0] = ramDataOut[2];
    dataSplit_1[1] = ramDataOut[1];
    dataSplit_1[2] = ramDataOut[0];
  end




  genvar t_011;
  generate
    for(t_011 = 32'sd0; t_011 <= 32'sd2; t_011 = t_011 + 32'sd1) begin:obj_messageExtender_dataOut_1_gen
      assign obj_messageExtender_dataOut_1[t_011] = dataSplit_1[t_011] != 1'b0;
    end
  endgenerate




  always @(posedge clk)
    begin : obj_messageExtender_dataOut_reg_process
      if (reset_x == 1'b1) begin
        obj_messageExtender_dataOut <= {3{1'b0}};
      end
      else begin
        if (enb) begin
          obj_messageExtender_dataOut <= obj_messageExtender_dataOut_1;
        end
      end
    end



  assign varargout_1 = obj_messageExtender_dataOut;



  assign varargout_1_3 = varargout_1;



  assign varargout_1_0 = varargout_1_3[0];

  assign varargout_1_1 = varargout_1_3[1];

  assign varargout_1_2 = varargout_1_3[2];

  assign tmp_26 = ctrl_valid && ctrl_start;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp131
  assign fsmNext_startOut = 1'b0;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp131
  assign fsmNext_startOut_1 = 1'b0;



  assign tmp_27 = (ctrl_valid == 1'b0 ? fsmNext_startOut :
              fsmNext_startOut_1);



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp43
  always @(obj_messageExtender_fsm_state, tmp_27) begin
    case ( obj_messageExtender_fsm_state)
      2'b01 :
        begin
          p73_tmp = tmp_27;
        end
      2'b10 :
        begin
          p73_tmp = 1'b0;
        end
      2'b11 :
        begin
          p73_tmp = 1'b0;
        end
      default :
        begin
          p73_tmp = 1'b0;
        end
    endcase
    tmp_28 = p73_tmp;
  end



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp43
  assign fsmNext_startOut_2 = 1'b1;



  assign tmp_29 = (tmp_26 == 1'b0 ? tmp_28 :
              fsmNext_startOut_2);



  always @(posedge clk)
    begin : obj_messageExtender_fsm_startOut_reg_process
      if (reset_x == 1'b1) begin
        obj_messageExtender_fsm_startOut <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_messageExtender_fsm_startOut <= tmp_29;
        end
      end
    end



  assign tmp_30 = ctrl_valid && ctrl_start;



  assign tmp_31 = obj_messageExtender_fsm_extCount == 7'b1001110;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp143
  assign fsmNext_endExtOut = 1'b0;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp143
  assign fsmNext_endExtOut_1 = 1'b1;



  assign tmp_32 = (tmp_31 == 1'b0 ? fsmNext_endExtOut :
              fsmNext_endExtOut_1);



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp128
  assign fsmNext_endExtOut_2 = 1'b0;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp128
  assign fsmNext_endExtOut_3 = 1'b0;



  assign tmp_33 = (ctrl_valid == 1'b0 ? fsmNext_endExtOut_2 :
              fsmNext_endExtOut_3);



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp38
  always @(obj_messageExtender_fsm_state, tmp_32, tmp_33) begin
    case ( obj_messageExtender_fsm_state)
      2'b01 :
        begin
          p71_tmp = tmp_33;
        end
      2'b10 :
        begin
          p71_tmp = 1'b0;
        end
      2'b11 :
        begin
          p71_tmp = tmp_32;
        end
      default :
        begin
          p71_tmp = 1'b0;
        end
    endcase
    tmp_34 = p71_tmp;
  end



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp38
  assign fsmNext_endExtOut_4 = 1'b0;



  assign tmp_35 = (tmp_30 == 1'b0 ? tmp_34 :
              fsmNext_endExtOut_4);



  always @(posedge clk)
    begin : obj_messageExtender_fsm_endExtOut_reg_process
      if (reset_x == 1'b1) begin
        obj_messageExtender_fsm_endExtOut <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_messageExtender_fsm_endExtOut <= tmp_35;
        end
      end
    end



  assign tmp_36 = ctrl_valid && ctrl_start;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp125
  assign fsmNext_validOut = 1'b0;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp125
  assign fsmNext_validOut_1 = 1'b1;



  assign tmp_37 = (ctrl_valid == 1'b0 ? fsmNext_validOut :
              fsmNext_validOut_1);



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp33
  always @(obj_messageExtender_fsm_state, tmp_37) begin
    case ( obj_messageExtender_fsm_state)
      2'b01 :
        begin
          p69_tmp = tmp_37;
        end
      2'b10 :
        begin
          p69_tmp = 1'b1;
        end
      2'b11 :
        begin
          p69_tmp = 1'b1;
        end
      default :
        begin
          p69_tmp = 1'b0;
        end
    endcase
    tmp_38 = p69_tmp;
  end



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp33
  assign fsmNext_validOut_2 = 1'b1;



  assign tmp_39 = (tmp_36 == 1'b0 ? tmp_38 :
              fsmNext_validOut_2);



  always @(posedge clk)
    begin : obj_messageExtender_fsm_validOut_reg_process
      if (reset_x == 1'b1) begin
        obj_messageExtender_fsm_validOut <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_messageExtender_fsm_validOut <= tmp_39;
        end
      end
    end



  assign tmp_40 = ctrl_valid && ctrl_start;



  assign p152tmp_1 = {1'b0, obj_messageExtender_fsm_addr};
  assign p152tmp_2 = {1'b0, obj_messageExtender_fsm_endAddr};
  assign tmp_41 = p152tmp_1 == (p152tmp_2 - 11'b00000000001);



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp116
  assign fsmNext_endMsgOut = 1'b0;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp153
  assign fsmNext_endMsgOut_1 = 1'b0;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp153
  assign fsmNext_endMsgOut_2 = 1'b1;



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp116
  assign tmp_42 = (ctrl_end == 1'b0 ? fsmNext_endMsgOut_1 :
              fsmNext_endMsgOut_2);



  assign tmp_43 = (ctrl_valid == 1'b0 ? fsmNext_endMsgOut :
              tmp_42);



  // HDL code generation from MATLAB function: SystemCore_stepImpl_falseregionp28
  always @(obj_messageExtender_fsm_state, tmp_41, tmp_43) begin
    case ( obj_messageExtender_fsm_state)
      2'b01 :
        begin
          p67_tmp = tmp_43;
        end
      2'b10 :
        begin
          p67_tmp = 1'b0;
        end
      2'b11 :
        begin
          p67_tmp = tmp_41;
        end
      default :
        begin
          p67_tmp = 1'b0;
        end
    endcase
    tmp_44 = p67_tmp;
  end



  // HDL code generation from MATLAB function: SystemCore_stepImpl_trueregionp28
  assign fsmNext_endMsgOut_3 = 1'b0;



  assign tmp_45 = (tmp_40 == 1'b0 ? tmp_44 :
              fsmNext_endMsgOut_3);



  always @(posedge clk)
    begin : obj_messageExtender_fsm_endMsgOut_reg_process
      if (reset_x == 1'b1) begin
        obj_messageExtender_fsm_endMsgOut <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_messageExtender_fsm_endMsgOut <= tmp_45;
        end
      end
    end



  always @(obj_messageExtender_fsm_endExtOut, obj_messageExtender_fsm_endMsgOut,
       obj_messageExtender_fsm_startOut, obj_messageExtender_fsm_validOut) begin
    tmp_46[0] = obj_messageExtender_fsm_startOut;
    tmp_46[1] = obj_messageExtender_fsm_endExtOut;
    tmp_46[2] = obj_messageExtender_fsm_validOut;
    tmp_46[3] = obj_messageExtender_fsm_endMsgOut;
  end



  always @(posedge clk)
    begin : obj_messageExtender_ctrlDelay_reg_process
      if (reset_x == 1'b1) begin
        obj_messageExtender_ctrlDelay <= {4{1'b0}};
      end
      else begin
        if (enb) begin
          obj_messageExtender_ctrlDelay <= tmp_46;
        end
      end
    end



  assign tmp_47 = obj_messageExtender_ctrlDelay[0];



  always @(posedge clk)
    begin : obj_messageExtender_startOut_reg_process
      if (reset_x == 1'b1) begin
        obj_messageExtender_startOut <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_messageExtender_startOut <= tmp_47;
        end
      end
    end



  assign varargout_2 = obj_messageExtender_startOut;

  assign tmp_48 = obj_messageExtender_ctrlDelay[1];



  always @(posedge clk)
    begin : obj_messageExtender_endExtOut_reg_process
      if (reset_x == 1'b1) begin
        obj_messageExtender_endExtOut <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_messageExtender_endExtOut <= tmp_48;
        end
      end
    end



  assign varargout_3 = obj_messageExtender_endExtOut;

  assign tmp_49 = obj_messageExtender_ctrlDelay[2];



  always @(posedge clk)
    begin : obj_messageExtender_validOut_reg_process
      if (reset_x == 1'b1) begin
        obj_messageExtender_validOut <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_messageExtender_validOut <= tmp_49;
        end
      end
    end



  assign varargout_4 = obj_messageExtender_validOut;

  assign tmp_50 = obj_messageExtender_ctrlDelay[3];



  always @(posedge clk)
    begin : obj_messageExtender_endMsgOut_reg_process
      if (reset_x == 1'b1) begin
        obj_messageExtender_endMsgOut <= 1'b0;
      end
      else begin
        if (enb) begin
          obj_messageExtender_endMsgOut <= tmp_50;
        end
      end
    end



  assign varargout_5 = obj_messageExtender_endMsgOut;

endmodule  // ConvolutionalDecoderMessageExtender

