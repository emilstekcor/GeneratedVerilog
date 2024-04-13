call xvlog Controller.v
call xvlog GeneratorMatrix.v
call xvlog SinglePortRAM_generic.v
call xvlog LTE_Convolutional_Encoder1.v
call xvlog Sample_Control_Bus_Creator.v
call xvlog SimpleDualPortRAM_singlebit.v
call xvlog SinglePortRAM_generic_block.v
call xvlog ConvolutionalDecoderTracebackUnit.v
call xvlog ConvolutionalDecoderMetricComputer.v
call xvlog ConvolutionalDecoderMessageExtender.v
call xvlog LTE_Convolutional_Decoder.v
call xvlog conv_subsystem.v
call xvlog -sv gm_commrshdl_ref_dpi.sv conv_subsystem_dpi_tb.sv
call xelab conv_subsystem_dpi_tb  -L work -sv_root ./ -sv_lib gm_commrshdl_ref_win64.dll -R