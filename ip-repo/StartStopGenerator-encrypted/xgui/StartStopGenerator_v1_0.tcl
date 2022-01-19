# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "NUM_CARRY_BLOCK" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HALF_DIVIDER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CLK_SELECT" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "START_STOP_DALAY_NUM_CARRY_BLOCK" -parent ${Page_0}


}

proc update_PARAM_VALUE.CLK_SELECT { PARAM_VALUE.CLK_SELECT } {
	# Procedure called to update CLK_SELECT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CLK_SELECT { PARAM_VALUE.CLK_SELECT } {
	# Procedure called to validate CLK_SELECT
	return true
}

proc update_PARAM_VALUE.HALF_DIVIDER { PARAM_VALUE.HALF_DIVIDER } {
	# Procedure called to update HALF_DIVIDER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HALF_DIVIDER { PARAM_VALUE.HALF_DIVIDER } {
	# Procedure called to validate HALF_DIVIDER
	return true
}

proc update_PARAM_VALUE.NUM_CARRY_BLOCK { PARAM_VALUE.NUM_CARRY_BLOCK } {
	# Procedure called to update NUM_CARRY_BLOCK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_CARRY_BLOCK { PARAM_VALUE.NUM_CARRY_BLOCK } {
	# Procedure called to validate NUM_CARRY_BLOCK
	return true
}

proc update_PARAM_VALUE.START_STOP_DALAY_NUM_CARRY_BLOCK { PARAM_VALUE.START_STOP_DALAY_NUM_CARRY_BLOCK } {
	# Procedure called to update START_STOP_DALAY_NUM_CARRY_BLOCK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.START_STOP_DALAY_NUM_CARRY_BLOCK { PARAM_VALUE.START_STOP_DALAY_NUM_CARRY_BLOCK } {
	# Procedure called to validate START_STOP_DALAY_NUM_CARRY_BLOCK
	return true
}


proc update_MODELPARAM_VALUE.NUM_CARRY_BLOCK { MODELPARAM_VALUE.NUM_CARRY_BLOCK PARAM_VALUE.NUM_CARRY_BLOCK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_CARRY_BLOCK}] ${MODELPARAM_VALUE.NUM_CARRY_BLOCK}
}

proc update_MODELPARAM_VALUE.HALF_DIVIDER { MODELPARAM_VALUE.HALF_DIVIDER PARAM_VALUE.HALF_DIVIDER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HALF_DIVIDER}] ${MODELPARAM_VALUE.HALF_DIVIDER}
}

proc update_MODELPARAM_VALUE.BIT_HALF_DIVIDER { MODELPARAM_VALUE.BIT_HALF_DIVIDER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "BIT_HALF_DIVIDER". Setting updated value from the model parameter.
set_property value 1 ${MODELPARAM_VALUE.BIT_HALF_DIVIDER}
}

proc update_MODELPARAM_VALUE.CLK_SELECT { MODELPARAM_VALUE.CLK_SELECT PARAM_VALUE.CLK_SELECT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CLK_SELECT}] ${MODELPARAM_VALUE.CLK_SELECT}
}

proc update_MODELPARAM_VALUE.START_STOP_DALAY_NUM_CARRY_BLOCK { MODELPARAM_VALUE.START_STOP_DALAY_NUM_CARRY_BLOCK PARAM_VALUE.START_STOP_DALAY_NUM_CARRY_BLOCK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.START_STOP_DALAY_NUM_CARRY_BLOCK}] ${MODELPARAM_VALUE.START_STOP_DALAY_NUM_CARRY_BLOCK}
}

