# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "AXI4_LENGTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "BIT_CALIBRATION" -parent ${Page_0}
  ipgui::add_param $IPINST -name "BIT_RESOLUTION" -parent ${Page_0}
  ipgui::add_param $IPINST -name "BIT_UNCALIBRATED" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_ARUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_AWUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_BUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_ID_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_RUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_WUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEBUG_MODE_CC" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DEBUG_MODE_CT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ENABLE_SLICE_REGISTERS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MEMORY_PRIMITIVE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SAVE_BIT" -parent ${Page_0}


}

proc update_PARAM_VALUE.AXI4_LENGTH { PARAM_VALUE.AXI4_LENGTH } {
	# Procedure called to update AXI4_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI4_LENGTH { PARAM_VALUE.AXI4_LENGTH } {
	# Procedure called to validate AXI4_LENGTH
	return true
}

proc update_PARAM_VALUE.BIT_CALIBRATION { PARAM_VALUE.BIT_CALIBRATION } {
	# Procedure called to update BIT_CALIBRATION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_CALIBRATION { PARAM_VALUE.BIT_CALIBRATION } {
	# Procedure called to validate BIT_CALIBRATION
	return true
}

proc update_PARAM_VALUE.BIT_RESOLUTION { PARAM_VALUE.BIT_RESOLUTION } {
	# Procedure called to update BIT_RESOLUTION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_RESOLUTION { PARAM_VALUE.BIT_RESOLUTION } {
	# Procedure called to validate BIT_RESOLUTION
	return true
}

proc update_PARAM_VALUE.BIT_UNCALIBRATED { PARAM_VALUE.BIT_UNCALIBRATED } {
	# Procedure called to update BIT_UNCALIBRATED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_UNCALIBRATED { PARAM_VALUE.BIT_UNCALIBRATED } {
	# Procedure called to validate BIT_UNCALIBRATED
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ARUSER_WIDTH { PARAM_VALUE.C_S00_AXI_ARUSER_WIDTH } {
	# Procedure called to update C_S00_AXI_ARUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ARUSER_WIDTH { PARAM_VALUE.C_S00_AXI_ARUSER_WIDTH } {
	# Procedure called to validate C_S00_AXI_ARUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_AWUSER_WIDTH { PARAM_VALUE.C_S00_AXI_AWUSER_WIDTH } {
	# Procedure called to update C_S00_AXI_AWUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_AWUSER_WIDTH { PARAM_VALUE.C_S00_AXI_AWUSER_WIDTH } {
	# Procedure called to validate C_S00_AXI_AWUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_BUSER_WIDTH { PARAM_VALUE.C_S00_AXI_BUSER_WIDTH } {
	# Procedure called to update C_S00_AXI_BUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_BUSER_WIDTH { PARAM_VALUE.C_S00_AXI_BUSER_WIDTH } {
	# Procedure called to validate C_S00_AXI_BUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ID_WIDTH { PARAM_VALUE.C_S00_AXI_ID_WIDTH } {
	# Procedure called to update C_S00_AXI_ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ID_WIDTH { PARAM_VALUE.C_S00_AXI_ID_WIDTH } {
	# Procedure called to validate C_S00_AXI_ID_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_RUSER_WIDTH { PARAM_VALUE.C_S00_AXI_RUSER_WIDTH } {
	# Procedure called to update C_S00_AXI_RUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_RUSER_WIDTH { PARAM_VALUE.C_S00_AXI_RUSER_WIDTH } {
	# Procedure called to validate C_S00_AXI_RUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_WUSER_WIDTH { PARAM_VALUE.C_S00_AXI_WUSER_WIDTH } {
	# Procedure called to update C_S00_AXI_WUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_WUSER_WIDTH { PARAM_VALUE.C_S00_AXI_WUSER_WIDTH } {
	# Procedure called to validate C_S00_AXI_WUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.DEBUG_MODE_CC { PARAM_VALUE.DEBUG_MODE_CC } {
	# Procedure called to update DEBUG_MODE_CC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEBUG_MODE_CC { PARAM_VALUE.DEBUG_MODE_CC } {
	# Procedure called to validate DEBUG_MODE_CC
	return true
}

proc update_PARAM_VALUE.DEBUG_MODE_CT { PARAM_VALUE.DEBUG_MODE_CT } {
	# Procedure called to update DEBUG_MODE_CT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEBUG_MODE_CT { PARAM_VALUE.DEBUG_MODE_CT } {
	# Procedure called to validate DEBUG_MODE_CT
	return true
}

proc update_PARAM_VALUE.ENABLE_SLICE_REGISTERS { PARAM_VALUE.ENABLE_SLICE_REGISTERS } {
	# Procedure called to update ENABLE_SLICE_REGISTERS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ENABLE_SLICE_REGISTERS { PARAM_VALUE.ENABLE_SLICE_REGISTERS } {
	# Procedure called to validate ENABLE_SLICE_REGISTERS
	return true
}

proc update_PARAM_VALUE.MEMORY_PRIMITIVE { PARAM_VALUE.MEMORY_PRIMITIVE } {
	# Procedure called to update MEMORY_PRIMITIVE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MEMORY_PRIMITIVE { PARAM_VALUE.MEMORY_PRIMITIVE } {
	# Procedure called to validate MEMORY_PRIMITIVE
	return true
}

proc update_PARAM_VALUE.SAVE_BIT { PARAM_VALUE.SAVE_BIT } {
	# Procedure called to update SAVE_BIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SAVE_BIT { PARAM_VALUE.SAVE_BIT } {
	# Procedure called to validate SAVE_BIT
	return true
}


proc update_MODELPARAM_VALUE.ENABLE_SLICE_REGISTERS { MODELPARAM_VALUE.ENABLE_SLICE_REGISTERS PARAM_VALUE.ENABLE_SLICE_REGISTERS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ENABLE_SLICE_REGISTERS}] ${MODELPARAM_VALUE.ENABLE_SLICE_REGISTERS}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ID_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ID_WIDTH PARAM_VALUE.C_S00_AXI_ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ID_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ID_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_AWUSER_WIDTH { MODELPARAM_VALUE.C_S00_AXI_AWUSER_WIDTH PARAM_VALUE.C_S00_AXI_AWUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_AWUSER_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_AWUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ARUSER_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ARUSER_WIDTH PARAM_VALUE.C_S00_AXI_ARUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ARUSER_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ARUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_WUSER_WIDTH { MODELPARAM_VALUE.C_S00_AXI_WUSER_WIDTH PARAM_VALUE.C_S00_AXI_WUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_WUSER_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_WUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_RUSER_WIDTH { MODELPARAM_VALUE.C_S00_AXI_RUSER_WIDTH PARAM_VALUE.C_S00_AXI_RUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_RUSER_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_RUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_BUSER_WIDTH { MODELPARAM_VALUE.C_S00_AXI_BUSER_WIDTH PARAM_VALUE.C_S00_AXI_BUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_BUSER_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_BUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.DEBUG_MODE_CT { MODELPARAM_VALUE.DEBUG_MODE_CT PARAM_VALUE.DEBUG_MODE_CT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEBUG_MODE_CT}] ${MODELPARAM_VALUE.DEBUG_MODE_CT}
}

proc update_MODELPARAM_VALUE.DEBUG_MODE_CC { MODELPARAM_VALUE.DEBUG_MODE_CC PARAM_VALUE.DEBUG_MODE_CC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEBUG_MODE_CC}] ${MODELPARAM_VALUE.DEBUG_MODE_CC}
}

