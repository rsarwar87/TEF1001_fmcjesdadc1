#----------
# FEX0
set_property PACKAGE_PIN B20 [get_ports PCI_PERSTN]
set_property IOSTANDARD LVCMOS18 [get_ports PCI_PERSTN]
#----------
set_property PACKAGE_PIN K6 [get_ports {CLK_PCIe_100MHz_clk_p[0]}]
set_property PACKAGE_PIN K5 [get_ports {CLK_PCIe_100MHz_clk_n[0]}]





set_property LOC GTXE2_CHANNEL_X0Y0 [get_cells {i_system_wrapper/msys_i/pcie/xdma_0/inst/msys_xdma_0_0_pcie2_to_pcie3_wrapper_i/pcie2_ip_i/inst/inst/gt_top_i/pipe_wrapper_i/pipe_lane[3].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]
set_property PACKAGE_PIN R3 [get_ports {pcie_7x_mgt_rxn[3]}]
set_property PACKAGE_PIN R4 [get_ports {pcie_7x_mgt_rxp[3]}]
set_property PACKAGE_PIN P1 [get_ports {pcie_7x_mgt_txn[3]}]
set_property PACKAGE_PIN P2 [get_ports {pcie_7x_mgt_txp[3]}]

set_property LOC GTXE2_CHANNEL_X0Y1 [get_cells {i_system_wrapper/msys_i/pcie/xdma_0/inst/msys_xdma_0_0_pcie2_to_pcie3_wrapper_i/pcie2_ip_i/inst/inst/gt_top_i/pipe_wrapper_i/pipe_lane[2].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]
set_property PACKAGE_PIN N3 [get_ports {pcie_7x_mgt_rxn[2]}]
set_property PACKAGE_PIN N4 [get_ports {pcie_7x_mgt_rxp[2]}]
set_property PACKAGE_PIN M1 [get_ports {pcie_7x_mgt_txn[2]}]
set_property PACKAGE_PIN M2 [get_ports {pcie_7x_mgt_txp[2]}]

set_property LOC GTXE2_CHANNEL_X0Y2 [get_cells {i_system_wrapper/msys_i/pcie/xdma_0/inst/msys_xdma_0_0_pcie2_to_pcie3_wrapper_i/pcie2_ip_i/inst/inst/gt_top_i/pipe_wrapper_i/pipe_lane[1].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]
set_property PACKAGE_PIN L3 [get_ports {pcie_7x_mgt_rxn[1]}]
set_property PACKAGE_PIN L4 [get_ports {pcie_7x_mgt_rxp[1]}]
set_property PACKAGE_PIN K1 [get_ports {pcie_7x_mgt_txn[1]}]
set_property PACKAGE_PIN K2 [get_ports {pcie_7x_mgt_txp[1]}]

set_property LOC GTXE2_CHANNEL_X0Y3 [get_cells {i_system_wrapper/msys_i/pcie/xdma_0/inst/msys_xdma_0_0_pcie2_to_pcie3_wrapper_i/pcie2_ip_i/inst/inst/gt_top_i/pipe_wrapper_i/pipe_lane[0].gt_wrapper_i/gtx_channel.gtxe2_channel_i}]
set_property PACKAGE_PIN J3 [get_ports {pcie_7x_mgt_rxn[0]}]
set_property PACKAGE_PIN J4 [get_ports {pcie_7x_mgt_rxp[0]}]
set_property PACKAGE_PIN H1 [get_ports {pcie_7x_mgt_txn[0]}]
set_property PACKAGE_PIN H2 [get_ports {pcie_7x_mgt_txp[0]}]


