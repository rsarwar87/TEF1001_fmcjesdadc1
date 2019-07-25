#------------------
# FMC Card
#----------

#set_property PACKAGE_PIN {} [get_ports {CLK_PCIe_100MHz_clk_p[0]}]
#set_property PACKAGE_PIN {} [get_ports {CLK_PCIe_100MHz_clk_n[0]}]
set_property PACKAGE_PIN D6 [get_ports rx_ref_clk_p]
set_property PACKAGE_PIN D5 [get_ports rx_ref_clk_n]

## Clear out the GTX; otherwise you cannot assign the RX GTX
#set_property PACKAGE_PIN {} [get_ports {rx_data_p[0]}]
#set_property PACKAGE_PIN {} [get_ports {rx_data_n[0]}]
#set_property PACKAGE_PIN {} [get_ports {rx_data_p[1]}]
#set_property PACKAGE_PIN {} [get_ports {rx_data_n[1]}]
#set_property PACKAGE_PIN {} [get_ports {rx_data_p[2]}]
#set_property PACKAGE_PIN {} [get_ports {rx_data_n[2]}]
#set_property PACKAGE_PIN {} [get_ports {rx_data_p[3]}]
#set_property PACKAGE_PIN {} [get_ports {rx_data_n[3]}]
#set_property PACKAGE_PIN {} [get_ports {pcie_7x_mgt_rxn[3]}]
#set_property PACKAGE_PIN {} [get_ports {pcie_7x_mgt_rxp[3]}]
#set_property PACKAGE_PIN {} [get_ports {pcie_7x_mgt_txn[3]}]
#set_property PACKAGE_PIN {} [get_ports {pcie_7x_mgt_txp[3]}]
#set_property PACKAGE_PIN {} [get_ports {pcie_7x_mgt_rxn[2]}]
#set_property PACKAGE_PIN {} [get_ports {pcie_7x_mgt_rxp[2]}]
#set_property PACKAGE_PIN {} [get_ports {pcie_7x_mgt_txn[2]}]
#set_property PACKAGE_PIN {} [get_ports {pcie_7x_mgt_txp[2]}]
#set_property PACKAGE_PIN {} [get_ports {pcie_7x_mgt_rxn[1]}]
#set_property PACKAGE_PIN {} [get_ports {pcie_7x_mgt_rxp[1]}]
#set_property PACKAGE_PIN {} [get_ports {pcie_7x_mgt_txn[1]}]
#set_property PACKAGE_PIN {} [get_ports {pcie_7x_mgt_txp[1]}]
#set_property PACKAGE_PIN {} [get_ports {pcie_7x_mgt_rxn[0]}]
#set_property PACKAGE_PIN {} [get_ports {pcie_7x_mgt_rxp[0]}]
#set_property PACKAGE_PIN {} [get_ports {pcie_7x_mgt_txn[0]}]
#set_property PACKAGE_PIN {} [get_ports {pcie_7x_mgt_txp[0]}]
# Assign RX GTX
set_property -dict {PACKAGE_PIN B6} [get_ports {rx_data_p[0]}]
set_property -dict {PACKAGE_PIN B5} [get_ports {rx_data_n[0]}]
set_property -dict {PACKAGE_PIN C4} [get_ports {rx_data_p[1]}]
set_property -dict {PACKAGE_PIN C3} [get_ports {rx_data_n[1]}]
set_property -dict {PACKAGE_PIN E4} [get_ports {rx_data_p[2]}]
set_property -dict {PACKAGE_PIN E3} [get_ports {rx_data_n[2]}]
set_property -dict {PACKAGE_PIN G4} [get_ports {rx_data_p[3]}]
set_property -dict {PACKAGE_PIN G3} [get_ports {rx_data_n[3]}]

set_property  -dict {PACKAGE_PIN  J16   IOSTANDARD LVCMOS18} [get_ports spi_csn_0]                      ; ## G34  FMC_HPC_LA31_N
set_property  -dict {PACKAGE_PIN  J15   IOSTANDARD LVCMOS18} [get_ports spi_clk]                      ; ## G33  FMC_HPC_LA31_P
set_property  -dict {PACKAGE_PIN  L17   IOSTANDARD LVCMOS18} [get_ports spi_sdio]                     ; ## H37  FMC_HPC_LA32_P

