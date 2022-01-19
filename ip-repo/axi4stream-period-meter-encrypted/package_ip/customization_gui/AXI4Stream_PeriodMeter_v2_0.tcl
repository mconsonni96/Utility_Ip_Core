# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  set CH_SYNC [ipgui::add_param $IPINST -name "CH_SYNC"]
  set_property tooltip {Variable that specifies the synchronization channel} ${CH_SYNC}
  set EXPSAMPLE [ipgui::add_param $IPINST -name "EXPSAMPLE"]
  set_property tooltip {2**EXPSAMPLE is the number of samples collected for the filter} ${EXPSAMPLE}
  set BIT_OVERFLOW [ipgui::add_param $IPINST -name "BIT_OVERFLOW"]
  set_property tooltip {Variable that sets the dimension of the overflow field} ${BIT_OVERFLOW}
  set BIT_NUM_CH [ipgui::add_param $IPINST -name "BIT_NUM_CH"]
  set_property tooltip {Variable that sets the dimension of the number of channel field} ${BIT_NUM_CH}
  set BIT_FID [ipgui::add_param $IPINST -name "BIT_FID"]
  set_property tooltip {Variable that sets the dimension of the fid field} ${BIT_FID}
  set BIT_COARSE [ipgui::add_param $IPINST -name "BIT_COARSE"]
  set_property tooltip {Variable that sets the dimension of the coarse field} ${BIT_COARSE}
  set BIT_RESOLUTION [ipgui::add_param $IPINST -name "BIT_RESOLUTION"]
  set_property tooltip {Variable that sets the dimension of the resolution field} ${BIT_RESOLUTION}
  set FILTER_SEL [ipgui::add_param $IPINST -name "FILTER_SEL" -widget comboBox]
  set_property tooltip {Choice between the gated_integrator filter and the moving_average filter} ${FILTER_SEL}
  ipgui::add_param $IPINST -name "FILTER_SEL_INT"
  set EXPDIVISION [ipgui::add_param $IPINST -name "EXPDIVISION"]
  set_property tooltip {2**EXPDIVISION the avaraged value is divided by division} ${EXPDIVISION}

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

proc update_PARAM_VALUE.BIT_OVERFLOW { PARAM_VALUE.BIT_OVERFLOW } {
	# Procedure called to update BIT_OVERFLOW when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_OVERFLOW { PARAM_VALUE.BIT_OVERFLOW } {
	# Procedure called to validate BIT_OVERFLOW
	return true
}

proc update_PARAM_VALUE.BIT_RESOLUTION { PARAM_VALUE.BIT_RESOLUTION } {
	# Procedure called to update BIT_RESOLUTION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_RESOLUTION { PARAM_VALUE.BIT_RESOLUTION } {
	# Procedure called to validate BIT_RESOLUTION
	return true
}

proc update_PARAM_VALUE.CH_SYNC { PARAM_VALUE.CH_SYNC } {
	# Procedure called to update CH_SYNC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CH_SYNC { PARAM_VALUE.CH_SYNC } {
	# Procedure called to validate CH_SYNC
	return true
}

proc update_PARAM_VALUE.EXPDIVISION { PARAM_VALUE.EXPDIVISION } {
	# Procedure called to update EXPDIVISION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EXPDIVISION { PARAM_VALUE.EXPDIVISION } {
	# Procedure called to validate EXPDIVISION
	return true
}

proc update_PARAM_VALUE.EXPSAMPLE { PARAM_VALUE.EXPSAMPLE } {
	# Procedure called to update EXPSAMPLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EXPSAMPLE { PARAM_VALUE.EXPSAMPLE } {
	# Procedure called to validate EXPSAMPLE
	return true
}

proc update_PARAM_VALUE.FILTER_SEL { PARAM_VALUE.FILTER_SEL } {
	# Procedure called to update FILTER_SEL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FILTER_SEL { PARAM_VALUE.FILTER_SEL } {
	# Procedure called to validate FILTER_SEL
	return true
}

proc update_PARAM_VALUE.FILTER_SEL_INT { PARAM_VALUE.FILTER_SEL_INT } {
	# Procedure called to update FILTER_SEL_INT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FILTER_SEL_INT { PARAM_VALUE.FILTER_SEL_INT } {
	# Procedure called to validate FILTER_SEL_INT
	return true
}


proc update_MODELPARAM_VALUE.CH_SYNC { MODELPARAM_VALUE.CH_SYNC PARAM_VALUE.CH_SYNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CH_SYNC}] ${MODELPARAM_VALUE.CH_SYNC}
}

proc update_MODELPARAM_VALUE.EXPSAMPLE { MODELPARAM_VALUE.EXPSAMPLE PARAM_VALUE.EXPSAMPLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EXPSAMPLE}] ${MODELPARAM_VALUE.EXPSAMPLE}
}

proc update_MODELPARAM_VALUE.BIT_OVERFLOW { MODELPARAM_VALUE.BIT_OVERFLOW PARAM_VALUE.BIT_OVERFLOW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_OVERFLOW}] ${MODELPARAM_VALUE.BIT_OVERFLOW}
}

proc update_MODELPARAM_VALUE.BIT_NUM_CH { MODELPARAM_VALUE.BIT_NUM_CH PARAM_VALUE.BIT_NUM_CH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_NUM_CH}] ${MODELPARAM_VALUE.BIT_NUM_CH}
}

proc update_MODELPARAM_VALUE.BIT_FID { MODELPARAM_VALUE.BIT_FID PARAM_VALUE.BIT_FID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_FID}] ${MODELPARAM_VALUE.BIT_FID}
}

proc update_MODELPARAM_VALUE.BIT_COARSE { MODELPARAM_VALUE.BIT_COARSE PARAM_VALUE.BIT_COARSE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_COARSE}] ${MODELPARAM_VALUE.BIT_COARSE}
}

proc update_MODELPARAM_VALUE.BIT_RESOLUTION { MODELPARAM_VALUE.BIT_RESOLUTION PARAM_VALUE.BIT_RESOLUTION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_RESOLUTION}] ${MODELPARAM_VALUE.BIT_RESOLUTION}
}

proc update_MODELPARAM_VALUE.FILTER_SEL { MODELPARAM_VALUE.FILTER_SEL PARAM_VALUE.FILTER_SEL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILTER_SEL}] ${MODELPARAM_VALUE.FILTER_SEL}
}

proc update_MODELPARAM_VALUE.FILTER_SEL_INT { MODELPARAM_VALUE.FILTER_SEL_INT PARAM_VALUE.FILTER_SEL_INT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILTER_SEL_INT}] ${MODELPARAM_VALUE.FILTER_SEL_INT}
}

proc update_MODELPARAM_VALUE.EXPDIVISION { MODELPARAM_VALUE.EXPDIVISION PARAM_VALUE.EXPDIVISION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EXPDIVISION}] ${MODELPARAM_VALUE.EXPDIVISION}
}

