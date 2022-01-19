
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/BeltBus_TTM_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {TTM Settings}]
  set_property tooltip {TTM Settings} ${Page_0}
  ipgui::add_static_text $IPINST -name "TTM num ch" -parent ${Page_0} -text {Ch field width have a huge impact on TTM compression performance.
Please set this field to the minimum bit value that can hold the number of channels.
This field CAN BE different from BeltBus BIT_NUM_CH.}
  set TTM_BIT_NUM_CH [ipgui::add_param $IPINST -name "TTM_BIT_NUM_CH" -parent ${Page_0}]
  set_property tooltip {Number of bits for channel field in TTM packets.} ${TTM_BIT_NUM_CH}
  set PTE_MAX_SIZE [ipgui::add_param $IPINST -name "PTE_MAX_SIZE" -parent ${Page_0}]
  set_property tooltip {The packet sent to PTE are limited to this size. Should be less than the maximum PTE allowed size} ${PTE_MAX_SIZE}
  set TAIL_FIFO_DEPTH [ipgui::add_param $IPINST -name "TAIL_FIFO_DEPTH" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Expressed in words/timestamps. A bigger fifo ensure a lower event loss rate} ${TAIL_FIFO_DEPTH}
  set BIT_TRUNC [ipgui::add_param $IPINST -name "BIT_TRUNC" -parent ${Page_0}]
  set_property tooltip {On the extended 64 bit, discard N right (LSB) bits to reduce LSB and slightly enhance compression} ${BIT_TRUNC}

  #Adding Page
  set TDC_Settings [ipgui::add_page $IPINST -name "TDC Settings"]
  ipgui::add_param $IPINST -name "NUM_CH" -parent ${TDC_Settings}
  #Adding Group
  set Belt-Bus [ipgui::add_group $IPINST -name "Belt-Bus" -parent ${TDC_Settings}]
  ipgui::add_param $IPINST -name "BIT_NUM_CH" -parent ${Belt-Bus}
  ipgui::add_param $IPINST -name "BIT_FID" -parent ${Belt-Bus}
  ipgui::add_param $IPINST -name "BIT_COARSE" -parent ${Belt-Bus}
  ipgui::add_param $IPINST -name "BIT_RESOLUTION" -parent ${Belt-Bus}


  #Adding Page
  set Advanced_TTM_settings [ipgui::add_page $IPINST -name "Advanced TTM settings"]
  #Adding Group
  set Compressor_settings [ipgui::add_group $IPINST -name "Compressor settings" -parent ${Advanced_TTM_settings}]
  ipgui::add_param $IPINST -name "INS_TIMEOUT_CYCLES" -parent ${Compressor_settings}
  ipgui::add_param $IPINST -name "DATA_FIFO_DEPTH" -parent ${Compressor_settings} -widget comboBox
  ipgui::add_param $IPINST -name "META_FIFO_DEPTH" -parent ${Compressor_settings} -widget comboBox

  #Adding Group
  set AXIS_Settings [ipgui::add_group $IPINST -name "AXIS Settings" -parent ${Advanced_TTM_settings}]
  ipgui::add_param $IPINST -name "TDEST_VALUE" -parent ${AXIS_Settings}
  ipgui::add_param $IPINST -name "ENABLE_SLICE_REGISTERS" -parent ${AXIS_Settings}
  set CLK_AXI_BB_RELATED [ipgui::add_param $IPINST -name "CLK_AXI_BB_RELATED" -parent ${AXIS_Settings}]
  set_property tooltip {Check if Clock AXI is related to BeltBus clock. This is passed to XPM_FIFO_ASYNC} ${CLK_AXI_BB_RELATED}

  #Adding Group
  set BeltBus_extender [ipgui::add_group $IPINST -name "BeltBus extender" -parent ${Advanced_TTM_settings}]
  ipgui::add_param $IPINST -name "BELTBUS_EXTENDED_W" -parent ${BeltBus_extender}
  ipgui::add_param $IPINST -name "EXT_FIFO_DEPTH" -parent ${BeltBus_extender} -widget comboBox
  ipgui::add_param $IPINST -name "LOSS_COUNTER_W" -parent ${BeltBus_extender}

  #Adding Group
  set TLAST_generator [ipgui::add_group $IPINST -name "TLAST generator" -parent ${Advanced_TTM_settings}]
  ipgui::add_param $IPINST -name "CUSTOM_TRESHOLD" -parent ${TLAST_generator}
  ipgui::add_param $IPINST -name "TAIL_TRESHOLD" -parent ${TLAST_generator}
  ipgui::add_param $IPINST -name "TLAST_GEN_TIMEOUT_CYCLES" -parent ${TLAST_generator}

  #Adding Group
  set SYNC_settings [ipgui::add_group $IPINST -name "SYNC settings" -parent ${Advanced_TTM_settings}]
  set COLLAPSE_SYNC [ipgui::add_param $IPINST -name "COLLAPSE_SYNC" -parent ${SYNC_settings}]
  set_property tooltip {If enabled, SYNC measurements will be collapsed (i.e., only the SYNC before a measurement or a group of them will be send)} ${COLLAPSE_SYNC}



}

