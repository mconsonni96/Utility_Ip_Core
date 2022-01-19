# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  ipgui::add_param $IPINST -name "BIN_DATA_WIDTH"
  ipgui::add_param $IPINST -name "BIN_ADDR_WIDTH"
  ipgui::add_param $IPINST -name "BIT_FINE"
  ipgui::add_param $IPINST -name "BIT_COARSE"
  ipgui::add_param $IPINST -name "BIT_FID"
  ipgui::add_param $IPINST -name "BIT_NUM_CH"
  ipgui::add_param $IPINST -name "NUM_CH"
  ipgui::add_param $IPINST -name "BIT_OVERFLOW"
  ipgui::add_param $IPINST -name "FUNC_MODE" -widget comboBox
  ipgui::add_param $IPINST -name "BASE_ADDRESS"
  ipgui::add_param $IPINST -name "ASYNC_CLOCK"

}

proc update_PARAM_VALUE.ASYNC_CLOCK { PARAM_VALUE.ASYNC_CLOCK } {
	# Procedure called to update ASYNC_CLOCK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ASYNC_CLOCK { PARAM_VALUE.ASYNC_CLOCK } {
	# Procedure called to validate ASYNC_CLOCK
	return true
}

proc update_PARAM_VALUE.BASE_ADDRESS { PARAM_VALUE.BASE_ADDRESS } {
	# Procedure called to update BASE_ADDRESS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BASE_ADDRESS { PARAM_VALUE.BASE_ADDRESS } {
	# Procedure called to validate BASE_ADDRESS
	return true
}

proc update_PARAM_VALUE.BIN_ADDR_WIDTH { PARAM_VALUE.BIN_ADDR_WIDTH } {
	# Procedure called to update BIN_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIN_ADDR_WIDTH { PARAM_VALUE.BIN_ADDR_WIDTH } {
	# Procedure called to validate BIN_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.BIN_DATA_WIDTH { PARAM_VALUE.BIN_DATA_WIDTH } {
	# Procedure called to update BIN_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIN_DATA_WIDTH { PARAM_VALUE.BIN_DATA_WIDTH } {
	# Procedure called to validate BIN_DATA_WIDTH
	return true
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

proc update_PARAM_VALUE.BIT_FINE { PARAM_VALUE.BIT_FINE } {
	# Procedure called to update BIT_FINE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_FINE { PARAM_VALUE.BIT_FINE } {
	# Procedure called to validate BIT_FINE
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

proc update_PARAM_VALUE.C_s00_axi_BASEADDR { PARAM_VALUE.C_s00_axi_BASEADDR } {
	# Procedure called to update C_s00_axi_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_s00_axi_BASEADDR { PARAM_VALUE.C_s00_axi_BASEADDR } {
	# Procedure called to validate C_s00_axi_BASEADDR
	return true
}

proc update_PARAM_VALUE.FUNC_MODE { PARAM_VALUE.FUNC_MODE } {
	# Procedure called to update FUNC_MODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FUNC_MODE { PARAM_VALUE.FUNC_MODE } {
	# Procedure called to validate FUNC_MODE
	return true
}

proc update_PARAM_VALUE.NUM_CH { PARAM_VALUE.NUM_CH } {
	# Procedure called to update NUM_CH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_CH { PARAM_VALUE.NUM_CH } {
	# Procedure called to validate NUM_CH
	return true
}

proc update_PARAM_VALUE.VERSION_MAJOR { PARAM_VALUE.VERSION_MAJOR } {
	# Procedure called to update VERSION_MAJOR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VERSION_MAJOR { PARAM_VALUE.VERSION_MAJOR } {
	# Procedure called to validate VERSION_MAJOR
	return true
}

proc update_PARAM_VALUE.VERSION_MINOR { PARAM_VALUE.VERSION_MINOR } {
	# Procedure called to update VERSION_MINOR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VERSION_MINOR { PARAM_VALUE.VERSION_MINOR } {
	# Procedure called to validate VERSION_MINOR
	return true
}

proc update_PARAM_VALUE.VERSION_REVISION { PARAM_VALUE.VERSION_REVISION } {
	# Procedure called to update VERSION_REVISION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.VERSION_REVISION { PARAM_VALUE.VERSION_REVISION } {
	# Procedure called to validate VERSION_REVISION
	return true
}

proc update_PARAM_VALUE.C_s_axi_BASEADDR { PARAM_VALUE.C_s_axi_BASEADDR } {
	# Procedure called to update C_s_axi_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_s_axi_BASEADDR { PARAM_VALUE.C_s_axi_BASEADDR } {
	# Procedure called to validate C_s_axi_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_s_axi_HIGHADDR { PARAM_VALUE.C_s_axi_HIGHADDR } {
	# Procedure called to update C_s_axi_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_s_axi_HIGHADDR { PARAM_VALUE.C_s_axi_HIGHADDR } {
	# Procedure called to validate C_s_axi_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.BIN_DATA_WIDTH { MODELPARAM_VALUE.BIN_DATA_WIDTH PARAM_VALUE.BIN_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIN_DATA_WIDTH}] ${MODELPARAM_VALUE.BIN_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.BIN_ADDR_WIDTH { MODELPARAM_VALUE.BIN_ADDR_WIDTH PARAM_VALUE.BIN_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIN_ADDR_WIDTH}] ${MODELPARAM_VALUE.BIN_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.BIT_FINE { MODELPARAM_VALUE.BIT_FINE PARAM_VALUE.BIT_FINE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_FINE}] ${MODELPARAM_VALUE.BIT_FINE}
}

proc update_MODELPARAM_VALUE.BIT_COARSE { MODELPARAM_VALUE.BIT_COARSE PARAM_VALUE.BIT_COARSE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_COARSE}] ${MODELPARAM_VALUE.BIT_COARSE}
}

