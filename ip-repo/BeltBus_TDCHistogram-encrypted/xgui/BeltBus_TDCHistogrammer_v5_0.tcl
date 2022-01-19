# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Histogrammer [ipgui::add_page $IPINST -name "Histogrammer"]
  #Adding Group
  set TDC_settings [ipgui::add_group $IPINST -name "TDC settings" -parent ${Histogrammer}]
  ipgui::add_param $IPINST -name "NUM_CH" -parent ${TDC_settings}
  ipgui::add_param $IPINST -name "BIT_NUM_CH" -parent ${TDC_settings}
  ipgui::add_param $IPINST -name "BIT_FID" -parent ${TDC_settings}
  ipgui::add_param $IPINST -name "BIT_COARSE" -parent ${TDC_settings}
  ipgui::add_param $IPINST -name "BIT_FINE" -parent ${TDC_settings}

  #Adding Group
  set Histogram_settings [ipgui::add_group $IPINST -name "Histogram settings" -parent ${Histogrammer}]
  ipgui::add_param $IPINST -name "BIT_OVERFLOW" -parent ${Histogram_settings}
  ipgui::add_param $IPINST -name "BIN_DATA_WIDTH" -parent ${Histogram_settings}
  ipgui::add_param $IPINST -name "BIN_ADDR_WIDTH" -parent ${Histogram_settings}
  ipgui::add_param $IPINST -name "FUNC_MODE" -parent ${Histogram_settings} -widget comboBox
  ipgui::add_param $IPINST -name "ASYNC_CLOCK" -parent ${Histogram_settings}



}

proc update_PARAM_VALUE.ASYNC_CLOCK { PARAM_VALUE.ASYNC_CLOCK } {
	# Procedure called to update ASYNC_CLOCK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ASYNC_CLOCK { PARAM_VALUE.ASYNC_CLOCK } {
	# Procedure called to validate ASYNC_CLOCK
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

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_BASEADDRESS { PARAM_VALUE.C_S00_AXI_BASEADDRESS } {
	# Procedure called to update C_S00_AXI_BASEADDRESS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_BASEADDRESS { PARAM_VALUE.C_S00_AXI_BASEADDRESS } {
	# Procedure called to validate C_S00_AXI_BASEADDRESS
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_HIGHADDRESS { PARAM_VALUE.C_S00_AXI_HIGHADDRESS } {
	# Procedure called to update C_S00_AXI_HIGHADDRESS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_HIGHADDRESS { PARAM_VALUE.C_S00_AXI_HIGHADDRESS } {
	# Procedure called to validate C_S00_AXI_HIGHADDRESS
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

proc update_MODELPARAM_VALUE.ASYNC_CLOCK { MODELPARAM_VALUE.ASYNC_CLOCK PARAM_VALUE.ASYNC_CLOCK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ASYNC_CLOCK}] ${MODELPARAM_VALUE.ASYNC_CLOCK}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_BASEADDRESS { MODELPARAM_VALUE.C_S00_AXI_BASEADDRESS PARAM_VALUE.C_S00_AXI_BASEADDRESS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_BASEADDRESS}] ${MODELPARAM_VALUE.C_S00_AXI_BASEADDRESS}
}

proc update_MODELPARAM_VALUE.BIT_FID { MODELPARAM_VALUE.BIT_FID PARAM_VALUE.BIT_FID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_FID}] ${MODELPARAM_VALUE.BIT_FID}
}