proc update_PARAM_VALUE.TAIL_TRESHOLD { PARAM_VALUE.TAIL_TRESHOLD PARAM_VALUE.CUSTOM_TRESHOLD PARAM_VALUE.TAIL_FIFO_DEPTH } {
	# Procedure called to update TAIL_TRESHOLD when any of the dependent parameters in the arguments change
	
	set TAIL_TRESHOLD ${PARAM_VALUE.TAIL_TRESHOLD}
	set CUSTOM_TRESHOLD ${PARAM_VALUE.CUSTOM_TRESHOLD}
	set TAIL_FIFO_DEPTH ${PARAM_VALUE.TAIL_FIFO_DEPTH}
	set values(CUSTOM_TRESHOLD) [get_property value $CUSTOM_TRESHOLD]
	set values(TAIL_FIFO_DEPTH) [get_property value $TAIL_FIFO_DEPTH]
	if { [gen_USERPARAMETER_TAIL_TRESHOLD_ENABLEMENT $values(CUSTOM_TRESHOLD)] } {
		set_property enabled true $TAIL_TRESHOLD
	} else {
		set_property enabled false $TAIL_TRESHOLD
		set_property value [gen_USERPARAMETER_TAIL_TRESHOLD_VALUE $values(TAIL_FIFO_DEPTH)] $TAIL_TRESHOLD
	}
}

proc validate_PARAM_VALUE.TAIL_TRESHOLD { PARAM_VALUE.TAIL_TRESHOLD } {
	# Procedure called to validate TAIL_TRESHOLD
	return true
}

proc update_PARAM_VALUE.BELTBUS_EXTENDED_W { PARAM_VALUE.BELTBUS_EXTENDED_W } {
	# Procedure called to update BELTBUS_EXTENDED_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BELTBUS_EXTENDED_W { PARAM_VALUE.BELTBUS_EXTENDED_W } {
	# Procedure called to validate BELTBUS_EXTENDED_W
	return true
}

proc update_PARAM_VALUE.BIT_COARSE { PARAM_VALUE.BIT_COARSE } {
	# Procedure called to update BIT_COARSE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_COARSE { PARAM_VALUE.BIT_COARSE } {
	# Procedure called to validate BIT_COARSE
	return true
}

proc update_PARAM_VALUE.BIT_FID { PARAM_VALUE.BIT_FID } {
	# Procedure called to update BIT_FID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_FID { PARAM_VALUE.BIT_FID } {
	# Procedure called to validate BIT_FID
	return true
}

proc update_PARAM_VALUE.BIT_NUM_CH { PARAM_VALUE.BIT_NUM_CH } {
	# Procedure called to update BIT_NUM_CH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_NUM_CH { PARAM_VALUE.BIT_NUM_CH } {
	# Procedure called to validate BIT_NUM_CH
	return true
}

proc update_PARAM_VALUE.BIT_RESOLUTION { PARAM_VALUE.BIT_RESOLUTION } {
	# Procedure called to update BIT_RESOLUTION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_RESOLUTION { PARAM_VALUE.BIT_RESOLUTION } {
	# Procedure called to validate BIT_RESOLUTION
	return true
}

