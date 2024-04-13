call xvlog Discrete.v
call xvlog Set_Reset_Flip_Flop.v
call xvlog Source.v
call xvlog -sv gm_commrshdl_ref_dpi.sv Source_dpi_tb.sv
call xelab Source_dpi_tb  -L work -sv_root ./ -sv_lib gm_commrshdl_ref_win64.dll -R