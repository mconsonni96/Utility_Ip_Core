
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/AXI4_TDC_Wrapper_v4_1.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Magic_Debugger [ipgui::add_page $IPINST -name "Magic Debugger" -display_name {Calibration tables readout}]
  #Adding Group
  set Uncalibrated_Dimension [ipgui::add_group $IPINST -name "Uncalibrated Dimension" -parent ${Magic_Debugger}]
  set BIT_UNCALIBRATED [ipgui::add_param $IPINST -name "BIT_UNCALIBRATED" -parent ${Uncalibrated_Dimension}]
  set_property tooltip {Bit reserver to the FID of the Belt Bus used to identify properly the timestamps} ${BIT_UNCALIBRATED}

  #Adding Group
  set Calibrated_Dimension [ipgui::add_group $IPINST -name "Calibrated Dimension" -parent ${Magic_Debugger}]
  set SAVE_BIT [ipgui::add_param $IPINST -name "SAVE_BIT" -parent ${Calibrated_Dimension}]
  set_property tooltip {Use 2^BIT_CALIBARTION (BIT_CALIBARTION +1 bits) if FALSE or 2^BIT_CALIBARTION -1 (BIT_CALIBARTION bits) if TRUE samples for performing the calibration} ${SAVE_BIT}
  set BIT_RESOLUTION [ipgui::add_param $IPINST -name "BIT_RESOLUTION" -parent ${Calibrated_Dimension}]
  set_property tooltip {Bit used for the fine part of the timestamp} ${BIT_RESOLUTION}
  set BIT_CALIBRATION [ipgui::add_param $IPINST -name "BIT_CALIBRATION" -parent ${Calibrated_Dimension}]
  set_property tooltip {Bit dimension of the calibration table} ${BIT_CALIBRATION}

  #Adding Group
  ipgui::add_group $IPINST -name "Axi Dimension" -parent ${Magic_Debugger}

  #Adding Group
  set Debug_Mode [ipgui::add_group $IPINST -name "Debug Mode" -parent ${Magic_Debugger}]
  set DEBUG_MODE_CT [ipgui::add_param $IPINST -name "DEBUG_MODE_CT" -parent ${Debug_Mode}]
  set_property tooltip {Allow to tune in real-time the calibration and read the CalibTable} ${DEBUG_MODE_CT}
  set DEBUG_MODE_CC [ipgui::add_param $IPINST -name "DEBUG_MODE_CC" -parent ${Debug_Mode}]
  set_property tooltip {Allow to tune in real-time the calibration and read the Charact Curve} ${DEBUG_MODE_CC}

  #Adding Group
  ipgui::add_group $IPINST -name "Module Address" -parent ${Magic_Debugger}


  #Adding Page
  set TDC_Properties [ipgui::add_page $IPINST -name "TDC Properties" -display_name {TDC Properties R/W}]
  set_property tooltip {TDC Properties R/W} ${TDC_Properties}
  ipgui::add_param $IPINST -name "PW_StretcherLength" -parent ${TDC_Properties}
  ipgui::add_param $IPINST -name "PW_Divider" -parent ${TDC_Properties}
  ipgui::add_param $IPINST -name "TDC_CHANNEL_N" -parent ${TDC_Properties}
  ipgui::add_param $IPINST -name "TDC_ENABLE_DEBUG_PORTS" -parent ${TDC_Properties}
  set TDC_DISABLE_DEBUG_PORTS_READOUT [ipgui::add_param $IPINST -name "TDC_DISABLE_DEBUG_PORTS_READOUT" -parent ${TDC_Properties}]
  set_property tooltip {This allows for optimization of unused ports, but values can not be read back from AXI} ${TDC_DISABLE_DEBUG_PORTS_READOUT}

  set C_S00_AXI_ADDR_ABS [ipgui::add_param $IPINST -name "C_S00_AXI_ADDR_ABS"]
  set_property tooltip {Starting address of Debugger Module} ${C_S00_AXI_ADDR_ABS}

}

