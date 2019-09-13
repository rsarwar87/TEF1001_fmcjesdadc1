// ***************************************************************************
// ***************************************************************************
// Copyright 2014 - 2017 (c) Analog Devices, Inc. All rights reserved.
//
// In this HDL repository, there are many different and unique modules, consisting
// of various HDL (Verilog or VHDL) components. The individual modules are
// developed independently, and may be accompanied by separate and unique license
// terms.
//
// The user should read each of these license terms, and understand the
// freedoms and responsibilities that he or she has by using this source/core.
//
// This core is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE.
//
// Redistribution and use of source or resulting binaries, with or without modification
// of this file, are permitted under one of the following two license terms:
//
//   1. The GNU General Public License version 2 as published by the
//      Free Software Foundation, which can be found in the top level directory
//      of this repository (LICENSE_GPL2), and also online at:
//      <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
//
// OR
//
//   2. An ADI specific BSD license, which can be found in the top level directory
//      of this repository (LICENSE_ADIBSD), and also on-line at:
//      https://github.com/analogdevicesinc/hdl/blob/master/LICENSE_ADIBSD
//      This will allow to generate bit files and not release the source code,
//      as long as it attaches to an ADI device.
//
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

module system_top (

  input                   CLK_DDR3_200MHz_clk_n,
  input                   CLK_DDR3_200MHz_clk_p,
  input       [ 0:0]      CLK_PCIe_100MHz_clk_n,
  input       [ 0:0]      CLK_PCIe_100MHz_clk_p,

  output                  DDR3_SDRAM_reset_n,
  output      [15:0]      DDR3_SDRAM_addr,
  output      [ 2:0]      DDR3_SDRAM_ba,
  output                  DDR3_SDRAM_cas_n,
  output                  DDR3_SDRAM_ras_n,
  output                  DDR3_SDRAM_we_n,
  output      [ 0:0]      DDR3_SDRAM_ck_n,
  output      [ 0:0]      DDR3_SDRAM_ck_p,
  output      [ 0:0]      DDR3_SDRAM_cke,
  output      [ 0:0]      DDR3_SDRAM_cs_n,
  output      [ 7:0]      DDR3_SDRAM_dm,
  inout       [63:0]      DDR3_SDRAM_dq,
  inout       [ 7:0]      DDR3_SDRAM_dqs_n,
  inout       [ 7:0]      DDR3_SDRAM_dqs_p,
  output      [ 0:0]      DDR3_SDRAM_odt,

  input                   rx_ref_clk_p,
  input                   rx_ref_clk_n,
  output                  rx_sysref,
  output                  rx_sync,
  input       [ 3:0]      rx_data_p,
  input       [ 3:0]      rx_data_n,
  
  output      [ 9:0]      USR_LED,
  output      [ 0:0]      USR_CPLD_LED,

  input                   PCI_PERSTN,

  output                  SCF_cpld_14_oe,
  input                   SCF_cpld_16_sda,
  output                  SCF_cpld_1_scl,
  input       [ 2:0]      SI_FCLK_clk_n,
  input       [ 2:0]      SI_FCLK_clk_p,
  input       [ 0:0]      SI_MGT115_0_clk_n,
  input       [ 0:0]      SI_MGT115_0_clk_p,

  input       [ 3:0]      pcie_7x_mgt_rxn,
  input       [ 3:0]      pcie_7x_mgt_rxp,
  output      [ 3:0]      pcie_7x_mgt_txn,
  output      [ 3:0]      pcie_7x_mgt_txp,
  
  output                  spi_csn_0,
  output                  spi_clk,
  inout                   spi_sdio,

  inout                   spi_rtl_io0_io,
  inout                   spi_rtl_io1_io,
  inout                   spi_rtl_io2_io,
  inout                   spi_rtl_io3_io,
  inout       [ 0:0]      spi_rtl_ss_io
  );

  // internal signals

  wire    [ 7:0]  spi_csn;
  wire            spi_mosi;
  wire            spi_miso;
  wire     [31:0] gpio; 
  
  wire            rx_ref_clk;
  wire            rx_clk;
    

  // instantiations
  assing spi_csn_0 = spi_csn[0];
  fmcjesdadc1_spi i_fmcjesdadc1_spi (
    .spi_csn (spi_csn[0]),
    .spi_clk (spi_clk),
    .spi_mosi (spi_mosi),
    .spi_miso (spi_miso),
    .spi_sdio (spi_sdio));

  ad_sysref_gen #(.SYSREF_PERIOD(64)) i_sysref (
    .core_clk (rx_clk),
    .sysref_en (gpio[0]), //TODO: WHAT IS THIS??
    .sysref_out (rx_sysref));

  // instantiations

  msys_wrapper i_system_wrapper (
    .CLK_DDR3_200MHz_clk_n(CLK_DDR3_200MHz_clk_n),
    .CLK_DDR3_200MHz_clk_p(CLK_DDR3_200MHz_clk_p),

    .DDR3_SDRAM_addr(DDR3_SDRAM_addr),
    .DDR3_SDRAM_ba(DDR3_SDRAM_ba),
    .DDR3_SDRAM_cas_n(DDR3_SDRAM_cas_n),
    .DDR3_SDRAM_ck_n(DDR3_SDRAM_ck_n),
    .DDR3_SDRAM_ck_p(DDR3_SDRAM_ck_p),
    .DDR3_SDRAM_cke(DDR3_SDRAM_cke),
    .DDR3_SDRAM_cs_n(DDR3_SDRAM_cs_n),
    .DDR3_SDRAM_dm(DDR3_SDRAM_dm),
    .DDR3_SDRAM_dq(DDR3_SDRAM_dq),
    .DDR3_SDRAM_dqs_n(DDR3_SDRAM_dqs_n),
    .DDR3_SDRAM_dqs_p(DDR3_SDRAM_dqs_p),
    .DDR3_SDRAM_odt(DDR3_SDRAM_odt),
    .DDR3_SDRAM_ras_n(DDR3_SDRAM_ras_n),
    .DDR3_SDRAM_reset_n(DDR3_SDRAM_reset_n),
    .DDR3_SDRAM_we_n(DDR3_SDRAM_we_n),
    
    .CLK_PCIe_100MHz_clk_n(CLK_PCIe_100MHz_clk_n),
    .CLK_PCIe_100MHz_clk_p(CLK_PCIe_100MHz_clk_p),
    .pcie_7x_mgt_rxn(pcie_7x_mgt_rxn),
    .pcie_7x_mgt_rxp(pcie_7x_mgt_rxp),
    .pcie_7x_mgt_txn(pcie_7x_mgt_txn),
    .pcie_7x_mgt_txp(pcie_7x_mgt_txp),
    .PCI_PERSTN(PCI_PERSTN),
    
    //iic
    .SCF_cpld_14_oe(SCF_cpld_14_oe),
    .SCF_cpld_16_sda(SCF_cpld_16_sda),
    .SCF_cpld_1_scl(SCF_cpld_1_scl),
    
    .SI_FCLK_clk_n(SI_FCLK_clk_n),
    .SI_FCLK_clk_p(SI_FCLK_clk_p),
    .SI_MGT115_0_clk_n(SI_MGT115_0_clk_n),
    .SI_MGT115_0_clk_p(SI_MGT115_0_clk_p),
    
    .USR_CPLD_LED(USR_CPLD_LED),
    .USR_LED(USR_LED),
    
    .rx_data_0_n (rx_data_n[0]),
    .rx_data_0_p (rx_data_p[0]),
    .rx_data_1_n (rx_data_n[1]),
    .rx_data_1_p (rx_data_p[1]),
    .rx_data_2_n (rx_data_n[2]),
    .rx_data_2_p (rx_data_p[2]),
    .rx_data_3_n (rx_data_n[3]),
    .rx_data_3_p (rx_data_p[3]),
    .rx_ref_clk_clk_p (rx_ref_clk_p),
    .rx_ref_clk_clk_n (rx_ref_clk_n),
    .rx_sync (rx_sync),
    .rx_sysref (rx_sysref),
    .rx_core_clk (rx_clk),
    
    .spi_rtl_io0_io(spi_rtl_io0_io),
    .spi_rtl_io1_io(spi_rtl_io1_io),
    .spi_rtl_io2_io(spi_rtl_io2_io),
    .spi_rtl_io3_io(spi_rtl_io3_io),
    .spi_rtl_ss_io(spi_rtl_ss_io),

    .gpio_o(gpio),
    
    .spi_clk_i (spi_clk),
    .spi_clk_o (spi_clk),
    .spi_csn_i (spi_csn),
    .spi_csn_o (spi_csn),
    .spi_sdi_i (spi_miso),
    .spi_sdo_i (spi_mosi),
    .spi_sdo_o (spi_mosi)
    );

endmodule

// ***************************************************************************
// ***************************************************************************
