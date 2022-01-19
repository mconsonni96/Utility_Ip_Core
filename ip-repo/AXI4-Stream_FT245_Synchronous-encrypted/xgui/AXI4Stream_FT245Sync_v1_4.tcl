# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  ipgui::add_param $IPINST -name "RX_BUFFER_DEPTH" -widget comboBox
  ipgui::add_param $IPINST -name "TX_BUFFER_DEPTH" -widget comboBox
  ipgui::add_param $IPINST -name "PRIORITY" -widget comboBox

}

proc update_PARAM_VALUE.FT245_BOARD_INTERFACE { PARAM_VALUE.FT245_BOARD_INTERFACE } {
	# Procedure called to update FT245_BOARD_INTERFACE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FT245_BOARD_INTERFACE { PARAM_VALUE.FT245_BOARD_INTERFACE } {
	# Procedure called to validate FT245_BOARD_INTERFACE
	return true
}

proc update_PARAM_VALUE.PRIORITY { PARAM_VALUE.PRIORITY } {
	# Procedure called to update PRIORITY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PRIORITY { PARAM_VALUE.PRIORITY } {
	# Procedure called to validate PRIORITY
	return true
}

proc update_PARAM_VALUE.RX_BUFFER_DEPTH { PARAM_VALUE.RX_BUFFER_DEPTH } {
	# Procedure called to update RX_BUFFER_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RX_BUFFER_DEPTH { PARAM_VALUE.RX_BUFFER_DEPTH } {
	# Procedure called to validate RX_BUFFER_DEPTH
	return true
}

proc update_PARAM_VALUE.TX_BUFFER_DEPTH { PARAM_VALUE.TX_BUFFER_DEPTH } {
	# Procedure called to update TX_BUFFER_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TX_BUFFER_DEPTH { PARAM_VALUE.TX_BUFFER_DEPTH } {
	# Procedure called to validate TX_BUFFER_DEPTH
	return true
}


proc update_MODELPARAM_VALUE.RX_BUFFER_DEPTH { MODELPARAM_VALUE.RX_BUFFER_DEPTH PARAM_VALUE.RX_BUFFER_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RX_BUFFER_DEPTH}] ${MODELPARAM_VALUE.RX_BUFFER_DEPTH}
}

proc update_MODELPARAM_VALUE.TX_BUFFER_DEPTH { MODELPARAM_VALUE.TX_BUFFER_DEPTH PARAM_VALUE.TX_BUFFER_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TX_BUFFER_DEPTH}] ${MODELPARAM_VALUE.TX_BUFFER_DEPTH}
}

proc update_MODELPARAM_VALUE.PRIORITY { MODELPARAM_VALUE.PRIORITY PARAM_VALUE.PRIORITY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PRIORITY}] ${MODELPARAM_VALUE.PRIORITY}
}

