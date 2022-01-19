# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  #Adding Group
  set Channel_number [ipgui::add_group $IPINST -name "Channel number" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "NUM_CH" -parent ${Channel_number}
  ipgui::add_param $IPINST -name "NUM_NODE" -parent ${Channel_number}

  #Adding Group
  set Data [ipgui::add_group $IPINST -name "Data" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "BIT_COARSE" -parent ${Data}
  ipgui::add_param $IPINST -name "BIT_FID" -parent ${Data}
  ipgui::add_param $IPINST -name "PASS_THROUGH" -parent ${Data}
  ipgui::add_param $IPINST -name "BIT_NUM_CH" -parent ${Data}
  ipgui::add_param $IPINST -name "BIT_RESOLUTION" -parent ${Data}

  #Adding Group
  set Tunable_Generics [ipgui::add_group $IPINST -name "Tunable Generics" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "HOLD_ON_INTEGRAL" -parent ${Tunable_Generics}
  ipgui::add_param $IPINST -name "HOLD_ON_MIN_MOD" -parent ${Tunable_Generics}
  ipgui::add_param $IPINST -name "HOLD_ON_SINGLE_NODE" -parent ${Tunable_Generics}
  ipgui::add_param $IPINST -name "INJECT_CYCLES" -parent ${Tunable_Generics}
  ipgui::add_param $IPINST -name "RETAIN_SINGLE_NODE" -parent ${Tunable_Generics}



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

proc update_PARAM_VALUE.HOLD_ON_INTEGRAL { PARAM_VALUE.HOLD_ON_INTEGRAL } {
	# Procedure called to update HOLD_ON_INTEGRAL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HOLD_ON_INTEGRAL { PARAM_VALUE.HOLD_ON_INTEGRAL } {
	# Procedure called to validate HOLD_ON_INTEGRAL
	return true
}

proc update_PARAM_VALUE.HOLD_ON_MIN_MOD { PARAM_VALUE.HOLD_ON_MIN_MOD } {
	# Procedure called to update HOLD_ON_MIN_MOD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HOLD_ON_MIN_MOD { PARAM_VALUE.HOLD_ON_MIN_MOD } {
	# Procedure called to validate HOLD_ON_MIN_MOD
	return true
}

proc update_PARAM_VALUE.HOLD_ON_SINGLE_NODE { PARAM_VALUE.HOLD_ON_SINGLE_NODE } {
	# Procedure called to update HOLD_ON_SINGLE_NODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HOLD_ON_SINGLE_NODE { PARAM_VALUE.HOLD_ON_SINGLE_NODE } {
	# Procedure called to validate HOLD_ON_SINGLE_NODE
	return true
}

proc update_PARAM_VALUE.INJECT_CYCLES { PARAM_VALUE.INJECT_CYCLES } {
	# Procedure called to update INJECT_CYCLES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INJECT_CYCLES { PARAM_VALUE.INJECT_CYCLES } {
	# Procedure called to validate INJECT_CYCLES
	return true
}

proc update_PARAM_VALUE.NUM_CH { PARAM_VALUE.NUM_CH } {
	# Procedure called to update NUM_CH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_CH { PARAM_VALUE.NUM_CH } {
	# Procedure called to validate NUM_CH
	return true
}

proc update_PARAM_VALUE.NUM_NODE { PARAM_VALUE.NUM_NODE } {
	# Procedure called to update NUM_NODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_NODE { PARAM_VALUE.NUM_NODE } {
	# Procedure called to validate NUM_NODE
	return true
}

proc update_PARAM_VALUE.PASS_THROUGH { PARAM_VALUE.PASS_THROUGH } {
	# Procedure called to update PASS_THROUGH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PASS_THROUGH { PARAM_VALUE.PASS_THROUGH } {
	# Procedure called to validate PASS_THROUGH
	return true
}

proc update_PARAM_VALUE.RETAIN_SINGLE_NODE { PARAM_VALUE.RETAIN_SINGLE_NODE } {
	# Procedure called to update RETAIN_SINGLE_NODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RETAIN_SINGLE_NODE { PARAM_VALUE.RETAIN_SINGLE_NODE } {
	# Procedure called to validate RETAIN_SINGLE_NODE
	return true
}


proc update_MODELPARAM_VALUE.NUM_CH { MODELPARAM_VALUE.NUM_CH PARAM_VALUE.NUM_CH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_CH}] ${MODELPARAM_VALUE.NUM_CH}
}

proc update_MODELPARAM_VALUE.NUM_NODE { MODELPARAM_VALUE.NUM_NODE PARAM_VALUE.NUM_NODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_NODE}] ${MODELPARAM_VALUE.NUM_NODE}
}

proc update_MODELPARAM_VALUE.PASS_THROUGH { MODELPARAM_VALUE.PASS_THROUGH PARAM_VALUE.PASS_THROUGH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PASS_THROUGH}] ${MODELPARAM_VALUE.PASS_THROUGH}
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

proc update_MODELPARAM_VALUE.RETAIN_SINGLE_NODE { MODELPARAM_VALUE.RETAIN_SINGLE_NODE PARAM_VALUE.RETAIN_SINGLE_NODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RETAIN_SINGLE_NODE}] ${MODELPARAM_VALUE.RETAIN_SINGLE_NODE}
}

proc update_MODELPARAM_VALUE.HOLD_ON_SINGLE_NODE { MODELPARAM_VALUE.HOLD_ON_SINGLE_NODE PARAM_VALUE.HOLD_ON_SINGLE_NODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HOLD_ON_SINGLE_NODE}] ${MODELPARAM_VALUE.HOLD_ON_SINGLE_NODE}
}

proc update_MODELPARAM_VALUE.HOLD_ON_MIN_MOD { MODELPARAM_VALUE.HOLD_ON_MIN_MOD PARAM_VALUE.HOLD_ON_MIN_MOD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HOLD_ON_MIN_MOD}] ${MODELPARAM_VALUE.HOLD_ON_MIN_MOD}
}

proc update_MODELPARAM_VALUE.HOLD_ON_INTEGRAL { MODELPARAM_VALUE.HOLD_ON_INTEGRAL PARAM_VALUE.HOLD_ON_INTEGRAL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HOLD_ON_INTEGRAL}] ${MODELPARAM_VALUE.HOLD_ON_INTEGRAL}
}

proc update_MODELPARAM_VALUE.INJECT_CYCLES { MODELPARAM_VALUE.INJECT_CYCLES PARAM_VALUE.INJECT_CYCLES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INJECT_CYCLES}] ${MODELPARAM_VALUE.INJECT_CYCLES}
}

