# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "TDC_ENABLE_DEBUG_PORTS" -parent ${Page_0}
  #Adding Group
  set Input_Logic [ipgui::add_group $IPINST -name "Input Logic" -parent ${Page_0}]
  set BIT_STRETCH_LENGTH [ipgui::add_param $IPINST -name "BIT_STRETCH_LENGTH" -parent ${Input_Logic}]
  set_property tooltip {Bit length of StretchLength} ${BIT_STRETCH_LENGTH}
  set BIT_DIVIDER [ipgui::add_param $IPINST -name "BIT_DIVIDER" -parent ${Input_Logic}]
  set_property tooltip {Bit length of the Divider} ${BIT_DIVIDER}

  #Adding Group
  set Period_Meter [ipgui::add_group $IPINST -name "Period Meter" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "BIT_OVERFLOW" -parent ${Period_Meter}
  ipgui::add_param $IPINST -name "BIT_COARSE" -parent ${Period_Meter}
  ipgui::add_param $IPINST -name "BIT_RESOLUTION" -parent ${Period_Meter}



}

proc update_PARAM_VALUE.BIT_COARSE { PARAM_VALUE.BIT_COARSE } {
	# Procedure called to update BIT_COARSE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_COARSE { PARAM_VALUE.BIT_COARSE } {
	# Procedure called to validate BIT_COARSE
	return true
}

proc update_PARAM_VALUE.BIT_DIVIDER { PARAM_VALUE.BIT_DIVIDER } {
	# Procedure called to update BIT_DIVIDER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_DIVIDER { PARAM_VALUE.BIT_DIVIDER } {
	# Procedure called to validate BIT_DIVIDER
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

proc update_PARAM_VALUE.BIT_STRETCH_LENGTH { PARAM_VALUE.BIT_STRETCH_LENGTH } {
	# Procedure called to update BIT_STRETCH_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_STRETCH_LENGTH { PARAM_VALUE.BIT_STRETCH_LENGTH } {
	# Procedure called to validate BIT_STRETCH_LENGTH
	return true
}

proc update_PARAM_VALUE.DEST_SYNC_FF { PARAM_VALUE.DEST_SYNC_FF } {
	# Procedure called to update DEST_SYNC_FF when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEST_SYNC_FF { PARAM_VALUE.DEST_SYNC_FF } {
	# Procedure called to validate DEST_SYNC_FF
	return true
}

proc update_PARAM_VALUE.SRC_SYNC_FF { PARAM_VALUE.SRC_SYNC_FF } {
	# Procedure called to update SRC_SYNC_FF when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SRC_SYNC_FF { PARAM_VALUE.SRC_SYNC_FF } {
	# Procedure called to validate SRC_SYNC_FF
	return true
}

proc update_PARAM_VALUE.TDC_ENABLE_DEBUG_PORTS { PARAM_VALUE.TDC_ENABLE_DEBUG_PORTS } {
	# Procedure called to update TDC_ENABLE_DEBUG_PORTS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TDC_ENABLE_DEBUG_PORTS { PARAM_VALUE.TDC_ENABLE_DEBUG_PORTS } {
	# Procedure called to validate TDC_ENABLE_DEBUG_PORTS
	return true
}


proc update_MODELPARAM_VALUE.BIT_STRETCH_LENGTH { MODELPARAM_VALUE.BIT_STRETCH_LENGTH PARAM_VALUE.BIT_STRETCH_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_STRETCH_LENGTH}] ${MODELPARAM_VALUE.BIT_STRETCH_LENGTH}
}

proc update_MODELPARAM_VALUE.BIT_DIVIDER { MODELPARAM_VALUE.BIT_DIVIDER PARAM_VALUE.BIT_DIVIDER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_DIVIDER}] ${MODELPARAM_VALUE.BIT_DIVIDER}
}

proc update_MODELPARAM_VALUE.DEST_SYNC_FF { MODELPARAM_VALUE.DEST_SYNC_FF PARAM_VALUE.DEST_SYNC_FF } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEST_SYNC_FF}] ${MODELPARAM_VALUE.DEST_SYNC_FF}
}

proc update_MODELPARAM_VALUE.SRC_SYNC_FF { MODELPARAM_VALUE.SRC_SYNC_FF PARAM_VALUE.SRC_SYNC_FF } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SRC_SYNC_FF}] ${MODELPARAM_VALUE.SRC_SYNC_FF}
}

proc update_MODELPARAM_VALUE.TDC_ENABLE_DEBUG_PORTS { MODELPARAM_VALUE.TDC_ENABLE_DEBUG_PORTS PARAM_VALUE.TDC_ENABLE_DEBUG_PORTS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TDC_ENABLE_DEBUG_PORTS}] ${MODELPARAM_VALUE.TDC_ENABLE_DEBUG_PORTS}
}

proc update_MODELPARAM_VALUE.BIT_OVERFLOW { MODELPARAM_VALUE.BIT_OVERFLOW PARAM_VALUE.BIT_OVERFLOW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_OVERFLOW}] ${MODELPARAM_VALUE.BIT_OVERFLOW}
}

proc update_MODELPARAM_VALUE.BIT_COARSE { MODELPARAM_VALUE.BIT_COARSE PARAM_VALUE.BIT_COARSE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_COARSE}] ${MODELPARAM_VALUE.BIT_COARSE}
}

proc update_MODELPARAM_VALUE.BIT_RESOLUTION { MODELPARAM_VALUE.BIT_RESOLUTION PARAM_VALUE.BIT_RESOLUTION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_RESOLUTION}] ${MODELPARAM_VALUE.BIT_RESOLUTION}
}

