# --------------------------- INPUT_BUFFER_TYPE --------------------------------
proc update_PARAM_VALUE.INPUT_BUFFER_TYPE { PARAM_VALUE.INPUT_BUFFER_TYPE } {
	# Procedure called to update INPUT_BUFFER_TYPE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INPUT_BUFFER_TYPE { PARAM_VALUE.INPUT_BUFFER_TYPE } {
	# Procedure called to validate INPUT_BUFFER_TYPE
	return true
}

proc update_MODELPARAM_VALUE.INPUT_BUFFER_TYPE { MODELPARAM_VALUE.INPUT_BUFFER_TYPE PARAM_VALUE.INPUT_BUFFER_TYPE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INPUT_BUFFER_TYPE}] ${MODELPARAM_VALUE.INPUT_BUFFER_TYPE}
}
# ------------------------------------------------------------------------------


# ------------------------- INVERT_BUFFER_POLARITY -----------------------------
proc update_PARAM_VALUE.INVERT_BUFFER_POLARITY { PARAM_VALUE.INVERT_BUFFER_POLARITY } {
	# Procedure called to update INVERT_BUFFER_POLARITY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INVERT_BUFFER_POLARITY { PARAM_VALUE.INVERT_BUFFER_POLARITY } {
	# Procedure called to validate INVERT_BUFFER_POLARITY
	return true
}

proc update_MODELPARAM_VALUE.INVERT_BUFFER_POLARITY { MODELPARAM_VALUE.INVERT_BUFFER_POLARITY PARAM_VALUE.INVERT_BUFFER_POLARITY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INVERT_BUFFER_POLARITY}] ${MODELPARAM_VALUE.INVERT_BUFFER_POLARITY}
}
# ------------------------------------------------------------------------------


# --------------------------- EDGE_TRIGGER_INIT --------------------------------
proc update_PARAM_VALUE.EDGE_TRIGGER_INIT { PARAM_VALUE.EDGE_TRIGGER_INIT PARAM_VALUE.TUNING_MODE } {
	# Procedure called to update EDGE_TRIGGER_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EDGE_TRIGGER_INIT { PARAM_VALUE.EDGE_TRIGGER_INIT } {
	# Procedure called to validate EDGE_TRIGGER_INIT
	return true
}

proc update_MODELPARAM_VALUE.EDGE_TRIGGER_INIT { MODELPARAM_VALUE.EDGE_TRIGGER_INIT PARAM_VALUE.EDGE_TRIGGER_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EDGE_TRIGGER_INIT}] ${MODELPARAM_VALUE.EDGE_TRIGGER_INIT}
}
# ------------------------------------------------------------------------------


# ----------------------------- CALIB_EVENT ------------------------------------
proc update_PARAM_VALUE.CALIB_EVENT { PARAM_VALUE.CALIB_EVENT } {
	# Procedure called to update CALIB_EVENT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CALIB_EVENT { PARAM_VALUE.CALIB_EVENT } {
	# Procedure called to validate CALIB_EVENT
	return true
}

proc update_MODELPARAM_VALUE.CALIB_EVENT { MODELPARAM_VALUE.CALIB_EVENT PARAM_VALUE.CALIB_EVENT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CALIB_EVENT}] ${MODELPARAM_VALUE.CALIB_EVENT}
}
# ------------------------------------------------------------------------------

# ------------------------------- BIT_DIVIDER ----------------------------------
proc update_PARAM_VALUE.BIT_DIVIDER { PARAM_VALUE.BIT_DIVIDER } {
	# Procedure called to update BIT_DIVIDER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_DIVIDER { PARAM_VALUE.BIT_DIVIDER } {
	# Procedure called to validate BIT_DIVIDER
	return true
}

proc update_MODELPARAM_VALUE.BIT_DIVIDER { MODELPARAM_VALUE.BIT_DIVIDER PARAM_VALUE.BIT_DIVIDER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_DIVIDER}] ${MODELPARAM_VALUE.BIT_DIVIDER}
}
# ------------------------------------------------------------------------------


# ----------------------------- BIT_STRETCH_LENGTH -----------------------------
proc update_PARAM_VALUE.BIT_STRETCH_LENGTH { PARAM_VALUE.BIT_STRETCH_LENGTH } {
	# Procedure called to update BIT_STRETCH_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_STRETCH_LENGTH { PARAM_VALUE.BIT_STRETCH_LENGTH } {
	# Procedure called to validate BIT_STRETCH_LENGTH
	return true
}

proc update_MODELPARAM_VALUE.BIT_STRETCH_LENGTH { MODELPARAM_VALUE.BIT_STRETCH_LENGTH PARAM_VALUE.BIT_STRETCH_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_STRETCH_LENGTH}] ${MODELPARAM_VALUE.BIT_STRETCH_LENGTH}
}
# ------------------------------------------------------------------------------