proc update_PARAM_VALUE.TDC_DISABLE_DEBUG_PORTS_READOUT { PARAM_VALUE.TDC_DISABLE_DEBUG_PORTS_READOUT PARAM_VALUE.TDC_ENABLE_DEBUG_PORTS } {
	# Procedure called to update TDC_DISABLE_DEBUG_PORTS_READOUT when any of the dependent parameters in the arguments change
	
	set TDC_DISABLE_DEBUG_PORTS_READOUT ${PARAM_VALUE.TDC_DISABLE_DEBUG_PORTS_READOUT}
	set TDC_ENABLE_DEBUG_PORTS ${PARAM_VALUE.TDC_ENABLE_DEBUG_PORTS}
	set values(TDC_ENABLE_DEBUG_PORTS) [get_property value $TDC_ENABLE_DEBUG_PORTS]
	if { [gen_USERPARAMETER_TDC_DISABLE_DEBUG_PORTS_READOUT_ENABLEMENT $values(TDC_ENABLE_DEBUG_PORTS)] } {
		set_property enabled true $TDC_DISABLE_DEBUG_PORTS_READOUT
	} else {
		set_property enabled false $TDC_DISABLE_DEBUG_PORTS_READOUT
	}
}

proc validate_PARAM_VALUE.TDC_DISABLE_DEBUG_PORTS_READOUT { PARAM_VALUE.TDC_DISABLE_DEBUG_PORTS_READOUT } {
	# Procedure called to validate TDC_DISABLE_DEBUG_PORTS_READOUT
	return true
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

proc update_PARAM_VALUE.C_S00_AXI_ADDR_ABS { PARAM_VALUE.C_S00_AXI_ADDR_ABS } {
	# Procedure called to update C_S00_AXI_ADDR_ABS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_ABS { PARAM_VALUE.C_S00_AXI_ADDR_ABS } {
	# Procedure called to validate C_S00_AXI_ADDR_ABS
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

proc update_PARAM_VALUE.PW_Divider { PARAM_VALUE.PW_Divider } {
	# Procedure called to update PW_Divider when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PW_Divider { PARAM_VALUE.PW_Divider } {
	# Procedure called to validate PW_Divider
	return true
}

proc update_PARAM_VALUE.PW_StretcherLength { PARAM_VALUE.PW_StretcherLength } {
	# Procedure called to update PW_StretcherLength when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PW_StretcherLength { PARAM_VALUE.PW_StretcherLength } {
	# Procedure called to validate PW_StretcherLength
	return true
}

proc update_PARAM_VALUE.SAVE_BIT { PARAM_VALUE.SAVE_BIT } {
	# Procedure called to update SAVE_BIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SAVE_BIT { PARAM_VALUE.SAVE_BIT } {
	# Procedure called to validate SAVE_BIT
	return true
}

proc update_PARAM_VALUE.SELECTOR_WIDTH { PARAM_VALUE.SELECTOR_WIDTH } {
	# Procedure called to update SELECTOR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SELECTOR_WIDTH { PARAM_VALUE.SELECTOR_WIDTH } {
	# Procedure called to validate SELECTOR_WIDTH
	return true
}

proc update_PARAM_VALUE.TDC_CHANNEL_N { PARAM_VALUE.TDC_CHANNEL_N } {
	# Procedure called to update TDC_CHANNEL_N when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TDC_CHANNEL_N { PARAM_VALUE.TDC_CHANNEL_N } {
	# Procedure called to validate TDC_CHANNEL_N
	return true
}

proc update_PARAM_VALUE.TDC_CH_DEBUG_WPORT_WIDTH { PARAM_VALUE.TDC_CH_DEBUG_WPORT_WIDTH } {
	# Procedure called to update TDC_CH_DEBUG_WPORT_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TDC_CH_DEBUG_WPORT_WIDTH { PARAM_VALUE.TDC_CH_DEBUG_WPORT_WIDTH } {
	# Procedure called to validate TDC_CH_DEBUG_WPORT_WIDTH
	return true
}

proc update_PARAM_VALUE.TDC_CH_RPORT_WIDTH { PARAM_VALUE.TDC_CH_RPORT_WIDTH } {
	# Procedure called to update TDC_CH_RPORT_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TDC_CH_RPORT_WIDTH { PARAM_VALUE.TDC_CH_RPORT_WIDTH } {
	# Procedure called to validate TDC_CH_RPORT_WIDTH
	return true
}

proc update_PARAM_VALUE.TDC_CH_WPORT_WIDTH { PARAM_VALUE.TDC_CH_WPORT_WIDTH } {
	# Procedure called to update TDC_CH_WPORT_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TDC_CH_WPORT_WIDTH { PARAM_VALUE.TDC_CH_WPORT_WIDTH } {
	# Procedure called to validate TDC_CH_WPORT_WIDTH
	return true
}

proc update_PARAM_VALUE.TDC_ENABLE_DEBUG_PORTS { PARAM_VALUE.TDC_ENABLE_DEBUG_PORTS } {
	# Procedure called to update TDC_ENABLE_DEBUG_PORTS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TDC_ENABLE_DEBUG_PORTS { PARAM_VALUE.TDC_ENABLE_DEBUG_PORTS } {
	# Procedure called to validate TDC_ENABLE_DEBUG_PORTS
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

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_ABS { MODELPARAM_VALUE.C_S00_AXI_ADDR_ABS PARAM_VALUE.C_S00_AXI_ADDR_ABS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_ABS}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_ABS}
}

proc update_MODELPARAM_VALUE.SELECTOR_WIDTH { MODELPARAM_VALUE.SELECTOR_WIDTH PARAM_VALUE.SELECTOR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SELECTOR_WIDTH}] ${MODELPARAM_VALUE.SELECTOR_WIDTH}
}

