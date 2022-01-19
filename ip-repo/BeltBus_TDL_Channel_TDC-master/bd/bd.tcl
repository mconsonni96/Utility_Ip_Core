

proc init { cell_name args } {

}

proc pre_propagate { this prop_info } {

}

proc update_boundary { this args } {
}

# Update the content of the IP-Core
proc update_contents {cell_name args} {

	# ======================== Init IP in Hier =================================

	# -------------- vlnv of the instantiated IP-Cores -------------------------
	# List the VLNV of IPs
	set _VLNV(X7_VTDL) "DigiLAB:ip:AXI4Stream_X7S_VirtualTDL:2.3"
	set _VLNV(ID) "DigiLAB:ip:AXI4Stream_IperDecoder:1.2"
	set _VLNV(CEC) "DigiLAB:ip:AXI4Stream_CoarseExtensionCore:3.5"
	set _VLNV(MC) "DigiLAB:ip:AXI4Stream_MagicCalibrator:2.5"
	set _VLNV(SYNC) "DigiLAB:ip:AXI4Stream_Synchronizer:2.3"
	set _VLNV(NI) "DigiLAB:ip:BeltBus_NodeInserter:2.3"
	set _VLNV(OC) "DigiLAB:ip:AXI4Stream_OverflowCounter:2.0"
	# --------------------------------------------------------------------------


	set cell_obj [get_bd_cells $cell_name]

	# Set cell_obj as current instance
	current_bd_instance $cell_obj


	# -------- Import in variable the Generic of HIER set in GUI ---------------

	#AXI4Stream_X7S_VirtualTDL generics
	set BUFFERING_STAGE [get_property CONFIG.BUFFERING_STAGE $cell_obj]
	set DEBUG_MODE [get_property CONFIG.DEBUG_MODE $cell_obj]
	set SIM_VS_IMP [get_property CONFIG.SIM_VS_IMP $cell_obj]
	set FILE_PATH_NAME_CO_DELAY [get_property CONFIG.FILE_PATH_NAME_CO_DELAY $cell_obj]
	set FILE_PATH_NAME_O_DELAY [get_property CONFIG.FILE_PATH_NAME_O_DELAY $cell_obj]
	set NUM_TAP_TDL [get_property CONFIG.NUM_TAP_TDL $cell_obj]
	set NUMBER_OF_TDL [get_property CONFIG.NUMBER_OF_TDL $cell_obj]
	set BIT_SMP_TDL [get_property CONFIG.BIT_SMP_TDL $cell_obj]
	set VALID_NUMBER_OF_TDL_INIT [get_property CONFIG.VALID_NUMBER_OF_TDL_INIT $cell_obj]
	set VALID_POSITION_TAP_INIT [get_property CONFIG.VALID_POSITION_TAP_INIT $cell_obj]
	set MAX_VALID_TAP_POS [get_property CONFIG.MAX_VALID_TAP_POS $cell_obj]
	set MIN_VALID_TAP_POS [get_property CONFIG.MIN_VALID_TAP_POS $cell_obj]
	set STEP_VALID_TAP_POS [get_property CONFIG.STEP_VALID_TAP_POS $cell_obj]
	set OFFSET_TAP_TDL_0 [get_property CONFIG.OFFSET_TAP_TDL_0 $cell_obj]
	set OFFSET_TAP_TDL_1 [get_property CONFIG.OFFSET_TAP_TDL_1 $cell_obj]
	set OFFSET_TAP_TDL_2 [get_property CONFIG.OFFSET_TAP_TDL_2 $cell_obj]
	set OFFSET_TAP_TDL_3 [get_property CONFIG.OFFSET_TAP_TDL_3 $cell_obj]
	set OFFSET_TAP_TDL_4 [get_property CONFIG.OFFSET_TAP_TDL_4 $cell_obj]
	set OFFSET_TAP_TDL_5 [get_property CONFIG.OFFSET_TAP_TDL_5 $cell_obj]
	set OFFSET_TAP_TDL_6 [get_property CONFIG.OFFSET_TAP_TDL_6 $cell_obj]
	set OFFSET_TAP_TDL_7 [get_property CONFIG.OFFSET_TAP_TDL_7 $cell_obj]
	set OFFSET_TAP_TDL_8 [get_property CONFIG.OFFSET_TAP_TDL_8 $cell_obj]
	set OFFSET_TAP_TDL_9 [get_property CONFIG.OFFSET_TAP_TDL_9 $cell_obj]
	set OFFSET_TAP_TDL_10 [get_property CONFIG.OFFSET_TAP_TDL_10 $cell_obj]
	set OFFSET_TAP_TDL_11 [get_property CONFIG.OFFSET_TAP_TDL_11 $cell_obj]
	set OFFSET_TAP_TDL_12 [get_property CONFIG.OFFSET_TAP_TDL_12 $cell_obj]
	set OFFSET_TAP_TDL_13 [get_property CONFIG.OFFSET_TAP_TDL_13 $cell_obj]
	set OFFSET_TAP_TDL_14 [get_property CONFIG.OFFSET_TAP_TDL_14 $cell_obj]
	set OFFSET_TAP_TDL_15 [get_property CONFIG.OFFSET_TAP_TDL_15 $cell_obj]
	set TYPE_TDL_0 [get_property CONFIG.TYPE_TDL_0 $cell_obj]
	set TYPE_TDL_1 [get_property CONFIG.TYPE_TDL_1 $cell_obj]
	set TYPE_TDL_2 [get_property CONFIG.TYPE_TDL_2 $cell_obj]
	set TYPE_TDL_3 [get_property CONFIG.TYPE_TDL_3 $cell_obj]
	set TYPE_TDL_4 [get_property CONFIG.TYPE_TDL_4 $cell_obj]
	set TYPE_TDL_5 [get_property CONFIG.TYPE_TDL_5 $cell_obj]
	set TYPE_TDL_6 [get_property CONFIG.TYPE_TDL_6 $cell_obj]
	set TYPE_TDL_7 [get_property CONFIG.TYPE_TDL_7 $cell_obj]
	set TYPE_TDL_8 [get_property CONFIG.TYPE_TDL_8 $cell_obj]
	set TYPE_TDL_9 [get_property CONFIG.TYPE_TDL_9 $cell_obj]
	set TYPE_TDL_10 [get_property CONFIG.TYPE_TDL_10 $cell_obj]
	set TYPE_TDL_11 [get_property CONFIG.TYPE_TDL_11 $cell_obj]
	set TYPE_TDL_11 [get_property CONFIG.TYPE_TDL_11 $cell_obj]
	set TYPE_TDL_12 [get_property CONFIG.TYPE_TDL_12 $cell_obj]
	set TYPE_TDL_13 [get_property CONFIG.TYPE_TDL_13 $cell_obj]
	set TYPE_TDL_14 [get_property CONFIG.TYPE_TDL_14 $cell_obj]
	set TYPE_TDL_15 [get_property CONFIG.TYPE_TDL_15 $cell_obj]
	set NUM_TAP_PRE_TDL [get_property CONFIG.NUM_TAP_PRE_TDL $cell_obj]
	set BIT_SMP_PRE_TDL [get_property CONFIG.BIT_SMP_PRE_TDL $cell_obj]

	#AXI4Stream_IperDecoder generics
	set DEBUG_PORT_DECODER [get_property CONFIG.DEBUG_PORT_DECODER $cell_obj]
	set TYPE_EDGE_0 [get_property CONFIG.TYPE_EDGE_0 $cell_obj]
	set TYPE_EDGE_1 [get_property CONFIG.TYPE_EDGE_1 $cell_obj]
	set TYPE_EDGE_2 [get_property CONFIG.TYPE_EDGE_2 $cell_obj]
	set TYPE_EDGE_3 [get_property CONFIG.TYPE_EDGE_3 $cell_obj]
	set TYPE_EDGE_4 [get_property CONFIG.TYPE_EDGE_4 $cell_obj]
	set TYPE_EDGE_5 [get_property CONFIG.TYPE_EDGE_5 $cell_obj]
	set TYPE_EDGE_6 [get_property CONFIG.TYPE_EDGE_6 $cell_obj]
	set TYPE_EDGE_7 [get_property CONFIG.TYPE_EDGE_7 $cell_obj]
	set TYPE_EDGE_8 [get_property CONFIG.TYPE_EDGE_8 $cell_obj]
	set TYPE_EDGE_9 [get_property CONFIG.TYPE_EDGE_9 $cell_obj]
	set TYPE_EDGE_10 [get_property CONFIG.TYPE_EDGE_10 $cell_obj]
	set TYPE_EDGE_11 [get_property CONFIG.TYPE_EDGE_11 $cell_obj]
	set TYPE_EDGE_11 [get_property CONFIG.TYPE_EDGE_11 $cell_obj]
	set TYPE_EDGE_12 [get_property CONFIG.TYPE_EDGE_12 $cell_obj]
	set TYPE_EDGE_13 [get_property CONFIG.TYPE_EDGE_13 $cell_obj]
	set TYPE_EDGE_14 [get_property CONFIG.TYPE_EDGE_14 $cell_obj]
	set TYPE_EDGE_15 [get_property CONFIG.TYPE_EDGE_15 $cell_obj]
	set FREE_RUNNING [get_property CONFIG.FREE_RUNNING $cell_obj]
	set EDGE_CHECK [get_property CONFIG.EDGE_CHECK $cell_obj]
	set MD_VS_TD [get_property CONFIG.MD_VS_TD $cell_obj]
	set TYPE_DECODER [get_property CONFIG.TYPE_DECODER $cell_obj]
	set BIT_COARSE [get_property CONFIG.BIT_COARSE $cell_obj]
	set BIT_SUB_INT [get_property CONFIG.BIT_SUB_INT $cell_obj]
	set BIT_BUBBLE [get_property CONFIG.BIT_BUBBLE $cell_obj]
	set DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0 [get_property CONFIG.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0 $cell_obj]
	set DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1 [get_property CONFIG.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1 $cell_obj]
	set DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0 [get_property CONFIG.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0 $cell_obj]
	set DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1 [get_property CONFIG.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1 $cell_obj]
	set DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2 [get_property CONFIG.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2 $cell_obj]
	set DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3 [get_property CONFIG.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3 $cell_obj]
	set SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0 [get_property CONFIG.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0 $cell_obj]
	set SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1 [get_property CONFIG.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1 $cell_obj]
	set PRINT_FULL_REPORT [get_property CONFIG.PRINT_FULL_REPORT $cell_obj]
	set OPTIMIZATION_MODE [get_property CONFIG.OPTIMIZATION_MODE $cell_obj]
	set WEIGHT_AREA_VS_TIME_PERCENT [get_property CONFIG.WEIGHT_AREA_VS_TIME_PERCENT $cell_obj]


	#AXI4Stream_CoarseExtensionCore generics
	set BIT_FID [get_property CONFIG.BIT_FID $cell_obj]
	set CEC_VS_CTD_COUNTER [get_property CONFIG.CEC_VS_CTD_COUNTER $cell_obj]
	set CEC_COARSE_CNT_INIT [get_property CONFIG.CEC_COARSE_CNT_INIT $cell_obj]
	set BIT_COARSE [get_property CONFIG.BIT_COARSE $cell_obj]
	set BIT_UNCALIBRATED [get_property CONFIG.BIT_UNCALIBRATED $cell_obj]
	#set BIT_SUB_INT [get_property CONFIG.BIT_SUB_INT $cell_obj]
	set RELATED_CLOCKS [get_property CONFIG.RELATED_CLOCKS $cell_obj]
	set CDC_SYNC_STAGES [get_property CONFIG.CDC_SYNC_STAGES $cell_obj]
	set FIFO_MEMORY_TYPE [get_property CONFIG.FIFO_MEMORY_TYPE $cell_obj]
	set FIFO_WRITE_DEPTH [get_property CONFIG.FIFO_WRITE_DEPTH $cell_obj]
	set MAX_NUM_BIT_EQ_PIPELINE_STAGE0 [get_property CONFIG.MAX_NUM_BIT_EQ_PIPELINE_STAGE0 $cell_obj]
	set MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 [get_property CONFIG.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 $cell_obj]
	set MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 [get_property CONFIG.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 $cell_obj]
	set MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 [get_property CONFIG.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 $cell_obj]
	set INTERNAL_OVERFLOW_CNT [get_property CONFIG.INTERNAL_OVERFLOW_CNT $cell_obj]


	#AXI4Stream_MagicCalibrator generics
	set BIT_CALIBRATION [get_property CONFIG.BIT_CALIBRATION $cell_obj]
	set BIT_RESOLUTION [get_property CONFIG.BIT_RESOLUTION $cell_obj]
	set INTEGRATION_METHOD [get_property CONFIG.INTEGRATION_METHOD $cell_obj]
	set SAVE_BIT [get_property CONFIG.SAVE_BIT $cell_obj]
	set DEBUG_MODE_CT [get_property CONFIG.DEBUG_MODE_CT $cell_obj]
	set DEBUG_MODE_CC [get_property CONFIG.DEBUG_MODE_CC $cell_obj]
	set AXI4_LENGTH [get_property CONFIG.AXI4_LENGTH $cell_obj]

	#AXI4Stream_Synchronizer generics
	set DATA_WIDTH [get_property CONFIG.DATA_WIDTH $cell_obj]
	set MODE_SEL [get_property CONFIG.MODE_SEL $cell_obj]
	set SYNCH_CDC_SYNC_STAGES [get_property CONFIG.SYNCH_CDC_SYNC_STAGES $cell_obj]
	set SYNCH_RELATED_CLOCKS [get_property CONFIG.SYNCH_RELATED_CLOCKS $cell_obj]
	set FIFO_DEPTH [get_property CONFIG.FIFO_DEPTH $cell_obj]
	set SYNCH_FIFO_MEMORY_TYPE [get_property CONFIG.SYNCH_FIFO_MEMORY_TYPE $cell_obj]
	set SRC_SYNC_FF [get_property CONFIG.SRC_SYNC_FF $cell_obj]
	set DEST_SYNC_FF [get_property CONFIG.DEST_SYNC_FF $cell_obj]

	#BeltBus_NodeInserter
	set PASS_THROUGH [get_property CONFIG.PASS_THROUGH $cell_obj]
	set BIT_NUM_CH [get_property CONFIG.BIT_NUM_CH $cell_obj]
	set INJECT_CYCLES [get_property CONFIG.INJECT_CYCLES $cell_obj]
	set HOLD_ON_SINGLE_NODE [get_property CONFIG.HOLD_ON_SINGLE_NODE $cell_obj]
	set HOLD_ON_INTEGRAL [get_property CONFIG.HOLD_ON_INTEGRAL $cell_obj]
	set HOLD_ON_MIN_MOD [get_property CONFIG.HOLD_ON_MIN_MOD $cell_obj]
	set RETAIN_SINGLE_NODE [get_property CONFIG.RETAIN_SINGLE_NODE $cell_obj]
	set NUM_NODE [get_property CONFIG.NUM_NODE $cell_obj]
	set NUM_CH [get_property CONFIG.NUM_CH $cell_obj]
	# --------------------------------------------------------------------------
	# ==========================================================================



	# ========================== Ports on Hier GUI =============================
	# --------------------------- Create interface pins ------------------------
	# Place input on the left and output on the right with the order of the code

	# ------ AXI4Stream_MagicCalibrator ------
	# M01_AXIS_DebugCT
	if {[get_bd_intf_pins $cell_obj/M01_AXIS_DebugCT] == "" && $DEBUG_MODE_CT} {
		set m01_debug_port [create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M01_AXIS_DebugCT]
	}
	if {[get_bd_intf_pins $cell_obj/M01_AXIS_DebugCT] == "$cell_obj/M01_AXIS_DebugCT" && !$DEBUG_MODE_CT} {
		delete_bd_objs [get_bd_intf_pin $cell_obj/M01_AXIS_DebugCT]
	}

	# M02_AXIS_DebugCC
	if {[get_bd_intf_pins $cell_obj/M02_AXIS_DebugCC] == "" && $DEBUG_MODE_CC} {
		set m01_debug_port [create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M02_AXIS_DebugCC]
	}
	if {[get_bd_intf_pins $cell_obj/M02_AXIS_DebugCC] == "$cell_obj/M02_AXIS_DebugCC" && !$DEBUG_MODE_CC} {
		delete_bd_objs [get_bd_intf_pin $cell_obj/M02_AXIS_DebugCC]
	}
	# ----------------------------------------


	# --------- BeltBus_NodeInserter ----------
	# M00_BB
	if {[get_bd_intf_pins $cell_obj/M00_BB] == "" && ($PASS_THROUGH == "Belt-Bus" || $PASS_THROUGH == "Both")} {
		set m_bb_port [create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M00_BB]
	}
	if {[get_bd_intf_pins $cell_obj/M00_BB] == "$cell_obj/M00_BB" && !($PASS_THROUGH == "Belt-Bus" || $PASS_THROUGH == "Both")} {
		delete_bd_objs [get_bd_intf_pin $cell_obj/M00_BB]
	}

	# S00_BB
	if {[get_bd_intf_pins $cell_obj/S00_BB] == "" && ($PASS_THROUGH == "Belt-Bus" || $PASS_THROUGH == "Both") } {
		set s_bb_port [create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S00_BB]
	}
	if {[get_bd_intf_pins $cell_obj/S00_BB] == "$cell_obj/S00_BB" && !($PASS_THROUGH == "Belt-Bus" || $PASS_THROUGH == "Both")} {
		delete_bd_objs [get_bd_intf_pin $cell_obj/S00_BB]
	}

	# M00_AXIS
	if {[get_bd_intf_pins $cell_obj/M00_AXIS] == "" && ($PASS_THROUGH == "Timestamp" || $PASS_THROUGH == "Both")} {
		set m_axis_port [create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M00_AXIS]
	}
	if {[get_bd_intf_pins $cell_obj/M00_AXIS] == "$cell_obj/M00_AXIS" && !($PASS_THROUGH == "Timestamp" || $PASS_THROUGH == "Both")} {
		delete_bd_objs [get_bd_intf_pin $cell_obj/M00_AXIS]
	}
	# ----------------------------------------
	# --------------------------------------------------------------------------

	# --------------------------- Create interface pins ------------------------
	# Place input on the left and output on the right with the order of the code
	# Considering the interfaced reported before


	# ------- AXI4Stream_X7S_VirtualTDL ------
	#AsyncInput
	if {[get_bd_pins $cell_obj/AsyncInput] == "" } {
		create_bd_pin -dir I -type data AsyncInput
	}

	# ValidNumberOfTDL
	if {[get_bd_pins $cell_obj/ValidNumberOfTDL] == "" && $DEBUG_MODE} {
		create_bd_pin -dir I -from 31 -to 0 -type data ValidNumberOfTDL
	}
	if {[get_bd_pins $cell_obj/ValidNumberOfTDL] == "$cell_obj/ValidNumberOfTDL" && !$DEBUG_MODE} {
		delete_bd_objs [get_bd_pins $cell_obj/ValidNumberOfTDL]
	}

	# ValidPositionTap
	if {[get_bd_pins $cell_obj/ValidPositionTap] == "" && $DEBUG_MODE} {
		create_bd_pin -dir I -from 31 -to 0 -type data ValidPositionTap
	}
	if {[get_bd_pins $cell_obj/ValidPositionTap] == "$cell_obj/ValidPositionTap" && !$DEBUG_MODE} {
		delete_bd_objs [get_bd_pins $cell_obj/ValidPositionTap]
	}
	# ----------------------------------------

	# ------- AXI4Stream_IperDecoder ---------
	# subInterpolationMatrix
	if {[get_bd_pins $cell_obj/subInterpolationMatrix] == "" && $DEBUG_PORT_DECODER } {
		create_bd_pin -dir I -from 31 -to 0 subInterpolationMatrix
	}
	if {[get_bd_pins $cell_obj/subInterpolationMatrix] == "$cell_obj/subInterpolationMatrix" && !$DEBUG_PORT_DECODER} {
		delete_bd_objs [get_bd_pins $cell_obj/subInterpolationMatrix]
	}
	# ----------------------------------------

	# ------ AXI4Stream_CoarseExtensionCore ---
	# CoarseCounter_CTD
	if {[get_bd_pins $cell_obj/CoarseCounter_CTD] == "" && ($CEC_VS_CTD_COUNTER == "CTD")} {
		create_bd_pin -dir I -from [expr $BIT_COARSE -1] -to 0 CoarseCounter_CTD
	}
	if {[get_bd_pins $cell_obj/CoarseCounter_CTD] == "$cell_obj/CoarseCounter_CTD" && !($CEC_VS_CTD_COUNTER == "CTD")} {
		delete_bd_objs [get_bd_pins $cell_obj/CoarseCounter_CTD]
	}
	# ----------------------------------------

	# ------ AXI4Stream_MagicCalibrator ------
	# Calibrated (TODO connect to IsCalibrated)
	#if {[get_bd_pins $cell_obj/Calibrated] == ""} {
	#	create_bd_pin -dir O -type data Calibrated
	#}
	if {[get_bd_pins $cell_obj/Calibrated] == ""} {
		create_bd_pin -dir O -type data Calibrated
	}

	# Restart_Calibration
	if {[get_bd_pins $cell_obj/Restart_Calibration] == "" && ($DEBUG_MODE_CT || $DEBUG_MODE_CC) } {
		create_bd_pin -dir I -type data Restart_Calibration
	}
	if {[get_bd_pins $cell_obj/Restart_Calibration] == "$cell_obj/Restart_Calibration" && !($DEBUG_MODE_CT || $DEBUG_MODE_CC)} {
		delete_bd_objs [get_bd_pins $cell_obj/Restart_Calibration]
	}

	# Stop_Calibration
	if {[get_bd_pins $cell_obj/Stop_Calibration] == "" && ($DEBUG_MODE_CT || $DEBUG_MODE_CC)} {
		create_bd_pin -dir I -type data Stop_Calibration
	}
	if {[get_bd_pins $cell_obj/Stop_Calibration] == "$cell_obj/Stop_Calibration" && !($DEBUG_MODE_CT || $DEBUG_MODE_CC)} {
		delete_bd_objs [get_bd_pins $cell_obj/Stop_Calibration]
	}

	# bitTrn_Cal_dout
	if {[get_bd_pins $cell_obj/bitTrn_Cal_dout] == ""  && ($DEBUG_MODE_CT || $DEBUG_MODE_CC)} {
		create_bd_pin -dir I -from 31 -to 0 -type data bitTrn_Cal_dout
	}
	if {[get_bd_pins $cell_obj/bitTrn_Cal_dout] == "$cell_obj/bitTrn_Cal_dout" && !($DEBUG_MODE_CT || $DEBUG_MODE_CC)} {
		delete_bd_objs [get_bd_pins $cell_obj/bitTrn_Cal_dout]
	}

	# bitTrn_Uncal_addr
	if {[get_bd_pins $cell_obj/bitTrn_Uncal_addr] == "" && ($DEBUG_MODE_CT || $DEBUG_MODE_CC) } {
		create_bd_pin -dir I -from 31 -to 0 -type data bitTrn_Uncal_addr
	}
	if {[get_bd_pins $cell_obj/bitTrn_Uncal_addr] == "$cell_obj/bitTrn_Uncal_addr" && !($DEBUG_MODE_CT || $DEBUG_MODE_CC)} {
		delete_bd_objs [get_bd_pins $cell_obj/bitTrn_Uncal_addr]
	}

	# bitTrn_ReqSample
	if {[get_bd_pins $cell_obj/bitTrn_ReqSample] == ""  && ($DEBUG_MODE_CT || $DEBUG_MODE_CC)} {
		create_bd_pin -dir I -from 31 -to 0 -type data bitTrn_ReqSample
	}
	if {[get_bd_pins $cell_obj/bitTrn_ReqSample] == "$cell_obj/bitTrn_ReqSample" && !($DEBUG_MODE_CT || $DEBUG_MODE_CC)} {
		delete_bd_objs [get_bd_pins $cell_obj/bitTrn_ReqSample]
	}
	# ----------------------------------------
	# --------------------------------------------------------------------------

	# ------------------------- Clock/Reset interface pins ---------------------
	# Place input on the left and output on the right with the order of the code
	# Considering the interfaced reported before

	# ----------------- TDC ------------------
	if {[get_bd_pins $cell_obj/reset_TDC] == ""} {
		create_bd_pin -dir I -type rst reset_TDC
		set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins reset_TDC]
	}

	if {[get_bd_pins $cell_obj/clk_TDC] == ""} {
		create_bd_pin -dir I -type clk clk_TDC
		set_property CONFIG.FREQ_HZ 400000000 [get_bd_pins clk_TDC]
		set_property CONFIG.ASSOCIATED_RESET reset_TDC [get_bd_pins clk_TDC]
	}
	# ----------------------------------------

	# ----------------- SYS ------------------
	if {[get_bd_pins $cell_obj/reset_SYS] == ""} {
		create_bd_pin -dir I -type rst reset_SYS
		set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins reset_SYS]
	}

	if {[get_bd_pins $cell_obj/clk_SYS] == ""} {
		create_bd_pin -dir I -type clk clk_SYS
		set_property CONFIG.FREQ_HZ 100000000 [get_bd_pins clk_SYS]
		set_property CONFIG.ASSOCIATED_BUSIF Calibrated [get_bd_pins clk_SYS]
		set_property CONFIG.ASSOCIATED_RESET reset_SYS [get_bd_pins clk_SYS]

	}
	# ----------------------------------------

	# -------------- BeltBus ------------------
	if {[get_bd_pins $cell_obj/reset_BB] == ""} {
		create_bd_pin -dir I -type rst reset_BB
		set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_pins reset_BB]
	}

	if {[get_bd_pins $cell_obj/clk_BB] == ""} {
		create_bd_pin -dir I -type clk clk_BB
		set_property CONFIG.FREQ_HZ 200000000 [get_bd_pins clk_BB]
		set_property CONFIG.ASSOCIATED_BUSIF M00_BB:S00_BB:M00_AXIS [get_bd_pins clk_BB]
		set_property CONFIG.ASSOCIATED_RESET reset_BB [get_bd_pins clk_BB]
	}
	# ----------------------------------------

	# --------------------------------------------------------------------------

	# ==========================================================================


	# =========================== Crate IP =====================================
	# ----------------- Crate Instance of IP list in vnlv ----------------------


	# ------ AXI4Stream_X7S_VirtualTDL -------
	# Create instance: AXI4Stream_X7S_VirtualTDL_0, and set properties
	if {[get_bd_cells $cell_obj/AXI4Stream_X7S_VirtualTDL_0] == ""} {
		set AXI4Stream_X7S_VirtualTDL_0 [ create_bd_cell -type ip -vlnv $_VLNV(X7_VTDL) AXI4Stream_X7S_VirtualTDL_0 ]
	}
	set_property -dict [ list \
		CONFIG.BUFFERING_STAGE "$BUFFERING_STAGE" \
		CONFIG.DEBUG_MODE "$DEBUG_MODE" \
		CONFIG.SIM_VS_IMP "$SIM_VS_IMP" \
		CONFIG.FILE_PATH_NAME_CO_DELAY "$FILE_PATH_NAME_CO_DELAY" \
		CONFIG.FILE_PATH_NAME_O_DELAY "$FILE_PATH_NAME_O_DELAY" \
		CONFIG.NUM_TAP_TDL "$NUM_TAP_TDL" \
		CONFIG.NUMBER_OF_TDL "$NUMBER_OF_TDL" \
		CONFIG.BIT_SMP_TDL "$BIT_SMP_TDL" \
		CONFIG.VALID_NUMBER_OF_TDL_INIT "$VALID_NUMBER_OF_TDL_INIT" \
		CONFIG.VALID_POSITION_TAP_INIT "$VALID_POSITION_TAP_INIT" \
		CONFIG.MAX_VALID_TAP_POS "$MAX_VALID_TAP_POS" \
		CONFIG.MIN_VALID_TAP_POS "$MIN_VALID_TAP_POS" \
		CONFIG.STEP_VALID_TAP_POS "$STEP_VALID_TAP_POS" \
		CONFIG.OFFSET_TAP_TDL_0 "$OFFSET_TAP_TDL_0" \
		CONFIG.OFFSET_TAP_TDL_1 "$OFFSET_TAP_TDL_1" \
		CONFIG.OFFSET_TAP_TDL_2 "$OFFSET_TAP_TDL_2" \
		CONFIG.OFFSET_TAP_TDL_3 "$OFFSET_TAP_TDL_3" \
		CONFIG.OFFSET_TAP_TDL_4 "$OFFSET_TAP_TDL_4" \
		CONFIG.OFFSET_TAP_TDL_5 "$OFFSET_TAP_TDL_5" \
		CONFIG.OFFSET_TAP_TDL_6 "$OFFSET_TAP_TDL_6" \
		CONFIG.OFFSET_TAP_TDL_7 "$OFFSET_TAP_TDL_7" \
		CONFIG.OFFSET_TAP_TDL_8 "$OFFSET_TAP_TDL_8" \
		CONFIG.OFFSET_TAP_TDL_9 "$OFFSET_TAP_TDL_9" \
		CONFIG.OFFSET_TAP_TDL_10 "$OFFSET_TAP_TDL_10" \
		CONFIG.OFFSET_TAP_TDL_11 "$OFFSET_TAP_TDL_11" \
		CONFIG.OFFSET_TAP_TDL_12 "$OFFSET_TAP_TDL_12" \
		CONFIG.OFFSET_TAP_TDL_13 "$OFFSET_TAP_TDL_13" \
		CONFIG.OFFSET_TAP_TDL_14 "$OFFSET_TAP_TDL_14" \
		CONFIG.OFFSET_TAP_TDL_15 "$OFFSET_TAP_TDL_15" \
		CONFIG.TYPE_TDL_0 "$TYPE_TDL_0" \
		CONFIG.TYPE_TDL_1 "$TYPE_TDL_1" \
		CONFIG.TYPE_TDL_2 "$TYPE_TDL_2" \
		CONFIG.TYPE_TDL_3 "$TYPE_TDL_3" \
		CONFIG.TYPE_TDL_4 "$TYPE_TDL_4" \
		CONFIG.TYPE_TDL_5 "$TYPE_TDL_5" \
		CONFIG.TYPE_TDL_6 "$TYPE_TDL_6" \
		CONFIG.TYPE_TDL_7 "$TYPE_TDL_7" \
		CONFIG.TYPE_TDL_8 "$TYPE_TDL_8" \
		CONFIG.TYPE_TDL_9 "$TYPE_TDL_9" \
		CONFIG.TYPE_TDL_10 "$TYPE_TDL_10" \
		CONFIG.TYPE_TDL_11 "$TYPE_TDL_11" \
		CONFIG.TYPE_TDL_12 "$TYPE_TDL_12" \
		CONFIG.TYPE_TDL_13 "$TYPE_TDL_13" \
		CONFIG.TYPE_TDL_14 "$TYPE_TDL_14" \
		CONFIG.TYPE_TDL_15 "$TYPE_TDL_15" \
		CONFIG.BIT_SMP_PRE_TDL "$BIT_SMP_PRE_TDL" \
		CONFIG.NUM_TAP_PRE_TDL "$NUM_TAP_PRE_TDL" \

	] [get_bd_cells $cell_obj/AXI4Stream_X7S_VirtualTDL_0]
	# ----------------------------------------


	# ------- AXI4Stream_IperDecoder ---------
	# Create instance: AXI4Stream_IperDecoder_0, and set properties, BIT_COARSE = 0 because initially there wasn't the CEC so we had in pipeline also the coarse. Now it is better to call it BIT_PIPELINE, and BIT_TDL = BIT_SMP because of the decimation
	if {[get_bd_cells $cell_obj/AXI4Stream_IperDecoder_0] == ""} {
		set AXI4Stream_IperDecoder_0 [ create_bd_cell -type ip -vlnv $_VLNV(ID) AXI4Stream_IperDecoder_0 ]

		#TODO togli CONFIG.BIT_SUB_INT {8}?
		set_property -dict [ list \
			CONFIG.BIT_SUB_INT {8} \
			CONFIG.BIT_COARSE {0} \
		] $AXI4Stream_IperDecoder_0
	}

	set_property -dict [ list \
		CONFIG.DEBUG_MODE "$DEBUG_PORT_DECODER" \
		CONFIG.TYPE_EDGE_0 "$TYPE_EDGE_0" \
		CONFIG.TYPE_EDGE_1 "$TYPE_EDGE_1" \
		CONFIG.TYPE_EDGE_2 "$TYPE_EDGE_2" \
		CONFIG.TYPE_EDGE_3 "$TYPE_EDGE_3" \
		CONFIG.TYPE_EDGE_4 "$TYPE_EDGE_4" \
		CONFIG.TYPE_EDGE_5 "$TYPE_EDGE_5" \
		CONFIG.TYPE_EDGE_6 "$TYPE_EDGE_6" \
		CONFIG.TYPE_EDGE_7 "$TYPE_EDGE_7" \
		CONFIG.TYPE_EDGE_8 "$TYPE_EDGE_8" \
		CONFIG.TYPE_EDGE_9 "$TYPE_EDGE_9" \
		CONFIG.TYPE_EDGE_10 "$TYPE_EDGE_10" \
		CONFIG.TYPE_EDGE_11 "$TYPE_EDGE_11" \
		CONFIG.TYPE_EDGE_12 "$TYPE_EDGE_12" \
		CONFIG.TYPE_EDGE_13 "$TYPE_EDGE_13" \
		CONFIG.TYPE_EDGE_14 "$TYPE_EDGE_14" \
		CONFIG.TYPE_EDGE_15 "$TYPE_EDGE_15" \
		CONFIG.FREE_RUNNING "$FREE_RUNNING" \
		CONFIG.EDGE_CHECK "$EDGE_CHECK" \
		CONFIG.MD_VS_TD "$MD_VS_TD" \
		CONFIG.TYPE_DECODER "$TYPE_DECODER" \
		CONFIG.BIT_COARSE {0} \
		CONFIG.BIT_SUB_INT "$BIT_SUB_INT" \
		CONFIG.BIT_BUBBLE "$BIT_BUBBLE" \
		CONFIG.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0 "$DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0" \
		CONFIG.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1 "$DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1" \
		CONFIG.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0 "$DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0" \
		CONFIG.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1 "$DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1" \
		CONFIG.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2 "$DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2" \
		CONFIG.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3 "$DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3" \
		CONFIG.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0 "$SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0" \
		CONFIG.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1 "$SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1" \
		CONFIG.PRINT_FULL_REPORT "$PRINT_FULL_REPORT" \
		CONFIG.OPTIMIZATION_MODE "$OPTIMIZATION_MODE" \
		CONFIG.WEIGHT_AREA_VS_TIME_PERCENT "$WEIGHT_AREA_VS_TIME_PERCENT" \
		CONFIG.NUMBER_OF_TDL "$NUMBER_OF_TDL" \
		CONFIG.BIT_TDL "$BIT_SMP_TDL" \
	] [get_bd_cells $cell_obj/AXI4Stream_IperDecoder_0]
	# ----------------------------------------

	# --- AXI4Stream_CoarseExtensionCore ----
	# Create instance: AXI4Stream_CoarseExtensionCore_0, and set properties
	if {[get_bd_cells $cell_obj/AXI4Stream_CoarseExtensionCore_0] == ""} {
		set AXI4Stream_CoarseExtensionCore_0 [ create_bd_cell -type ip -vlnv $_VLNV(CEC) AXI4Stream_CoarseExtensionCore_0 ]
	}

	set_property -dict [ list \
		CONFIG.BIT_FID "$BIT_FID" \
		CONFIG.CEC_VS_CTD_COUNTER "$CEC_VS_CTD_COUNTER" \
		CONFIG.CEC_COARSE_CNT_INIT "$CEC_COARSE_CNT_INIT" \
		CONFIG.BIT_COARSE "$BIT_COARSE" \
		CONFIG.BIT_UNCALIBRATED "$BIT_UNCALIBRATED" \
		CONFIG.BIT_SUB_INT "$BIT_SUB_INT" \
		CONFIG.RELATED_CLOCKS "$RELATED_CLOCKS" \
		CONFIG.CDC_SYNC_STAGES "$CDC_SYNC_STAGES" \
		CONFIG.FIFO_MEMORY_TYPE "$FIFO_MEMORY_TYPE" \
		CONFIG.FIFO_WRITE_DEPTH "$FIFO_WRITE_DEPTH" \
		CONFIG.MAX_NUM_BIT_EQ_PIPELINE_STAGE0 "$MAX_NUM_BIT_EQ_PIPELINE_STAGE0" \
		CONFIG.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 "$MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1" \
		CONFIG.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 "$MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2" \
		CONFIG.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 "$MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3" \
		CONFIG.INTERNAL_OVERFLOW_CNT "$INTERNAL_OVERFLOW_CNT" \

	] [get_bd_cells $cell_obj/AXI4Stream_CoarseExtensionCore_0]
	# ----------------------------------------

	# ----- AXI4Stream_MagicCalibrator -------
	# Create instance: AXI4Stream_MagicCalibrator_0, and set properties
	if {[get_bd_cells $cell_obj/AXI4Stream_MagicCalibrator_0] == ""} {
		set AXI4Stream_MagicCalibrator_0 [ create_bd_cell -type ip -vlnv $_VLNV(MC) AXI4Stream_MagicCalibrator_0 ]
	}

	set_property -dict [ list \
		CONFIG.BIT_CALIBRATION "$BIT_CALIBRATION" \
		CONFIG.BIT_COARSE "$BIT_COARSE" \
		CONFIG.BIT_FID "$BIT_FID" \
		CONFIG.BIT_RESOLUTION "$BIT_RESOLUTION" \
		CONFIG.BIT_UNCALIBRATED "$BIT_UNCALIBRATED" \
		CONFIG.INTEGRATION_METHOD "$INTEGRATION_METHOD" \
		CONFIG.SAVE_BIT "$SAVE_BIT" \
		CONFIG.DEBUG_MODE_CT "$DEBUG_MODE_CT" \
		CONFIG.AXI4_LENGTH "$AXI4_LENGTH" \
		CONFIG.DEBUG_MODE_CC "$DEBUG_MODE_CC" \

	] [get_bd_cells $cell_obj/AXI4Stream_MagicCalibrator_0]
	# ----------------------------------------

	# ------ AXI4Stream_OverflowCounter ------
	# Create instance: AXI4Stream_OverflowCounter_0, and set properties
	if {[get_bd_cells $cell_obj/AXI4Stream_OverflowCounter_0] == ""} {
		set AXI4Stream_OverflowCounter_0 [ create_bd_cell -type ip -vlnv $_VLNV(OC) AXI4Stream_OverflowCounter_0 ]
	}
	set_property -dict [ list \
		CONFIG.BIT_COARSE "$BIT_COARSE" \
		CONFIG.BIT_FID "$BIT_FID" \
		CONFIG.BIT_RESOLUTION "$BIT_RESOLUTION" \

	] [get_bd_cells $cell_obj/AXI4Stream_OverflowCounter_0]
	# ----------------------------------------


	# ------- AXI4Stream_Synchronizer -------
	# Create instance: AXI4Stream_Synchronizer_0, and set properties
	if {[get_bd_cells $cell_obj/AXI4Stream_Synchronizer_0] == ""} {
		set AXI4Stream_Synchronizer_0 [ create_bd_cell -type ip -vlnv $_VLNV(SYNC) AXI4Stream_Synchronizer_0 ]

		#TODO togli CONFIG.DATA_WIDTH {32}?
		set_property -dict [ list \
			CONFIG.DATA_WIDTH {32} \
		] $AXI4Stream_Synchronizer_0

	}

	set_property -dict [ list \
		CONFIG.DATA_WIDTH "$DATA_WIDTH" \
		CONFIG.MODE_SEL "$MODE_SEL" \
		CONFIG.CDC_SYNC_STAGES "$SYNCH_CDC_SYNC_STAGES" \
		CONFIG.RELATED_CLOCKS "$SYNCH_RELATED_CLOCKS" \
		CONFIG.FIFO_DEPTH "$FIFO_DEPTH" \
		CONFIG.FIFO_MEMORY_TYPE "$SYNCH_FIFO_MEMORY_TYPE" \
		CONFIG.SRC_SYNC_FF "$SRC_SYNC_FF" \
		CONFIG.DEST_SYNC_FF "$DEST_SYNC_FF" \

	] [get_bd_cells $cell_obj/AXI4Stream_Synchronizer_0]
	# ----------------------------------------


	# --------- BeltBus_NodeInserter ---------
	# Create instance: BeltBus_NodeInserter_0, and set properties
	if {[get_bd_cells $cell_obj/BeltBus_NodeInserter_0] == ""} {
		set BeltBus_NodeInserter_0 [ create_bd_cell -type ip -vlnv $_VLNV(NI) BeltBus_NodeInserter_0 ]
	}
	set_property -dict [ list \
		CONFIG.PASS_THROUGH "$PASS_THROUGH" \
		CONFIG.BIT_NUM_CH "$BIT_NUM_CH" \
		CONFIG.BIT_COARSE "$BIT_COARSE" \
		CONFIG.BIT_FID "$BIT_FID" \
		CONFIG.BIT_RESOLUTION "$BIT_RESOLUTION" \
		CONFIG.INJECT_CYCLES "$INJECT_CYCLES" \
		CONFIG.HOLD_ON_SINGLE_NODE "$HOLD_ON_SINGLE_NODE" \
		CONFIG.HOLD_ON_INTEGRAL "$HOLD_ON_INTEGRAL" \
		CONFIG.HOLD_ON_MIN_MOD "$HOLD_ON_MIN_MOD" \
		CONFIG.RETAIN_SINGLE_NODE "$RETAIN_SINGLE_NODE" \
		CONFIG.NUM_CH "$NUM_CH" \
		CONFIG.NUM_NODE "$NUM_NODE" \

	] [get_bd_cells $cell_obj/BeltBus_NodeInserter_0]
	# ----------------------------------------

	# --------------------------------------------------------------------------

	# ==========================================================================



	# ===================== IP to Hier Ports Connection ========================

	# --------------------- Create interface connections -----------------------

	# ------------AXIS V-TDL -> ID -----------
	if {[get_bd_intf_nets $cell_obj/AXI4Stream_X7S_VirtualTDL_0_M00_AXIS_Undeco] == ""} {
		connect_bd_intf_net -intf_net AXI4Stream_X7S_VirtualTDL_0_M00_AXIS_Undeco [get_bd_intf_pins AXI4Stream_IperDecoder_0/S00_AXIS_UnDeco] [get_bd_intf_pins AXI4Stream_X7S_VirtualTDL_0/M00_AXIS_Undeco]
	}
	# ----------------------------------------

	# ------------- AXIS ID -> CEC -----------
	if {[get_bd_intf_nets $cell_obj/AXI4Stream_IperDecoder_0_M00_SubInt] == ""} {
		connect_bd_intf_net -intf_net AXI4Stream_IperDecoder_0_M00_SubInt [get_bd_intf_pins AXI4Stream_CoarseExtensionCore_0/S00_AXIS_SubInt] [get_bd_intf_pins AXI4Stream_IperDecoder_0/M00_AXIS_SubInt]
	}
	# ----------------------------------------

	# ------------- AXIS CEC -> MC -----------
	if {[get_bd_intf_nets $cell_obj/AXI4Stream_CoarseExtensionCore_0_M00_AXIS_UnCalib] == ""} {
		connect_bd_intf_net -intf_net AXI4Stream_CoarseExtensionCore_0_M00_AXIS_UnCalib [get_bd_intf_pins AXI4Stream_CoarseExtensionCore_0/M00_AXIS_UnCalib] [get_bd_intf_pins AXI4Stream_MagicCalibrator_0/S00_AXIS_UnCalib]
	}
	# ----------------------------------------

	# ------------- AXIS MC -> OC -----------
	if {[get_bd_intf_nets $cell_obj/AXI4Stream_MagicCalibrator_0_M00_AXIS_TimeStamp] == ""} {
		connect_bd_intf_net -intf_net AXI4Stream_MagicCalibrator_0_M00_AXIS_TimeStamp [get_bd_intf_pins AXI4Stream_MagicCalibrator_0/M00_AXIS_TimeStamp] [get_bd_intf_pins AXI4Stream_OverflowCounter_0/S00_AXIS_timestamp]
	}
	# ----------------------------------------

	# ------------ AXIS OC -> SYNC -----------
	if {[get_bd_intf_nets $cell_obj/AXI4Stream_OverflowCounter_0_M00_AXIS_beltbus] == ""} {
		connect_bd_intf_net -intf_net AXI4Stream_OverflowCounter_0_M00_AXIS_beltbus [get_bd_intf_pins AXI4Stream_OverflowCounter_0/M00_AXIS_beltbus] [get_bd_intf_pins AXI4Stream_Synchronizer_0/S00_AXIS]
	}
	# ----------------------------------------

	# ------------ AXIS SYNC -> BB -----------
	if {[get_bd_intf_nets $cell_obj/AXI4Stream_Synchronizer_0_M00_AXIS] == ""} {
		connect_bd_intf_net -intf_net AXI4Stream_Synchronizer_0_M00_AXIS [get_bd_intf_pins AXI4Stream_Synchronizer_0/M00_AXIS] [get_bd_intf_pins BeltBus_NodeInserter_0/S00_AXIS]
	}
	# ----------------------------------------

	# --------------- M00_BB -----------------
	if {[get_bd_intf_nets $cell_obj/BeltBus_NodeInserter_0_M00_BB] == "" && ($PASS_THROUGH == "Belt-Bus" || $PASS_THROUGH == "Both")} {
		connect_bd_intf_net -intf_net BeltBus_NodeInserter_0_M00_BB [get_bd_intf_pins M00_BB] [get_bd_intf_pins BeltBus_NodeInserter_0/M00_BB]
	}
	if {[get_bd_intf_nets $cell_obj/BeltBus_NodeInserter_0_M00_BB] == "$cell_obj/BeltBus_NodeInserter_0_M00_BB" && !($PASS_THROUGH == "Belt-Bus" || $PASS_THROUGH == "Both")} {
		delete_bd_objs [get_bd_intf_nets $cell_obj/BeltBus_NodeInserter_0_M00_BB]
	}
	# ----------------------------------------

	# --------------- S00_BB -----------------
	if {[get_bd_intf_nets $cell_obj/BeltBus_NodeInserter_0_S00_BB] == ""  && ($PASS_THROUGH == "Belt-Bus" || $PASS_THROUGH == "Both")} {
		connect_bd_intf_net -intf_net BeltBus_NodeInserter_0_S00_BB [get_bd_intf_pins S00_BB] [get_bd_intf_pins BeltBus_NodeInserter_0/S00_BB]
	}
	if {[get_bd_intf_nets $cell_obj/BeltBus_NodeInserter_0_S00_BB] == "$cell_obj/BeltBus_NodeInserter_0_S00_BB" && !($PASS_THROUGH == "Belt-Bus" || $PASS_THROUGH == "Both")} {
		delete_bd_objs [get_bd_intf_nets $cell_obj/BeltBus_NodeInserter_0_S00_BB]
	}
	# ----------------------------------------

	# -------------- M00_AXIS -----------------
	if {[get_bd_intf_nets $cell_obj/BeltBus_NodeInserter_0_M00_AXIS] == "" && ($PASS_THROUGH == "Timestamp" || $PASS_THROUGH == "Both")} {
		connect_bd_intf_net -intf_net BeltBus_NodeInserter_0_M00_AXIS [get_bd_intf_pins M00_AXIS] [get_bd_intf_pins BeltBus_NodeInserter_0/M00_AXIS]
	}
	if {[get_bd_intf_nets $cell_obj/BeltBus_NodeInserter_0_M00_AXIS] == "$cell_obj/BeltBus_NodeInserter_0_M00_AXIS" && !($PASS_THROUGH == "Timestamp" || $PASS_THROUGH == "Both")} {
		delete_bd_objs [get_bd_intf_nets $cell_obj/BeltBus_NodeInserter_0_M00_AXIS]
	}
	# ----------------------------------------

	# ------------ M01_AXIS_DebugCT ----------
	if {[get_bd_intf_nets $cell_obj/AXI4Stream_MagicCalibrator_0_M01_AXIS_DebugCT] == "" && $DEBUG_MODE_CT} {
		connect_bd_intf_net -intf_net AXI4Stream_MagicCalibrator_0_M01_AXIS_DebugCT [get_bd_intf_pins M01_AXIS_DebugCT] [get_bd_intf_pins AXI4Stream_MagicCalibrator_0/M01_AXIS_DebugCT]
	}
	if {[get_bd_intf_nets $cell_obj/AXI4Stream_MagicCalibrator_0_M01_AXIS_DebugCT] == "$cell_obj/AXI4Stream_MagicCalibrator_0_M01_AXIS_DebugCT" && !$DEBUG_MODE_CT} {
		delete_bd_objs [get_bd_intf_nets $cell_obj/AXI4Stream_MagicCalibrator_0_M01_AXIS_DebugCT]
	}
	# ----------------------------------------

	# ------------ M02_AXIS_DebugCC ----------
	if {[get_bd_intf_nets $cell_obj/AXI4Stream_MagicCalibrator_0_M02_AXIS_DebugCC] == "" && $DEBUG_MODE_CC} {
		connect_bd_intf_net -intf_net AXI4Stream_MagicCalibrator_0_M02_AXIS_DebugCC [get_bd_intf_pins M02_AXIS_DebugCC] [get_bd_intf_pins AXI4Stream_MagicCalibrator_0/M02_AXIS_DebugCC]
	}
	if {[get_bd_intf_nets $cell_obj/AXI4Stream_MagicCalibrator_0_M02_AXIS_DebugCC] == "$cell_obj/AXI4Stream_MagicCalibrator_0_M02_AXIS_DebugCC" && !$DEBUG_MODE_CC} {
		delete_bd_objs [get_bd_intf_nets $cell_obj/AXI4Stream_MagicCalibrator_0_M02_AXIS_DebugCC]
	}
	# ----------------------------------------


	# --------------------------------------------------------------------------



	# -------------------- Create port connections -----------------------------


	# ------- AXI4Stream_X7S_VirtualTDL ------
	#AsyncInput
	if {[get_bd_nets $cell_obj/AsyncInput_1] == "" } {
		connect_bd_net -net AsyncInput_1 [get_bd_pins AXI4Stream_X7S_VirtualTDL_0/AsyncInput] [get_bd_pins AsyncInput]
	}


	# ValidNumberOfTDL
	if {[get_bd_nets $cell_obj/ValidNumberOfTDL_1] == ""  && $DEBUG_MODE} {
		connect_bd_net -net ValidNumberOfTDL_1 [get_bd_pins ValidNumberOfTDL] [get_bd_pins AXI4Stream_X7S_VirtualTDL_0/ValidNumberOfTdl]
	}
	if {[get_bd_nets $cell_obj/ValidNumberOfTDL_1] == "$cell_obj/ValidNumberOfTDL_1" && !$DEBUG_MODE} {
		delete_bd_objs [get_bd_nets $cell_obj/ValidNumberOfTDL_1]
	}

	# ValidPositionTap
	if {[get_bd_nets $cell_obj/ValidPositionTap_1] == "" && $DEBUG_MODE } {
		connect_bd_net -net ValidPositionTap_1 [get_bd_pins ValidPositionTap] [get_bd_pins AXI4Stream_X7S_VirtualTDL_0/ValidPositionTap]
	}
	if {[get_bd_nets $cell_obj/ValidPositionTap_1] == "$cell_obj/ValidPositionTap_1" && !$DEBUG_MODE} {
		delete_bd_objs [get_bd_nets $cell_obj/ValidPositionTap_1]
	}
	# ----------------------------------------






	# ------- AXI4Stream_IperDecoder ---------
	# subInterpolationMatrix
	if {[get_bd_nets $cell_obj/subInterpolationMatrix_1] == "" && $DEBUG_PORT_DECODER} {
		connect_bd_net -net subInterpolationMatrix_1 [get_bd_pins subInterpolationMatrix] [get_bd_pins AXI4Stream_IperDecoder_0/subInterpolationMatrix]
	}
	if {[get_bd_nets $cell_obj/subInterpolationMatrix_1] == "$cell_obj/subInterpolationMatrix_1" && !$DEBUG_PORT_DECODER} {
		delete_bd_objs [get_bd_nets $cell_obj/subInterpolationMatrix_1]
	}
	# ----------------------------------------



	# ------ AXI4Stream_CoarseExtensionCore ---
	# C'è un errore lo devo trovare TODO
	# CoarseCounter_CTD
	if {[get_bd_nets $cell_obj/CoarseCounter_CTD_0] == "" && ($CEC_VS_CTD_COUNTER == "CTD")} {
		connect_bd_net -net CoarseCounter_CTD_0 [get_bd_pins CoarseCounter_CTD] [get_bd_pins AXI4Stream_CoarseExtensionCore_0/CoarseCounter_CTD]
	}
	if {[get_bd_nets $cell_obj/CoarseCounter_CTD_0] == "$cell_obj/CoarseCounter_CTD_0" && !($CEC_VS_CTD_COUNTER == "CTD")} {
		delete_bd_objs [get_bd_nets $cell_obj/CoarseCounter_CTD_0]
	}
	# ----------------------------------------


	# ------ AXI4Stream_MagicCalibrator ------
	#if {[get_bd_nets $cell_obj/AXI4Stream_MagicCalibrator_0_Calibrated] == "" && ($CALIB_EVENT == "NOT REQUIRED") } {
	#	connect_bd_net -net AXI4Stream_MagicCalibrator_0_Calibrated [get_bd_pins Calibrated] [get_bd_pins AXI4Stream_MagicCalibrator_0/Calibrated]
	#}
	#if {[get_bd_nets $cell_obj/AXI4Stream_MagicCalibrator_0_Calibrated] == "$cell_obj/AXI4Stream_MagicCalibrator_0_Calibrated" && !($CALIB_EVENT == "NOT REQUIRED") } {
	#	delete_bd_objs [get_bd_nets $cell_obj/AXI4Stream_MagicCalibrator_0_Calibrated]
	#}
	# Calibrate
	if {[get_bd_nets $cell_obj/Calibrate_1] == "" } {
		connect_bd_net -net Calibrate_1 [get_bd_pins AXI4Stream_MagicCalibrator_0/Calibrated] [get_bd_pins AXI4Stream_OverflowCounter_0/IsCalibrated] [get_bd_pins Calibrated]
	}

	# Restart_Calibration
	if {[get_bd_nets $cell_obj/Restart_Calibration_1] == "" && ($DEBUG_MODE_CT || $DEBUG_MODE_CC) } {
		connect_bd_net -net Restart_Calibration_1 [get_bd_pins Restart_Calibration] [get_bd_pins AXI4Stream_MagicCalibrator_0/Restart_Calibration]
	}
	if {[get_bd_nets $cell_obj/Restart_Calibration_1] == "$cell_obj/Restart_Calibration_1" && !($DEBUG_MODE_CT || $DEBUG_MODE_CC)} {
		delete_bd_objs [get_bd_nets $cell_obj/Restart_Calibration_1]
	}


	# Stop_Calibration
	if {[get_bd_nets $cell_obj/Stop_Calibration_1] == "" && ($DEBUG_MODE_CT || $DEBUG_MODE_CC)} {
		connect_bd_net -net Stop_Calibration_1 [get_bd_pins Stop_Calibration] [get_bd_pins AXI4Stream_MagicCalibrator_0/Stop_Calibration]
	}
	if {[get_bd_nets $cell_obj/Stop_Calibration_1] == "$cell_obj/Stop_Calibration_1" && !($DEBUG_MODE_CT || $DEBUG_MODE_CC)} {
		delete_bd_objs [get_bd_nets $cell_obj/Stop_Calibration_1]
	}

	# bitTrn_Cal_dout
	if {[get_bd_nets $cell_obj/bitTrn_Cal_dout_1] == "" && ($DEBUG_MODE_CT || $DEBUG_MODE_CC)} {
		connect_bd_net -net bitTrn_Cal_dout_1 [get_bd_pins bitTrn_Cal_dout] [get_bd_pins AXI4Stream_MagicCalibrator_0/bitTrn_Cal_dout]
	}
	if {[get_bd_nets $cell_obj/bitTrn_Cal_dout_1] == "$cell_obj/bitTrn_Cal_dout_1" && !($DEBUG_MODE_CT || $DEBUG_MODE_CC)} {
		delete_bd_objs [get_bd_nets $cell_obj/bitTrn_Cal_dout_1]
	}

	# bitTrn_Uncal_addr
	if {[get_bd_nets $cell_obj/bitTrn_Uncal_addr_1] == "" && ($DEBUG_MODE_CT || $DEBUG_MODE_CC)} {
		connect_bd_net -net bitTrn_Uncal_addr_1 [get_bd_pins bitTrn_Uncal_addr] [get_bd_pins AXI4Stream_MagicCalibrator_0/bitTrn_Uncal_addr]
	}
	if {[get_bd_nets $cell_obj/bitTrn_Uncal_addr_1] == "$cell_obj/bitTrn_Uncal_addr_1" && !($DEBUG_MODE_CT || $DEBUG_MODE_CC)} {
		delete_bd_objs [get_bd_nets $cell_obj/bitTrn_Uncal_addr_1]
	}

	# bitTrn_ReqSample
	if {[get_bd_nets $cell_obj/bitTrn_ReqSample_addr_1] == "" && ($DEBUG_MODE_CT || $DEBUG_MODE_CC)} {
		connect_bd_net -net bitTrn_ReqSample_addr_1 [get_bd_pins bitTrn_ReqSample] [get_bd_pins AXI4Stream_MagicCalibrator_0/bitTrn_ReqSample]
	}
	if {[get_bd_nets $cell_obj/bitTrn_ReqSample_addr_1] == "$cell_obj/bitTrn_ReqSample_addr_1" && !($DEBUG_MODE_CT || $DEBUG_MODE_CC)} {
		delete_bd_objs [get_bd_nets $cell_obj/bitTrn_ReqSample_addr_1]
	}
	# ----------------------------------------

	# --------------------------------------------------------------------------



	# --------------------- Create Clock/Reset port connections ----------------

	# ----------------- TDC ------------------
	if {[get_bd_nets $cell_obj/Net] == ""} {
		connect_bd_net -net Net [get_bd_pins reset_TDC] [get_bd_pins AXI4Stream_CoarseExtensionCore_0/reset_TDC] [get_bd_pins AXI4Stream_IperDecoder_0/reset] [get_bd_pins AXI4Stream_X7S_VirtualTDL_0/reset]
	}

	if {[get_bd_nets $cell_obj/Net2] == ""} {
		connect_bd_net -net Net2 [get_bd_pins clk_TDC] [get_bd_pins AXI4Stream_CoarseExtensionCore_0/clk_TDC] [get_bd_pins AXI4Stream_IperDecoder_0/clk] [get_bd_pins AXI4Stream_X7S_VirtualTDL_0/clk]
	}
	# ----------------------------------------

	# ----------------- SYS ------------------
	if {[get_bd_nets $cell_obj/Net1] == ""} {
		connect_bd_net -net Net1 [get_bd_pins reset_SYS] [get_bd_pins AXI4Stream_CoarseExtensionCore_0/reset_SYS] [get_bd_pins AXI4Stream_MagicCalibrator_0/reset] [get_bd_pins AXI4Stream_OverflowCounter_0/reset]
	}

	if {[get_bd_nets $cell_obj/Net3] == ""} {
		connect_bd_net -net Net3 [get_bd_pins clk_SYS] [get_bd_pins AXI4Stream_CoarseExtensionCore_0/clk_SYS] [get_bd_pins AXI4Stream_MagicCalibrator_0/clk] [get_bd_pins AXI4Stream_Synchronizer_0/s00_axis_aclk] [get_bd_pins AXI4Stream_OverflowCounter_0/clk]
	}
	# ----------------------------------------

	# -------------- BeltBus ------------------
	if {[get_bd_nets $cell_obj/NetBB] == ""} {
		connect_bd_net -net NetBB [get_bd_pins reset_BB] [get_bd_pins BeltBus_NodeInserter_0/reset]
	}

	if {[get_bd_nets $cell_obj/Net4] == ""} {
		connect_bd_net -net Net4 [get_bd_pins clk_BB] [get_bd_pins AXI4Stream_Synchronizer_0/m00_axis_aclk] [get_bd_pins BeltBus_NodeInserter_0/clk]
	}
	# ----------------------------------------

	# --------------------------------------------------------------------------
	# ==========================================================================

}

proc post_propagate { this args } {
}