proc update_PARAM_VALUE.BIT_TRUNC { PARAM_VALUE.BIT_TRUNC } {
	# Procedure called to update BIT_TRUNC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_TRUNC { PARAM_VALUE.BIT_TRUNC } {
	# Procedure called to validate BIT_TRUNC
	return true
}

proc update_PARAM_VALUE.CLK_AXI_BB_RELATED { PARAM_VALUE.CLK_AXI_BB_RELATED } {
	# Procedure called to update CLK_AXI_BB_RELATED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CLK_AXI_BB_RELATED { PARAM_VALUE.CLK_AXI_BB_RELATED } {
	# Procedure called to validate CLK_AXI_BB_RELATED
	return true
}

proc update_PARAM_VALUE.COLLAPSE_SYNC { PARAM_VALUE.COLLAPSE_SYNC } {
	# Procedure called to update COLLAPSE_SYNC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COLLAPSE_SYNC { PARAM_VALUE.COLLAPSE_SYNC } {
	# Procedure called to validate COLLAPSE_SYNC
	return true
}

proc update_PARAM_VALUE.CUSTOM_TRESHOLD { PARAM_VALUE.CUSTOM_TRESHOLD } {
	# Procedure called to update CUSTOM_TRESHOLD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CUSTOM_TRESHOLD { PARAM_VALUE.CUSTOM_TRESHOLD } {
	# Procedure called to validate CUSTOM_TRESHOLD
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ARUSER_WIDTH { PARAM_VALUE.C_S00_AXI_ARUSER_WIDTH } {
	# Procedure called to update C_S00_AXI_ARUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ARUSER_WIDTH { PARAM_VALUE.C_S00_AXI_ARUSER_WIDTH } {
	# Procedure called to validate C_S00_AXI_ARUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_AWUSER_WIDTH { PARAM_VALUE.C_S00_AXI_AWUSER_WIDTH } {
	# Procedure called to update C_S00_AXI_AWUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_AWUSER_WIDTH { PARAM_VALUE.C_S00_AXI_AWUSER_WIDTH } {
	# Procedure called to validate C_S00_AXI_AWUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_BUSER_WIDTH { PARAM_VALUE.C_S00_AXI_BUSER_WIDTH } {
	# Procedure called to update C_S00_AXI_BUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_BUSER_WIDTH { PARAM_VALUE.C_S00_AXI_BUSER_WIDTH } {
	# Procedure called to validate C_S00_AXI_BUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ID_WIDTH { PARAM_VALUE.C_S00_AXI_ID_WIDTH } {
	# Procedure called to update C_S00_AXI_ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ID_WIDTH { PARAM_VALUE.C_S00_AXI_ID_WIDTH } {
	# Procedure called to validate C_S00_AXI_ID_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_RUSER_WIDTH { PARAM_VALUE.C_S00_AXI_RUSER_WIDTH } {
	# Procedure called to update C_S00_AXI_RUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_RUSER_WIDTH { PARAM_VALUE.C_S00_AXI_RUSER_WIDTH } {
	# Procedure called to validate C_S00_AXI_RUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_WUSER_WIDTH { PARAM_VALUE.C_S00_AXI_WUSER_WIDTH } {
	# Procedure called to update C_S00_AXI_WUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_WUSER_WIDTH { PARAM_VALUE.C_S00_AXI_WUSER_WIDTH } {
	# Procedure called to validate C_S00_AXI_WUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.DATA_FIFO_DEPTH { PARAM_VALUE.DATA_FIFO_DEPTH } {
	# Procedure called to update DATA_FIFO_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_FIFO_DEPTH { PARAM_VALUE.DATA_FIFO_DEPTH } {
	# Procedure called to validate DATA_FIFO_DEPTH
	return true
}

proc update_PARAM_VALUE.ENABLE_SLICE_REGISTERS { PARAM_VALUE.ENABLE_SLICE_REGISTERS } {
	# Procedure called to update ENABLE_SLICE_REGISTERS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ENABLE_SLICE_REGISTERS { PARAM_VALUE.ENABLE_SLICE_REGISTERS } {
	# Procedure called to validate ENABLE_SLICE_REGISTERS
	return true
}

proc update_PARAM_VALUE.EXT_FIFO_DEPTH { PARAM_VALUE.EXT_FIFO_DEPTH } {
	# Procedure called to update EXT_FIFO_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EXT_FIFO_DEPTH { PARAM_VALUE.EXT_FIFO_DEPTH } {
	# Procedure called to validate EXT_FIFO_DEPTH
	return true
}

proc update_PARAM_VALUE.INS_TIMEOUT_CYCLES { PARAM_VALUE.INS_TIMEOUT_CYCLES } {
	# Procedure called to update INS_TIMEOUT_CYCLES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INS_TIMEOUT_CYCLES { PARAM_VALUE.INS_TIMEOUT_CYCLES } {
	# Procedure called to validate INS_TIMEOUT_CYCLES
	return true
}

proc update_PARAM_VALUE.LOSS_COUNTER_W { PARAM_VALUE.LOSS_COUNTER_W } {
	# Procedure called to update LOSS_COUNTER_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LOSS_COUNTER_W { PARAM_VALUE.LOSS_COUNTER_W } {
	# Procedure called to validate LOSS_COUNTER_W
	return true
}

proc update_PARAM_VALUE.META_FIFO_DEPTH { PARAM_VALUE.META_FIFO_DEPTH } {
	# Procedure called to update META_FIFO_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.META_FIFO_DEPTH { PARAM_VALUE.META_FIFO_DEPTH } {
	# Procedure called to validate META_FIFO_DEPTH
	return true
}

proc update_PARAM_VALUE.M_AXIS_TDATA_W { PARAM_VALUE.M_AXIS_TDATA_W } {
	# Procedure called to update M_AXIS_TDATA_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M_AXIS_TDATA_W { PARAM_VALUE.M_AXIS_TDATA_W } {
	# Procedure called to validate M_AXIS_TDATA_W
	return true
}

proc update_PARAM_VALUE.M_AXIS_TDEST_W { PARAM_VALUE.M_AXIS_TDEST_W } {
	# Procedure called to update M_AXIS_TDEST_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.M_AXIS_TDEST_W { PARAM_VALUE.M_AXIS_TDEST_W } {
	# Procedure called to validate M_AXIS_TDEST_W
	return true
}

proc update_PARAM_VALUE.NUM_CH { PARAM_VALUE.NUM_CH } {
	# Procedure called to update NUM_CH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_CH { PARAM_VALUE.NUM_CH } {
	# Procedure called to validate NUM_CH
	return true
}

proc update_PARAM_VALUE.PTE_MAX_SIZE { PARAM_VALUE.PTE_MAX_SIZE } {
	# Procedure called to update PTE_MAX_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PTE_MAX_SIZE { PARAM_VALUE.PTE_MAX_SIZE } {
	# Procedure called to validate PTE_MAX_SIZE
	return true
}

proc update_PARAM_VALUE.TAIL_FIFO_DEPTH { PARAM_VALUE.TAIL_FIFO_DEPTH } {
	# Procedure called to update TAIL_FIFO_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TAIL_FIFO_DEPTH { PARAM_VALUE.TAIL_FIFO_DEPTH } {
	# Procedure called to validate TAIL_FIFO_DEPTH
	return true
}

proc update_PARAM_VALUE.TDEST_VALUE { PARAM_VALUE.TDEST_VALUE } {
	# Procedure called to update TDEST_VALUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TDEST_VALUE { PARAM_VALUE.TDEST_VALUE } {
	# Procedure called to validate TDEST_VALUE
	return true
}

proc update_PARAM_VALUE.TLAST_GEN_TIMEOUT_CYCLES { PARAM_VALUE.TLAST_GEN_TIMEOUT_CYCLES } {
	# Procedure called to update TLAST_GEN_TIMEOUT_CYCLES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TLAST_GEN_TIMEOUT_CYCLES { PARAM_VALUE.TLAST_GEN_TIMEOUT_CYCLES } {
	# Procedure called to validate TLAST_GEN_TIMEOUT_CYCLES
	return true
}

proc update_PARAM_VALUE.TTM_BIT_NUM_CH { PARAM_VALUE.TTM_BIT_NUM_CH } {
	# Procedure called to update TTM_BIT_NUM_CH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TTM_BIT_NUM_CH { PARAM_VALUE.TTM_BIT_NUM_CH } {
	# Procedure called to validate TTM_BIT_NUM_CH
	return true
}


proc update_MODELPARAM_VALUE.BIT_RESOLUTION { MODELPARAM_VALUE.BIT_RESOLUTION PARAM_VALUE.BIT_RESOLUTION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_RESOLUTION}] ${MODELPARAM_VALUE.BIT_RESOLUTION}
}