set_property  -dict {PACKAGE_PIN  M17   IOSTANDARD LVCMOS18} [get_ports rx_sync]                      ; ## G36  FMC_HPC_LA33_P
set_property  -dict {PACKAGE_PIN  L18   IOSTANDARD LVCMOS18} [get_ports rx_sysref]                    ; ## G37  FMC_HPC_LA33_N


#USER LED Matrix
#

#USER LEDS CONNECTED TO A FMC_ADJ VCCO BANK (default config 1.8V)
set_property PACKAGE_PIN K25 [get_ports {USR_LED[0]}]
set_property PACKAGE_PIN K26 [get_ports {USR_LED[1]}]
set_property PACKAGE_PIN P26 [get_ports {USR_LED[2]}]
set_property PACKAGE_PIN R26 [get_ports {USR_LED[3]}]
set_property PACKAGE_PIN N16 [get_ports {USR_LED[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {USR_LED[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {USR_LED[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {USR_LED[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {USR_LED[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {USR_LED[4]}]

#USER LEDS CONNECTED TO A 1.8V VCCO BANK
set_property PACKAGE_PIN J26 [get_ports {USR_LED[5]}]
set_property PACKAGE_PIN H26 [get_ports {USR_LED[6]}]
set_property PACKAGE_PIN E26 [get_ports {USR_LED[7]}]
set_property PACKAGE_PIN A24 [get_ports {USR_LED[8]}]
set_property IOSTANDARD LVCMOS18 [get_ports {USR_LED[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {USR_LED[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {USR_LED[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {USR_LED[8]}]

#USER LED CONNECTED TO A FMC_ADJ VCCO BANK (default config 1.8V)
set_property PACKAGE_PIN F19 [get_ports {USR_LED[9]}]
set_property IOSTANDARD LVCMOS18 [get_ports {USR_LED[9]}]


#----------
#USER LED over CPLD
# FEX11
set_property PACKAGE_PIN B21 [get_ports {USR_CPLD_LED[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {USR_CPLD_LED[0]}]
#----------
#CLK DDR3
#AC9 /AD9 for REV01
#AB11 / AC11 for REV02
##set_property PACKAGE_PIN AB11 [get_ports CLK_DDR3_200MHz_clk_p]
##set_property PACKAGE_PIN AC11 [get_ports CLK_DDR3_200MHz_clk_n]
##set_property IOSTANDARD DIFF_SSTL15 [get_ports CLK_DDR3_200MHz_clk_p]
##set_property IOSTANDARD DIFF_SSTL15 [get_ports CLK_DDR3_200MHz_clk_n]
#----------
#QSPI
set_property PACKAGE_PIN C23 [get_ports {spi_rtl_ss_io[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {spi_rtl_ss_io[0]}]
set_property PACKAGE_PIN B24 [get_ports spi_rtl_io0_io]
set_property PACKAGE_PIN A25 [get_ports spi_rtl_io1_io]
set_property PACKAGE_PIN B22 [get_ports spi_rtl_io2_io]
set_property PACKAGE_PIN A22 [get_ports spi_rtl_io3_io]
set_property IOSTANDARD LVCMOS18 [get_ports spi_rtl_io0_io]
set_property IOSTANDARD LVCMOS18 [get_ports spi_rtl_io1_io]
set_property IOSTANDARD LVCMOS18 [get_ports spi_rtl_io2_io]
set_property IOSTANDARD LVCMOS18 [get_ports spi_rtl_io3_io]
#----------
#IIC to CPLD
set_property PACKAGE_PIN G26 [get_ports SCF_cpld_1_scl]
set_property PACKAGE_PIN F25 [get_ports SCF_cpld_14_oe]
set_property PACKAGE_PIN G25 [get_ports SCF_cpld_16_sda]
set_property IOSTANDARD LVCMOS18 [get_ports SCF_cpld_1_scl]
set_property IOSTANDARD LVCMOS18 [get_ports SCF_cpld_14_oe]
set_property IOSTANDARD LVCMOS18 [get_ports SCF_cpld_16_sda]
#----------
#SI5338 CLKs
set_property PACKAGE_PIN H6 [get_ports {SI_MGT115_0_clk_p[0]}]

set_property PACKAGE_PIN G22 [get_ports {SI_FCLK_clk_p[1]}]
set_property PACKAGE_PIN D23 [get_ports {SI_FCLK_clk_p[2]}]
set_property PACKAGE_PIN G24 [get_ports {SI_FCLK_clk_p[0]}]
set_property IOSTANDARD LVDS_25 [get_ports {SI_FCLK_*}]
