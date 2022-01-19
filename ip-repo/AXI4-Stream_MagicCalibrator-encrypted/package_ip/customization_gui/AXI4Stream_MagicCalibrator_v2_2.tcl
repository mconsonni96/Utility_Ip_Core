# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Magic_Calibrator [ipgui::add_page $IPINST -name "Magic Calibrator"]
  #Adding Group
  set Calibrator_Dimension [ipgui::add_group $IPINST -name "Calibrator Dimension" -parent ${Magic_Calibrator} -display_name {Calibrator Settings}]
  set_property tooltip {Calibrator Settings} ${Calibrator_Dimension}
  set SAVE_BIT [ipgui::add_param $IPINST -name "SAVE_BIT" -parent ${Calibrator_Dimension}]
  set_property tooltip {Use 2^BIT_CALIBARTION (BIT_CALIBARTION +1 bits) if FALSE or 2^BIT_CALIBARTION -1 (BIT_CALIBARTION bits) if TRUE samples for performing the calibration} ${SAVE_BIT}
  set BIT_CALIBRATION [ipgui::add_param $IPINST -name "BIT_CALIBRATION" -parent ${Calibrator_Dimension}]
  set_property tooltip {Bit dimension of the calibration table} ${BIT_CALIBRATION}
  set INTEGRATION_METHOD [ipgui::add_param $IPINST -name "INTEGRATION_METHOD" -parent ${Calibrator_Dimension} -widget comboBox]
  set_property tooltip {integration method used in magic Calibrator} ${INTEGRATION_METHOD}

  #Adding Group
  set Timestamp_Dimension [ipgui::add_group $IPINST -name "Timestamp Dimension" -parent ${Magic_Calibrator}]
  set_property tooltip {Timestamp Dimension} ${Timestamp_Dimension}
  set BIT_FID [ipgui::add_param $IPINST -name "BIT_FID" -parent ${Timestamp_Dimension}]
  set_property tooltip {Bit reserver to the FID of the Belt Bus used to identify properly the timestamps} ${BIT_FID}
  set BIT_COARSE [ipgui::add_param $IPINST -name "BIT_COARSE" -parent ${Timestamp_Dimension}]
  set_property tooltip {Bit Coarse Counter dimension} ${BIT_COARSE}
  set BIT_RESOLUTION [ipgui::add_param $IPINST -name "BIT_RESOLUTION" -parent ${Timestamp_Dimension}]
  set_property tooltip {Bit used for the fine part of the timestamp} ${BIT_RESOLUTION}
  set BIT_UNCALIBRATED [ipgui::add_param $IPINST -name "BIT_UNCALIBRATED" -parent ${Timestamp_Dimension}]
  set_property tooltip {Bit reserver to the FID of the Belt Bus used to identify properly the timestamps} ${BIT_UNCALIBRATED}

  #Adding Group
  set Debug_Mode [ipgui::add_group $IPINST -name "Debug Mode" -parent ${Magic_Calibrator}]
  set_property tooltip {Debug Mode} ${Debug_Mode}
  set DEBUG_MODE_CT [ipgui::add_param $IPINST -name "DEBUG_MODE_CT" -parent ${Debug_Mode}]
  set_property tooltip {Allow to tune in real-time the calibration and read the CalibTable} ${DEBUG_MODE_CT}
  set DEBUG_MODE_CC [ipgui::add_param $IPINST -name "DEBUG_MODE_CC" -parent ${Debug_Mode}]
  set_property tooltip {Allow to tune in real-time the calibration and read the Charact Curve} ${DEBUG_MODE_CC}



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

proc update_PARAM_VALUE.INTEGRATION_METHOD { PARAM_VALUE.INTEGRATION_METHOD } {
	# Procedure called to update INTEGRATION_METHOD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INTEGRATION_METHOD { PARAM_VALUE.INTEGRATION_METHOD } {
	# Procedure called to validate INTEGRATION_METHOD
	return true
}

proc update_PARAM_VALUE.SAVE_BIT { PARAM_VALUE.SAVE_BIT } {
	# Procedure called to update SAVE_BIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SAVE_BIT { PARAM_VALUE.SAVE_BIT } {
	# Procedure called to validate SAVE_BIT
	return true
}


proc update_MODELPARAM_VALUE.BIT_UNCALIBRATED { MODELPARAM_VALUE.BIT_UNCALIBRATED PARAM_VALUE.BIT_UNCALIBRATED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_UNCALIBRATED}] ${MODELPARAM_VALUE.BIT_UNCALIBRATED}
}

proc update_MODELPARAM_VALUE.BIT_COARSE { MODELPARAM_VALUE.BIT_COARSE PARAM_VALUE.BIT_COARSE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_COARSE}] ${MODELPARAM_VALUE.BIT_COARSE}
}

proc update_MODELPARAM_VALUE.BIT_FID { MODELPARAM_VALUE.BIT_FID PARAM_VALUE.BIT_FID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_FID}] ${MODELPARAM_VALUE.BIT_FID}
}

proc update_MODELPARAM_VALUE.INTEGRATION_METHOD { MODELPARAM_VALUE.INTEGRATION_METHOD PARAM_VALUE.INTEGRATION_METHOD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INTEGRATION_METHOD}] ${MODELPARAM_VALUE.INTEGRATION_METHOD}
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

proc update_MODELPARAM_VALUE.DEBUG_MODE_CT { MODELPARAM_VALUE.DEBUG_MODE_CT PARAM_VALUE.DEBUG_MODE_CT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEBUG_MODE_CT}] ${MODELPARAM_VALUE.DEBUG_MODE_CT}
}

proc update_MODELPARAM_VALUE.DEBUG_MODE_CC { MODELPARAM_VALUE.DEBUG_MODE_CC PARAM_VALUE.DEBUG_MODE_CC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEBUG_MODE_CC}] ${MODELPARAM_VALUE.DEBUG_MODE_CC}
}

proc update_MODELPARAM_VALUE.AXI4_LENGTH { MODELPARAM_VALUE.AXI4_LENGTH PARAM_VALUE.AXI4_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI4_LENGTH}] ${MODELPARAM_VALUE.AXI4_LENGTH}
}