proc update_MODELPARAM_VALUE.BIT_COARSE { MODELPARAM_VALUE.BIT_COARSE PARAM_VALUE.BIT_COARSE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_COARSE}] ${MODELPARAM_VALUE.BIT_COARSE}
}

proc update_MODELPARAM_VALUE.BIT_FID { MODELPARAM_VALUE.BIT_FID PARAM_VALUE.BIT_FID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_FID}] ${MODELPARAM_VALUE.BIT_FID}
}

proc update_MODELPARAM_VALUE.BIT_NUM_CH { MODELPARAM_VALUE.BIT_NUM_CH PARAM_VALUE.BIT_NUM_CH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_NUM_CH}] ${MODELPARAM_VALUE.BIT_NUM_CH}
}

proc update_MODELPARAM_VALUE.NUM_CH { MODELPARAM_VALUE.NUM_CH PARAM_VALUE.NUM_CH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_CH}] ${MODELPARAM_VALUE.NUM_CH}
}

proc update_MODELPARAM_VALUE.BELTBUS_EXTENDED_W { MODELPARAM_VALUE.BELTBUS_EXTENDED_W PARAM_VALUE.BELTBUS_EXTENDED_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BELTBUS_EXTENDED_W}] ${MODELPARAM_VALUE.BELTBUS_EXTENDED_W}
}

