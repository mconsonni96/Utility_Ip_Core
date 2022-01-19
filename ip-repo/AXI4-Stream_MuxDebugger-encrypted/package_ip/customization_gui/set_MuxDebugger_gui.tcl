proc update_PARAM_VALUE.DEBUG_MODE_CC { PARAM_VALUE.DEBUG_MODE_CC } {
	# Procedure called to update DEBUG_MODE_CC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEBUG_MODE_CC { PARAM_VALUE.DEBUG_MODE_CC } {
	# Procedure called to validate DEBUG_MODE_CC
	return true
}

proc update_PARAM_VALUE.DEBUG_MODE_CT { PARAM_VALUE.DEBUG_MODE_CT } {
	# Procedure called to update DEBUG_MODE_CT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEBUG_MODE_CT { PARAM_VALUE.DEBUG_MODE_CT } {
	# Procedure called to validate DEBUG_MODE_CT
	return true
}

proc update_PARAM_VALUE.DEFAULT_BIT_SEL { PARAM_VALUE.DEFAULT_BIT_SEL } {
	# Procedure called to update DEFAULT_BIT_SEL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEFAULT_BIT_SEL { PARAM_VALUE.DEFAULT_BIT_SEL } {
	# Procedure called to validate DEFAULT_BIT_SEL
	return true
}

proc update_PARAM_VALUE.MAX_CHANNEL { PARAM_VALUE.MAX_CHANNEL } {
	# Procedure called to update MAX_CHANNEL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_CHANNEL { PARAM_VALUE.MAX_CHANNEL } {
	# Procedure called to validate MAX_CHANNEL
	return true
}

proc update_PARAM_VALUE.MUX_TYPE { PARAM_VALUE.MUX_TYPE } {
	# Procedure called to update MUX_TYPE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MUX_TYPE { PARAM_VALUE.MUX_TYPE } {
	# Procedure called to validate MUX_TYPE
	return true
}

proc update_PARAM_VALUE.NUM_CHANNEL { PARAM_VALUE.NUM_CHANNEL } {
	# Procedure called to update NUM_CHANNEL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_CHANNEL { PARAM_VALUE.NUM_CHANNEL } {
	# Procedure called to validate NUM_CHANNEL
	return true
}


proc update_MODELPARAM_VALUE.MAX_CHANNEL { MODELPARAM_VALUE.MAX_CHANNEL PARAM_VALUE.MAX_CHANNEL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_CHANNEL}] ${MODELPARAM_VALUE.MAX_CHANNEL}
}

proc update_MODELPARAM_VALUE.NUM_CHANNEL { MODELPARAM_VALUE.NUM_CHANNEL PARAM_VALUE.NUM_CHANNEL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_CHANNEL}] ${MODELPARAM_VALUE.NUM_CHANNEL}
}

proc update_MODELPARAM_VALUE.DEFAULT_BIT_SEL { MODELPARAM_VALUE.DEFAULT_BIT_SEL PARAM_VALUE.DEFAULT_BIT_SEL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEFAULT_BIT_SEL}] ${MODELPARAM_VALUE.DEFAULT_BIT_SEL}
}

proc update_MODELPARAM_VALUE.MUX_TYPE { MODELPARAM_VALUE.MUX_TYPE PARAM_VALUE.MUX_TYPE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MUX_TYPE}] ${MODELPARAM_VALUE.MUX_TYPE}
}

proc update_MODELPARAM_VALUE.DEBUG_MODE_CT { MODELPARAM_VALUE.DEBUG_MODE_CT PARAM_VALUE.DEBUG_MODE_CT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEBUG_MODE_CT}] ${MODELPARAM_VALUE.DEBUG_MODE_CT}
}

proc update_MODELPARAM_VALUE.DEBUG_MODE_CC { MODELPARAM_VALUE.DEBUG_MODE_CC PARAM_VALUE.DEBUG_MODE_CC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEBUG_MODE_CC}] ${MODELPARAM_VALUE.DEBUG_MODE_CC}
}
