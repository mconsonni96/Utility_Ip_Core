# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  set MAX_PACKET_LENGTH [ipgui::add_param $IPINST -name "MAX_PACKET_LENGTH" -widget comboBox]
  set_property tooltip {Maximum length (in Bytes) of the input packet. Bigger packets are considered invalid and are automatically flushed. Note that the whole packet must be buffered, so a a BRAM large enough to store it will be instantiated.} ${MAX_PACKET_LENGTH}
  set MAX_STORED_PACKETS [ipgui::add_param $IPINST -name "MAX_STORED_PACKETS" -widget comboBox]
  set_property tooltip {Maximum number of packets stored in the module but not yet transmitted. After MAX_STORED_PACKETS (valid or invalid) are received but not yet read from the M_AXIS interface, s_axis_tready goes low, even if the main data FIFO is not full yet. Unless you expect lot of small packets in a very short amount of time, you can keep this value low.} ${MAX_STORED_PACKETS}
  #Adding Group
  set CRC_settings [ipgui::add_group $IPINST -name "CRC settings"]
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

proc update_PARAM_VALUE.C_INIT_VALUE { PARAM_VALUE.C_INIT_VALUE } {
	# Procedure called to update C_INIT_VALUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_INIT_VALUE { PARAM_VALUE.C_INIT_VALUE } {
	# Procedure called to validate C_INIT_VALUE
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_TDEST_WIDTH { PARAM_VALUE.C_M_AXIS_TDEST_WIDTH } {
	# Procedure called to update C_M_AXIS_TDEST_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_TDEST_WIDTH { PARAM_VALUE.C_M_AXIS_TDEST_WIDTH } {
	# Procedure called to validate C_M_AXIS_TDEST_WIDTH
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

proc update_PARAM_VALUE.C_S_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_S_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_S_AXIS_TDATA_WIDTH
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

proc update_PARAM_VALUE.MAX_STORED_PACKETS { PARAM_VALUE.MAX_STORED_PACKETS } {
	# Procedure called to update MAX_STORED_PACKETS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_STORED_PACKETS { PARAM_VALUE.MAX_STORED_PACKETS } {
	# Procedure called to validate MAX_STORED_PACKETS
	return true
}


proc update_MODELPARAM_VALUE.MAX_STORED_PACKETS { MODELPARAM_VALUE.MAX_STORED_PACKETS PARAM_VALUE.MAX_STORED_PACKETS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_STORED_PACKETS}] ${MODELPARAM_VALUE.MAX_STORED_PACKETS}
}

proc update_MODELPARAM_VALUE.C_REF_IN { MODELPARAM_VALUE.C_REF_IN PARAM_VALUE.C_REF_IN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_REF_IN}] ${MODELPARAM_VALUE.C_REF_IN}
}

proc update_MODELPARAM_VALUE.C_REF_OUT { MODELPARAM_VALUE.C_REF_OUT PARAM_VALUE.C_REF_OUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_REF_OUT}] ${MODELPARAM_VALUE.C_REF_OUT}
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

proc update_MODELPARAM_VALUE.C_S_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S_AXIS_TDATA_WIDTH PARAM_VALUE.C_S_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH PARAM_VALUE.C_M_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_TDEST_WIDTH { MODELPARAM_VALUE.C_M_AXIS_TDEST_WIDTH PARAM_VALUE.C_M_AXIS_TDEST_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_TDEST_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_TDEST_WIDTH}
}

proc update_MODELPARAM_VALUE.MAX_PACKET_LENGTH { MODELPARAM_VALUE.MAX_PACKET_LENGTH PARAM_VALUE.MAX_PACKET_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_PACKET_LENGTH}] ${MODELPARAM_VALUE.MAX_PACKET_LENGTH}
}

