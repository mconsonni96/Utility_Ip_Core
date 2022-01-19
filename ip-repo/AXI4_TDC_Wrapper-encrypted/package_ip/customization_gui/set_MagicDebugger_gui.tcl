

# ========================= BIT_CALIBRATION ====================================

proc update_PARAM_VALUE.BIT_CALIBRATION { PARAM_VALUE.BIT_CALIBRATION } {
	# Procedure called to update BIT_CALIBRATION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_CALIBRATION { PARAM_VALUE.BIT_CALIBRATION } {
	# Procedure called to validate BIT_CALIBRATION
	return true
}

proc update_MODELPARAM_VALUE.BIT_CALIBRATION { MODELPARAM_VALUE.BIT_CALIBRATION PARAM_VALUE.BIT_CALIBRATION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_CALIBRATION}] ${MODELPARAM_VALUE.BIT_CALIBRATION}
}

# ==============================================================================

# ========================== BIT_RESOLUTION ====================================

proc update_PARAM_VALUE.BIT_RESOLUTION { PARAM_VALUE.BIT_RESOLUTION } {
	# Procedure called to update BIT_RESOLUTION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_RESOLUTION { PARAM_VALUE.BIT_RESOLUTION } {
	# Procedure called to validate BIT_RESOLUTION
	return true
}

proc update_MODELPARAM_VALUE.BIT_RESOLUTION { MODELPARAM_VALUE.BIT_RESOLUTION PARAM_VALUE.BIT_RESOLUTION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_RESOLUTION}] ${MODELPARAM_VALUE.BIT_RESOLUTION}
}

# ==============================================================================

# ========================= BIT_UNCALIBRATED ===================================

proc update_PARAM_VALUE.BIT_UNCALIBRATED { PARAM_VALUE.BIT_UNCALIBRATED } {
	# Procedure called to update BIT_UNCALIBRATED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_UNCALIBRATED { PARAM_VALUE.BIT_UNCALIBRATED } {
	# Procedure called to validate BIT_UNCALIBRATED
	return true
}

proc update_MODELPARAM_VALUE.BIT_UNCALIBRATED { MODELPARAM_VALUE.BIT_UNCALIBRATED PARAM_VALUE.BIT_UNCALIBRATED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_UNCALIBRATED}] ${MODELPARAM_VALUE.BIT_UNCALIBRATED}
}

# ==============================================================================

# =========================== DEBUG_MODE_CC ====================================

proc update_PARAM_VALUE.DEBUG_MODE_CC { PARAM_VALUE.DEBUG_MODE_CC } {
	# Procedure called to update DEBUG_MODE_CC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEBUG_MODE_CC { PARAM_VALUE.DEBUG_MODE_CC } {
	# Procedure called to validate DEBUG_MODE_CC
	return true
}

proc update_MODELPARAM_VALUE.DEBUG_MODE_CC { MODELPARAM_VALUE.DEBUG_MODE_CC PARAM_VALUE.DEBUG_MODE_CC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEBUG_MODE_CC}] ${MODELPARAM_VALUE.DEBUG_MODE_CC}
}

# ==============================================================================

# ========================== DEBUG_MODE_CT =====================================

proc update_PARAM_VALUE.DEBUG_MODE_CT { PARAM_VALUE.DEBUG_MODE_CT } {
	# Procedure called to update DEBUG_MODE_CT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEBUG_MODE_CT { PARAM_VALUE.DEBUG_MODE_CT } {
	# Procedure called to validate DEBUG_MODE_CT
	return true
}

proc update_MODELPARAM_VALUE.DEBUG_MODE_CT { MODELPARAM_VALUE.DEBUG_MODE_CT PARAM_VALUE.DEBUG_MODE_CT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEBUG_MODE_CT}] ${MODELPARAM_VALUE.DEBUG_MODE_CT}
}

# ==============================================================================



# ============================ SAVE_BIT ========================================

proc update_PARAM_VALUE.SAVE_BIT { PARAM_VALUE.SAVE_BIT } {
	# Procedure called to update SAVE_BIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SAVE_BIT { PARAM_VALUE.SAVE_BIT } {
	# Procedure called to validate SAVE_BIT
	return true
}

proc update_MODELPARAM_VALUE.SAVE_BIT { MODELPARAM_VALUE.SAVE_BIT PARAM_VALUE.SAVE_BIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SAVE_BIT}] ${MODELPARAM_VALUE.SAVE_BIT}
}

# ==============================================================================
