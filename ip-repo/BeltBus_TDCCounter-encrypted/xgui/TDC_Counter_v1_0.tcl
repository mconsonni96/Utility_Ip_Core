# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"

  set INTTIME_INIT [ipgui::add_param $IPINST -name "INTTIME_INIT"]
  set_property tooltip {At start, integration time will be initialized to this} ${INTTIME_INIT}
  set BIT_COARSE [ipgui::add_param $IPINST -name "BIT_COARSE"]
  set_property tooltip {BeltBus parameter BIT_COARSE} ${BIT_COARSE}
  set BIT_FID [ipgui::add_param $IPINST -name "BIT_FID"]
  set_property tooltip {BeltBus parameter BIT_FID} ${BIT_FID}
  set BIT_NUM_CH [ipgui::add_param $IPINST -name "BIT_NUM_CH"]
  set_property tooltip {BeltBus parameter BIT_NUM_CH} ${BIT_NUM_CH}
  ipgui::add_param $IPINST -name "NUM_CH"
  ipgui::add_param $IPINST -name "COUNTER_WIDTH"
  set SYNC_STAGES [ipgui::add_param $IPINST -name "SYNC_STAGES"]
  set_property tooltip {How many flip-flops are used to synchronize signals between two clock domains} ${SYNC_STAGES}
  ipgui::add_param $IPINST -name "BIT_RESOLUTION"

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

proc update_PARAM_VALUE.COMMAND_CMD_WIDTH { PARAM_VALUE.COMMAND_CMD_WIDTH } {
	# Procedure called to update COMMAND_CMD_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COMMAND_CMD_WIDTH { PARAM_VALUE.COMMAND_CMD_WIDTH } {
	# Procedure called to validate COMMAND_CMD_WIDTH
	return true
}

proc update_PARAM_VALUE.COMMAND_DATA_WIDTH { PARAM_VALUE.COMMAND_DATA_WIDTH } {
	# Procedure called to update COMMAND_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COMMAND_DATA_WIDTH { PARAM_VALUE.COMMAND_DATA_WIDTH } {
	# Procedure called to validate COMMAND_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.COMMAND_RESP_WIDTH { PARAM_VALUE.COMMAND_RESP_WIDTH } {
	# Procedure called to update COMMAND_RESP_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COMMAND_RESP_WIDTH { PARAM_VALUE.COMMAND_RESP_WIDTH } {
	# Procedure called to validate COMMAND_RESP_WIDTH
	return true
}

proc update_PARAM_VALUE.COUNTER_WIDTH { PARAM_VALUE.COUNTER_WIDTH } {
	# Procedure called to update COUNTER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COUNTER_WIDTH { PARAM_VALUE.COUNTER_WIDTH } {
	# Procedure called to validate COUNTER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M00_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M00_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M00_AXIS_TDEST_WIDTH { PARAM_VALUE.C_M00_AXIS_TDEST_WIDTH } {
	# Procedure called to update C_M00_AXIS_TDEST_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXIS_TDEST_WIDTH { PARAM_VALUE.C_M00_AXIS_TDEST_WIDTH } {
	# Procedure called to validate C_M00_AXIS_TDEST_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_ABS { PARAM_VALUE.C_S00_AXI_ADDR_ABS } {
	# Procedure called to update C_S00_AXI_ADDR_ABS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_ABS { PARAM_VALUE.C_S00_AXI_ADDR_ABS } {
	# Procedure called to validate C_S00_AXI_ADDR_ABS
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.INTTIME_INIT { PARAM_VALUE.INTTIME_INIT } {
	# Procedure called to update INTTIME_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INTTIME_INIT { PARAM_VALUE.INTTIME_INIT } {
	# Procedure called to validate INTTIME_INIT
	return true
}

proc update_PARAM_VALUE.NUM_CH { PARAM_VALUE.NUM_CH } {
	# Procedure called to update NUM_CH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_CH { PARAM_VALUE.NUM_CH } {
	# Procedure called to validate NUM_CH
	return true
}

proc update_PARAM_VALUE.SYNC_STAGES { PARAM_VALUE.SYNC_STAGES } {
	# Procedure called to update SYNC_STAGES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SYNC_STAGES { PARAM_VALUE.SYNC_STAGES } {
	# Procedure called to validate SYNC_STAGES
	return true
}

proc update_PARAM_VALUE.SYNC_STAGES_INIT_V { PARAM_VALUE.SYNC_STAGES_INIT_V } {
	# Procedure called to update SYNC_STAGES_INIT_V when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SYNC_STAGES_INIT_V { PARAM_VALUE.SYNC_STAGES_INIT_V } {
	# Procedure called to validate SYNC_STAGES_INIT_V
	return true
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

proc update_MODELPARAM_VALUE.COUNTER_WIDTH { MODELPARAM_VALUE.COUNTER_WIDTH PARAM_VALUE.COUNTER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COUNTER_WIDTH}] ${MODELPARAM_VALUE.COUNTER_WIDTH}
}

proc update_MODELPARAM_VALUE.INTTIME_INIT { MODELPARAM_VALUE.INTTIME_INIT PARAM_VALUE.INTTIME_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INTTIME_INIT}] ${MODELPARAM_VALUE.INTTIME_INIT}
}

proc update_MODELPARAM_VALUE.SYNC_STAGES { MODELPARAM_VALUE.SYNC_STAGES PARAM_VALUE.SYNC_STAGES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SYNC_STAGES}] ${MODELPARAM_VALUE.SYNC_STAGES}
}

proc update_MODELPARAM_VALUE.SYNC_STAGES_INIT_V { MODELPARAM_VALUE.SYNC_STAGES_INIT_V PARAM_VALUE.SYNC_STAGES_INIT_V } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SYNC_STAGES_INIT_V}] ${MODELPARAM_VALUE.SYNC_STAGES_INIT_V}
}

proc update_MODELPARAM_VALUE.COMMAND_CMD_WIDTH { MODELPARAM_VALUE.COMMAND_CMD_WIDTH PARAM_VALUE.COMMAND_CMD_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COMMAND_CMD_WIDTH}] ${MODELPARAM_VALUE.COMMAND_CMD_WIDTH}
}

proc update_MODELPARAM_VALUE.COMMAND_DATA_WIDTH { MODELPARAM_VALUE.COMMAND_DATA_WIDTH PARAM_VALUE.COMMAND_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COMMAND_DATA_WIDTH}] ${MODELPARAM_VALUE.COMMAND_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.COMMAND_RESP_WIDTH { MODELPARAM_VALUE.COMMAND_RESP_WIDTH PARAM_VALUE.COMMAND_RESP_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COMMAND_RESP_WIDTH}] ${MODELPARAM_VALUE.COMMAND_RESP_WIDTH}
}

proc update_MODELPARAM_VALUE.BIT_RESOLUTION { MODELPARAM_VALUE.BIT_RESOLUTION PARAM_VALUE.BIT_RESOLUTION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_RESOLUTION}] ${MODELPARAM_VALUE.BIT_RESOLUTION}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_ABS { MODELPARAM_VALUE.C_S00_AXI_ADDR_ABS PARAM_VALUE.C_S00_AXI_ADDR_ABS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_ABS}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_ABS}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXIS_TDEST_WIDTH { MODELPARAM_VALUE.C_M00_AXIS_TDEST_WIDTH PARAM_VALUE.C_M00_AXIS_TDEST_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXIS_TDEST_WIDTH}] ${MODELPARAM_VALUE.C_M00_AXIS_TDEST_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M00_AXIS_TDATA_WIDTH PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M00_AXIS_TDATA_WIDTH}
}

