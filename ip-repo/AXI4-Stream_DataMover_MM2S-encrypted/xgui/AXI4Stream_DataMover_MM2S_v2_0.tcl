# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  ipgui::add_param $IPINST -name "FIFO_CMD_DEPTH" -widget comboBox
  set C_S_AXIS_MAIN_TDEST_WIDTH [ipgui::add_param $IPINST -name "C_S_AXIS_MAIN_TDEST_WIDTH"]
  set_property tooltip {Sets the width of TDEST on s_axis_main} ${C_S_AXIS_MAIN_TDEST_WIDTH}
  set C_M_AXIS_MAIN_TDEST_WIDTH [ipgui::add_param $IPINST -name "C_M_AXIS_MAIN_TDEST_WIDTH"]
  set_property tooltip {Sets the TDEST width on m_axis} ${C_M_AXIS_MAIN_TDEST_WIDTH}
  set C_S_AXIS_AUX_TDEST_WIDTH [ipgui::add_param $IPINST -name "C_S_AXIS_AUX_TDEST_WIDTH"]
  set_property tooltip {Sets the TDEST width on s_axis_aux} ${C_S_AXIS_AUX_TDEST_WIDTH}
  set C_M_AXIS_AUX_TDEST_WIDTH [ipgui::add_param $IPINST -name "C_M_AXIS_AUX_TDEST_WIDTH"]
  set_property tooltip {Sets the TDEST width on m_axis_aux} ${C_M_AXIS_AUX_TDEST_WIDTH}
  set TDEST_ROUTING [ipgui::add_param $IPINST -name "TDEST_ROUTING"]
  set_property tooltip {Sets the TDEST LSBs necessary for routing in MME} ${TDEST_ROUTING}

}

proc update_PARAM_VALUE.C_M_AXIS_AUX_TDEST_WIDTH { PARAM_VALUE.C_M_AXIS_AUX_TDEST_WIDTH } {
	# Procedure called to update C_M_AXIS_AUX_TDEST_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_AUX_TDEST_WIDTH { PARAM_VALUE.C_M_AXIS_AUX_TDEST_WIDTH } {
	# Procedure called to validate C_M_AXIS_AUX_TDEST_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_MAIN_TDEST_WIDTH { PARAM_VALUE.C_M_AXIS_MAIN_TDEST_WIDTH } {
	# Procedure called to update C_M_AXIS_MAIN_TDEST_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_MAIN_TDEST_WIDTH { PARAM_VALUE.C_M_AXIS_MAIN_TDEST_WIDTH } {
	# Procedure called to validate C_M_AXIS_MAIN_TDEST_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXIS_AUX_TDEST_WIDTH { PARAM_VALUE.C_S_AXIS_AUX_TDEST_WIDTH } {
	# Procedure called to update C_S_AXIS_AUX_TDEST_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXIS_AUX_TDEST_WIDTH { PARAM_VALUE.C_S_AXIS_AUX_TDEST_WIDTH } {
	# Procedure called to validate C_S_AXIS_AUX_TDEST_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXIS_MAIN_TDEST_WIDTH { PARAM_VALUE.C_S_AXIS_MAIN_TDEST_WIDTH } {
	# Procedure called to update C_S_AXIS_MAIN_TDEST_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXIS_MAIN_TDEST_WIDTH { PARAM_VALUE.C_S_AXIS_MAIN_TDEST_WIDTH } {
	# Procedure called to validate C_S_AXIS_MAIN_TDEST_WIDTH
	return true
}

proc update_PARAM_VALUE.FIFO_CMD_DEPTH { PARAM_VALUE.FIFO_CMD_DEPTH } {
	# Procedure called to update FIFO_CMD_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIFO_CMD_DEPTH { PARAM_VALUE.FIFO_CMD_DEPTH } {
	# Procedure called to validate FIFO_CMD_DEPTH
	return true
}

proc update_PARAM_VALUE.MM2S_SID { PARAM_VALUE.MM2S_SID } {
	# Procedure called to update MM2S_SID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MM2S_SID { PARAM_VALUE.MM2S_SID } {
	# Procedure called to validate MM2S_SID
	return true
}

proc update_PARAM_VALUE.TDEST_ROUTING { PARAM_VALUE.TDEST_ROUTING } {
	# Procedure called to update TDEST_ROUTING when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TDEST_ROUTING { PARAM_VALUE.TDEST_ROUTING } {
	# Procedure called to validate TDEST_ROUTING
	return true
}


proc update_MODELPARAM_VALUE.FIFO_CMD_DEPTH { MODELPARAM_VALUE.FIFO_CMD_DEPTH PARAM_VALUE.FIFO_CMD_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIFO_CMD_DEPTH}] ${MODELPARAM_VALUE.FIFO_CMD_DEPTH}
}

proc update_MODELPARAM_VALUE.C_S_AXIS_MAIN_TDEST_WIDTH { MODELPARAM_VALUE.C_S_AXIS_MAIN_TDEST_WIDTH PARAM_VALUE.C_S_AXIS_MAIN_TDEST_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_MAIN_TDEST_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_MAIN_TDEST_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_MAIN_TDEST_WIDTH { MODELPARAM_VALUE.C_M_AXIS_MAIN_TDEST_WIDTH PARAM_VALUE.C_M_AXIS_MAIN_TDEST_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_MAIN_TDEST_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_MAIN_TDEST_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXIS_AUX_TDEST_WIDTH { MODELPARAM_VALUE.C_S_AXIS_AUX_TDEST_WIDTH PARAM_VALUE.C_S_AXIS_AUX_TDEST_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_AUX_TDEST_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_AUX_TDEST_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_AUX_TDEST_WIDTH { MODELPARAM_VALUE.C_M_AXIS_AUX_TDEST_WIDTH PARAM_VALUE.C_M_AXIS_AUX_TDEST_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_AUX_TDEST_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_AUX_TDEST_WIDTH}
}

proc update_MODELPARAM_VALUE.MM2S_SID { MODELPARAM_VALUE.MM2S_SID PARAM_VALUE.MM2S_SID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MM2S_SID}] ${MODELPARAM_VALUE.MM2S_SID}
}

proc update_MODELPARAM_VALUE.TDEST_ROUTING { MODELPARAM_VALUE.TDEST_ROUTING PARAM_VALUE.TDEST_ROUTING } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TDEST_ROUTING}] ${MODELPARAM_VALUE.TDEST_ROUTING}
}

