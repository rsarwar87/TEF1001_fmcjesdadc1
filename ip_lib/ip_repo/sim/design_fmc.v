//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
//Date        : Tue Jul 23 21:39:25 2019
//Host        : ukaea-fpga running 64-bit KDE neon User Edition 5.16
//Command     : generate_target design_fmc.bd
//Design      : design_fmc
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module axi_ad9250_jesd_imp_OCMOVV
   (device_clk,
    irq,
    phy_en_char_align,
    rx_data_tdata,
    rx_data_tvalid,
    rx_eof,
    rx_phy0_rxcharisk,
    rx_phy0_rxdata,
    rx_phy0_rxdisperr,
    rx_phy0_rxnotintable,
    rx_phy1_rxcharisk,
    rx_phy1_rxdata,
    rx_phy1_rxdisperr,
    rx_phy1_rxnotintable,
    rx_phy2_rxcharisk,
    rx_phy2_rxdata,
    rx_phy2_rxdisperr,
    rx_phy2_rxnotintable,
    rx_phy3_rxcharisk,
    rx_phy3_rxdata,
    rx_phy3_rxdisperr,
    rx_phy3_rxnotintable,
    rx_sof,
    s_axi_aclk,
    s_axi_araddr,
    s_axi_aresetn,
    s_axi_arprot,
    s_axi_arready,
    s_axi_arvalid,
    s_axi_awaddr,
    s_axi_awprot,
    s_axi_awready,
    s_axi_awvalid,
    s_axi_bready,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_rdata,
    s_axi_rready,
    s_axi_rresp,
    s_axi_rvalid,
    s_axi_wdata,
    s_axi_wready,
    s_axi_wstrb,
    s_axi_wvalid,
    sync,
    sysref);
  input device_clk;
  output irq;
  output phy_en_char_align;
  output [127:0]rx_data_tdata;
  output rx_data_tvalid;
  output [3:0]rx_eof;
  input [3:0]rx_phy0_rxcharisk;
  input [31:0]rx_phy0_rxdata;
  input [3:0]rx_phy0_rxdisperr;
  input [3:0]rx_phy0_rxnotintable;
  input [3:0]rx_phy1_rxcharisk;
  input [31:0]rx_phy1_rxdata;
  input [3:0]rx_phy1_rxdisperr;
  input [3:0]rx_phy1_rxnotintable;
  input [3:0]rx_phy2_rxcharisk;
  input [31:0]rx_phy2_rxdata;
  input [3:0]rx_phy2_rxdisperr;
  input [3:0]rx_phy2_rxnotintable;
  input [3:0]rx_phy3_rxcharisk;
  input [31:0]rx_phy3_rxdata;
  input [3:0]rx_phy3_rxdisperr;
  input [3:0]rx_phy3_rxnotintable;
  output [3:0]rx_sof;
  input s_axi_aclk;
  input s_axi_araddr;
  input s_axi_aresetn;
  input s_axi_arprot;
  output s_axi_arready;
  input s_axi_arvalid;
  input s_axi_awaddr;
  input s_axi_awprot;
  output s_axi_awready;
  input s_axi_awvalid;
  input s_axi_bready;
  output s_axi_bresp;
  output s_axi_bvalid;
  output s_axi_rdata;
  input s_axi_rready;
  output s_axi_rresp;
  output s_axi_rvalid;
  input s_axi_wdata;
  output s_axi_wready;
  input s_axi_wstrb;
  input s_axi_wvalid;
  output [0:0]sync;
  input sysref;

  wire device_clk_1;
  wire rx_axi_core_reset;
  wire rx_axi_irq;
  wire [7:0]rx_axi_rx_cfg_beats_per_multiframe;
  wire [7:0]rx_axi_rx_cfg_buffer_delay;
  wire rx_axi_rx_cfg_buffer_early_release;
  wire rx_axi_rx_cfg_disable_char_replacement;
  wire rx_axi_rx_cfg_disable_scrambler;
  wire [2:0]rx_axi_rx_cfg_err_statistics_mask;
  wire rx_axi_rx_cfg_err_statistics_reset;
  wire [3:0]rx_axi_rx_cfg_lanes_disable;
  wire [0:0]rx_axi_rx_cfg_links_disable;
  wire [7:0]rx_axi_rx_cfg_lmfc_offset;
  wire [7:0]rx_axi_rx_cfg_octets_per_frame;
  wire rx_axi_rx_cfg_sysref_disable;
  wire rx_axi_rx_cfg_sysref_oneshot;
  wire [3:0]rx_phy0_1_rxcharisk;
  wire [31:0]rx_phy0_1_rxdata;
  wire [3:0]rx_phy0_1_rxdisperr;
  wire [3:0]rx_phy0_1_rxnotintable;
  wire [3:0]rx_phy1_1_rxcharisk;
  wire [31:0]rx_phy1_1_rxdata;
  wire [3:0]rx_phy1_1_rxdisperr;
  wire [3:0]rx_phy1_1_rxnotintable;
  wire [3:0]rx_phy2_1_rxcharisk;
  wire [31:0]rx_phy2_1_rxdata;
  wire [3:0]rx_phy2_1_rxdisperr;
  wire [3:0]rx_phy2_1_rxnotintable;
  wire [3:0]rx_phy3_1_rxcharisk;
  wire [31:0]rx_phy3_1_rxdata;
  wire [3:0]rx_phy3_1_rxdisperr;
  wire [3:0]rx_phy3_1_rxnotintable;
  wire rx_phy_en_char_align;
  wire [127:0]rx_rx_data;
  wire [3:0]rx_rx_eof;
  wire rx_rx_event_sysref_alignment_error;
  wire rx_rx_event_sysref_edge;
  wire [7:0]rx_rx_ilas_config_addr;
  wire [127:0]rx_rx_ilas_config_data;
  wire [3:0]rx_rx_ilas_config_valid;
  wire [3:0]rx_rx_sof;
  wire [1:0]rx_rx_status_ctrl_state;
  wire [127:0]rx_rx_status_err_statistics_cnt;
  wire [7:0]rx_rx_status_lane_cgs_state;
  wire [3:0]rx_rx_status_lane_ifs_ready;
  wire [55:0]rx_rx_status_lane_latency;
  wire rx_rx_valid;
  wire [0:0]rx_sync;
  wire s_axi_1_ARADDR;
  wire s_axi_1_ARPROT;
  wire s_axi_1_ARREADY;
  wire s_axi_1_ARVALID;
  wire s_axi_1_AWADDR;
  wire s_axi_1_AWPROT;
  wire s_axi_1_AWREADY;
  wire s_axi_1_AWVALID;
  wire s_axi_1_BREADY;
  wire [1:0]s_axi_1_BRESP;
  wire s_axi_1_BVALID;
  wire [31:0]s_axi_1_RDATA;
  wire s_axi_1_RREADY;
  wire [1:0]s_axi_1_RRESP;
  wire s_axi_1_RVALID;
  wire s_axi_1_WDATA;
  wire s_axi_1_WREADY;
  wire s_axi_1_WSTRB;
  wire s_axi_1_WVALID;
  wire s_axi_aclk_1;
  wire s_axi_aresetn_1;
  wire sysref_1;

  assign device_clk_1 = device_clk;
  assign irq = rx_axi_irq;
  assign phy_en_char_align = rx_phy_en_char_align;
  assign rx_data_tdata[127:0] = rx_rx_data;
  assign rx_data_tvalid = rx_rx_valid;
  assign rx_eof[3:0] = rx_rx_eof;
  assign rx_phy0_1_rxcharisk = rx_phy0_rxcharisk[3:0];
  assign rx_phy0_1_rxdata = rx_phy0_rxdata[31:0];
  assign rx_phy0_1_rxdisperr = rx_phy0_rxdisperr[3:0];
  assign rx_phy0_1_rxnotintable = rx_phy0_rxnotintable[3:0];
  assign rx_phy1_1_rxcharisk = rx_phy1_rxcharisk[3:0];
  assign rx_phy1_1_rxdata = rx_phy1_rxdata[31:0];
  assign rx_phy1_1_rxdisperr = rx_phy1_rxdisperr[3:0];
  assign rx_phy1_1_rxnotintable = rx_phy1_rxnotintable[3:0];
  assign rx_phy2_1_rxcharisk = rx_phy2_rxcharisk[3:0];
  assign rx_phy2_1_rxdata = rx_phy2_rxdata[31:0];
  assign rx_phy2_1_rxdisperr = rx_phy2_rxdisperr[3:0];
  assign rx_phy2_1_rxnotintable = rx_phy2_rxnotintable[3:0];
  assign rx_phy3_1_rxcharisk = rx_phy3_rxcharisk[3:0];
  assign rx_phy3_1_rxdata = rx_phy3_rxdata[31:0];
  assign rx_phy3_1_rxdisperr = rx_phy3_rxdisperr[3:0];
  assign rx_phy3_1_rxnotintable = rx_phy3_rxnotintable[3:0];
  assign rx_sof[3:0] = rx_rx_sof;
  assign s_axi_1_ARADDR = s_axi_araddr;
  assign s_axi_1_ARPROT = s_axi_arprot;
  assign s_axi_1_ARVALID = s_axi_arvalid;
  assign s_axi_1_AWADDR = s_axi_awaddr;
  assign s_axi_1_AWPROT = s_axi_awprot;
  assign s_axi_1_AWVALID = s_axi_awvalid;
  assign s_axi_1_BREADY = s_axi_bready;
  assign s_axi_1_RREADY = s_axi_rready;
  assign s_axi_1_WDATA = s_axi_wdata;
  assign s_axi_1_WSTRB = s_axi_wstrb;
  assign s_axi_1_WVALID = s_axi_wvalid;
  assign s_axi_aclk_1 = s_axi_aclk;
  assign s_axi_aresetn_1 = s_axi_aresetn;
  assign s_axi_arready = s_axi_1_ARREADY;
  assign s_axi_awready = s_axi_1_AWREADY;
  assign s_axi_bresp = s_axi_1_BRESP[0];
  assign s_axi_bvalid = s_axi_1_BVALID;
  assign s_axi_rdata = s_axi_1_RDATA[0];
  assign s_axi_rresp = s_axi_1_RRESP[0];
  assign s_axi_rvalid = s_axi_1_RVALID;
  assign s_axi_wready = s_axi_1_WREADY;
  assign sync[0] = rx_sync;
  assign sysref_1 = sysref;
  design_fmc_rx_0 rx
       (.cfg_beats_per_multiframe(rx_axi_rx_cfg_beats_per_multiframe),
        .cfg_buffer_delay(rx_axi_rx_cfg_buffer_delay),
        .cfg_buffer_early_release(rx_axi_rx_cfg_buffer_early_release),
        .cfg_disable_char_replacement(rx_axi_rx_cfg_disable_char_replacement),
        .cfg_disable_scrambler(rx_axi_rx_cfg_disable_scrambler),
        .cfg_lanes_disable(rx_axi_rx_cfg_lanes_disable),
        .cfg_links_disable(rx_axi_rx_cfg_links_disable),
        .cfg_lmfc_offset(rx_axi_rx_cfg_lmfc_offset),
        .cfg_octets_per_frame(rx_axi_rx_cfg_octets_per_frame),
        .cfg_sysref_disable(rx_axi_rx_cfg_sysref_disable),
        .cfg_sysref_oneshot(rx_axi_rx_cfg_sysref_oneshot),
        .clk(device_clk_1),
        .ctrl_err_statistics_mask(rx_axi_rx_cfg_err_statistics_mask),
        .ctrl_err_statistics_reset(rx_axi_rx_cfg_err_statistics_reset),
        .event_sysref_alignment_error(rx_rx_event_sysref_alignment_error),
        .event_sysref_edge(rx_rx_event_sysref_edge),
        .ilas_config_addr(rx_rx_ilas_config_addr),
        .ilas_config_data(rx_rx_ilas_config_data),
        .ilas_config_valid(rx_rx_ilas_config_valid),
        .phy_charisk({rx_phy3_1_rxcharisk,rx_phy2_1_rxcharisk,rx_phy1_1_rxcharisk,rx_phy0_1_rxcharisk}),
        .phy_data({rx_phy3_1_rxdata,rx_phy2_1_rxdata,rx_phy1_1_rxdata,rx_phy0_1_rxdata}),
        .phy_disperr({rx_phy3_1_rxdisperr,rx_phy2_1_rxdisperr,rx_phy1_1_rxdisperr,rx_phy0_1_rxdisperr}),
        .phy_en_char_align(rx_phy_en_char_align),
        .phy_notintable({rx_phy3_1_rxnotintable,rx_phy2_1_rxnotintable,rx_phy1_1_rxnotintable,rx_phy0_1_rxnotintable}),
        .reset(rx_axi_core_reset),
        .rx_data(rx_rx_data),
        .rx_eof(rx_rx_eof),
        .rx_sof(rx_rx_sof),
        .rx_valid(rx_rx_valid),
        .status_ctrl_state(rx_rx_status_ctrl_state),
        .status_err_statistics_cnt(rx_rx_status_err_statistics_cnt),
        .status_lane_cgs_state(rx_rx_status_lane_cgs_state),
        .status_lane_ifs_ready(rx_rx_status_lane_ifs_ready),
        .status_lane_latency(rx_rx_status_lane_latency),
        .sync(rx_sync),
        .sysref(sysref_1));
  design_fmc_rx_axi_0 rx_axi
       (.core_cfg_beats_per_multiframe(rx_axi_rx_cfg_beats_per_multiframe),
        .core_cfg_buffer_delay(rx_axi_rx_cfg_buffer_delay),
        .core_cfg_buffer_early_release(rx_axi_rx_cfg_buffer_early_release),
        .core_cfg_disable_char_replacement(rx_axi_rx_cfg_disable_char_replacement),
        .core_cfg_disable_scrambler(rx_axi_rx_cfg_disable_scrambler),
        .core_cfg_lanes_disable(rx_axi_rx_cfg_lanes_disable),
        .core_cfg_links_disable(rx_axi_rx_cfg_links_disable),
        .core_cfg_lmfc_offset(rx_axi_rx_cfg_lmfc_offset),
        .core_cfg_octets_per_frame(rx_axi_rx_cfg_octets_per_frame),
        .core_cfg_sysref_disable(rx_axi_rx_cfg_sysref_disable),
        .core_cfg_sysref_oneshot(rx_axi_rx_cfg_sysref_oneshot),
        .core_clk(device_clk_1),
        .core_ctrl_err_statistics_mask(rx_axi_rx_cfg_err_statistics_mask),
        .core_ctrl_err_statistics_reset(rx_axi_rx_cfg_err_statistics_reset),
        .core_event_sysref_alignment_error(rx_rx_event_sysref_alignment_error),
        .core_event_sysref_edge(rx_rx_event_sysref_edge),
        .core_ilas_config_addr(rx_rx_ilas_config_addr),
        .core_ilas_config_data(rx_rx_ilas_config_data),
        .core_ilas_config_valid(rx_rx_ilas_config_valid),
        .core_reset(rx_axi_core_reset),
        .core_reset_ext(1'b0),
        .core_status_ctrl_state(rx_rx_status_ctrl_state),
        .core_status_err_statistics_cnt(rx_rx_status_err_statistics_cnt),
        .core_status_lane_cgs_state(rx_rx_status_lane_cgs_state),
        .core_status_lane_ifs_ready(rx_rx_status_lane_ifs_ready),
        .core_status_lane_latency(rx_rx_status_lane_latency),
        .irq(rx_axi_irq),
        .s_axi_aclk(s_axi_aclk_1),
        .s_axi_araddr({s_axi_1_ARADDR,s_axi_1_ARADDR,s_axi_1_ARADDR,s_axi_1_ARADDR,s_axi_1_ARADDR,s_axi_1_ARADDR,s_axi_1_ARADDR,s_axi_1_ARADDR,s_axi_1_ARADDR,s_axi_1_ARADDR,s_axi_1_ARADDR,s_axi_1_ARADDR,s_axi_1_ARADDR,s_axi_1_ARADDR}),
        .s_axi_aresetn(s_axi_aresetn_1),
        .s_axi_arprot({s_axi_1_ARPROT,s_axi_1_ARPROT,s_axi_1_ARPROT}),
        .s_axi_arready(s_axi_1_ARREADY),
        .s_axi_arvalid(s_axi_1_ARVALID),
        .s_axi_awaddr({s_axi_1_AWADDR,s_axi_1_AWADDR,s_axi_1_AWADDR,s_axi_1_AWADDR,s_axi_1_AWADDR,s_axi_1_AWADDR,s_axi_1_AWADDR,s_axi_1_AWADDR,s_axi_1_AWADDR,s_axi_1_AWADDR,s_axi_1_AWADDR,s_axi_1_AWADDR,s_axi_1_AWADDR,s_axi_1_AWADDR}),
        .s_axi_awprot({s_axi_1_AWPROT,s_axi_1_AWPROT,s_axi_1_AWPROT}),
        .s_axi_awready(s_axi_1_AWREADY),
        .s_axi_awvalid(s_axi_1_AWVALID),
        .s_axi_bready(s_axi_1_BREADY),
        .s_axi_bresp(s_axi_1_BRESP),
        .s_axi_bvalid(s_axi_1_BVALID),
        .s_axi_rdata(s_axi_1_RDATA),
        .s_axi_rready(s_axi_1_RREADY),
        .s_axi_rresp(s_axi_1_RRESP),
        .s_axi_rvalid(s_axi_1_RVALID),
        .s_axi_wdata({s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA,s_axi_1_WDATA}),
        .s_axi_wready(s_axi_1_WREADY),
        .s_axi_wstrb({s_axi_1_WSTRB,s_axi_1_WSTRB,s_axi_1_WSTRB,s_axi_1_WSTRB}),
        .s_axi_wvalid(s_axi_1_WVALID));
endmodule

(* CORE_GENERATION_INFO = "design_fmc,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_fmc,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=16,numReposBlks=15,numNonXlnxBlks=11,numHierBlks=1,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_fmc.hwdef" *) 
module design_fmc
   (AXI_LITE_fmcspi_araddr,
    AXI_LITE_fmcspi_arready,
    AXI_LITE_fmcspi_arvalid,
    AXI_LITE_fmcspi_awaddr,
    AXI_LITE_fmcspi_awready,
    AXI_LITE_fmcspi_awvalid,
    AXI_LITE_fmcspi_bready,
    AXI_LITE_fmcspi_bresp,
    AXI_LITE_fmcspi_bvalid,
    AXI_LITE_fmcspi_rdata,
    AXI_LITE_fmcspi_rready,
    AXI_LITE_fmcspi_rresp,
    AXI_LITE_fmcspi_rvalid,
    AXI_LITE_fmcspi_wdata,
    AXI_LITE_fmcspi_wready,
    AXI_LITE_fmcspi_wstrb,
    AXI_LITE_fmcspi_wvalid,
    aclk_100,
    m_dest_axi_0_awaddr,
    m_dest_axi_0_awburst,
    m_dest_axi_0_awcache,
    m_dest_axi_0_awlen,
    m_dest_axi_0_awprot,
    m_dest_axi_0_awready,
    m_dest_axi_0_awsize,
    m_dest_axi_0_awvalid,
    m_dest_axi_0_bready,
    m_dest_axi_0_bresp,
    m_dest_axi_0_bvalid,
    m_dest_axi_0_wdata,
    m_dest_axi_0_wlast,
    m_dest_axi_0_wready,
    m_dest_axi_0_wstrb,
    m_dest_axi_0_wvalid,
    m_dest_axi_1_awaddr,
    m_dest_axi_1_awburst,
    m_dest_axi_1_awcache,
    m_dest_axi_1_awlen,
    m_dest_axi_1_awprot,
    m_dest_axi_1_awready,
    m_dest_axi_1_awsize,
    m_dest_axi_1_awvalid,
    m_dest_axi_1_bready,
    m_dest_axi_1_bresp,
    m_dest_axi_1_bvalid,
    m_dest_axi_1_wdata,
    m_dest_axi_1_wlast,
    m_dest_axi_1_wready,
    m_dest_axi_1_wstrb,
    m_dest_axi_1_wvalid,
    m_dest_axi_aclk,
    m_dest_axi_aresetn,
    reset_100,
    rx_core_clk,
    rx_data_0_n,
    rx_data_0_p,
    rx_data_1_n,
    rx_data_1_p,
    rx_data_2_n,
    rx_data_2_p,
    rx_data_3_n,
    rx_data_3_p,
    rx_ref_clk_0,
    rx_sync_0,
    rx_sysref_0,
    s_axi_ad9250_0_araddr,
    s_axi_ad9250_0_arprot,
    s_axi_ad9250_0_arready,
    s_axi_ad9250_0_arvalid,
    s_axi_ad9250_0_awaddr,
    s_axi_ad9250_0_awprot,
    s_axi_ad9250_0_awready,
    s_axi_ad9250_0_awvalid,
    s_axi_ad9250_0_bready,
    s_axi_ad9250_0_bresp,
    s_axi_ad9250_0_bvalid,
    s_axi_ad9250_0_rdata,
    s_axi_ad9250_0_rready,
    s_axi_ad9250_0_rresp,
    s_axi_ad9250_0_rvalid,
    s_axi_ad9250_0_wdata,
    s_axi_ad9250_0_wready,
    s_axi_ad9250_0_wstrb,
    s_axi_ad9250_0_wvalid,
    s_axi_ad9259_1_araddr,
    s_axi_ad9259_1_arprot,
    s_axi_ad9259_1_arready,
    s_axi_ad9259_1_arvalid,
    s_axi_ad9259_1_awaddr,
    s_axi_ad9259_1_awprot,
    s_axi_ad9259_1_awready,
    s_axi_ad9259_1_awvalid,
    s_axi_ad9259_1_bready,
    s_axi_ad9259_1_bresp,
    s_axi_ad9259_1_bvalid,
    s_axi_ad9259_1_rdata,
    s_axi_ad9259_1_rready,
    s_axi_ad9259_1_rresp,
    s_axi_ad9259_1_rvalid,
    s_axi_ad9259_1_wdata,
    s_axi_ad9259_1_wready,
    s_axi_ad9259_1_wstrb,
    s_axi_ad9259_1_wvalid,
    s_axi_dma_0_araddr,
    s_axi_dma_0_arprot,
    s_axi_dma_0_arready,
    s_axi_dma_0_arvalid,
    s_axi_dma_0_awaddr,
    s_axi_dma_0_awprot,
    s_axi_dma_0_awready,
    s_axi_dma_0_awvalid,
    s_axi_dma_0_bready,
    s_axi_dma_0_bresp,
    s_axi_dma_0_bvalid,
    s_axi_dma_0_rdata,
    s_axi_dma_0_rready,
    s_axi_dma_0_rresp,
    s_axi_dma_0_rvalid,
    s_axi_dma_0_wdata,
    s_axi_dma_0_wready,
    s_axi_dma_0_wstrb,
    s_axi_dma_0_wvalid,
    s_axi_dma_1_araddr,
    s_axi_dma_1_arprot,
    s_axi_dma_1_arready,
    s_axi_dma_1_arvalid,
    s_axi_dma_1_awaddr,
    s_axi_dma_1_awprot,
    s_axi_dma_1_awready,
    s_axi_dma_1_awvalid,
    s_axi_dma_1_bready,
    s_axi_dma_1_bresp,
    s_axi_dma_1_bvalid,
    s_axi_dma_1_rdata,
    s_axi_dma_1_rready,
    s_axi_dma_1_rresp,
    s_axi_dma_1_rvalid,
    s_axi_dma_1_wdata,
    s_axi_dma_1_wready,
    s_axi_dma_1_wstrb,
    s_axi_dma_1_wvalid,
    s_axi_xcvr_araddr,
    s_axi_xcvr_arprot,
    s_axi_xcvr_arready,
    s_axi_xcvr_arvalid,
    s_axi_xcvr_awaddr,
    s_axi_xcvr_awprot,
    s_axi_xcvr_awready,
    s_axi_xcvr_awvalid,
    s_axi_xcvr_bready,
    s_axi_xcvr_bresp,
    s_axi_xcvr_bvalid,
    s_axi_xcvr_rdata,
    s_axi_xcvr_rready,
    s_axi_xcvr_rresp,
    s_axi_xcvr_rvalid,
    s_axi_xcvr_wdata,
    s_axi_xcvr_wready,
    s_axi_xcvr_wstrb,
    s_axi_xcvr_wvalid,
    spi_clk_i,
    spi_clk_o,
    spi_csn_i,
    spi_csn_o,
    spi_sdi_i,
    spi_sdo_i,
    spi_sdo_o);
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_fmcspi ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXI_LITE_fmcspi, ADDR_WIDTH 16, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_fmc_axi_ddr_cntrl_0_ui_clk, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [6:0]AXI_LITE_fmcspi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_fmcspi ARREADY" *) output AXI_LITE_fmcspi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_fmcspi ARVALID" *) input AXI_LITE_fmcspi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_fmcspi AWADDR" *) input [6:0]AXI_LITE_fmcspi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_fmcspi AWREADY" *) output AXI_LITE_fmcspi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_fmcspi AWVALID" *) input AXI_LITE_fmcspi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_fmcspi BREADY" *) input AXI_LITE_fmcspi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_fmcspi BRESP" *) output [1:0]AXI_LITE_fmcspi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_fmcspi BVALID" *) output AXI_LITE_fmcspi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_fmcspi RDATA" *) output [31:0]AXI_LITE_fmcspi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_fmcspi RREADY" *) input AXI_LITE_fmcspi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_fmcspi RRESP" *) output [1:0]AXI_LITE_fmcspi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_fmcspi RVALID" *) output AXI_LITE_fmcspi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_fmcspi WDATA" *) input [31:0]AXI_LITE_fmcspi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_fmcspi WREADY" *) output AXI_LITE_fmcspi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_fmcspi WSTRB" *) input [3:0]AXI_LITE_fmcspi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_fmcspi WVALID" *) input AXI_LITE_fmcspi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK_100 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK_100, ASSOCIATED_BUSIF s_axi_ad9250_0:s_axi_xcvr:AXI_LITE_fmcspi:s_axi_dma_1:s_axi_dma_0:s_axi_ad9259_1, ASSOCIATED_RESET reset_100, CLK_DOMAIN design_fmc_axi_ddr_cntrl_0_ui_clk, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0" *) input aclk_100;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_0 AWADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_dest_axi_0, ADDR_WIDTH 31, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN system_axi_ddr_cntrl_0_ui_clk, DATA_WIDTH 512, FREQ_HZ 200000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 0, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 2, NUM_READ_OUTSTANDING 0, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 32, NUM_WRITE_THREADS 1, PHASE 0, PROTOCOL AXI4, READ_WRITE_MODE WRITE_ONLY, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [31:0]m_dest_axi_0_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_0 AWBURST" *) output [1:0]m_dest_axi_0_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_0 AWCACHE" *) output [3:0]m_dest_axi_0_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_0 AWLEN" *) output [7:0]m_dest_axi_0_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_0 AWPROT" *) output [2:0]m_dest_axi_0_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_0 AWREADY" *) input m_dest_axi_0_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_0 AWSIZE" *) output [2:0]m_dest_axi_0_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_0 AWVALID" *) output m_dest_axi_0_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_0 BREADY" *) output m_dest_axi_0_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_0 BRESP" *) input [1:0]m_dest_axi_0_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_0 BVALID" *) input m_dest_axi_0_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_0 WDATA" *) output [511:0]m_dest_axi_0_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_0 WLAST" *) output m_dest_axi_0_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_0 WREADY" *) input m_dest_axi_0_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_0 WSTRB" *) output [63:0]m_dest_axi_0_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_0 WVALID" *) output m_dest_axi_0_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_1 AWADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_dest_axi_1, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN system_axi_ddr_cntrl_0_ui_clk, DATA_WIDTH 512, FREQ_HZ 200000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 0, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 2, NUM_READ_OUTSTANDING 0, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 32, NUM_WRITE_THREADS 1, PHASE 0, PROTOCOL AXI4, READ_WRITE_MODE WRITE_ONLY, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [31:0]m_dest_axi_1_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_1 AWBURST" *) output [1:0]m_dest_axi_1_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_1 AWCACHE" *) output [3:0]m_dest_axi_1_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_1 AWLEN" *) output [7:0]m_dest_axi_1_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_1 AWPROT" *) output [2:0]m_dest_axi_1_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_1 AWREADY" *) input m_dest_axi_1_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_1 AWSIZE" *) output [2:0]m_dest_axi_1_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_1 AWVALID" *) output m_dest_axi_1_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_1 BREADY" *) output m_dest_axi_1_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_1 BRESP" *) input [1:0]m_dest_axi_1_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_1 BVALID" *) input m_dest_axi_1_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_1 WDATA" *) output [511:0]m_dest_axi_1_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_1 WLAST" *) output m_dest_axi_1_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_1 WREADY" *) input m_dest_axi_1_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_1 WSTRB" *) output [63:0]m_dest_axi_1_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_dest_axi_1 WVALID" *) output m_dest_axi_1_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.M_DEST_AXI_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.M_DEST_AXI_ACLK, ASSOCIATED_BUSIF m_dest_axi_1:m_dest_axi_0, ASSOCIATED_RESET m_dest_axi_aresetn, CLK_DOMAIN system_axi_ddr_cntrl_0_ui_clk, FREQ_HZ 200000000, INSERT_VIP 0, PHASE 0" *) input m_dest_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.M_DEST_AXI_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.M_DEST_AXI_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input m_dest_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_100 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_100, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input reset_100;
  output rx_core_clk;
  input rx_data_0_n;
  input rx_data_0_p;
  input rx_data_1_n;
  input rx_data_1_p;
  input rx_data_2_n;
  input rx_data_2_p;
  input rx_data_3_n;
  input rx_data_3_p;
  input rx_ref_clk_0;
  output [0:0]rx_sync_0;
  input rx_sysref_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_ad9250_0, ADDR_WIDTH 12, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_fmc_axi_ddr_cntrl_0_ui_clk, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [11:0]s_axi_ad9250_0_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 ARPROT" *) input [2:0]s_axi_ad9250_0_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 ARREADY" *) output s_axi_ad9250_0_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 ARVALID" *) input s_axi_ad9250_0_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 AWADDR" *) input [11:0]s_axi_ad9250_0_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 AWPROT" *) input [2:0]s_axi_ad9250_0_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 AWREADY" *) output s_axi_ad9250_0_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 AWVALID" *) input s_axi_ad9250_0_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 BREADY" *) input s_axi_ad9250_0_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 BRESP" *) output [1:0]s_axi_ad9250_0_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 BVALID" *) output s_axi_ad9250_0_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 RDATA" *) output [31:0]s_axi_ad9250_0_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 RREADY" *) input s_axi_ad9250_0_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 RRESP" *) output [1:0]s_axi_ad9250_0_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 RVALID" *) output s_axi_ad9250_0_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 WDATA" *) input [31:0]s_axi_ad9250_0_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 WREADY" *) output s_axi_ad9250_0_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 WSTRB" *) input [3:0]s_axi_ad9250_0_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9250_0 WVALID" *) input s_axi_ad9250_0_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_ad9259_1, ADDR_WIDTH 12, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_fmc_axi_ddr_cntrl_0_ui_clk, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [11:0]s_axi_ad9259_1_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 ARPROT" *) input [2:0]s_axi_ad9259_1_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 ARREADY" *) output s_axi_ad9259_1_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 ARVALID" *) input s_axi_ad9259_1_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 AWADDR" *) input [11:0]s_axi_ad9259_1_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 AWPROT" *) input [2:0]s_axi_ad9259_1_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 AWREADY" *) output s_axi_ad9259_1_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 AWVALID" *) input s_axi_ad9259_1_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 BREADY" *) input s_axi_ad9259_1_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 BRESP" *) output [1:0]s_axi_ad9259_1_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 BVALID" *) output s_axi_ad9259_1_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 RDATA" *) output [31:0]s_axi_ad9259_1_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 RREADY" *) input s_axi_ad9259_1_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 RRESP" *) output [1:0]s_axi_ad9259_1_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 RVALID" *) output s_axi_ad9259_1_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 WDATA" *) input [31:0]s_axi_ad9259_1_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 WREADY" *) output s_axi_ad9259_1_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 WSTRB" *) input [3:0]s_axi_ad9259_1_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_ad9259_1 WVALID" *) input s_axi_ad9259_1_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_dma_0, ADDR_WIDTH 12, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_fmc_axi_ddr_cntrl_0_ui_clk, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [11:0]s_axi_dma_0_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 ARPROT" *) input [2:0]s_axi_dma_0_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 ARREADY" *) output s_axi_dma_0_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 ARVALID" *) input s_axi_dma_0_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 AWADDR" *) input [11:0]s_axi_dma_0_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 AWPROT" *) input [2:0]s_axi_dma_0_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 AWREADY" *) output s_axi_dma_0_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 AWVALID" *) input s_axi_dma_0_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 BREADY" *) input s_axi_dma_0_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 BRESP" *) output [1:0]s_axi_dma_0_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 BVALID" *) output s_axi_dma_0_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 RDATA" *) output [31:0]s_axi_dma_0_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 RREADY" *) input s_axi_dma_0_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 RRESP" *) output [1:0]s_axi_dma_0_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 RVALID" *) output s_axi_dma_0_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 WDATA" *) input [31:0]s_axi_dma_0_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 WREADY" *) output s_axi_dma_0_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 WSTRB" *) input [3:0]s_axi_dma_0_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_0 WVALID" *) input s_axi_dma_0_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_dma_1, ADDR_WIDTH 12, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_fmc_axi_ddr_cntrl_0_ui_clk, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 2, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 2, NUM_WRITE_THREADS 1, PHASE 0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [11:0]s_axi_dma_1_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 ARPROT" *) input [2:0]s_axi_dma_1_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 ARREADY" *) output s_axi_dma_1_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 ARVALID" *) input s_axi_dma_1_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 AWADDR" *) input [11:0]s_axi_dma_1_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 AWPROT" *) input [2:0]s_axi_dma_1_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 AWREADY" *) output s_axi_dma_1_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 AWVALID" *) input s_axi_dma_1_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 BREADY" *) input s_axi_dma_1_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 BRESP" *) output [1:0]s_axi_dma_1_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 BVALID" *) output s_axi_dma_1_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 RDATA" *) output [31:0]s_axi_dma_1_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 RREADY" *) input s_axi_dma_1_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 RRESP" *) output [1:0]s_axi_dma_1_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 RVALID" *) output s_axi_dma_1_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 WDATA" *) input [31:0]s_axi_dma_1_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 WREADY" *) output s_axi_dma_1_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 WSTRB" *) input [3:0]s_axi_dma_1_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_dma_1 WVALID" *) input s_axi_dma_1_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_xcvr, ADDR_WIDTH 16, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_fmc_axi_ddr_cntrl_0_ui_clk, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [15:0]s_axi_xcvr_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr ARPROT" *) input [2:0]s_axi_xcvr_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr ARREADY" *) output s_axi_xcvr_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr ARVALID" *) input s_axi_xcvr_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr AWADDR" *) input [15:0]s_axi_xcvr_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr AWPROT" *) input [2:0]s_axi_xcvr_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr AWREADY" *) output s_axi_xcvr_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr AWVALID" *) input s_axi_xcvr_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr BREADY" *) input s_axi_xcvr_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr BRESP" *) output [1:0]s_axi_xcvr_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr BVALID" *) output s_axi_xcvr_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr RDATA" *) output [31:0]s_axi_xcvr_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr RREADY" *) input s_axi_xcvr_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr RRESP" *) output [1:0]s_axi_xcvr_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr RVALID" *) output s_axi_xcvr_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr WDATA" *) input [31:0]s_axi_xcvr_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr WREADY" *) output s_axi_xcvr_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr WSTRB" *) input [3:0]s_axi_xcvr_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_xcvr WVALID" *) input s_axi_xcvr_wvalid;
  input spi_clk_i;
  output spi_clk_o;
  input [7:0]spi_csn_i;
  output [7:0]spi_csn_o;
  input spi_sdi_i;
  input spi_sdo_i;
  output spi_sdo_o;

  wire [6:0]AXI_LITE_fmcspi_1_ARADDR;
  wire AXI_LITE_fmcspi_1_ARREADY;
  wire AXI_LITE_fmcspi_1_ARVALID;
  wire [6:0]AXI_LITE_fmcspi_1_AWADDR;
  wire AXI_LITE_fmcspi_1_AWREADY;
  wire AXI_LITE_fmcspi_1_AWVALID;
  wire AXI_LITE_fmcspi_1_BREADY;
  wire [1:0]AXI_LITE_fmcspi_1_BRESP;
  wire AXI_LITE_fmcspi_1_BVALID;
  wire [31:0]AXI_LITE_fmcspi_1_RDATA;
  wire AXI_LITE_fmcspi_1_RREADY;
  wire [1:0]AXI_LITE_fmcspi_1_RRESP;
  wire AXI_LITE_fmcspi_1_RVALID;
  wire [31:0]AXI_LITE_fmcspi_1_WDATA;
  wire AXI_LITE_fmcspi_1_WREADY;
  wire [3:0]AXI_LITE_fmcspi_1_WSTRB;
  wire AXI_LITE_fmcspi_1_WVALID;
  wire [0:0]GND_1_dout;
  wire axi_ad9250_0_core_adc_clk;
  wire [31:0]axi_ad9250_0_core_adc_data_a;
  wire [31:0]axi_ad9250_0_core_adc_data_b;
  wire axi_ad9250_0_core_adc_enable_a;
  wire axi_ad9250_0_core_adc_enable_b;
  wire axi_ad9250_0_core_adc_valid_a;
  wire axi_ad9250_0_cpack_fifo_wr_overflow;
  wire [63:0]axi_ad9250_0_cpack_packed_fifo_wr_DATA;
  wire axi_ad9250_0_cpack_packed_fifo_wr_EN;
  wire axi_ad9250_0_cpack_packed_fifo_wr_OVERFLOW;
  wire axi_ad9250_0_cpack_packed_fifo_wr_SYNC;
  wire axi_ad9250_0_dma_irq;
  wire [31:0]axi_ad9250_0_dma_m_dest_axi_AWADDR;
  wire [1:0]axi_ad9250_0_dma_m_dest_axi_AWBURST;
  wire [3:0]axi_ad9250_0_dma_m_dest_axi_AWCACHE;
  wire [7:0]axi_ad9250_0_dma_m_dest_axi_AWLEN;
  wire [2:0]axi_ad9250_0_dma_m_dest_axi_AWPROT;
  wire axi_ad9250_0_dma_m_dest_axi_AWREADY;
  wire [2:0]axi_ad9250_0_dma_m_dest_axi_AWSIZE;
  wire axi_ad9250_0_dma_m_dest_axi_AWVALID;
  wire axi_ad9250_0_dma_m_dest_axi_BREADY;
  wire [1:0]axi_ad9250_0_dma_m_dest_axi_BRESP;
  wire axi_ad9250_0_dma_m_dest_axi_BVALID;
  wire [511:0]axi_ad9250_0_dma_m_dest_axi_WDATA;
  wire axi_ad9250_0_dma_m_dest_axi_WLAST;
  wire axi_ad9250_0_dma_m_dest_axi_WREADY;
  wire [63:0]axi_ad9250_0_dma_m_dest_axi_WSTRB;
  wire axi_ad9250_0_dma_m_dest_axi_WVALID;
  wire axi_ad9250_1_core_adc_clk;
  wire [31:0]axi_ad9250_1_core_adc_data_a;
  wire [31:0]axi_ad9250_1_core_adc_data_b;
  wire axi_ad9250_1_core_adc_enable_a;
  wire axi_ad9250_1_core_adc_enable_b;
  wire axi_ad9250_1_core_adc_valid_a;
  wire axi_ad9250_1_cpack_fifo_wr_overflow;
  wire [63:0]axi_ad9250_1_cpack_packed_fifo_wr_DATA;
  wire axi_ad9250_1_cpack_packed_fifo_wr_EN;
  wire axi_ad9250_1_cpack_packed_fifo_wr_OVERFLOW;
  wire axi_ad9250_1_cpack_packed_fifo_wr_SYNC;
  wire axi_ad9250_1_dma_irq;
  wire [31:0]axi_ad9250_1_dma_m_dest_axi_AWADDR;
  wire [1:0]axi_ad9250_1_dma_m_dest_axi_AWBURST;
  wire [3:0]axi_ad9250_1_dma_m_dest_axi_AWCACHE;
  wire [7:0]axi_ad9250_1_dma_m_dest_axi_AWLEN;
  wire [2:0]axi_ad9250_1_dma_m_dest_axi_AWPROT;
  wire axi_ad9250_1_dma_m_dest_axi_AWREADY;
  wire [2:0]axi_ad9250_1_dma_m_dest_axi_AWSIZE;
  wire axi_ad9250_1_dma_m_dest_axi_AWVALID;
  wire axi_ad9250_1_dma_m_dest_axi_BREADY;
  wire [1:0]axi_ad9250_1_dma_m_dest_axi_BRESP;
  wire axi_ad9250_1_dma_m_dest_axi_BVALID;
  wire [511:0]axi_ad9250_1_dma_m_dest_axi_WDATA;
  wire axi_ad9250_1_dma_m_dest_axi_WLAST;
  wire axi_ad9250_1_dma_m_dest_axi_WREADY;
  wire [63:0]axi_ad9250_1_dma_m_dest_axi_WSTRB;
  wire axi_ad9250_1_dma_m_dest_axi_WVALID;
  wire axi_ad9250_jesd_irq;
  wire axi_ad9250_jesd_phy_en_char_align;
  wire [0:0]axi_ad9250_jesd_rstgen_peripheral_reset;
  wire [127:0]axi_ad9250_jesd_rx_data_tdata;
  wire [3:0]axi_ad9250_jesd_rx_sof;
  wire [0:0]axi_ad9250_jesd_sync;
  wire [11:0]axi_ad9250_xcvr_up_ch_0_addr;
  wire axi_ad9250_xcvr_up_ch_0_enb;
  wire axi_ad9250_xcvr_up_ch_0_lpm_dfe_n;
  wire [2:0]axi_ad9250_xcvr_up_ch_0_out_clk_sel;
  wire axi_ad9250_xcvr_up_ch_0_pll_locked;
  wire [2:0]axi_ad9250_xcvr_up_ch_0_rate;
  wire [15:0]axi_ad9250_xcvr_up_ch_0_rdata;
  wire axi_ad9250_xcvr_up_ch_0_ready;
  wire axi_ad9250_xcvr_up_ch_0_rst;
  wire axi_ad9250_xcvr_up_ch_0_rst_done;
  wire [1:0]axi_ad9250_xcvr_up_ch_0_sys_clk_sel;
  wire axi_ad9250_xcvr_up_ch_0_user_ready;
  wire [15:0]axi_ad9250_xcvr_up_ch_0_wdata;
  wire axi_ad9250_xcvr_up_ch_0_wr;
  wire [11:0]axi_ad9250_xcvr_up_ch_1_addr;
  wire axi_ad9250_xcvr_up_ch_1_enb;
  wire axi_ad9250_xcvr_up_ch_1_lpm_dfe_n;
  wire [2:0]axi_ad9250_xcvr_up_ch_1_out_clk_sel;
  wire axi_ad9250_xcvr_up_ch_1_pll_locked;
  wire [2:0]axi_ad9250_xcvr_up_ch_1_rate;
  wire [15:0]axi_ad9250_xcvr_up_ch_1_rdata;
  wire axi_ad9250_xcvr_up_ch_1_ready;
  wire axi_ad9250_xcvr_up_ch_1_rst;
  wire axi_ad9250_xcvr_up_ch_1_rst_done;
  wire [1:0]axi_ad9250_xcvr_up_ch_1_sys_clk_sel;
  wire axi_ad9250_xcvr_up_ch_1_user_ready;
  wire [15:0]axi_ad9250_xcvr_up_ch_1_wdata;
  wire axi_ad9250_xcvr_up_ch_1_wr;
  wire [11:0]axi_ad9250_xcvr_up_ch_2_addr;
  wire axi_ad9250_xcvr_up_ch_2_enb;
  wire axi_ad9250_xcvr_up_ch_2_lpm_dfe_n;
  wire [2:0]axi_ad9250_xcvr_up_ch_2_out_clk_sel;
  wire axi_ad9250_xcvr_up_ch_2_pll_locked;
  wire [2:0]axi_ad9250_xcvr_up_ch_2_rate;
  wire [15:0]axi_ad9250_xcvr_up_ch_2_rdata;
  wire axi_ad9250_xcvr_up_ch_2_ready;
  wire axi_ad9250_xcvr_up_ch_2_rst;
  wire axi_ad9250_xcvr_up_ch_2_rst_done;
  wire [1:0]axi_ad9250_xcvr_up_ch_2_sys_clk_sel;
  wire axi_ad9250_xcvr_up_ch_2_user_ready;
  wire [15:0]axi_ad9250_xcvr_up_ch_2_wdata;
  wire axi_ad9250_xcvr_up_ch_2_wr;
  wire [11:0]axi_ad9250_xcvr_up_ch_3_addr;
  wire axi_ad9250_xcvr_up_ch_3_enb;
  wire axi_ad9250_xcvr_up_ch_3_lpm_dfe_n;
  wire [2:0]axi_ad9250_xcvr_up_ch_3_out_clk_sel;
  wire axi_ad9250_xcvr_up_ch_3_pll_locked;
  wire [2:0]axi_ad9250_xcvr_up_ch_3_rate;
  wire [15:0]axi_ad9250_xcvr_up_ch_3_rdata;
  wire axi_ad9250_xcvr_up_ch_3_ready;
  wire axi_ad9250_xcvr_up_ch_3_rst;
  wire axi_ad9250_xcvr_up_ch_3_rst_done;
  wire [1:0]axi_ad9250_xcvr_up_ch_3_sys_clk_sel;
  wire axi_ad9250_xcvr_up_ch_3_user_ready;
  wire [15:0]axi_ad9250_xcvr_up_ch_3_wdata;
  wire axi_ad9250_xcvr_up_ch_3_wr;
  wire [11:0]axi_ad9250_xcvr_up_es_0_addr;
  wire axi_ad9250_xcvr_up_es_0_enb;
  wire [15:0]axi_ad9250_xcvr_up_es_0_rdata;
  wire axi_ad9250_xcvr_up_es_0_ready;
  wire axi_ad9250_xcvr_up_es_0_reset;
  wire [15:0]axi_ad9250_xcvr_up_es_0_wdata;
  wire axi_ad9250_xcvr_up_es_0_wr;
  wire [11:0]axi_ad9250_xcvr_up_es_1_addr;
  wire axi_ad9250_xcvr_up_es_1_enb;
  wire [15:0]axi_ad9250_xcvr_up_es_1_rdata;
  wire axi_ad9250_xcvr_up_es_1_ready;
  wire axi_ad9250_xcvr_up_es_1_reset;
  wire [15:0]axi_ad9250_xcvr_up_es_1_wdata;
  wire axi_ad9250_xcvr_up_es_1_wr;
  wire [11:0]axi_ad9250_xcvr_up_es_2_addr;
  wire axi_ad9250_xcvr_up_es_2_enb;
  wire [15:0]axi_ad9250_xcvr_up_es_2_rdata;
  wire axi_ad9250_xcvr_up_es_2_ready;
  wire axi_ad9250_xcvr_up_es_2_reset;
  wire [15:0]axi_ad9250_xcvr_up_es_2_wdata;
  wire axi_ad9250_xcvr_up_es_2_wr;
  wire [11:0]axi_ad9250_xcvr_up_es_3_addr;
  wire axi_ad9250_xcvr_up_es_3_enb;
  wire [15:0]axi_ad9250_xcvr_up_es_3_rdata;
  wire axi_ad9250_xcvr_up_es_3_ready;
  wire axi_ad9250_xcvr_up_es_3_reset;
  wire [15:0]axi_ad9250_xcvr_up_es_3_wdata;
  wire axi_ad9250_xcvr_up_es_3_wr;
  wire axi_ad9250_xcvr_up_pll_rst;
  wire axi_spi_io0_o;
  wire axi_spi_ip2intc_irpt;
  wire axi_spi_sck_o;
  wire [7:0]axi_spi_ss_o;
  wire [63:0]data_bsplit_split_data_0;
  wire [63:0]data_bsplit_split_data_1;
  wire rx_data_0_n_1;
  wire rx_data_0_p_1;
  wire rx_data_1_n_1;
  wire rx_data_1_p_1;
  wire rx_data_2_n_1;
  wire rx_data_2_p_1;
  wire rx_data_3_n_1;
  wire rx_data_3_p_1;
  wire rx_ref_clk_0_1;
  wire [11:0]s_axi_ad9250_1_ARADDR;
  wire [2:0]s_axi_ad9250_1_ARPROT;
  wire s_axi_ad9250_1_ARREADY;
  wire s_axi_ad9250_1_ARVALID;
  wire [11:0]s_axi_ad9250_1_AWADDR;
  wire [2:0]s_axi_ad9250_1_AWPROT;
  wire s_axi_ad9250_1_AWREADY;
  wire s_axi_ad9250_1_AWVALID;
  wire s_axi_ad9250_1_BREADY;
  wire [1:0]s_axi_ad9250_1_BRESP;
  wire s_axi_ad9250_1_BVALID;
  wire [31:0]s_axi_ad9250_1_RDATA;
  wire s_axi_ad9250_1_RREADY;
  wire [1:0]s_axi_ad9250_1_RRESP;
  wire s_axi_ad9250_1_RVALID;
  wire [31:0]s_axi_ad9250_1_WDATA;
  wire s_axi_ad9250_1_WREADY;
  wire [3:0]s_axi_ad9250_1_WSTRB;
  wire s_axi_ad9250_1_WVALID;
  wire [11:0]s_axi_ad9259_1_1_ARADDR;
  wire [2:0]s_axi_ad9259_1_1_ARPROT;
  wire s_axi_ad9259_1_1_ARREADY;
  wire s_axi_ad9259_1_1_ARVALID;
  wire [11:0]s_axi_ad9259_1_1_AWADDR;
  wire [2:0]s_axi_ad9259_1_1_AWPROT;
  wire s_axi_ad9259_1_1_AWREADY;
  wire s_axi_ad9259_1_1_AWVALID;
  wire s_axi_ad9259_1_1_BREADY;
  wire [1:0]s_axi_ad9259_1_1_BRESP;
  wire s_axi_ad9259_1_1_BVALID;
  wire [31:0]s_axi_ad9259_1_1_RDATA;
  wire s_axi_ad9259_1_1_RREADY;
  wire [1:0]s_axi_ad9259_1_1_RRESP;
  wire s_axi_ad9259_1_1_RVALID;
  wire [31:0]s_axi_ad9259_1_1_WDATA;
  wire s_axi_ad9259_1_1_WREADY;
  wire [3:0]s_axi_ad9259_1_1_WSTRB;
  wire s_axi_ad9259_1_1_WVALID;
  wire [11:0]s_axi_dma_0_1_ARADDR;
  wire [2:0]s_axi_dma_0_1_ARPROT;
  wire s_axi_dma_0_1_ARREADY;
  wire s_axi_dma_0_1_ARVALID;
  wire [11:0]s_axi_dma_0_1_AWADDR;
  wire [2:0]s_axi_dma_0_1_AWPROT;
  wire s_axi_dma_0_1_AWREADY;
  wire s_axi_dma_0_1_AWVALID;
  wire s_axi_dma_0_1_BREADY;
  wire [1:0]s_axi_dma_0_1_BRESP;
  wire s_axi_dma_0_1_BVALID;
  wire [31:0]s_axi_dma_0_1_RDATA;
  wire s_axi_dma_0_1_RREADY;
  wire [1:0]s_axi_dma_0_1_RRESP;
  wire s_axi_dma_0_1_RVALID;
  wire [31:0]s_axi_dma_0_1_WDATA;
  wire s_axi_dma_0_1_WREADY;
  wire [3:0]s_axi_dma_0_1_WSTRB;
  wire s_axi_dma_0_1_WVALID;
  wire [11:0]s_axi_dma_1_1_ARADDR;
  wire [2:0]s_axi_dma_1_1_ARPROT;
  wire s_axi_dma_1_1_ARREADY;
  wire s_axi_dma_1_1_ARVALID;
  wire [11:0]s_axi_dma_1_1_AWADDR;
  wire [2:0]s_axi_dma_1_1_AWPROT;
  wire s_axi_dma_1_1_AWREADY;
  wire s_axi_dma_1_1_AWVALID;
  wire s_axi_dma_1_1_BREADY;
  wire [1:0]s_axi_dma_1_1_BRESP;
  wire s_axi_dma_1_1_BVALID;
  wire [31:0]s_axi_dma_1_1_RDATA;
  wire s_axi_dma_1_1_RREADY;
  wire [1:0]s_axi_dma_1_1_RRESP;
  wire s_axi_dma_1_1_RVALID;
  wire [31:0]s_axi_dma_1_1_WDATA;
  wire s_axi_dma_1_1_WREADY;
  wire [3:0]s_axi_dma_1_1_WSTRB;
  wire s_axi_dma_1_1_WVALID;
  wire [15:0]s_axi_xcvr_1_ARADDR;
  wire [2:0]s_axi_xcvr_1_ARPROT;
  wire s_axi_xcvr_1_ARREADY;
  wire s_axi_xcvr_1_ARVALID;
  wire [15:0]s_axi_xcvr_1_AWADDR;
  wire [2:0]s_axi_xcvr_1_AWPROT;
  wire s_axi_xcvr_1_AWREADY;
  wire s_axi_xcvr_1_AWVALID;
  wire s_axi_xcvr_1_BREADY;
  wire [1:0]s_axi_xcvr_1_BRESP;
  wire s_axi_xcvr_1_BVALID;
  wire [31:0]s_axi_xcvr_1_RDATA;
  wire s_axi_xcvr_1_RREADY;
  wire [1:0]s_axi_xcvr_1_RRESP;
  wire s_axi_xcvr_1_RVALID;
  wire [31:0]s_axi_xcvr_1_WDATA;
  wire s_axi_xcvr_1_WREADY;
  wire [3:0]s_axi_xcvr_1_WSTRB;
  wire s_axi_xcvr_1_WVALID;
  wire spi_clk_i_1;
  wire [7:0]spi_csn_i_1;
  wire spi_sdi_i_1;
  wire spi_sdo_i_1;
  wire sys_200m_clk;
  wire sys_200m_resetn;
  wire sys_cpu_clk;
  wire sys_cpu_resetn;
  wire sysref_1;
  wire [3:0]util_fmcjesdadc1_xcvr_rx_0_rxcharisk;
  wire [31:0]util_fmcjesdadc1_xcvr_rx_0_rxdata;
  wire [3:0]util_fmcjesdadc1_xcvr_rx_0_rxdisperr;
  wire [3:0]util_fmcjesdadc1_xcvr_rx_0_rxnotintable;
  wire [3:0]util_fmcjesdadc1_xcvr_rx_1_rxcharisk;
  wire [31:0]util_fmcjesdadc1_xcvr_rx_1_rxdata;
  wire [3:0]util_fmcjesdadc1_xcvr_rx_1_rxdisperr;
  wire [3:0]util_fmcjesdadc1_xcvr_rx_1_rxnotintable;
  wire [3:0]util_fmcjesdadc1_xcvr_rx_2_rxcharisk;
  wire [31:0]util_fmcjesdadc1_xcvr_rx_2_rxdata;
  wire [3:0]util_fmcjesdadc1_xcvr_rx_2_rxdisperr;
  wire [3:0]util_fmcjesdadc1_xcvr_rx_2_rxnotintable;
  wire [3:0]util_fmcjesdadc1_xcvr_rx_3_rxcharisk;
  wire [31:0]util_fmcjesdadc1_xcvr_rx_3_rxdata;
  wire [3:0]util_fmcjesdadc1_xcvr_rx_3_rxdisperr;
  wire [3:0]util_fmcjesdadc1_xcvr_rx_3_rxnotintable;
  wire util_fmcjesdadc1_xcvr_rx_out_clk_0;

  assign AXI_LITE_fmcspi_1_ARADDR = AXI_LITE_fmcspi_araddr[6:0];
  assign AXI_LITE_fmcspi_1_ARVALID = AXI_LITE_fmcspi_arvalid;
  assign AXI_LITE_fmcspi_1_AWADDR = AXI_LITE_fmcspi_awaddr[6:0];
  assign AXI_LITE_fmcspi_1_AWVALID = AXI_LITE_fmcspi_awvalid;
  assign AXI_LITE_fmcspi_1_BREADY = AXI_LITE_fmcspi_bready;
  assign AXI_LITE_fmcspi_1_RREADY = AXI_LITE_fmcspi_rready;
  assign AXI_LITE_fmcspi_1_WDATA = AXI_LITE_fmcspi_wdata[31:0];
  assign AXI_LITE_fmcspi_1_WSTRB = AXI_LITE_fmcspi_wstrb[3:0];
  assign AXI_LITE_fmcspi_1_WVALID = AXI_LITE_fmcspi_wvalid;
  assign AXI_LITE_fmcspi_arready = AXI_LITE_fmcspi_1_ARREADY;
  assign AXI_LITE_fmcspi_awready = AXI_LITE_fmcspi_1_AWREADY;
  assign AXI_LITE_fmcspi_bresp[1:0] = AXI_LITE_fmcspi_1_BRESP;
  assign AXI_LITE_fmcspi_bvalid = AXI_LITE_fmcspi_1_BVALID;
  assign AXI_LITE_fmcspi_rdata[31:0] = AXI_LITE_fmcspi_1_RDATA;
  assign AXI_LITE_fmcspi_rresp[1:0] = AXI_LITE_fmcspi_1_RRESP;
  assign AXI_LITE_fmcspi_rvalid = AXI_LITE_fmcspi_1_RVALID;
  assign AXI_LITE_fmcspi_wready = AXI_LITE_fmcspi_1_WREADY;
  assign axi_ad9250_0_dma_m_dest_axi_AWREADY = m_dest_axi_0_awready;
  assign axi_ad9250_0_dma_m_dest_axi_BRESP = m_dest_axi_0_bresp[1:0];
  assign axi_ad9250_0_dma_m_dest_axi_BVALID = m_dest_axi_0_bvalid;
  assign axi_ad9250_0_dma_m_dest_axi_WREADY = m_dest_axi_0_wready;
  assign axi_ad9250_1_dma_m_dest_axi_AWREADY = m_dest_axi_1_awready;
  assign axi_ad9250_1_dma_m_dest_axi_BRESP = m_dest_axi_1_bresp[1:0];
  assign axi_ad9250_1_dma_m_dest_axi_BVALID = m_dest_axi_1_bvalid;
  assign axi_ad9250_1_dma_m_dest_axi_WREADY = m_dest_axi_1_wready;
  assign m_dest_axi_0_awaddr[31:0] = axi_ad9250_0_dma_m_dest_axi_AWADDR;
  assign m_dest_axi_0_awburst[1:0] = axi_ad9250_0_dma_m_dest_axi_AWBURST;
  assign m_dest_axi_0_awcache[3:0] = axi_ad9250_0_dma_m_dest_axi_AWCACHE;
  assign m_dest_axi_0_awlen[7:0] = axi_ad9250_0_dma_m_dest_axi_AWLEN;
  assign m_dest_axi_0_awprot[2:0] = axi_ad9250_0_dma_m_dest_axi_AWPROT;
  assign m_dest_axi_0_awsize[2:0] = axi_ad9250_0_dma_m_dest_axi_AWSIZE;
  assign m_dest_axi_0_awvalid = axi_ad9250_0_dma_m_dest_axi_AWVALID;
  assign m_dest_axi_0_bready = axi_ad9250_0_dma_m_dest_axi_BREADY;
  assign m_dest_axi_0_wdata[511:0] = axi_ad9250_0_dma_m_dest_axi_WDATA;
  assign m_dest_axi_0_wlast = axi_ad9250_0_dma_m_dest_axi_WLAST;
  assign m_dest_axi_0_wstrb[63:0] = axi_ad9250_0_dma_m_dest_axi_WSTRB;
  assign m_dest_axi_0_wvalid = axi_ad9250_0_dma_m_dest_axi_WVALID;
  assign m_dest_axi_1_awaddr[31:0] = axi_ad9250_1_dma_m_dest_axi_AWADDR;
  assign m_dest_axi_1_awburst[1:0] = axi_ad9250_1_dma_m_dest_axi_AWBURST;
  assign m_dest_axi_1_awcache[3:0] = axi_ad9250_1_dma_m_dest_axi_AWCACHE;
  assign m_dest_axi_1_awlen[7:0] = axi_ad9250_1_dma_m_dest_axi_AWLEN;
  assign m_dest_axi_1_awprot[2:0] = axi_ad9250_1_dma_m_dest_axi_AWPROT;
  assign m_dest_axi_1_awsize[2:0] = axi_ad9250_1_dma_m_dest_axi_AWSIZE;
  assign m_dest_axi_1_awvalid = axi_ad9250_1_dma_m_dest_axi_AWVALID;
  assign m_dest_axi_1_bready = axi_ad9250_1_dma_m_dest_axi_BREADY;
  assign m_dest_axi_1_wdata[511:0] = axi_ad9250_1_dma_m_dest_axi_WDATA;
  assign m_dest_axi_1_wlast = axi_ad9250_1_dma_m_dest_axi_WLAST;
  assign m_dest_axi_1_wstrb[63:0] = axi_ad9250_1_dma_m_dest_axi_WSTRB;
  assign m_dest_axi_1_wvalid = axi_ad9250_1_dma_m_dest_axi_WVALID;
  assign rx_core_clk = util_fmcjesdadc1_xcvr_rx_out_clk_0;
  assign rx_data_0_n_1 = rx_data_0_n;
  assign rx_data_0_p_1 = rx_data_0_p;
  assign rx_data_1_n_1 = rx_data_1_n;
  assign rx_data_1_p_1 = rx_data_1_p;
  assign rx_data_2_n_1 = rx_data_2_n;
  assign rx_data_2_p_1 = rx_data_2_p;
  assign rx_data_3_n_1 = rx_data_3_n;
  assign rx_data_3_p_1 = rx_data_3_p;
  assign rx_ref_clk_0_1 = rx_ref_clk_0;
  assign rx_sync_0[0] = axi_ad9250_jesd_sync;
  assign s_axi_ad9250_0_arready = s_axi_ad9250_1_ARREADY;
  assign s_axi_ad9250_0_awready = s_axi_ad9250_1_AWREADY;
  assign s_axi_ad9250_0_bresp[1:0] = s_axi_ad9250_1_BRESP;
  assign s_axi_ad9250_0_bvalid = s_axi_ad9250_1_BVALID;
  assign s_axi_ad9250_0_rdata[31:0] = s_axi_ad9250_1_RDATA;
  assign s_axi_ad9250_0_rresp[1:0] = s_axi_ad9250_1_RRESP;
  assign s_axi_ad9250_0_rvalid = s_axi_ad9250_1_RVALID;
  assign s_axi_ad9250_0_wready = s_axi_ad9250_1_WREADY;
  assign s_axi_ad9250_1_ARADDR = s_axi_ad9250_0_araddr[11:0];
  assign s_axi_ad9250_1_ARPROT = s_axi_ad9250_0_arprot[2:0];
  assign s_axi_ad9250_1_ARVALID = s_axi_ad9250_0_arvalid;
  assign s_axi_ad9250_1_AWADDR = s_axi_ad9250_0_awaddr[11:0];
  assign s_axi_ad9250_1_AWPROT = s_axi_ad9250_0_awprot[2:0];
  assign s_axi_ad9250_1_AWVALID = s_axi_ad9250_0_awvalid;
  assign s_axi_ad9250_1_BREADY = s_axi_ad9250_0_bready;
  assign s_axi_ad9250_1_RREADY = s_axi_ad9250_0_rready;
  assign s_axi_ad9250_1_WDATA = s_axi_ad9250_0_wdata[31:0];
  assign s_axi_ad9250_1_WSTRB = s_axi_ad9250_0_wstrb[3:0];
  assign s_axi_ad9250_1_WVALID = s_axi_ad9250_0_wvalid;
  assign s_axi_ad9259_1_1_ARADDR = s_axi_ad9259_1_araddr[11:0];
  assign s_axi_ad9259_1_1_ARPROT = s_axi_ad9259_1_arprot[2:0];
  assign s_axi_ad9259_1_1_ARVALID = s_axi_ad9259_1_arvalid;
  assign s_axi_ad9259_1_1_AWADDR = s_axi_ad9259_1_awaddr[11:0];
  assign s_axi_ad9259_1_1_AWPROT = s_axi_ad9259_1_awprot[2:0];
  assign s_axi_ad9259_1_1_AWVALID = s_axi_ad9259_1_awvalid;
  assign s_axi_ad9259_1_1_BREADY = s_axi_ad9259_1_bready;
  assign s_axi_ad9259_1_1_RREADY = s_axi_ad9259_1_rready;
  assign s_axi_ad9259_1_1_WDATA = s_axi_ad9259_1_wdata[31:0];
  assign s_axi_ad9259_1_1_WSTRB = s_axi_ad9259_1_wstrb[3:0];
  assign s_axi_ad9259_1_1_WVALID = s_axi_ad9259_1_wvalid;
  assign s_axi_ad9259_1_arready = s_axi_ad9259_1_1_ARREADY;
  assign s_axi_ad9259_1_awready = s_axi_ad9259_1_1_AWREADY;
  assign s_axi_ad9259_1_bresp[1:0] = s_axi_ad9259_1_1_BRESP;
  assign s_axi_ad9259_1_bvalid = s_axi_ad9259_1_1_BVALID;
  assign s_axi_ad9259_1_rdata[31:0] = s_axi_ad9259_1_1_RDATA;
  assign s_axi_ad9259_1_rresp[1:0] = s_axi_ad9259_1_1_RRESP;
  assign s_axi_ad9259_1_rvalid = s_axi_ad9259_1_1_RVALID;
  assign s_axi_ad9259_1_wready = s_axi_ad9259_1_1_WREADY;
  assign s_axi_dma_0_1_ARADDR = s_axi_dma_1_araddr[11:0];
  assign s_axi_dma_0_1_ARPROT = s_axi_dma_1_arprot[2:0];
  assign s_axi_dma_0_1_ARVALID = s_axi_dma_1_arvalid;
  assign s_axi_dma_0_1_AWADDR = s_axi_dma_1_awaddr[11:0];
  assign s_axi_dma_0_1_AWPROT = s_axi_dma_1_awprot[2:0];
  assign s_axi_dma_0_1_AWVALID = s_axi_dma_1_awvalid;
  assign s_axi_dma_0_1_BREADY = s_axi_dma_1_bready;
  assign s_axi_dma_0_1_RREADY = s_axi_dma_1_rready;
  assign s_axi_dma_0_1_WDATA = s_axi_dma_1_wdata[31:0];
  assign s_axi_dma_0_1_WSTRB = s_axi_dma_1_wstrb[3:0];
  assign s_axi_dma_0_1_WVALID = s_axi_dma_1_wvalid;
  assign s_axi_dma_0_arready = s_axi_dma_1_1_ARREADY;
  assign s_axi_dma_0_awready = s_axi_dma_1_1_AWREADY;
  assign s_axi_dma_0_bresp[1:0] = s_axi_dma_1_1_BRESP;
  assign s_axi_dma_0_bvalid = s_axi_dma_1_1_BVALID;
  assign s_axi_dma_0_rdata[31:0] = s_axi_dma_1_1_RDATA;
  assign s_axi_dma_0_rresp[1:0] = s_axi_dma_1_1_RRESP;
  assign s_axi_dma_0_rvalid = s_axi_dma_1_1_RVALID;
  assign s_axi_dma_0_wready = s_axi_dma_1_1_WREADY;
  assign s_axi_dma_1_1_ARADDR = s_axi_dma_0_araddr[11:0];
  assign s_axi_dma_1_1_ARPROT = s_axi_dma_0_arprot[2:0];
  assign s_axi_dma_1_1_ARVALID = s_axi_dma_0_arvalid;
  assign s_axi_dma_1_1_AWADDR = s_axi_dma_0_awaddr[11:0];
  assign s_axi_dma_1_1_AWPROT = s_axi_dma_0_awprot[2:0];
  assign s_axi_dma_1_1_AWVALID = s_axi_dma_0_awvalid;
  assign s_axi_dma_1_1_BREADY = s_axi_dma_0_bready;
  assign s_axi_dma_1_1_RREADY = s_axi_dma_0_rready;
  assign s_axi_dma_1_1_WDATA = s_axi_dma_0_wdata[31:0];
  assign s_axi_dma_1_1_WSTRB = s_axi_dma_0_wstrb[3:0];
  assign s_axi_dma_1_1_WVALID = s_axi_dma_0_wvalid;
  assign s_axi_dma_1_arready = s_axi_dma_0_1_ARREADY;
  assign s_axi_dma_1_awready = s_axi_dma_0_1_AWREADY;
  assign s_axi_dma_1_bresp[1:0] = s_axi_dma_0_1_BRESP;
  assign s_axi_dma_1_bvalid = s_axi_dma_0_1_BVALID;
  assign s_axi_dma_1_rdata[31:0] = s_axi_dma_0_1_RDATA;
  assign s_axi_dma_1_rresp[1:0] = s_axi_dma_0_1_RRESP;
  assign s_axi_dma_1_rvalid = s_axi_dma_0_1_RVALID;
  assign s_axi_dma_1_wready = s_axi_dma_0_1_WREADY;
  assign s_axi_xcvr_1_ARADDR = s_axi_xcvr_araddr[15:0];
  assign s_axi_xcvr_1_ARPROT = s_axi_xcvr_arprot[2:0];
  assign s_axi_xcvr_1_ARVALID = s_axi_xcvr_arvalid;
  assign s_axi_xcvr_1_AWADDR = s_axi_xcvr_awaddr[15:0];
  assign s_axi_xcvr_1_AWPROT = s_axi_xcvr_awprot[2:0];
  assign s_axi_xcvr_1_AWVALID = s_axi_xcvr_awvalid;
  assign s_axi_xcvr_1_BREADY = s_axi_xcvr_bready;
  assign s_axi_xcvr_1_RREADY = s_axi_xcvr_rready;
  assign s_axi_xcvr_1_WDATA = s_axi_xcvr_wdata[31:0];
  assign s_axi_xcvr_1_WSTRB = s_axi_xcvr_wstrb[3:0];
  assign s_axi_xcvr_1_WVALID = s_axi_xcvr_wvalid;
  assign s_axi_xcvr_arready = s_axi_xcvr_1_ARREADY;
  assign s_axi_xcvr_awready = s_axi_xcvr_1_AWREADY;
  assign s_axi_xcvr_bresp[1:0] = s_axi_xcvr_1_BRESP;
  assign s_axi_xcvr_bvalid = s_axi_xcvr_1_BVALID;
  assign s_axi_xcvr_rdata[31:0] = s_axi_xcvr_1_RDATA;
  assign s_axi_xcvr_rresp[1:0] = s_axi_xcvr_1_RRESP;
  assign s_axi_xcvr_rvalid = s_axi_xcvr_1_RVALID;
  assign s_axi_xcvr_wready = s_axi_xcvr_1_WREADY;
  assign spi_clk_i_1 = spi_clk_i;
  assign spi_clk_o = axi_spi_sck_o;
  assign spi_csn_i_1 = spi_csn_i[7:0];
  assign spi_csn_o[7:0] = axi_spi_ss_o;
  assign spi_sdi_i_1 = spi_sdi_i;
  assign spi_sdo_i_1 = spi_sdo_i;
  assign spi_sdo_o = axi_spi_io0_o;
  assign sys_200m_clk = m_dest_axi_aclk;
  assign sys_200m_resetn = m_dest_axi_aresetn;
  assign sys_cpu_clk = aclk_100;
  assign sys_cpu_resetn = reset_100;
  assign sysref_1 = rx_sysref_0;
  design_fmc_GND_1_0 GND_1
       (.dout(GND_1_dout));
  design_fmc_axi_ad9250_0_core_0 axi_ad9250_0_core
       (.adc_clk(axi_ad9250_0_core_adc_clk),
        .adc_data_a(axi_ad9250_0_core_adc_data_a),
        .adc_data_b(axi_ad9250_0_core_adc_data_b),
        .adc_dovf(axi_ad9250_0_cpack_fifo_wr_overflow),
        .adc_enable_a(axi_ad9250_0_core_adc_enable_a),
        .adc_enable_b(axi_ad9250_0_core_adc_enable_b),
        .adc_valid_a(axi_ad9250_0_core_adc_valid_a),
        .rx_clk(util_fmcjesdadc1_xcvr_rx_out_clk_0),
        .rx_data(data_bsplit_split_data_0),
        .rx_sof(axi_ad9250_jesd_rx_sof),
        .rx_valid(1'b0),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(s_axi_ad9250_1_ARADDR),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arprot(s_axi_ad9250_1_ARPROT),
        .s_axi_arready(s_axi_ad9250_1_ARREADY),
        .s_axi_arvalid(s_axi_ad9250_1_ARVALID),
        .s_axi_awaddr(s_axi_ad9250_1_AWADDR),
        .s_axi_awprot(s_axi_ad9250_1_AWPROT),
        .s_axi_awready(s_axi_ad9250_1_AWREADY),
        .s_axi_awvalid(s_axi_ad9250_1_AWVALID),
        .s_axi_bready(s_axi_ad9250_1_BREADY),
        .s_axi_bresp(s_axi_ad9250_1_BRESP),
        .s_axi_bvalid(s_axi_ad9250_1_BVALID),
        .s_axi_rdata(s_axi_ad9250_1_RDATA),
        .s_axi_rready(s_axi_ad9250_1_RREADY),
        .s_axi_rresp(s_axi_ad9250_1_RRESP),
        .s_axi_rvalid(s_axi_ad9250_1_RVALID),
        .s_axi_wdata(s_axi_ad9250_1_WDATA),
        .s_axi_wready(s_axi_ad9250_1_WREADY),
        .s_axi_wstrb(s_axi_ad9250_1_WSTRB),
        .s_axi_wvalid(s_axi_ad9250_1_WVALID));
  design_fmc_axi_ad9250_0_cpack_0 axi_ad9250_0_cpack
       (.clk(util_fmcjesdadc1_xcvr_rx_out_clk_0),
        .enable_0(axi_ad9250_0_core_adc_enable_a),
        .enable_1(axi_ad9250_0_core_adc_enable_b),
        .fifo_wr_data_0(axi_ad9250_0_core_adc_data_a),
        .fifo_wr_data_1(axi_ad9250_0_core_adc_data_b),
        .fifo_wr_en(axi_ad9250_0_core_adc_valid_a),
        .fifo_wr_overflow(axi_ad9250_0_cpack_fifo_wr_overflow),
        .packed_fifo_wr_data(axi_ad9250_0_cpack_packed_fifo_wr_DATA),
        .packed_fifo_wr_en(axi_ad9250_0_cpack_packed_fifo_wr_EN),
        .packed_fifo_wr_overflow(axi_ad9250_0_cpack_packed_fifo_wr_OVERFLOW),
        .packed_fifo_wr_sync(axi_ad9250_0_cpack_packed_fifo_wr_SYNC),
        .reset(axi_ad9250_jesd_rstgen_peripheral_reset));
  design_fmc_axi_ad9250_0_dma_0 axi_ad9250_0_dma
       (.fifo_wr_clk(axi_ad9250_0_core_adc_clk),
        .fifo_wr_din(axi_ad9250_0_cpack_packed_fifo_wr_DATA),
        .fifo_wr_en(axi_ad9250_0_cpack_packed_fifo_wr_EN),
        .fifo_wr_overflow(axi_ad9250_0_cpack_packed_fifo_wr_OVERFLOW),
        .fifo_wr_sync(axi_ad9250_0_cpack_packed_fifo_wr_SYNC),
        .irq(axi_ad9250_0_dma_irq),
        .m_dest_axi_aclk(sys_200m_clk),
        .m_dest_axi_aresetn(sys_200m_resetn),
        .m_dest_axi_awaddr(axi_ad9250_0_dma_m_dest_axi_AWADDR),
        .m_dest_axi_awburst(axi_ad9250_0_dma_m_dest_axi_AWBURST),
        .m_dest_axi_awcache(axi_ad9250_0_dma_m_dest_axi_AWCACHE),
        .m_dest_axi_awlen(axi_ad9250_0_dma_m_dest_axi_AWLEN),
        .m_dest_axi_awprot(axi_ad9250_0_dma_m_dest_axi_AWPROT),
        .m_dest_axi_awready(axi_ad9250_0_dma_m_dest_axi_AWREADY),
        .m_dest_axi_awsize(axi_ad9250_0_dma_m_dest_axi_AWSIZE),
        .m_dest_axi_awvalid(axi_ad9250_0_dma_m_dest_axi_AWVALID),
        .m_dest_axi_bready(axi_ad9250_0_dma_m_dest_axi_BREADY),
        .m_dest_axi_bresp(axi_ad9250_0_dma_m_dest_axi_BRESP),
        .m_dest_axi_bvalid(axi_ad9250_0_dma_m_dest_axi_BVALID),
        .m_dest_axi_wdata(axi_ad9250_0_dma_m_dest_axi_WDATA),
        .m_dest_axi_wlast(axi_ad9250_0_dma_m_dest_axi_WLAST),
        .m_dest_axi_wready(axi_ad9250_0_dma_m_dest_axi_WREADY),
        .m_dest_axi_wstrb(axi_ad9250_0_dma_m_dest_axi_WSTRB),
        .m_dest_axi_wvalid(axi_ad9250_0_dma_m_dest_axi_WVALID),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(s_axi_dma_1_1_ARADDR),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arprot(s_axi_dma_1_1_ARPROT),
        .s_axi_arready(s_axi_dma_1_1_ARREADY),
        .s_axi_arvalid(s_axi_dma_1_1_ARVALID),
        .s_axi_awaddr(s_axi_dma_1_1_AWADDR),
        .s_axi_awprot(s_axi_dma_1_1_AWPROT),
        .s_axi_awready(s_axi_dma_1_1_AWREADY),
        .s_axi_awvalid(s_axi_dma_1_1_AWVALID),
        .s_axi_bready(s_axi_dma_1_1_BREADY),
        .s_axi_bresp(s_axi_dma_1_1_BRESP),
        .s_axi_bvalid(s_axi_dma_1_1_BVALID),
        .s_axi_rdata(s_axi_dma_1_1_RDATA),
        .s_axi_rready(s_axi_dma_1_1_RREADY),
        .s_axi_rresp(s_axi_dma_1_1_RRESP),
        .s_axi_rvalid(s_axi_dma_1_1_RVALID),
        .s_axi_wdata(s_axi_dma_1_1_WDATA),
        .s_axi_wready(s_axi_dma_1_1_WREADY),
        .s_axi_wstrb(s_axi_dma_1_1_WSTRB),
        .s_axi_wvalid(s_axi_dma_1_1_WVALID));
  design_fmc_axi_ad9250_1_core_0 axi_ad9250_1_core
       (.adc_clk(axi_ad9250_1_core_adc_clk),
        .adc_data_a(axi_ad9250_1_core_adc_data_a),
        .adc_data_b(axi_ad9250_1_core_adc_data_b),
        .adc_dovf(axi_ad9250_1_cpack_fifo_wr_overflow),
        .adc_enable_a(axi_ad9250_1_core_adc_enable_a),
        .adc_enable_b(axi_ad9250_1_core_adc_enable_b),
        .adc_valid_a(axi_ad9250_1_core_adc_valid_a),
        .rx_clk(util_fmcjesdadc1_xcvr_rx_out_clk_0),
        .rx_data(data_bsplit_split_data_1),
        .rx_sof(axi_ad9250_jesd_rx_sof),
        .rx_valid(1'b0),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(s_axi_ad9259_1_1_ARADDR),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arprot(s_axi_ad9259_1_1_ARPROT),
        .s_axi_arready(s_axi_ad9259_1_1_ARREADY),
        .s_axi_arvalid(s_axi_ad9259_1_1_ARVALID),
        .s_axi_awaddr(s_axi_ad9259_1_1_AWADDR),
        .s_axi_awprot(s_axi_ad9259_1_1_AWPROT),
        .s_axi_awready(s_axi_ad9259_1_1_AWREADY),
        .s_axi_awvalid(s_axi_ad9259_1_1_AWVALID),
        .s_axi_bready(s_axi_ad9259_1_1_BREADY),
        .s_axi_bresp(s_axi_ad9259_1_1_BRESP),
        .s_axi_bvalid(s_axi_ad9259_1_1_BVALID),
        .s_axi_rdata(s_axi_ad9259_1_1_RDATA),
        .s_axi_rready(s_axi_ad9259_1_1_RREADY),
        .s_axi_rresp(s_axi_ad9259_1_1_RRESP),
        .s_axi_rvalid(s_axi_ad9259_1_1_RVALID),
        .s_axi_wdata(s_axi_ad9259_1_1_WDATA),
        .s_axi_wready(s_axi_ad9259_1_1_WREADY),
        .s_axi_wstrb(s_axi_ad9259_1_1_WSTRB),
        .s_axi_wvalid(s_axi_ad9259_1_1_WVALID));
  design_fmc_axi_ad9250_1_cpack_0 axi_ad9250_1_cpack
       (.clk(util_fmcjesdadc1_xcvr_rx_out_clk_0),
        .enable_0(axi_ad9250_1_core_adc_enable_a),
        .enable_1(axi_ad9250_1_core_adc_enable_b),
        .fifo_wr_data_0(axi_ad9250_1_core_adc_data_a),
        .fifo_wr_data_1(axi_ad9250_1_core_adc_data_b),
        .fifo_wr_en(axi_ad9250_1_core_adc_valid_a),
        .fifo_wr_overflow(axi_ad9250_1_cpack_fifo_wr_overflow),
        .packed_fifo_wr_data(axi_ad9250_1_cpack_packed_fifo_wr_DATA),
        .packed_fifo_wr_en(axi_ad9250_1_cpack_packed_fifo_wr_EN),
        .packed_fifo_wr_overflow(axi_ad9250_1_cpack_packed_fifo_wr_OVERFLOW),
        .packed_fifo_wr_sync(axi_ad9250_1_cpack_packed_fifo_wr_SYNC),
        .reset(axi_ad9250_jesd_rstgen_peripheral_reset));
  design_fmc_axi_ad9250_1_dma_0 axi_ad9250_1_dma
       (.fifo_wr_clk(axi_ad9250_1_core_adc_clk),
        .fifo_wr_din(axi_ad9250_1_cpack_packed_fifo_wr_DATA),
        .fifo_wr_en(axi_ad9250_1_cpack_packed_fifo_wr_EN),
        .fifo_wr_overflow(axi_ad9250_1_cpack_packed_fifo_wr_OVERFLOW),
        .fifo_wr_sync(axi_ad9250_1_cpack_packed_fifo_wr_SYNC),
        .irq(axi_ad9250_1_dma_irq),
        .m_dest_axi_aclk(sys_200m_clk),
        .m_dest_axi_aresetn(sys_200m_resetn),
        .m_dest_axi_awaddr(axi_ad9250_1_dma_m_dest_axi_AWADDR),
        .m_dest_axi_awburst(axi_ad9250_1_dma_m_dest_axi_AWBURST),
        .m_dest_axi_awcache(axi_ad9250_1_dma_m_dest_axi_AWCACHE),
        .m_dest_axi_awlen(axi_ad9250_1_dma_m_dest_axi_AWLEN),
        .m_dest_axi_awprot(axi_ad9250_1_dma_m_dest_axi_AWPROT),
        .m_dest_axi_awready(axi_ad9250_1_dma_m_dest_axi_AWREADY),
        .m_dest_axi_awsize(axi_ad9250_1_dma_m_dest_axi_AWSIZE),
        .m_dest_axi_awvalid(axi_ad9250_1_dma_m_dest_axi_AWVALID),
        .m_dest_axi_bready(axi_ad9250_1_dma_m_dest_axi_BREADY),
        .m_dest_axi_bresp(axi_ad9250_1_dma_m_dest_axi_BRESP),
        .m_dest_axi_bvalid(axi_ad9250_1_dma_m_dest_axi_BVALID),
        .m_dest_axi_wdata(axi_ad9250_1_dma_m_dest_axi_WDATA),
        .m_dest_axi_wlast(axi_ad9250_1_dma_m_dest_axi_WLAST),
        .m_dest_axi_wready(axi_ad9250_1_dma_m_dest_axi_WREADY),
        .m_dest_axi_wstrb(axi_ad9250_1_dma_m_dest_axi_WSTRB),
        .m_dest_axi_wvalid(axi_ad9250_1_dma_m_dest_axi_WVALID),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(s_axi_dma_0_1_ARADDR),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arprot(s_axi_dma_0_1_ARPROT),
        .s_axi_arready(s_axi_dma_0_1_ARREADY),
        .s_axi_arvalid(s_axi_dma_0_1_ARVALID),
        .s_axi_awaddr(s_axi_dma_0_1_AWADDR),
        .s_axi_awprot(s_axi_dma_0_1_AWPROT),
        .s_axi_awready(s_axi_dma_0_1_AWREADY),
        .s_axi_awvalid(s_axi_dma_0_1_AWVALID),
        .s_axi_bready(s_axi_dma_0_1_BREADY),
        .s_axi_bresp(s_axi_dma_0_1_BRESP),
        .s_axi_bvalid(s_axi_dma_0_1_BVALID),
        .s_axi_rdata(s_axi_dma_0_1_RDATA),
        .s_axi_rready(s_axi_dma_0_1_RREADY),
        .s_axi_rresp(s_axi_dma_0_1_RRESP),
        .s_axi_rvalid(s_axi_dma_0_1_RVALID),
        .s_axi_wdata(s_axi_dma_0_1_WDATA),
        .s_axi_wready(s_axi_dma_0_1_WREADY),
        .s_axi_wstrb(s_axi_dma_0_1_WSTRB),
        .s_axi_wvalid(s_axi_dma_0_1_WVALID));
  axi_ad9250_jesd_imp_OCMOVV axi_ad9250_jesd
       (.device_clk(util_fmcjesdadc1_xcvr_rx_out_clk_0),
        .irq(axi_ad9250_jesd_irq),
        .phy_en_char_align(axi_ad9250_jesd_phy_en_char_align),
        .rx_data_tdata(axi_ad9250_jesd_rx_data_tdata),
        .rx_phy0_rxcharisk(util_fmcjesdadc1_xcvr_rx_0_rxcharisk),
        .rx_phy0_rxdata(util_fmcjesdadc1_xcvr_rx_0_rxdata),
        .rx_phy0_rxdisperr(util_fmcjesdadc1_xcvr_rx_0_rxdisperr),
        .rx_phy0_rxnotintable(util_fmcjesdadc1_xcvr_rx_0_rxnotintable),
        .rx_phy1_rxcharisk(util_fmcjesdadc1_xcvr_rx_1_rxcharisk),
        .rx_phy1_rxdata(util_fmcjesdadc1_xcvr_rx_1_rxdata),
        .rx_phy1_rxdisperr(util_fmcjesdadc1_xcvr_rx_1_rxdisperr),
        .rx_phy1_rxnotintable(util_fmcjesdadc1_xcvr_rx_1_rxnotintable),
        .rx_phy2_rxcharisk(util_fmcjesdadc1_xcvr_rx_2_rxcharisk),
        .rx_phy2_rxdata(util_fmcjesdadc1_xcvr_rx_2_rxdata),
        .rx_phy2_rxdisperr(util_fmcjesdadc1_xcvr_rx_2_rxdisperr),
        .rx_phy2_rxnotintable(util_fmcjesdadc1_xcvr_rx_2_rxnotintable),
        .rx_phy3_rxcharisk(util_fmcjesdadc1_xcvr_rx_3_rxcharisk),
        .rx_phy3_rxdata(util_fmcjesdadc1_xcvr_rx_3_rxdata),
        .rx_phy3_rxdisperr(util_fmcjesdadc1_xcvr_rx_3_rxdisperr),
        .rx_phy3_rxnotintable(util_fmcjesdadc1_xcvr_rx_3_rxnotintable),
        .rx_sof(axi_ad9250_jesd_rx_sof),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(1'b0),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arprot(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr(1'b0),
        .s_axi_awprot(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bready(1'b0),
        .s_axi_rready(1'b0),
        .s_axi_wdata(1'b0),
        .s_axi_wstrb(1'b1),
        .s_axi_wvalid(1'b0),
        .sync(axi_ad9250_jesd_sync),
        .sysref(sysref_1));
  design_fmc_axi_ad9250_jesd_rstgen_0 axi_ad9250_jesd_rstgen
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(sys_cpu_resetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_reset(axi_ad9250_jesd_rstgen_peripheral_reset),
        .slowest_sync_clk(util_fmcjesdadc1_xcvr_rx_out_clk_0));
  design_fmc_axi_ad9250_xcvr_0 axi_ad9250_xcvr
       (.m_axi_arready(1'b0),
        .m_axi_awready(1'b0),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_rvalid(1'b0),
        .m_axi_wready(1'b0),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(s_axi_xcvr_1_ARADDR),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arprot(s_axi_xcvr_1_ARPROT),
        .s_axi_arready(s_axi_xcvr_1_ARREADY),
        .s_axi_arvalid(s_axi_xcvr_1_ARVALID),
        .s_axi_awaddr(s_axi_xcvr_1_AWADDR),
        .s_axi_awprot(s_axi_xcvr_1_AWPROT),
        .s_axi_awready(s_axi_xcvr_1_AWREADY),
        .s_axi_awvalid(s_axi_xcvr_1_AWVALID),
        .s_axi_bready(s_axi_xcvr_1_BREADY),
        .s_axi_bresp(s_axi_xcvr_1_BRESP),
        .s_axi_bvalid(s_axi_xcvr_1_BVALID),
        .s_axi_rdata(s_axi_xcvr_1_RDATA),
        .s_axi_rready(s_axi_xcvr_1_RREADY),
        .s_axi_rresp(s_axi_xcvr_1_RRESP),
        .s_axi_rvalid(s_axi_xcvr_1_RVALID),
        .s_axi_wdata(s_axi_xcvr_1_WDATA),
        .s_axi_wready(s_axi_xcvr_1_WREADY),
        .s_axi_wstrb(s_axi_xcvr_1_WSTRB),
        .s_axi_wvalid(s_axi_xcvr_1_WVALID),
        .up_ch_addr_0(axi_ad9250_xcvr_up_ch_0_addr),
        .up_ch_addr_1(axi_ad9250_xcvr_up_ch_1_addr),
        .up_ch_addr_2(axi_ad9250_xcvr_up_ch_2_addr),
        .up_ch_addr_3(axi_ad9250_xcvr_up_ch_3_addr),
        .up_ch_enb_0(axi_ad9250_xcvr_up_ch_0_enb),
        .up_ch_enb_1(axi_ad9250_xcvr_up_ch_1_enb),
        .up_ch_enb_2(axi_ad9250_xcvr_up_ch_2_enb),
        .up_ch_enb_3(axi_ad9250_xcvr_up_ch_3_enb),
        .up_ch_lpm_dfe_n_0(axi_ad9250_xcvr_up_ch_0_lpm_dfe_n),
        .up_ch_lpm_dfe_n_1(axi_ad9250_xcvr_up_ch_1_lpm_dfe_n),
        .up_ch_lpm_dfe_n_2(axi_ad9250_xcvr_up_ch_2_lpm_dfe_n),
        .up_ch_lpm_dfe_n_3(axi_ad9250_xcvr_up_ch_3_lpm_dfe_n),
        .up_ch_out_clk_sel_0(axi_ad9250_xcvr_up_ch_0_out_clk_sel),
        .up_ch_out_clk_sel_1(axi_ad9250_xcvr_up_ch_1_out_clk_sel),
        .up_ch_out_clk_sel_2(axi_ad9250_xcvr_up_ch_2_out_clk_sel),
        .up_ch_out_clk_sel_3(axi_ad9250_xcvr_up_ch_3_out_clk_sel),
        .up_ch_pll_locked_0(axi_ad9250_xcvr_up_ch_0_pll_locked),
        .up_ch_pll_locked_1(axi_ad9250_xcvr_up_ch_1_pll_locked),
        .up_ch_pll_locked_2(axi_ad9250_xcvr_up_ch_2_pll_locked),
        .up_ch_pll_locked_3(axi_ad9250_xcvr_up_ch_3_pll_locked),
        .up_ch_rate_0(axi_ad9250_xcvr_up_ch_0_rate),
        .up_ch_rate_1(axi_ad9250_xcvr_up_ch_1_rate),
        .up_ch_rate_2(axi_ad9250_xcvr_up_ch_2_rate),
        .up_ch_rate_3(axi_ad9250_xcvr_up_ch_3_rate),
        .up_ch_rdata_0(axi_ad9250_xcvr_up_ch_0_rdata),
        .up_ch_rdata_1(axi_ad9250_xcvr_up_ch_1_rdata),
        .up_ch_rdata_2(axi_ad9250_xcvr_up_ch_2_rdata),
        .up_ch_rdata_3(axi_ad9250_xcvr_up_ch_3_rdata),
        .up_ch_ready_0(axi_ad9250_xcvr_up_ch_0_ready),
        .up_ch_ready_1(axi_ad9250_xcvr_up_ch_1_ready),
        .up_ch_ready_2(axi_ad9250_xcvr_up_ch_2_ready),
        .up_ch_ready_3(axi_ad9250_xcvr_up_ch_3_ready),
        .up_ch_rst_0(axi_ad9250_xcvr_up_ch_0_rst),
        .up_ch_rst_1(axi_ad9250_xcvr_up_ch_1_rst),
        .up_ch_rst_2(axi_ad9250_xcvr_up_ch_2_rst),
        .up_ch_rst_3(axi_ad9250_xcvr_up_ch_3_rst),
        .up_ch_rst_done_0(axi_ad9250_xcvr_up_ch_0_rst_done),
        .up_ch_rst_done_1(axi_ad9250_xcvr_up_ch_1_rst_done),
        .up_ch_rst_done_2(axi_ad9250_xcvr_up_ch_2_rst_done),
        .up_ch_rst_done_3(axi_ad9250_xcvr_up_ch_3_rst_done),
        .up_ch_sys_clk_sel_0(axi_ad9250_xcvr_up_ch_0_sys_clk_sel),
        .up_ch_sys_clk_sel_1(axi_ad9250_xcvr_up_ch_1_sys_clk_sel),
        .up_ch_sys_clk_sel_2(axi_ad9250_xcvr_up_ch_2_sys_clk_sel),
        .up_ch_sys_clk_sel_3(axi_ad9250_xcvr_up_ch_3_sys_clk_sel),
        .up_ch_user_ready_0(axi_ad9250_xcvr_up_ch_0_user_ready),
        .up_ch_user_ready_1(axi_ad9250_xcvr_up_ch_1_user_ready),
        .up_ch_user_ready_2(axi_ad9250_xcvr_up_ch_2_user_ready),
        .up_ch_user_ready_3(axi_ad9250_xcvr_up_ch_3_user_ready),
        .up_ch_wdata_0(axi_ad9250_xcvr_up_ch_0_wdata),
        .up_ch_wdata_1(axi_ad9250_xcvr_up_ch_1_wdata),
        .up_ch_wdata_2(axi_ad9250_xcvr_up_ch_2_wdata),
        .up_ch_wdata_3(axi_ad9250_xcvr_up_ch_3_wdata),
        .up_ch_wr_0(axi_ad9250_xcvr_up_ch_0_wr),
        .up_ch_wr_1(axi_ad9250_xcvr_up_ch_1_wr),
        .up_ch_wr_2(axi_ad9250_xcvr_up_ch_2_wr),
        .up_ch_wr_3(axi_ad9250_xcvr_up_ch_3_wr),
        .up_es_addr_0(axi_ad9250_xcvr_up_es_0_addr),
        .up_es_addr_1(axi_ad9250_xcvr_up_es_1_addr),
        .up_es_addr_2(axi_ad9250_xcvr_up_es_2_addr),
        .up_es_addr_3(axi_ad9250_xcvr_up_es_3_addr),
        .up_es_enb_0(axi_ad9250_xcvr_up_es_0_enb),
        .up_es_enb_1(axi_ad9250_xcvr_up_es_1_enb),
        .up_es_enb_2(axi_ad9250_xcvr_up_es_2_enb),
        .up_es_enb_3(axi_ad9250_xcvr_up_es_3_enb),
        .up_es_rdata_0(axi_ad9250_xcvr_up_es_0_rdata),
        .up_es_rdata_1(axi_ad9250_xcvr_up_es_1_rdata),
        .up_es_rdata_2(axi_ad9250_xcvr_up_es_2_rdata),
        .up_es_rdata_3(axi_ad9250_xcvr_up_es_3_rdata),
        .up_es_ready_0(axi_ad9250_xcvr_up_es_0_ready),
        .up_es_ready_1(axi_ad9250_xcvr_up_es_1_ready),
        .up_es_ready_2(axi_ad9250_xcvr_up_es_2_ready),
        .up_es_ready_3(axi_ad9250_xcvr_up_es_3_ready),
        .up_es_reset_0(axi_ad9250_xcvr_up_es_0_reset),
        .up_es_reset_1(axi_ad9250_xcvr_up_es_1_reset),
        .up_es_reset_2(axi_ad9250_xcvr_up_es_2_reset),
        .up_es_reset_3(axi_ad9250_xcvr_up_es_3_reset),
        .up_es_wdata_0(axi_ad9250_xcvr_up_es_0_wdata),
        .up_es_wdata_1(axi_ad9250_xcvr_up_es_1_wdata),
        .up_es_wdata_2(axi_ad9250_xcvr_up_es_2_wdata),
        .up_es_wdata_3(axi_ad9250_xcvr_up_es_3_wdata),
        .up_es_wr_0(axi_ad9250_xcvr_up_es_0_wr),
        .up_es_wr_1(axi_ad9250_xcvr_up_es_1_wr),
        .up_es_wr_2(axi_ad9250_xcvr_up_es_2_wr),
        .up_es_wr_3(axi_ad9250_xcvr_up_es_3_wr),
        .up_pll_rst(axi_ad9250_xcvr_up_pll_rst));
  design_fmc_axi_spi_0 axi_spi
       (.ext_spi_clk(sys_cpu_clk),
        .io0_i(spi_sdo_i_1),
        .io0_o(axi_spi_io0_o),
        .io1_i(spi_sdi_i_1),
        .ip2intc_irpt(axi_spi_ip2intc_irpt),
        .s_axi_aclk(sys_cpu_clk),
        .s_axi_araddr(AXI_LITE_fmcspi_1_ARADDR),
        .s_axi_aresetn(sys_cpu_resetn),
        .s_axi_arready(AXI_LITE_fmcspi_1_ARREADY),
        .s_axi_arvalid(AXI_LITE_fmcspi_1_ARVALID),
        .s_axi_awaddr(AXI_LITE_fmcspi_1_AWADDR),
        .s_axi_awready(AXI_LITE_fmcspi_1_AWREADY),
        .s_axi_awvalid(AXI_LITE_fmcspi_1_AWVALID),
        .s_axi_bready(AXI_LITE_fmcspi_1_BREADY),
        .s_axi_bresp(AXI_LITE_fmcspi_1_BRESP),
        .s_axi_bvalid(AXI_LITE_fmcspi_1_BVALID),
        .s_axi_rdata(AXI_LITE_fmcspi_1_RDATA),
        .s_axi_rready(AXI_LITE_fmcspi_1_RREADY),
        .s_axi_rresp(AXI_LITE_fmcspi_1_RRESP),
        .s_axi_rvalid(AXI_LITE_fmcspi_1_RVALID),
        .s_axi_wdata(AXI_LITE_fmcspi_1_WDATA),
        .s_axi_wready(AXI_LITE_fmcspi_1_WREADY),
        .s_axi_wstrb(AXI_LITE_fmcspi_1_WSTRB),
        .s_axi_wvalid(AXI_LITE_fmcspi_1_WVALID),
        .sck_i(spi_clk_i_1),
        .sck_o(axi_spi_sck_o),
        .ss_i(spi_csn_i_1),
        .ss_o(axi_spi_ss_o));
  design_fmc_data_bsplit_0 data_bsplit
       (.data(axi_ad9250_jesd_rx_data_tdata),
        .split_data_0(data_bsplit_split_data_0),
        .split_data_1(data_bsplit_split_data_1));
  design_fmc_sys_concat_intc_0 sys_concat_intc
       (.In0(1'b0),
        .In1(1'b0),
        .In10(axi_spi_ip2intc_irpt),
        .In11(1'b0),
        .In12(axi_ad9250_1_dma_irq),
        .In13(axi_ad9250_0_dma_irq),
        .In14(axi_ad9250_jesd_irq),
        .In15(GND_1_dout),
        .In2(GND_1_dout),
        .In3(GND_1_dout),
        .In4(1'b0),
        .In5(1'b0),
        .In6(GND_1_dout),
        .In7(GND_1_dout),
        .In8(GND_1_dout),
        .In9(1'b0));
  design_fmc_util_fmcjesdadc1_xcvr_0 util_fmcjesdadc1_xcvr
       (.cpll_ref_clk_0(rx_ref_clk_0_1),
        .cpll_ref_clk_1(rx_ref_clk_0_1),
        .cpll_ref_clk_2(rx_ref_clk_0_1),
        .cpll_ref_clk_3(rx_ref_clk_0_1),
        .qpll_ref_clk_0(rx_ref_clk_0_1),
        .rx_0_n(rx_data_0_n_1),
        .rx_0_p(rx_data_0_p_1),
        .rx_1_n(rx_data_1_n_1),
        .rx_1_p(rx_data_1_p_1),
        .rx_2_n(rx_data_2_n_1),
        .rx_2_p(rx_data_2_p_1),
        .rx_3_n(rx_data_3_n_1),
        .rx_3_p(rx_data_3_p_1),
        .rx_calign_0(axi_ad9250_jesd_phy_en_char_align),
        .rx_calign_1(axi_ad9250_jesd_phy_en_char_align),
        .rx_calign_2(axi_ad9250_jesd_phy_en_char_align),
        .rx_calign_3(axi_ad9250_jesd_phy_en_char_align),
        .rx_charisk_0(util_fmcjesdadc1_xcvr_rx_0_rxcharisk),
        .rx_charisk_1(util_fmcjesdadc1_xcvr_rx_1_rxcharisk),
        .rx_charisk_2(util_fmcjesdadc1_xcvr_rx_2_rxcharisk),
        .rx_charisk_3(util_fmcjesdadc1_xcvr_rx_3_rxcharisk),
        .rx_clk_0(util_fmcjesdadc1_xcvr_rx_out_clk_0),
        .rx_clk_1(util_fmcjesdadc1_xcvr_rx_out_clk_0),
        .rx_clk_2(util_fmcjesdadc1_xcvr_rx_out_clk_0),
        .rx_clk_3(util_fmcjesdadc1_xcvr_rx_out_clk_0),
        .rx_data_0(util_fmcjesdadc1_xcvr_rx_0_rxdata),
        .rx_data_1(util_fmcjesdadc1_xcvr_rx_1_rxdata),
        .rx_data_2(util_fmcjesdadc1_xcvr_rx_2_rxdata),
        .rx_data_3(util_fmcjesdadc1_xcvr_rx_3_rxdata),
        .rx_disperr_0(util_fmcjesdadc1_xcvr_rx_0_rxdisperr),
        .rx_disperr_1(util_fmcjesdadc1_xcvr_rx_1_rxdisperr),
        .rx_disperr_2(util_fmcjesdadc1_xcvr_rx_2_rxdisperr),
        .rx_disperr_3(util_fmcjesdadc1_xcvr_rx_3_rxdisperr),
        .rx_notintable_0(util_fmcjesdadc1_xcvr_rx_0_rxnotintable),
        .rx_notintable_1(util_fmcjesdadc1_xcvr_rx_1_rxnotintable),
        .rx_notintable_2(util_fmcjesdadc1_xcvr_rx_2_rxnotintable),
        .rx_notintable_3(util_fmcjesdadc1_xcvr_rx_3_rxnotintable),
        .rx_out_clk_0(util_fmcjesdadc1_xcvr_rx_out_clk_0),
        .up_clk(sys_cpu_clk),
        .up_cm_addr_0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .up_cm_enb_0(1'b0),
        .up_cm_wdata_0({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .up_cm_wr_0(1'b0),
        .up_cpll_rst_0(axi_ad9250_xcvr_up_pll_rst),
        .up_cpll_rst_1(axi_ad9250_xcvr_up_pll_rst),
        .up_cpll_rst_2(axi_ad9250_xcvr_up_pll_rst),
        .up_cpll_rst_3(axi_ad9250_xcvr_up_pll_rst),
        .up_es_addr_0(axi_ad9250_xcvr_up_es_0_addr),
        .up_es_addr_1(axi_ad9250_xcvr_up_es_1_addr),
        .up_es_addr_2(axi_ad9250_xcvr_up_es_2_addr),
        .up_es_addr_3(axi_ad9250_xcvr_up_es_3_addr),
        .up_es_enb_0(axi_ad9250_xcvr_up_es_0_enb),
        .up_es_enb_1(axi_ad9250_xcvr_up_es_1_enb),
        .up_es_enb_2(axi_ad9250_xcvr_up_es_2_enb),
        .up_es_enb_3(axi_ad9250_xcvr_up_es_3_enb),
        .up_es_rdata_0(axi_ad9250_xcvr_up_es_0_rdata),
        .up_es_rdata_1(axi_ad9250_xcvr_up_es_1_rdata),
        .up_es_rdata_2(axi_ad9250_xcvr_up_es_2_rdata),
        .up_es_rdata_3(axi_ad9250_xcvr_up_es_3_rdata),
        .up_es_ready_0(axi_ad9250_xcvr_up_es_0_ready),
        .up_es_ready_1(axi_ad9250_xcvr_up_es_1_ready),
        .up_es_ready_2(axi_ad9250_xcvr_up_es_2_ready),
        .up_es_ready_3(axi_ad9250_xcvr_up_es_3_ready),
        .up_es_reset_0(axi_ad9250_xcvr_up_es_0_reset),
        .up_es_reset_1(axi_ad9250_xcvr_up_es_1_reset),
        .up_es_reset_2(axi_ad9250_xcvr_up_es_2_reset),
        .up_es_reset_3(axi_ad9250_xcvr_up_es_3_reset),
        .up_es_wdata_0(axi_ad9250_xcvr_up_es_0_wdata),
        .up_es_wdata_1(axi_ad9250_xcvr_up_es_1_wdata),
        .up_es_wdata_2(axi_ad9250_xcvr_up_es_2_wdata),
        .up_es_wdata_3(axi_ad9250_xcvr_up_es_3_wdata),
        .up_es_wr_0(axi_ad9250_xcvr_up_es_0_wr),
        .up_es_wr_1(axi_ad9250_xcvr_up_es_1_wr),
        .up_es_wr_2(axi_ad9250_xcvr_up_es_2_wr),
        .up_es_wr_3(axi_ad9250_xcvr_up_es_3_wr),
        .up_qpll_rst_0(axi_ad9250_xcvr_up_pll_rst),
        .up_rstn(sys_cpu_resetn),
        .up_rx_addr_0(axi_ad9250_xcvr_up_ch_0_addr),
        .up_rx_addr_1(axi_ad9250_xcvr_up_ch_1_addr),
        .up_rx_addr_2(axi_ad9250_xcvr_up_ch_2_addr),
        .up_rx_addr_3(axi_ad9250_xcvr_up_ch_3_addr),
        .up_rx_enb_0(axi_ad9250_xcvr_up_ch_0_enb),
        .up_rx_enb_1(axi_ad9250_xcvr_up_ch_1_enb),
        .up_rx_enb_2(axi_ad9250_xcvr_up_ch_2_enb),
        .up_rx_enb_3(axi_ad9250_xcvr_up_ch_3_enb),
        .up_rx_lpm_dfe_n_0(axi_ad9250_xcvr_up_ch_0_lpm_dfe_n),
        .up_rx_lpm_dfe_n_1(axi_ad9250_xcvr_up_ch_1_lpm_dfe_n),
        .up_rx_lpm_dfe_n_2(axi_ad9250_xcvr_up_ch_2_lpm_dfe_n),
        .up_rx_lpm_dfe_n_3(axi_ad9250_xcvr_up_ch_3_lpm_dfe_n),
        .up_rx_out_clk_sel_0(axi_ad9250_xcvr_up_ch_0_out_clk_sel),
        .up_rx_out_clk_sel_1(axi_ad9250_xcvr_up_ch_1_out_clk_sel),
        .up_rx_out_clk_sel_2(axi_ad9250_xcvr_up_ch_2_out_clk_sel),
        .up_rx_out_clk_sel_3(axi_ad9250_xcvr_up_ch_3_out_clk_sel),
        .up_rx_pll_locked_0(axi_ad9250_xcvr_up_ch_0_pll_locked),
        .up_rx_pll_locked_1(axi_ad9250_xcvr_up_ch_1_pll_locked),
        .up_rx_pll_locked_2(axi_ad9250_xcvr_up_ch_2_pll_locked),
        .up_rx_pll_locked_3(axi_ad9250_xcvr_up_ch_3_pll_locked),
        .up_rx_rate_0(axi_ad9250_xcvr_up_ch_0_rate),
        .up_rx_rate_1(axi_ad9250_xcvr_up_ch_1_rate),
        .up_rx_rate_2(axi_ad9250_xcvr_up_ch_2_rate),
        .up_rx_rate_3(axi_ad9250_xcvr_up_ch_3_rate),
        .up_rx_rdata_0(axi_ad9250_xcvr_up_ch_0_rdata),
        .up_rx_rdata_1(axi_ad9250_xcvr_up_ch_1_rdata),
        .up_rx_rdata_2(axi_ad9250_xcvr_up_ch_2_rdata),
        .up_rx_rdata_3(axi_ad9250_xcvr_up_ch_3_rdata),
        .up_rx_ready_0(axi_ad9250_xcvr_up_ch_0_ready),
        .up_rx_ready_1(axi_ad9250_xcvr_up_ch_1_ready),
        .up_rx_ready_2(axi_ad9250_xcvr_up_ch_2_ready),
        .up_rx_ready_3(axi_ad9250_xcvr_up_ch_3_ready),
        .up_rx_rst_0(axi_ad9250_xcvr_up_ch_0_rst),
        .up_rx_rst_1(axi_ad9250_xcvr_up_ch_1_rst),
        .up_rx_rst_2(axi_ad9250_xcvr_up_ch_2_rst),
        .up_rx_rst_3(axi_ad9250_xcvr_up_ch_3_rst),
        .up_rx_rst_done_0(axi_ad9250_xcvr_up_ch_0_rst_done),
        .up_rx_rst_done_1(axi_ad9250_xcvr_up_ch_1_rst_done),
        .up_rx_rst_done_2(axi_ad9250_xcvr_up_ch_2_rst_done),
        .up_rx_rst_done_3(axi_ad9250_xcvr_up_ch_3_rst_done),
        .up_rx_sys_clk_sel_0(axi_ad9250_xcvr_up_ch_0_sys_clk_sel),
        .up_rx_sys_clk_sel_1(axi_ad9250_xcvr_up_ch_1_sys_clk_sel),
        .up_rx_sys_clk_sel_2(axi_ad9250_xcvr_up_ch_2_sys_clk_sel),
        .up_rx_sys_clk_sel_3(axi_ad9250_xcvr_up_ch_3_sys_clk_sel),
        .up_rx_user_ready_0(axi_ad9250_xcvr_up_ch_0_user_ready),
        .up_rx_user_ready_1(axi_ad9250_xcvr_up_ch_1_user_ready),
        .up_rx_user_ready_2(axi_ad9250_xcvr_up_ch_2_user_ready),
        .up_rx_user_ready_3(axi_ad9250_xcvr_up_ch_3_user_ready),
        .up_rx_wdata_0(axi_ad9250_xcvr_up_ch_0_wdata),
        .up_rx_wdata_1(axi_ad9250_xcvr_up_ch_1_wdata),
        .up_rx_wdata_2(axi_ad9250_xcvr_up_ch_2_wdata),
        .up_rx_wdata_3(axi_ad9250_xcvr_up_ch_3_wdata),
        .up_rx_wr_0(axi_ad9250_xcvr_up_ch_0_wr),
        .up_rx_wr_1(axi_ad9250_xcvr_up_ch_1_wr),
        .up_rx_wr_2(axi_ad9250_xcvr_up_ch_2_wr),
        .up_rx_wr_3(axi_ad9250_xcvr_up_ch_3_wr));
endmodule
