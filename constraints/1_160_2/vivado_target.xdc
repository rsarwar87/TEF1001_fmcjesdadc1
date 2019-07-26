
set_false_path -from [get_pins i_system_wrapper/msys_i/pcie/xdma_0/inst/msys_xdma_0_0_pcie2_to_pcie3_wrapper_i/pcie2_ip_i/U0/inst/user_lnk_up_int_reg/C] -to [get_pins {i_system_wrapper/msys_i/vio/vio_0/inst/PROBE_IN_INST/probe_in_reg_reg[131]/D}]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
