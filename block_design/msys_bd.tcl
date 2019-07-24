catch {TE::UTILS::te_msg TE_BD-0 INFO "This block design tcl-file was generate with Trenz Electronic GmbH Board Part:trenz.biz:tef1001_160_2i:part0:1.0, FPGA: xc7k160tfbg676-2 at 2019-07-23T15:54:52."}

################################################################
# This is a generated script based on design: msys
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source msys_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7k160tfbg676-2
   set_property BOARD_PART trenz.biz:tef1001_160_2i:part0:1.0 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name msys

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
trenz.biz:user:SCF1001:1.0\
xilinx.com:ip:axi_iic:2.0\
xilinx.com:ip:axi_quad_spi:3.2\
xilinx.com:ip:axi_timer:2.0\
xilinx.com:ip:xlconstant:1.1\
xilinx.com:ip:mig_7series:4.2\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:util_ds_buf:2.1\
xilinx.com:ip:xdma:4.1\
xilinx.com:ip:mdm:3.2\
xilinx.com:ip:microblaze:11.0\
xilinx.com:ip:axi_intc:4.1\
xilinx.com:ip:xlconcat:2.1\
trenz.biz:user:labtools_fmeter:1.0\
xilinx.com:ip:vio:3.0\
xilinx.com:ip:lmb_bram_if_cntlr:4.0\
xilinx.com:ip:lmb_v10:3.0\
xilinx.com:ip:blk_mem_gen:8.4\
"

   set list_ips_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

