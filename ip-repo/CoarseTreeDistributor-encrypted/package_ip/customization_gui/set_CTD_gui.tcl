# ------------------------------------------------------------------------------
proc update_PARAM_VALUE.BIT_COARSE { PARAM_VALUE.BIT_COARSE } {
	# Procedure called to update BIT_COARSE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_COARSE { PARAM_VALUE.BIT_COARSE } {
	# Procedure called to validate BIT_COARSE
	return true
}

proc update_MODELPARAM_VALUE.BIT_COARSE { MODELPARAM_VALUE.BIT_COARSE PARAM_VALUE.BIT_COARSE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_COARSE}] ${MODELPARAM_VALUE.BIT_COARSE}
}
# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
proc update_PARAM_VALUE.CTD_COARSE_CNT_INIT { PARAM_VALUE.CTD_COARSE_CNT_INIT PARAM_VALUE.BIT_COARSE } {
	# Procedure called to update CTD_COARSE_CNT_INIT when any of the dependent parameters in the arguments change


    set CTD_COARSE_CNT_INIT ${PARAM_VALUE.CTD_COARSE_CNT_INIT}
    set BIT_COARSE ${PARAM_VALUE.BIT_COARSE}

    set values(CTD_COARSE_CNT_INIT) [get_property value $CTD_COARSE_CNT_INIT]
    set values(BIT_COARSE) [get_property value $BIT_COARSE]

    # Refresh the new range
    set MIN_CTD_COARSE_CNT_INIT 0
    set MAX_CTD_COARSE_CNT_INIT [expr 2**$values(BIT_COARSE) -1]
    set_property range  "$MIN_CTD_COARSE_CNT_INIT,$MAX_CTD_COARSE_CNT_INIT" $CTD_COARSE_CNT_INIT

	set_property enabled true $CTD_COARSE_CNT_INIT


}

proc validate_PARAM_VALUE.CTD_COARSE_CNT_INIT { PARAM_VALUE.CTD_COARSE_CNT_INIT } {
	# Procedure called to validate CTD_COARSE_CNT_INIT
	return true
}

proc update_MODELPARAM_VALUE.CTD_COARSE_CNT_INIT { MODELPARAM_VALUE.CTD_COARSE_CNT_INIT PARAM_VALUE.CTD_COARSE_CNT_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CTD_COARSE_CNT_INIT}] ${MODELPARAM_VALUE.CTD_COARSE_CNT_INIT}
}
# ------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
proc update_PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0 { PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0 } {
	# Procedure called to update MAX_OUTPUT_ENGINE_PIPELINE_0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0 { PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0 } {
	# Procedure called to validate MAX_OUTPUT_ENGINE_PIPELINE_0
	return true
}

proc update_PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1 { PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1 } {
	# Procedure called to update MAX_OUTPUT_ENGINE_PIPELINE_1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1 { PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1 } {
	# Procedure called to validate MAX_OUTPUT_ENGINE_PIPELINE_1
	return true
}

proc update_PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2 { PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2 } {
	# Procedure called to update MAX_OUTPUT_ENGINE_PIPELINE_2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2 { PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2 } {
	# Procedure called to validate MAX_OUTPUT_ENGINE_PIPELINE_2
	return true
}

proc update_PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3 { PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3 } {
	# Procedure called to update MAX_OUTPUT_ENGINE_PIPELINE_3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3 { PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3 } {
	# Procedure called to validate MAX_OUTPUT_ENGINE_PIPELINE_3
	return true
}

proc update_MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0 { MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0 PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0}] ${MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0}
}

proc update_MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1 { MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1 PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1}] ${MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1}
}

proc update_MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2 { MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2 PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2}] ${MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2}
}

proc update_MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3 { MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3 PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3}] ${MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3}
}
# ------------------------------------------------------------------------------



# ------------------------------------------------------------------------------
proc update_PARAM_VALUE.NUMBER_OF_OUTPUT { PARAM_VALUE.NUMBER_OF_OUTPUT } {
	# Procedure called to update NUMBER_OF_OUTPUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_OF_OUTPUT { PARAM_VALUE.NUMBER_OF_OUTPUT } {
	# Procedure called to validate NUMBER_OF_OUTPUT
	return true
}

proc update_MODELPARAM_VALUE.NUMBER_OF_OUTPUT { MODELPARAM_VALUE.NUMBER_OF_OUTPUT PARAM_VALUE.NUMBER_OF_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_OF_OUTPUT}] ${MODELPARAM_VALUE.NUMBER_OF_OUTPUT}
}
# ------------------------------------------------------------------------------