proc update_MODELPARAM_VALUE.BIT_UNCALIBRATED { MODELPARAM_VALUE.BIT_UNCALIBRATED PARAM_VALUE.BIT_UNCALIBRATED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_UNCALIBRATED}] ${MODELPARAM_VALUE.BIT_UNCALIBRATED}
}

proc update_MODELPARAM_VALUE.SAVE_BIT { MODELPARAM_VALUE.SAVE_BIT PARAM_VALUE.SAVE_BIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SAVE_BIT}] ${MODELPARAM_VALUE.SAVE_BIT}
}

proc update_MODELPARAM_VALUE.BIT_CALIBRATION { MODELPARAM_VALUE.BIT_CALIBRATION PARAM_VALUE.BIT_CALIBRATION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_CALIBRATION}] ${MODELPARAM_VALUE.BIT_CALIBRATION}
}

proc update_MODELPARAM_VALUE.BIT_RESOLUTION { MODELPARAM_VALUE.BIT_RESOLUTION PARAM_VALUE.BIT_RESOLUTION } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_RESOLUTION}] ${MODELPARAM_VALUE.BIT_RESOLUTION}
}

proc update_MODELPARAM_VALUE.AXI4_LENGTH { MODELPARAM_VALUE.AXI4_LENGTH PARAM_VALUE.AXI4_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI4_LENGTH}] ${MODELPARAM_VALUE.AXI4_LENGTH}
}

proc update_MODELPARAM_VALUE.MEMORY_PRIMITIVE { MODELPARAM_VALUE.MEMORY_PRIMITIVE PARAM_VALUE.MEMORY_PRIMITIVE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MEMORY_PRIMITIVE}] ${MODELPARAM_VALUE.MEMORY_PRIMITIVE}
}