if { $bCheckIPsPassed != 1 } {
  common::send_msg_id "BD_TCL-1003" "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: microblaze_0_local_memory
proc create_hier_cell_microblaze_0_local_memory { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_microblaze_0_local_memory() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB

  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB


  # Create pins
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -type rst SYS_Rst

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
   CONFIG.C_ECC {0} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
   CONFIG.C_ECC {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 lmb_bram ]
  set_property -dict [ list \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Use_RSTB_Pin {true} \
   CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: vio
proc create_hier_cell_vio { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_vio() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 SI_FCLK

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 SI_MGT115_0


  # Create pins
  create_bd_pin -dir O -from 0 -to 0 USR_CPLD_LED
  create_bd_pin -dir O -from 9 -to 0 USR_LED
  create_bd_pin -dir I -type clk clk
  create_bd_pin -dir I -from 0 -to 0 probe_in5
  create_bd_pin -dir I -from 0 -to 0 probe_in6
  create_bd_pin -dir I -from 0 -to 0 probe_in7
  create_bd_pin -dir O -from 0 -to 0 probe_out0
  create_bd_pin -dir O -from 0 -to 0 probe_out2

  # Create instance: labtools_fmeter_0, and set properties
  set labtools_fmeter_0 [ create_bd_cell -type ip -vlnv trenz.biz:user:labtools_fmeter:1.0 labtools_fmeter_0 ]
  set_property -dict [ list \
   CONFIG.C_REFCLK_HZ {50000000} \
 ] $labtools_fmeter_0

  # Create instance: util_ds_buf_0, and set properties
  set util_ds_buf_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_0 ]
  set_property -dict [ list \
   CONFIG.C_SIZE {3} \
 ] $util_ds_buf_0

  # Create instance: util_ds_buf_1, and set properties
  set util_ds_buf_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_1 ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {IBUFDSGTE} \
 ] $util_ds_buf_1

  # Create instance: vio_0, and set properties
  set vio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:vio:3.0 vio_0 ]
  set_property -dict [ list \
   CONFIG.C_NUM_PROBE_IN {8} \
   CONFIG.C_NUM_PROBE_OUT {4} \
   CONFIG.C_PROBE_OUT0_INIT_VAL {0x1} \
   CONFIG.C_PROBE_OUT2_INIT_VAL {0x1} \
   CONFIG.C_PROBE_OUT3_WIDTH {10} \
   CONFIG.C_PROBE_OUT4_WIDTH {5} \
 ] $vio_0

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net CLK_IN_D_1 [get_bd_intf_pins SI_FCLK] [get_bd_intf_pins util_ds_buf_0/CLK_IN_D]
  connect_bd_intf_net -intf_net CLK_IN_D_1_1 [get_bd_intf_pins SI_MGT115_0] [get_bd_intf_pins util_ds_buf_1/CLK_IN_D]

  # Create port connections
  connect_bd_net -net axi_pcie_0_mmcm_lock [get_bd_pins probe_in7] [get_bd_pins vio_0/probe_in7]
  connect_bd_net -net labt_SI_CLK0 [get_bd_pins labtools_fmeter_0/F0] [get_bd_pins vio_0/probe_in1]
  connect_bd_net -net labt_SI_CLK1 [get_bd_pins labtools_fmeter_0/F1] [get_bd_pins vio_0/probe_in2]
  connect_bd_net -net labt_SI_CLK2 [get_bd_pins labtools_fmeter_0/F2] [get_bd_pins vio_0/probe_in3]
  connect_bd_net -net labt_SI_MGT [get_bd_pins labtools_fmeter_0/F3] [get_bd_pins vio_0/probe_in4]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins clk] [get_bd_pins labtools_fmeter_0/refclk] [get_bd_pins vio_0/clk]
  connect_bd_net -net mig_7series_0_init_calib_complete [get_bd_pins probe_in6] [get_bd_pins vio_0/probe_in6]
  connect_bd_net -net mig_7series_0_mmcm_locked [get_bd_pins probe_in5] [get_bd_pins vio_0/probe_in5]
  connect_bd_net -net pcie_rst_n [get_bd_pins probe_out2] [get_bd_pins vio_0/probe_out2]
  connect_bd_net -net sys_rst_n [get_bd_pins probe_out0] [get_bd_pins vio_0/probe_in0] [get_bd_pins vio_0/probe_out0]
  connect_bd_net -net util_ds_buf_0_IBUF_OUT [get_bd_pins util_ds_buf_0/IBUF_OUT] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net util_ds_buf_1_IBUF_OUT [get_bd_pins util_ds_buf_1/IBUF_OUT] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net vio_USR_CPLD_LED [get_bd_pins USR_CPLD_LED] [get_bd_pins vio_0/probe_out1]
  connect_bd_net -net vio_USR_LED [get_bd_pins USR_LED] [get_bd_pins vio_0/probe_out3]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins labtools_fmeter_0/fin] [get_bd_pins xlconcat_0/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: sys_mb
proc create_hier_cell_sys_mb { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_sys_mb() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_DC

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_DP

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_IC

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI1

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi


  # Create pins
  create_bd_pin -dir I -from 0 -to 0 In1
  create_bd_pin -dir I -from 0 -to 0 In2
  create_bd_pin -dir I -from 0 -to 0 In3
  create_bd_pin -dir I -type clk S_AXI_ACLK
  create_bd_pin -dir I dcm_locked
  create_bd_pin -dir I -type rst ext_reset_in
  create_bd_pin -dir O -from 0 -to 0 -type rst interconnect_aresetn
  create_bd_pin -dir O -from 0 -to 0 -type rst peripheral_aresetn

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]
  set_property -dict [ list \
   CONFIG.C_USE_UART {1} \
 ] $mdm_1

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:11.0 microblaze_0 ]
  set_property -dict [ list \
   CONFIG.C_ADDR_TAG_BITS {16} \
   CONFIG.C_CACHE_BYTE_SIZE {32768} \
   CONFIG.C_DCACHE_ADDR_TAG {16} \
   CONFIG.C_DCACHE_BYTE_SIZE {32768} \
   CONFIG.C_DEBUG_ENABLED {1} \
   CONFIG.C_D_AXI {1} \
   CONFIG.C_D_LMB {1} \
   CONFIG.C_I_LMB {1} \
   CONFIG.C_USE_BARREL {1} \
   CONFIG.C_USE_DCACHE {1} \
   CONFIG.C_USE_DIV {1} \
   CONFIG.C_USE_FPU {1} \
   CONFIG.C_USE_HW_MUL {1} \
   CONFIG.C_USE_ICACHE {1} \
   CONFIG.C_USE_MSR_INSTR {0} \
   CONFIG.C_USE_PCMP_INSTR {1} \
 ] $microblaze_0

  # Create instance: microblaze_0_axi_intc, and set properties
  set microblaze_0_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_0_axi_intc ]
  set_property -dict [ list \
   CONFIG.C_HAS_FAST {1} \
 ] $microblaze_0_axi_intc

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory $hier_obj microblaze_0_local_memory

  # Create instance: microblaze_0_xlconcat, and set properties
  set microblaze_0_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_0_xlconcat ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {4} \
 ] $microblaze_0_xlconcat

  # Create instance: rst_clk_wiz_0_50M, and set properties
  set rst_clk_wiz_0_50M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_0_50M ]

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_DC [get_bd_intf_pins M_AXI_DC] [get_bd_intf_pins microblaze_0/M_AXI_DC]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_IC [get_bd_intf_pins M_AXI_IC] [get_bd_intf_pins microblaze_0/M_AXI_IC]
  connect_bd_intf_net -intf_net microblaze_0_axi_dp [get_bd_intf_pins M_AXI_DP] [get_bd_intf_pins microblaze_0/M_AXI_DP]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_0_intc_axi [get_bd_intf_pins s_axi] [get_bd_intf_pins microblaze_0_axi_intc/s_axi]
  connect_bd_intf_net -intf_net microblaze_0_interrupt [get_bd_intf_pins microblaze_0/INTERRUPT] [get_bd_intf_pins microblaze_0_axi_intc/interrupt]
  connect_bd_intf_net -intf_net microblaze_0_mdm_axi [get_bd_intf_pins S_AXI1] [get_bd_intf_pins mdm_1/S_AXI]

  # Create port connections
  connect_bd_net -net In1_1 [get_bd_pins In1] [get_bd_pins microblaze_0_xlconcat/In1]
  connect_bd_net -net In2_1 [get_bd_pins In2] [get_bd_pins microblaze_0_xlconcat/In2]
  connect_bd_net -net In3_1 [get_bd_pins In3] [get_bd_pins microblaze_0_xlconcat/In3]
  connect_bd_net -net mdm_1_Interrupt [get_bd_pins mdm_1/Interrupt] [get_bd_pins microblaze_0_xlconcat/In0]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins mdm_1/Debug_SYS_Rst] [get_bd_pins rst_clk_wiz_0_50M/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins S_AXI_ACLK] [get_bd_pins mdm_1/S_AXI_ACLK] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_intc/processor_clk] [get_bd_pins microblaze_0_axi_intc/s_axi_aclk] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins rst_clk_wiz_0_50M/slowest_sync_clk]
  connect_bd_net -net microblaze_0_xlconcat_dout [get_bd_pins microblaze_0_axi_intc/intr] [get_bd_pins microblaze_0_xlconcat/dout]
  connect_bd_net -net mig_7series_0_mmcm_locked [get_bd_pins dcm_locked] [get_bd_pins rst_clk_wiz_0_50M/dcm_locked]
  connect_bd_net -net rst_clk_wiz_0_50M_bus_struct_reset [get_bd_pins microblaze_0_local_memory/SYS_Rst] [get_bd_pins rst_clk_wiz_0_50M/bus_struct_reset]
  connect_bd_net -net rst_clk_wiz_0_50M_interconnect_aresetn [get_bd_pins interconnect_aresetn] [get_bd_pins rst_clk_wiz_0_50M/interconnect_aresetn]
  connect_bd_net -net rst_clk_wiz_0_50M_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins microblaze_0_axi_intc/processor_rst] [get_bd_pins rst_clk_wiz_0_50M/mb_reset]
  connect_bd_net -net rst_clk_wiz_0_50M_peripheral_aresetn [get_bd_pins peripheral_aresetn] [get_bd_pins mdm_1/S_AXI_ARESETN] [get_bd_pins microblaze_0_axi_intc/s_axi_aresetn] [get_bd_pins rst_clk_wiz_0_50M/peripheral_aresetn]
  connect_bd_net -net sys_rst_n [get_bd_pins ext_reset_in] [get_bd_pins rst_clk_wiz_0_50M/ext_reset_in]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: pcie