proc update_MODELPARAM_VALUE.BIT_TRUNC { MODELPARAM_VALUE.BIT_TRUNC PARAM_VALUE.BIT_TRUNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_TRUNC}] ${MODELPARAM_VALUE.BIT_TRUNC}
}

proc update_MODELPARAM_VALUE.DATA_FIFO_DEPTH { MODELPARAM_VALUE.DATA_FIFO_DEPTH PARAM_VALUE.DATA_FIFO_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_FIFO_DEPTH}] ${MODELPARAM_VALUE.DATA_FIFO_DEPTH}
}

proc update_MODELPARAM_VALUE.META_FIFO_DEPTH { MODELPARAM_VALUE.META_FIFO_DEPTH PARAM_VALUE.META_FIFO_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.META_FIFO_DEPTH}] ${MODELPARAM_VALUE.META_FIFO_DEPTH}
}

proc update_MODELPARAM_VALUE.CLK_AXI_BB_RELATED { MODELPARAM_VALUE.CLK_AXI_BB_RELATED PARAM_VALUE.CLK_AXI_BB_RELATED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CLK_AXI_BB_RELATED}] ${MODELPARAM_VALUE.CLK_AXI_BB_RELATED}
}

proc update_MODELPARAM_VALUE.M_AXIS_TDATA_W { MODELPARAM_VALUE.M_AXIS_TDATA_W PARAM_VALUE.M_AXIS_TDATA_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M_AXIS_TDATA_W}] ${MODELPARAM_VALUE.M_AXIS_TDATA_W}
}

proc update_MODELPARAM_VALUE.M_AXIS_TDEST_W { MODELPARAM_VALUE.M_AXIS_TDEST_W PARAM_VALUE.M_AXIS_TDEST_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.M_AXIS_TDEST_W}] ${MODELPARAM_VALUE.M_AXIS_TDEST_W}
}

proc update_MODELPARAM_VALUE.TDEST_VALUE { MODELPARAM_VALUE.TDEST_VALUE PARAM_VALUE.TDEST_VALUE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TDEST_VALUE}] ${MODELPARAM_VALUE.TDEST_VALUE}
}

proc update_MODELPARAM_VALUE.INS_TIMEOUT_CYCLES { MODELPARAM_VALUE.INS_TIMEOUT_CYCLES PARAM_VALUE.INS_TIMEOUT_CYCLES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INS_TIMEOUT_CYCLES}] ${MODELPARAM_VALUE.INS_TIMEOUT_CYCLES}
}

