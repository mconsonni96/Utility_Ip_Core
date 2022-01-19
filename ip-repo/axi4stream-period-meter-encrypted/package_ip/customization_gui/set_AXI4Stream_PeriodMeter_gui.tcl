#--------------------------------FILTER_SEL ----------------------------------

proc update_PARAM_VALUE.FILTER_SEL { PARAM_VALUE.FILTER_SEL } {
	# Procedure called to update FILTER_SEL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FILTER_SEL { PARAM_VALUE.FILTER_SEL } {
	# Procedure called to validate FILTER_SEL
	return true
}
proc update_MODELPARAM_VALUE.FILTER_SEL { MODELPARAM_VALUE.FILTER_SEL PARAM_VALUE.FILTER_SEL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILTER_SEL}] ${MODELPARAM_VALUE.FILTER_SEL}
}
#------------------------------------------------------------------------------


#--------------------------------BIT_COARSE ----------------------------------
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
#------------------------------------------------------------------------------

#----------------------------BIT_FID-------------------------------------------
proc update_PARAM_VALUE.BIT_FID { PARAM_VALUE.BIT_FID } {
	# Procedure called to update BIT_FID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_FID { PARAM_VALUE.BIT_FID } {
	# Procedure called to validate BIT_FID
	return true
}

proc update_MODELPARAM_VALUE.BIT_FID { MODELPARAM_VALUE.BIT_FID PARAM_VALUE.BIT_FID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_FID}] ${MODELPARAM_VALUE.BIT_FID}
}
#--------------------------------------------------------------------------------

#------------------------------BIT_NUM_CH----------------------------------------
proc update_PARAM_VALUE.BIT_NUM_CH { PARAM_VALUE.BIT_NUM_CH } {
	# Procedure called to update BIT_NUM_CH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_NUM_CH { PARAM_VALUE.BIT_NUM_CH } {
	# Procedure called to validate BIT_NUM_CH
	return true
}

proc update_MODELPARAM_VALUE.BIT_NUM_CH { MODELPARAM_VALUE.BIT_NUM_CH PARAM_VALUE.BIT_NUM_CH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_NUM_CH}] ${MODELPARAM_VALUE.BIT_NUM_CH}
}
#--------------------------------------------------------------------------------

#-------------------------------BIT_OVERFLOW-------------------------------------
proc update_PARAM_VALUE.BIT_OVERFLOW { PARAM_VALUE.BIT_OVERFLOW } {
	# Procedure called to update BIT_OVERFLOW when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_OVERFLOW { PARAM_VALUE.BIT_OVERFLOW } {
	# Procedure called to validate BIT_OVERFLOW
	return true
}

proc update_MODELPARAM_VALUE.BIT_OVERFLOW { MODELPARAM_VALUE.BIT_OVERFLOW PARAM_VALUE.BIT_OVERFLOW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_OVERFLOW}] ${MODELPARAM_VALUE.BIT_OVERFLOW}
}
#-------------------------------------------------------------------------------

#-------------------------------BIT_RESOLUTION----------------------------------
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
#-------------------------------------------------------------------------------

#------------------------------CH_SYNC------------------------------------------
proc update_PARAM_VALUE.CH_SYNC { PARAM_VALUE.CH_SYNC } {
	# Procedure called to update CH_SYNC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CH_SYNC { PARAM_VALUE.CH_SYNC } {
	# Procedure called to validate CH_SYNC
	return true
}

proc update_MODELPARAM_VALUE.CH_SYNC { MODELPARAM_VALUE.CH_SYNC PARAM_VALUE.CH_SYNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CH_SYNC}] ${MODELPARAM_VALUE.CH_SYNC}
}
#--------------------------------------------------------------------------------

#-----------------------------EXPSAMPLE------------------------------------------
proc update_PARAM_VALUE.EXPSAMPLE { PARAM_VALUE.EXPSAMPLE } {
	# Procedure called to update EXPSAMPLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EXPSAMPLE { PARAM_VALUE.EXPSAMPLE } {
	# Procedure called to validate EXPSAMPLE
	return true
}

proc update_MODELPARAM_VALUE.EXPSAMPLE { MODELPARAM_VALUE.EXPSAMPLE PARAM_VALUE.EXPSAMPLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EXPSAMPLE}] ${MODELPARAM_VALUE.EXPSAMPLE}
}
#--------------------------------------------------------------------------------