proc update_MODELPARAM_VALUE.TDC_CH_RPORT_WIDTH { MODELPARAM_VALUE.TDC_CH_RPORT_WIDTH PARAM_VALUE.TDC_CH_RPORT_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TDC_CH_RPORT_WIDTH}] ${MODELPARAM_VALUE.TDC_CH_RPORT_WIDTH}
}

proc update_MODELPARAM_VALUE.TDC_CH_WPORT_WIDTH { MODELPARAM_VALUE.TDC_CH_WPORT_WIDTH PARAM_VALUE.TDC_CH_WPORT_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TDC_CH_WPORT_WIDTH}] ${MODELPARAM_VALUE.TDC_CH_WPORT_WIDTH}
}

proc update_MODELPARAM_VALUE.TDC_CHANNEL_N { MODELPARAM_VALUE.TDC_CHANNEL_N PARAM_VALUE.TDC_CHANNEL_N } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TDC_CHANNEL_N}] ${MODELPARAM_VALUE.TDC_CHANNEL_N}
}

proc update_MODELPARAM_VALUE.PW_StretcherLength { MODELPARAM_VALUE.PW_StretcherLength PARAM_VALUE.PW_StretcherLength } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PW_StretcherLength}] ${MODELPARAM_VALUE.PW_StretcherLength}
}

proc update_MODELPARAM_VALUE.PW_Divider { MODELPARAM_VALUE.PW_Divider PARAM_VALUE.PW_Divider } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PW_Divider}] ${MODELPARAM_VALUE.PW_Divider}
}

proc update_MODELPARAM_VALUE.TDC_CH_DEBUG_WPORT_WIDTH { MODELPARAM_VALUE.TDC_CH_DEBUG_WPORT_WIDTH PARAM_VALUE.TDC_CH_DEBUG_WPORT_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TDC_CH_DEBUG_WPORT_WIDTH}] ${MODELPARAM_VALUE.TDC_CH_DEBUG_WPORT_WIDTH}
}

proc update_MODELPARAM_VALUE.TDC_ENABLE_DEBUG_PORTS { MODELPARAM_VALUE.TDC_ENABLE_DEBUG_PORTS PARAM_VALUE.TDC_ENABLE_DEBUG_PORTS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TDC_ENABLE_DEBUG_PORTS}] ${MODELPARAM_VALUE.TDC_ENABLE_DEBUG_PORTS}
}

proc update_MODELPARAM_VALUE.TDC_DISABLE_DEBUG_PORTS_READOUT { MODELPARAM_VALUE.TDC_DISABLE_DEBUG_PORTS_READOUT PARAM_VALUE.TDC_DISABLE_DEBUG_PORTS_READOUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TDC_DISABLE_DEBUG_PORTS_READOUT}] ${MODELPARAM_VALUE.TDC_DISABLE_DEBUG_PORTS_READOUT}
}