proc update_MODELPARAM_VALUE.TAIL_FIFO_DEPTH { MODELPARAM_VALUE.TAIL_FIFO_DEPTH PARAM_VALUE.TAIL_FIFO_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TAIL_FIFO_DEPTH}] ${MODELPARAM_VALUE.TAIL_FIFO_DEPTH}
}

proc update_MODELPARAM_VALUE.TAIL_TRESHOLD { MODELPARAM_VALUE.TAIL_TRESHOLD PARAM_VALUE.TAIL_TRESHOLD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TAIL_TRESHOLD}] ${MODELPARAM_VALUE.TAIL_TRESHOLD}
}

proc update_MODELPARAM_VALUE.TLAST_GEN_TIMEOUT_CYCLES { MODELPARAM_VALUE.TLAST_GEN_TIMEOUT_CYCLES PARAM_VALUE.TLAST_GEN_TIMEOUT_CYCLES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TLAST_GEN_TIMEOUT_CYCLES}] ${MODELPARAM_VALUE.TLAST_GEN_TIMEOUT_CYCLES}
}

proc update_MODELPARAM_VALUE.PTE_MAX_SIZE { MODELPARAM_VALUE.PTE_MAX_SIZE PARAM_VALUE.PTE_MAX_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PTE_MAX_SIZE}] ${MODELPARAM_VALUE.PTE_MAX_SIZE}
}

proc update_MODELPARAM_VALUE.EXT_FIFO_DEPTH { MODELPARAM_VALUE.EXT_FIFO_DEPTH PARAM_VALUE.EXT_FIFO_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EXT_FIFO_DEPTH}] ${MODELPARAM_VALUE.EXT_FIFO_DEPTH}
}

proc update_MODELPARAM_VALUE.ENABLE_SLICE_REGISTERS { MODELPARAM_VALUE.ENABLE_SLICE_REGISTERS PARAM_VALUE.ENABLE_SLICE_REGISTERS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ENABLE_SLICE_REGISTERS}] ${MODELPARAM_VALUE.ENABLE_SLICE_REGISTERS}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ID_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ID_WIDTH PARAM_VALUE.C_S00_AXI_ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ID_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ID_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_AWUSER_WIDTH { MODELPARAM_VALUE.C_S00_AXI_AWUSER_WIDTH PARAM_VALUE.C_S00_AXI_AWUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_AWUSER_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_AWUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ARUSER_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ARUSER_WIDTH PARAM_VALUE.C_S00_AXI_ARUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ARUSER_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ARUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_WUSER_WIDTH { MODELPARAM_VALUE.C_S00_AXI_WUSER_WIDTH PARAM_VALUE.C_S00_AXI_WUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_WUSER_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_WUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_RUSER_WIDTH { MODELPARAM_VALUE.C_S00_AXI_RUSER_WIDTH PARAM_VALUE.C_S00_AXI_RUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_RUSER_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_RUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_BUSER_WIDTH { MODELPARAM_VALUE.C_S00_AXI_BUSER_WIDTH PARAM_VALUE.C_S00_AXI_BUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_BUSER_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_BUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.TTM_BIT_NUM_CH { MODELPARAM_VALUE.TTM_BIT_NUM_CH PARAM_VALUE.TTM_BIT_NUM_CH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TTM_BIT_NUM_CH}] ${MODELPARAM_VALUE.TTM_BIT_NUM_CH}
}

proc update_MODELPARAM_VALUE.LOSS_COUNTER_W { MODELPARAM_VALUE.LOSS_COUNTER_W PARAM_VALUE.LOSS_COUNTER_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LOSS_COUNTER_W}] ${MODELPARAM_VALUE.LOSS_COUNTER_W}
}

proc update_MODELPARAM_VALUE.COLLAPSE_SYNC { MODELPARAM_VALUE.COLLAPSE_SYNC PARAM_VALUE.COLLAPSE_SYNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COLLAPSE_SYNC}] ${MODELPARAM_VALUE.COLLAPSE_SYNC}
}