# ------------------------------ DIVIDER_INIT ----------------------------------
proc update_PARAM_VALUE.DIVIDER_INIT { PARAM_VALUE.DIVIDER_INIT PARAM_VALUE.BIT_DIVIDER } {
	# Procedure called to update DIVIDER_INIT when any of the dependent parameters in the arguments change
    set DIVIDER_INIT ${PARAM_VALUE.DIVIDER_INIT}
    set BIT_DIVIDER ${PARAM_VALUE.BIT_DIVIDER}

    set values(DIVIDER_INIT) [get_property value $DIVIDER_INIT]
    set values(BIT_DIVIDER) [get_property value $BIT_DIVIDER]

    # Enable Param
	if { [gen_USERPARAMETER_DIVIDER_INIT_ENABLEMENT $values(BIT_DIVIDER)] } {
		set_property enabled true $DIVIDER_INIT
	} else {
		set_property enabled false $DIVIDER_INIT
		set_property value [gen_USERPARAMETER_DIVIDER_INIT_VALUE $values(BIT_DIVIDER)] $DIVIDER_INIT
	}

    # Refresh the new range
    set MIN_DIVIDER_INIT 0
    set MAX_DIVIDER_INIT [expr 2**$values(BIT_DIVIDER) -1]
    set_property range  "$MIN_DIVIDER_INIT,$MAX_DIVIDER_INIT" $DIVIDER_INIT
}

proc validate_PARAM_VALUE.DIVIDER_INIT { PARAM_VALUE.DIVIDER_INIT } {
	# Procedure called to validate DIVIDER_INIT
	return true
}

proc update_MODELPARAM_VALUE.DIVIDER_INIT { MODELPARAM_VALUE.DIVIDER_INIT PARAM_VALUE.DIVIDER_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DIVIDER_INIT}] ${MODELPARAM_VALUE.DIVIDER_INIT}
}
# ------------------------------------------------------------------------------


# ----------------------------- STRETCH_LENGTH_INIT ----------------------------
proc update_PARAM_VALUE.STRETCH_LENGTH_INIT { PARAM_VALUE.STRETCH_LENGTH_INIT PARAM_VALUE.BIT_STRETCH_LENGTH} {
	# Procedure called to update STRETCH_LENGTH_INIT when any of the dependent parameters in the arguments change
    set STRETCH_LENGTH_INIT ${PARAM_VALUE.STRETCH_LENGTH_INIT}
    set BIT_STRETCH_LENGTH ${PARAM_VALUE.BIT_STRETCH_LENGTH}

    set values(STRETCH_LENGTH_INIT) [get_property value $STRETCH_LENGTH_INIT]
    set values(BIT_STRETCH_LENGTH) [get_property value $BIT_STRETCH_LENGTH]

    # Enable Param
	if { [gen_USERPARAMETER_STRETCH_LENGTH_INIT_ENABLEMENT $values(BIT_STRETCH_LENGTH)] } {
		set_property enabled true $STRETCH_LENGTH_INIT
	} else {
		set_property enabled false $STRETCH_LENGTH_INIT
		set_property value [gen_USERPARAMETER_STRETCH_LENGTH_INIT_VALUE $values(BIT_STRETCH_LENGTH)] $STRETCH_LENGTH_INIT
	}

    # Refresh the new range
    set MIN_STRETCH_LENGTH_INIT 0
    set MAX_STRETCH_LENGTH_INIT [expr 2**$values(BIT_STRETCH_LENGTH) -1]
    set_property range  "$MIN_STRETCH_LENGTH_INIT,$MAX_STRETCH_LENGTH_INIT" $STRETCH_LENGTH_INIT
}

proc validate_PARAM_VALUE.STRETCH_LENGTH_INIT { PARAM_VALUE.STRETCH_LENGTH_INIT } {
	# Procedure called to validate STRETCH_LENGTH_INIT
	return true
}


proc update_MODELPARAM_VALUE.STRETCH_LENGTH_INIT { MODELPARAM_VALUE.STRETCH_LENGTH_INIT PARAM_VALUE.STRETCH_LENGTH_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.STRETCH_LENGTH_INIT}] ${MODELPARAM_VALUE.STRETCH_LENGTH_INIT}
}
# ------------------------------------------------------------------------------


# -------------------------------- TUNING_MODE ---------------------------------
proc update_PARAM_VALUE.TUNING_MODE { PARAM_VALUE.TUNING_MODE } {
	# Procedure called to update TUNING_MODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TUNING_MODE { PARAM_VALUE.TUNING_MODE } {
	# Procedure called to validate TUNING_MODE
	return true
}


proc update_MODELPARAM_VALUE.TUNING_MODE { MODELPARAM_VALUE.TUNING_MODE PARAM_VALUE.TUNING_MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TUNING_MODE}] ${MODELPARAM_VALUE.TUNING_MODE}
}
# ------------------------------------------------------------------------------
