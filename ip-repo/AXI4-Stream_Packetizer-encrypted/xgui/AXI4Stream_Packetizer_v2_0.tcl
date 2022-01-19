# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Settings [ipgui::add_page $IPINST -name "Settings"]
  set MAX_PACKET_LENGTH [ipgui::add_param $IPINST -name "MAX_PACKET_LENGTH" -parent ${Settings} -widget comboBox]
  set_property tooltip {Maximum length (in Bytes) of the input packet. This is the minimum guaranteed length: in the average case much larger packets will be handled correctly. Large packets are cheap (i.e., increasing this value causes a very low increase of resources).} ${MAX_PACKET_LENGTH}
  #Adding Group
  set CRC_settings [ipgui::add_group $IPINST -name "CRC settings" -parent ${Settings}]
  ipgui::add_param $IPINST -name "C_CRC_POLY" -parent ${CRC_settings}
  ipgui::add_param $IPINST -name "C_INIT_VALUE" -parent ${CRC_settings}
  ipgui::add_param $IPINST -name "C_XOR_OUT" -parent ${CRC_settings}
  ipgui::add_param $IPINST -name "C_REF_IN" -parent ${CRC_settings}
  ipgui::add_param $IPINST -name "C_REF_OUT" -parent ${CRC_settings}



}

proc update_PARAM_VALUE.C_CRC_POLY { PARAM_VALUE.C_CRC_POLY } {
	# Procedure called to update C_CRC_POLY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CRC_POLY { PARAM_VALUE.C_CRC_POLY } {
	# Procedure called to validate C_CRC_POLY
	return true
}

proc update_PARAM_VALUE.C_CRC_WIDTH { PARAM_VALUE.C_CRC_WIDTH } {
	# Procedure called to update C_CRC_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CRC_WIDTH { PARAM_VALUE.C_CRC_WIDTH } {
	# Procedure called to validate C_CRC_WIDTH
	return true
}

proc update_PARAM_VALUE.C_INIT_VALUE { PARAM_VALUE.C_INIT_VALUE } {
	# Procedure called to update C_INIT_VALUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_INIT_VALUE { PARAM_VALUE.C_INIT_VALUE } {
	# Procedure called to validate C_INIT_VALUE
	return true
}

proc update_PARAM_VALUE.C_REF_IN { PARAM_VALUE.C_REF_IN } {
	# Procedure called to update C_REF_IN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_REF_IN { PARAM_VALUE.C_REF_IN } {
	# Procedure called to validate C_REF_IN
	return true
}

proc update_PARAM_VALUE.C_REF_OUT { PARAM_VALUE.C_REF_OUT } {
	# Procedure called to update C_REF_OUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_REF_OUT { PARAM_VALUE.C_REF_OUT } {
	# Procedure called to validate C_REF_OUT
	return true
}

proc update_PARAM_VALUE.C_WORD_WIDTH { PARAM_VALUE.C_WORD_WIDTH } {
	# Procedure called to update C_WORD_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_WORD_WIDTH { PARAM_VALUE.C_WORD_WIDTH } {
	# Procedure called to validate C_WORD_WIDTH
	return true
}

proc update_PARAM_VALUE.C_XOR_OUT { PARAM_VALUE.C_XOR_OUT } {
	# Procedure called to update C_XOR_OUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_XOR_OUT { PARAM_VALUE.C_XOR_OUT } {
	# Procedure called to validate C_XOR_OUT
	return true
}

proc update_PARAM_VALUE.MAX_PACKET_LENGTH { PARAM_VALUE.MAX_PACKET_LENGTH } {
	# Procedure called to update MAX_PACKET_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_PACKET_LENGTH { PARAM_VALUE.MAX_PACKET_LENGTH } {
	# Procedure called to validate MAX_PACKET_LENGTH
	return true
}

proc update_PARAM_VALUE.TDEST_WIDTH { PARAM_VALUE.TDEST_WIDTH } {
	# Procedure called to update TDEST_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TDEST_WIDTH { PARAM_VALUE.TDEST_WIDTH } {
	# Procedure called to validate TDEST_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.C_WORD_WIDTH { MODELPARAM_VALUE.C_WORD_WIDTH PARAM_VALUE.C_WORD_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_WORD_WIDTH}] ${MODELPARAM_VALUE.C_WORD_WIDTH}
}

proc update_MODELPARAM_VALUE.C_REF_IN { MODELPARAM_VALUE.C_REF_IN PARAM_VALUE.C_REF_IN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_REF_IN}] ${MODELPARAM_VALUE.C_REF_IN}
}

proc update_MODELPARAM_VALUE.C_REF_OUT { MODELPARAM_VALUE.C_REF_OUT PARAM_VALUE.C_REF_OUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_REF_OUT}] ${MODELPARAM_VALUE.C_REF_OUT}
}

proc update_MODELPARAM_VALUE.C_CRC_WIDTH { MODELPARAM_VALUE.C_CRC_WIDTH PARAM_VALUE.C_CRC_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CRC_WIDTH}] ${MODELPARAM_VALUE.C_CRC_WIDTH}
}

proc update_MODELPARAM_VALUE.C_CRC_POLY { MODELPARAM_VALUE.C_CRC_POLY PARAM_VALUE.C_CRC_POLY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CRC_POLY}] ${MODELPARAM_VALUE.C_CRC_POLY}
}

proc update_MODELPARAM_VALUE.C_INIT_VALUE { MODELPARAM_VALUE.C_INIT_VALUE PARAM_VALUE.C_INIT_VALUE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_INIT_VALUE}] ${MODELPARAM_VALUE.C_INIT_VALUE}
}

proc update_MODELPARAM_VALUE.C_XOR_OUT { MODELPARAM_VALUE.C_XOR_OUT PARAM_VALUE.C_XOR_OUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_XOR_OUT}] ${MODELPARAM_VALUE.C_XOR_OUT}
}

proc update_MODELPARAM_VALUE.MAX_PACKET_LENGTH { MODELPARAM_VALUE.MAX_PACKET_LENGTH PARAM_VALUE.MAX_PACKET_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_PACKET_LENGTH}] ${MODELPARAM_VALUE.MAX_PACKET_LENGTH}
}

proc update_MODELPARAM_VALUE.TDEST_WIDTH { MODELPARAM_VALUE.TDEST_WIDTH PARAM_VALUE.TDEST_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TDEST_WIDTH}] ${MODELPARAM_VALUE.TDEST_WIDTH}
}
