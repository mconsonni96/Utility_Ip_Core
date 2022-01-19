# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "TUNING_MODE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "START_STOP_DALAY_NUM_CARRY_BLOCK" -parent ${Page_0}
  #Adding Group
  set Type_of_Clock [ipgui::add_group $IPINST -name "Type of Clock" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "CLK_SELECT" -parent ${Type_of_Clock}

  #Adding Group
  set Principal_Divider [ipgui::add_group $IPINST -name "Principal Divider" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "HALF_DIVIDER" -parent ${Principal_Divider}

  #Adding Group
  set Ring_Oscillator_Parameter [ipgui::add_group $IPINST -name "Ring Oscillator Parameter" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "NUM_CARRY_BLOCK" -parent ${Ring_Oscillator_Parameter}

  #Adding Group
  set Extra_Divder [ipgui::add_group $IPINST -name "Extra Divder" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "DIVIDER_INIT" -parent ${Extra_Divder}



}

proc update_PARAM_VALUE.CLK_SELECT { PARAM_VALUE.CLK_SELECT } {
	# Procedure called to update CLK_SELECT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CLK_SELECT { PARAM_VALUE.CLK_SELECT } {
	# Procedure called to validate CLK_SELECT
	return true
}

proc update_PARAM_VALUE.DIVIDER_INIT { PARAM_VALUE.DIVIDER_INIT } {
	# Procedure called to update DIVIDER_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DIVIDER_INIT { PARAM_VALUE.DIVIDER_INIT } {
	# Procedure called to validate DIVIDER_INIT
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

proc update_PARAM_VALUE.TUNING_MODE { PARAM_VALUE.TUNING_MODE } {
	# Procedure called to update TUNING_MODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TUNING_MODE { PARAM_VALUE.TUNING_MODE } {
	# Procedure called to validate TUNING_MODE
	return true
}


proc update_MODELPARAM_VALUE.NUM_CARRY_BLOCK { MODELPARAM_VALUE.NUM_CARRY_BLOCK PARAM_VALUE.NUM_CARRY_BLOCK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_CARRY_BLOCK}] ${MODELPARAM_VALUE.NUM_CARRY_BLOCK}
}

proc update_MODELPARAM_VALUE.TUNING_MODE { MODELPARAM_VALUE.TUNING_MODE PARAM_VALUE.TUNING_MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TUNING_MODE}] ${MODELPARAM_VALUE.TUNING_MODE}
}

proc update_MODELPARAM_VALUE.HALF_DIVIDER { MODELPARAM_VALUE.HALF_DIVIDER PARAM_VALUE.HALF_DIVIDER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HALF_DIVIDER}] ${MODELPARAM_VALUE.HALF_DIVIDER}
}

proc update_MODELPARAM_VALUE.DIVIDER_INIT { MODELPARAM_VALUE.DIVIDER_INIT PARAM_VALUE.DIVIDER_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DIVIDER_INIT}] ${MODELPARAM_VALUE.DIVIDER_INIT}
}

proc update_MODELPARAM_VALUE.CLK_SELECT { MODELPARAM_VALUE.CLK_SELECT PARAM_VALUE.CLK_SELECT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CLK_SELECT}] ${MODELPARAM_VALUE.CLK_SELECT}
}

proc update_MODELPARAM_VALUE.START_STOP_DALAY_NUM_CARRY_BLOCK { MODELPARAM_VALUE.START_STOP_DALAY_NUM_CARRY_BLOCK PARAM_VALUE.START_STOP_DALAY_NUM_CARRY_BLOCK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.START_STOP_DALAY_NUM_CARRY_BLOCK}] ${MODELPARAM_VALUE.START_STOP_DALAY_NUM_CARRY_BLOCK}
}