proc create_hier_cell_pcie { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_pcie() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 CLK_PCIe_100MHz

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_LITE

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pcie_7x_mgt


  # Create pins
  create_bd_pin -dir I -type rst PCI_PERSTN
  create_bd_pin -dir O -type clk axi_aclk_out
  create_bd_pin -dir O axi_aresetn
  create_bd_pin -dir O mmcm_lock

  # Create instance: util_ds_buf_2, and set properties
  set util_ds_buf_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_2 ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {IBUFDSGTE} \
 ] $util_ds_buf_2

  # Create instance: xdma_0, and set properties
  set xdma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xdma:4.1 xdma_0 ]
  set_property -dict [ list \
   CONFIG.PF0_DEVICE_ID_mqdma {9024} \
   CONFIG.PF2_DEVICE_ID_mqdma {9024} \
   CONFIG.PF3_DEVICE_ID_mqdma {9024} \
   CONFIG.axi_data_width {128_bit} \
   CONFIG.axilite_master_en {true} \
   CONFIG.axilite_master_size {8} \
   CONFIG.axisten_freq {125} \
   CONFIG.pf0_device_id {7024} \
   CONFIG.pf0_msi_enabled {false} \
   CONFIG.pf0_msix_cap_pba_bir {BAR_1} \
   CONFIG.pf0_msix_cap_table_bir {BAR_1} \
   CONFIG.pl_link_cap_max_link_speed {5.0_GT/s} \
   CONFIG.pl_link_cap_max_link_width {X4} \
   CONFIG.plltype {QPLL1} \
 ] $xdma_0

  # Create instance: xlconstant_high_pcie, and set properties
  set xlconstant_high_pcie [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_high_pcie ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_high_pcie

  # Create interface connections
  connect_bd_intf_net -intf_net CLK_IN_D_2 [get_bd_intf_pins CLK_PCIe_100MHz] [get_bd_intf_pins util_ds_buf_2/CLK_IN_D]
  connect_bd_intf_net -intf_net xdma_0_M_AXI [get_bd_intf_pins M_AXI] [get_bd_intf_pins xdma_0/M_AXI]
  connect_bd_intf_net -intf_net xdma_0_M_AXI_LITE [get_bd_intf_pins M_AXI_LITE] [get_bd_intf_pins xdma_0/M_AXI_LITE]
  connect_bd_intf_net -intf_net xdma_0_pcie_mgt [get_bd_intf_pins pcie_7x_mgt] [get_bd_intf_pins xdma_0/pcie_mgt]

  # Create port connections
  connect_bd_net -net PCI_PERSTN_1 [get_bd_pins PCI_PERSTN] [get_bd_pins xdma_0/sys_rst_n]
  connect_bd_net -net util_ds_buf_2_IBUF_OUT [get_bd_pins util_ds_buf_2/IBUF_OUT] [get_bd_pins xdma_0/sys_clk]
  connect_bd_net -net xdma_0_axi_aclk [get_bd_pins axi_aclk_out] [get_bd_pins xdma_0/axi_aclk]
  connect_bd_net -net xdma_0_axi_aresetn [get_bd_pins axi_aresetn] [get_bd_pins xdma_0/axi_aresetn]
  connect_bd_net -net xdma_0_user_lnk_up [get_bd_pins mmcm_lock] [get_bd_pins xdma_0/user_lnk_up]
  connect_bd_net -net xlconstant_high_pcie_dout [get_bd_pins xdma_0/usr_irq_req] [get_bd_pins xlconstant_high_pcie/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: ddr
proc create_hier_cell_ddr { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_ddr() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 CLK_DDR3_200MHz

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR3_SDRAM

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S01_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S02_AXI1


  # Create pins
  create_bd_pin -dir O -type clk S00_ACLK
  create_bd_pin -dir I -type rst S01_ARESETN
  create_bd_pin -dir I -type clk S02_ACLK
  create_bd_pin -dir I -type rst S02_ARESETN1
  create_bd_pin -dir O dcm_locked
  create_bd_pin -dir O init_calib_complete

  # Create instance: axi_interconnect_ddr, and set properties
  set axi_interconnect_ddr [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_ddr ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {3} \
   CONFIG.SYNCHRONIZATION_STAGES {2} \
 ] $axi_interconnect_ddr

  # Create instance: const_high, and set properties
  set const_high [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_high ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {1} \
 ] $const_high

  # Create instance: mig_7series_0, and set properties
  set mig_7series_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mig_7series:4.2 mig_7series_0 ]
  set_property -dict [ list \
   CONFIG.BOARD_MIG_PARAM {DDR3_SDRAM} \
 ] $mig_7series_0

  # Create instance: rst_mig_7series_0_125M, and set properties
  set rst_mig_7series_0_125M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_mig_7series_0_125M ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S02_AXI1] [get_bd_intf_pins axi_interconnect_ddr/S02_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_ddr_M00_AXI [get_bd_intf_pins axi_interconnect_ddr/M00_AXI] [get_bd_intf_pins mig_7series_0/S_AXI]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_DC [get_bd_intf_pins S00_AXI] [get_bd_intf_pins axi_interconnect_ddr/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_IC [get_bd_intf_pins S01_AXI] [get_bd_intf_pins axi_interconnect_ddr/S01_AXI]
  connect_bd_intf_net -intf_net mig_7series_0_DDR3 [get_bd_intf_pins DDR3_SDRAM] [get_bd_intf_pins mig_7series_0/DDR3]
  connect_bd_intf_net -intf_net sys_diff_clock_1 [get_bd_intf_pins CLK_DDR3_200MHz] [get_bd_intf_pins mig_7series_0/SYS_CLK]

  # Create port connections
  connect_bd_net -net S02_ACLK_1 [get_bd_pins S02_ACLK] [get_bd_pins axi_interconnect_ddr/S02_ACLK]
  connect_bd_net -net S02_ARESETN_1 [get_bd_pins S02_ARESETN1] [get_bd_pins axi_interconnect_ddr/S02_ARESETN]
  connect_bd_net -net const_high_dout [get_bd_pins const_high/dout] [get_bd_pins mig_7series_0/sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins S00_ACLK] [get_bd_pins axi_interconnect_ddr/S00_ACLK] [get_bd_pins axi_interconnect_ddr/S01_ACLK] [get_bd_pins mig_7series_0/ui_addn_clk_0]
  connect_bd_net -net mig_7series_0_init_calib_complete [get_bd_pins init_calib_complete] [get_bd_pins mig_7series_0/init_calib_complete]
  connect_bd_net -net mig_7series_0_mmcm_locked [get_bd_pins dcm_locked] [get_bd_pins mig_7series_0/mmcm_locked] [get_bd_pins rst_mig_7series_0_125M/dcm_locked]
  connect_bd_net -net mig_7series_0_ui_clk [get_bd_pins axi_interconnect_ddr/ACLK] [get_bd_pins axi_interconnect_ddr/M00_ACLK] [get_bd_pins mig_7series_0/ui_clk] [get_bd_pins rst_mig_7series_0_125M/slowest_sync_clk]
  connect_bd_net -net mig_7series_0_ui_clk_sync_rst [get_bd_pins mig_7series_0/ui_clk_sync_rst] [get_bd_pins rst_mig_7series_0_125M/ext_reset_in]
  connect_bd_net -net rst_clk_wiz_0_50M_peripheral_aresetn [get_bd_pins S01_ARESETN] [get_bd_pins axi_interconnect_ddr/S00_ARESETN] [get_bd_pins axi_interconnect_ddr/S01_ARESETN]
  connect_bd_net -net rst_mig_7series_0_125M_interconnect_aresetn [get_bd_pins axi_interconnect_ddr/ARESETN] [get_bd_pins rst_mig_7series_0_125M/interconnect_aresetn]
  connect_bd_net -net rst_mig_7series_0_125M_peripheral_aresetn [get_bd_pins axi_interconnect_ddr/M00_ARESETN] [get_bd_pins mig_7series_0/aresetn] [get_bd_pins rst_mig_7series_0_125M/peripheral_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set CLK_DDR3_200MHz [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 CLK_DDR3_200MHz ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {200000000} \
   ] $CLK_DDR3_200MHz

  set CLK_PCIe_100MHz [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 CLK_PCIe_100MHz ]

  set DDR3_SDRAM [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR3_SDRAM ]

  set SCF [ create_bd_intf_port -mode Master -vlnv trenz.biz:user:SCF1001_bus_rtl:1.0 SCF ]

  set SI_FCLK [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 SI_FCLK ]

  set SI_MGT115_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 SI_MGT115_0 ]

  set pcie_7x_mgt [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:pcie_7x_mgt_rtl:1.0 pcie_7x_mgt ]

  set spi_rtl [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 spi_rtl ]


  # Create ports
  set PCI_PERSTN [ create_bd_port -dir I -type rst PCI_PERSTN ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_LOW} \
 ] $PCI_PERSTN
  set USR_CPLD_LED [ create_bd_port -dir O -from 0 -to 0 USR_CPLD_LED ]
  set USR_LED [ create_bd_port -dir O -from 9 -to 0 USR_LED ]

  # Create instance: SCF1001_0, and set properties
  set SCF1001_0 [ create_bd_cell -type ip -vlnv trenz.biz:user:SCF1001:1.0 SCF1001_0 ]

  # Create instance: axi_iic_0, and set properties
  set axi_iic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 axi_iic_0 ]

  # Create instance: axi_quad_spi_0, and set properties
  set axi_quad_spi_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_quad_spi_0 ]
  set_property -dict [ list \
   CONFIG.C_FIFO_DEPTH {256} \
   CONFIG.C_SCK_RATIO {2} \
   CONFIG.C_SPI_MEMORY {2} \
   CONFIG.C_SPI_MODE {2} \
 ] $axi_quad_spi_0

  # Create instance: axi_timer_0, and set properties
  set axi_timer_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 axi_timer_0 ]

  # Create instance: ddr
  create_hier_cell_ddr [current_bd_instance .] ddr

  # Create instance: microblaze_0_axi_periph, and set properties
  set microblaze_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_0_axi_periph ]
  set_property -dict [ list \
   CONFIG.NUM_MI {5} \
   CONFIG.NUM_SI {2} \
   CONFIG.SYNCHRONIZATION_STAGES {2} \
 ] $microblaze_0_axi_periph

  # Create instance: pcie
  create_hier_cell_pcie [current_bd_instance .] pcie

  # Create instance: sys_mb
  create_hier_cell_sys_mb [current_bd_instance .] sys_mb

  # Create instance: vio
  create_hier_cell_vio [current_bd_instance .] vio



  # Create interface connections
  connect_bd_intf_net -intf_net CLK_IN_D_1 [get_bd_intf_ports SI_FCLK] [get_bd_intf_pins vio/SI_FCLK]
  connect_bd_intf_net -intf_net CLK_IN_D_1_1 [get_bd_intf_ports SI_MGT115_0] [get_bd_intf_pins vio/SI_MGT115_0]
  connect_bd_intf_net -intf_net CLK_IN_D_2 [get_bd_intf_ports CLK_PCIe_100MHz] [get_bd_intf_pins pcie/CLK_PCIe_100MHz]
  connect_bd_intf_net -intf_net SCF1001_0_SCF [get_bd_intf_ports SCF] [get_bd_intf_pins SCF1001_0/SCF]
  connect_bd_intf_net -intf_net axi_iic_0_IIC [get_bd_intf_pins SCF1001_0/EMIO_I2C] [get_bd_intf_pins axi_iic_0/IIC]
  connect_bd_intf_net -intf_net axi_pcie_0_pcie_7x_mgt [get_bd_intf_ports pcie_7x_mgt] [get_bd_intf_pins pcie/pcie_7x_mgt]
  connect_bd_intf_net -intf_net axi_quad_spi_0_SPI_0 [get_bd_intf_ports spi_rtl] [get_bd_intf_pins axi_quad_spi_0/SPI_0]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_DC [get_bd_intf_pins ddr/S00_AXI] [get_bd_intf_pins sys_mb/M_AXI_DC]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_IC [get_bd_intf_pins ddr/S01_AXI] [get_bd_intf_pins sys_mb/M_AXI_IC]
  connect_bd_intf_net -intf_net microblaze_0_axi_dp [get_bd_intf_pins microblaze_0_axi_periph/S00_AXI] [get_bd_intf_pins sys_mb/M_AXI_DP]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M02_AXI [get_bd_intf_pins axi_timer_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M03_AXI [get_bd_intf_pins axi_quad_spi_0/AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M04_AXI [get_bd_intf_pins axi_iic_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net microblaze_0_intc_axi [get_bd_intf_pins microblaze_0_axi_periph/M00_AXI] [get_bd_intf_pins sys_mb/s_axi]
  connect_bd_intf_net -intf_net microblaze_0_mdm_axi [get_bd_intf_pins microblaze_0_axi_periph/M01_AXI] [get_bd_intf_pins sys_mb/S_AXI1]
  connect_bd_intf_net -intf_net mig_7series_0_DDR3 [get_bd_intf_ports DDR3_SDRAM] [get_bd_intf_pins ddr/DDR3_SDRAM]
  connect_bd_intf_net -intf_net pcie_M_AXI [get_bd_intf_pins ddr/S02_AXI1] [get_bd_intf_pins pcie/M_AXI]
  connect_bd_intf_net -intf_net pcie_M_AXI_LITE [get_bd_intf_pins microblaze_0_axi_periph/S01_AXI] [get_bd_intf_pins pcie/M_AXI_LITE]
  connect_bd_intf_net -intf_net sys_diff_clock_1 [get_bd_intf_ports CLK_DDR3_200MHz] [get_bd_intf_pins ddr/CLK_DDR3_200MHz]

  # Create port connections
  connect_bd_net -net axi_iic_0_iic2intc_irpt [get_bd_pins axi_iic_0/iic2intc_irpt] [get_bd_pins sys_mb/In3]
  connect_bd_net -net axi_pcie_0_axi_aclk_out [get_bd_pins ddr/S02_ACLK] [get_bd_pins microblaze_0_axi_periph/S01_ACLK] [get_bd_pins pcie/axi_aclk_out]
  connect_bd_net -net axi_pcie_0_mmcm_lock [get_bd_pins pcie/mmcm_lock] [get_bd_pins vio/probe_in7]
  connect_bd_net -net axi_quad_spi_0_ip2intc_irpt [get_bd_pins axi_quad_spi_0/ip2intc_irpt] [get_bd_pins sys_mb/In2]
  connect_bd_net -net axi_timer_0_interrupt [get_bd_pins axi_timer_0/interrupt] [get_bd_pins sys_mb/In1]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins axi_iic_0/s_axi_aclk] [get_bd_pins axi_quad_spi_0/ext_spi_clk] [get_bd_pins axi_quad_spi_0/s_axi_aclk] [get_bd_pins axi_timer_0/s_axi_aclk] [get_bd_pins ddr/S00_ACLK] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/M02_ACLK] [get_bd_pins microblaze_0_axi_periph/M03_ACLK] [get_bd_pins microblaze_0_axi_periph/M04_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins sys_mb/S_AXI_ACLK] [get_bd_pins vio/clk]
  connect_bd_net -net mig_7series_0_init_calib_complete [get_bd_pins ddr/init_calib_complete] [get_bd_pins vio/probe_in6]
  connect_bd_net -net mig_7series_0_mmcm_locked [get_bd_pins ddr/dcm_locked] [get_bd_pins sys_mb/dcm_locked] [get_bd_pins vio/probe_in5]
  connect_bd_net -net pcie_axi_aresetn [get_bd_pins ddr/S02_ARESETN1] [get_bd_pins microblaze_0_axi_periph/S01_ARESETN] [get_bd_pins pcie/axi_aresetn]
  connect_bd_net -net reset_rtl_1 [get_bd_ports PCI_PERSTN] [get_bd_pins pcie/PCI_PERSTN]
  connect_bd_net -net rst_clk_wiz_0_50M_interconnect_aresetn [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins sys_mb/interconnect_aresetn]
  connect_bd_net -net rst_clk_wiz_0_50M_peripheral_aresetn [get_bd_pins axi_iic_0/s_axi_aresetn] [get_bd_pins axi_quad_spi_0/s_axi_aresetn] [get_bd_pins axi_timer_0/s_axi_aresetn] [get_bd_pins ddr/S01_ARESETN] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/M02_ARESETN] [get_bd_pins microblaze_0_axi_periph/M03_ARESETN] [get_bd_pins microblaze_0_axi_periph/M04_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN] [get_bd_pins sys_mb/peripheral_aresetn]
  connect_bd_net -net sys_rst_n [get_bd_pins sys_mb/ext_reset_in] [get_bd_pins vio/probe_out0]
  connect_bd_net -net vio_USR_CPLD_LED [get_bd_ports USR_CPLD_LED] [get_bd_pins vio/USR_CPLD_LED]
  connect_bd_net -net vio_USR_LED [get_bd_ports USR_LED] [get_bd_pins vio/USR_LED]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0x40800000 [get_bd_addr_spaces pcie/xdma_0/M_AXI_LITE] [get_bd_addr_segs axi_iic_0/S_AXI/Reg] SEG_axi_iic_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A00000 [get_bd_addr_spaces pcie/xdma_0/M_AXI_LITE] [get_bd_addr_segs axi_quad_spi_0/AXI_LITE/Reg] SEG_axi_quad_spi_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41C00000 [get_bd_addr_spaces pcie/xdma_0/M_AXI_LITE] [get_bd_addr_segs axi_timer_0/S_AXI/Reg] SEG_axi_timer_0_Reg
  create_bd_addr_seg -range 0x00001000 -offset 0x41400000 [get_bd_addr_spaces pcie/xdma_0/M_AXI_LITE] [get_bd_addr_segs sys_mb/mdm_1/S_AXI/Reg] SEG_mdm_1_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41200000 [get_bd_addr_spaces pcie/xdma_0/M_AXI_LITE] [get_bd_addr_segs sys_mb/microblaze_0_axi_intc/S_AXI/Reg] SEG_microblaze_0_axi_intc_Reg
  create_bd_addr_seg -range 0x80000000 -offset 0x80000000 [get_bd_addr_spaces pcie/xdma_0/M_AXI] [get_bd_addr_segs ddr/mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x00010000 -offset 0x40800000 [get_bd_addr_spaces sys_mb/microblaze_0/Data] [get_bd_addr_segs axi_iic_0/S_AXI/Reg] SEG_axi_iic_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A00000 [get_bd_addr_spaces sys_mb/microblaze_0/Data] [get_bd_addr_segs axi_quad_spi_0/AXI_LITE/Reg] SEG_axi_quad_spi_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41C00000 [get_bd_addr_spaces sys_mb/microblaze_0/Data] [get_bd_addr_segs axi_timer_0/S_AXI/Reg] SEG_axi_timer_0_Reg
  create_bd_addr_seg -range 0x00020000 -offset 0x00000000 [get_bd_addr_spaces sys_mb/microblaze_0/Data] [get_bd_addr_segs sys_mb/microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00020000 -offset 0x00000000 [get_bd_addr_spaces sys_mb/microblaze_0/Instruction] [get_bd_addr_segs sys_mb/microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00001000 -offset 0x41400000 [get_bd_addr_spaces sys_mb/microblaze_0/Data] [get_bd_addr_segs sys_mb/mdm_1/S_AXI/Reg] SEG_mdm_1_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41200000 [get_bd_addr_spaces sys_mb/microblaze_0/Data] [get_bd_addr_segs sys_mb/microblaze_0_axi_intc/S_AXI/Reg] SEG_microblaze_0_axi_intc_Reg
  create_bd_addr_seg -range 0x80000000 -offset 0x80000000 [get_bd_addr_spaces sys_mb/microblaze_0/Data] [get_bd_addr_segs ddr/mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x80000000 -offset 0x80000000 [get_bd_addr_spaces sys_mb/microblaze_0/Instruction] [get_bd_addr_segs ddr/mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  source ../block_design/fmcjesdadc_bd.ttcl
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