proc update_MODELPARAM_VALUE.BIT_FID { MODELPARAM_VALUE.BIT_FID PARAM_VALUE.BIT_FID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_FID}] ${MODELPARAM_VALUE.BIT_FID}
}

proc update_MODELPARAM_VALUE.BIT_NUM_CH { MODELPARAM_VALUE.BIT_NUM_CH PARAM_VALUE.BIT_NUM_CH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_NUM_CH}] ${MODELPARAM_VALUE.BIT_NUM_CH}
}

proc update_MODELPARAM_VALUE.NUM_CH { MODELPARAM_VALUE.NUM_CH PARAM_VALUE.NUM_CH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_CH}] ${MODELPARAM_VALUE.NUM_CH}
}

proc update_MODELPARAM_VALUE.BIT_OVERFLOW { MODELPARAM_VALUE.BIT_OVERFLOW PARAM_VALUE.BIT_OVERFLOW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_OVERFLOW}] ${MODELPARAM_VALUE.BIT_OVERFLOW}
}

proc update_MODELPARAM_VALUE.FUNC_MODE { MODELPARAM_VALUE.FUNC_MODE PARAM_VALUE.FUNC_MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FUNC_MODE}] ${MODELPARAM_VALUE.FUNC_MODE}
}

proc update_MODELPARAM_VALUE.BASE_ADDRESS { MODELPARAM_VALUE.BASE_ADDRESS PARAM_VALUE.BASE_ADDRESS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BASE_ADDRESS}] ${MODELPARAM_VALUE.BASE_ADDRESS}
}

proc update_MODELPARAM_VALUE.ASYNC_CLOCK { MODELPARAM_VALUE.ASYNC_CLOCK PARAM_VALUE.ASYNC_CLOCK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ASYNC_CLOCK}] ${MODELPARAM_VALUE.ASYNC_CLOCK}
}

proc update_MODELPARAM_VALUE.VERSION_MAJOR { MODELPARAM_VALUE.VERSION_MAJOR PARAM_VALUE.VERSION_MAJOR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VERSION_MAJOR}] ${MODELPARAM_VALUE.VERSION_MAJOR}
}

proc update_MODELPARAM_VALUE.VERSION_MINOR { MODELPARAM_VALUE.VERSION_MINOR PARAM_VALUE.VERSION_MINOR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VERSION_MINOR}] ${MODELPARAM_VALUE.VERSION_MINOR}
}

proc update_MODELPARAM_VALUE.VERSION_REVISION { MODELPARAM_VALUE.VERSION_REVISION PARAM_VALUE.VERSION_REVISION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.VERSION_REVISION}] ${MODELPARAM_VALUE.VERSION_REVISION}
}

proc update_MODELPARAM_VALUE.C_s00_axi_BASEADDR { MODELPARAM_VALUE.C_s00_axi_BASEADDR PARAM_VALUE.C_s00_axi_BASEADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_s00_axi_BASEADDR}] ${MODELPARAM_VALUE.C_s00_axi_BASEADDR}
}

