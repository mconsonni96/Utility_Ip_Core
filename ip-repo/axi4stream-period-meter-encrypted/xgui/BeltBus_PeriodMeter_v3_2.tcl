# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set 1 [ipgui::add_page $IPINST -name "1" -display_name {Period Meter}]
  #Adding Group
  set Belt-Bus_Parameters [ipgui::add_group $IPINST -name "Belt-Bus Parameters" -parent ${1}]
  set_property tooltip {Belt-Bus Parameters} ${Belt-Bus_Parameters}
  set BIT_NUM_CH [ipgui::add_param $IPINST -name "BIT_NUM_CH" -parent ${Belt-Bus_Parameters}]
  set_property tooltip {Variable that sets the dimension of the number of channel field} ${BIT_NUM_CH}
  set BIT_FID [ipgui::add_param $IPINST -name "BIT_FID" -parent ${Belt-Bus_Parameters}]
  set_property tooltip {Variable that sets the dimension of the fid field} ${BIT_FID}
  set BIT_COARSE [ipgui::add_param $IPINST -name "BIT_COARSE" -parent ${Belt-Bus_Parameters}]
  set_property tooltip {Variable that sets the dimension of the coarse field} ${BIT_COARSE}
  set BIT_RESOLUTION [ipgui::add_param $IPINST -name "BIT_RESOLUTION" -parent ${Belt-Bus_Parameters}]
  set_property tooltip {Variable that sets the dimension of the resolution field} ${BIT_RESOLUTION}

  #Adding Group
  set Period_Settings [ipgui::add_group $IPINST -name "Period Settings" -parent ${1}]
  set NUN_CH_PERIOD [ipgui::add_param $IPINST -name "NUN_CH_PERIOD" -parent ${Period_Settings}]
  set_property tooltip {Channel over compute the Period} ${NUN_CH_PERIOD}
  set DIVIDER [ipgui::add_param $IPINST -name "DIVIDER" -parent ${Period_Settings} -widget comboBox]
  set_property tooltip {tThe avaraged value is divided by Divider} ${DIVIDER}
  set BIT_OVERFLOW [ipgui::add_param $IPINST -name "BIT_OVERFLOW" -parent ${Period_Settings}]
  set_property tooltip {Variable that sets the dimension of the overflow field} ${BIT_OVERFLOW}

  #Adding Group
  set Average_Settings [ipgui::add_group $IPINST -name "Average Settings" -parent ${1}]
  set FILTER_SEL [ipgui::add_param $IPINST -name "FILTER_SEL" -parent ${Average_Settings} -widget comboBox]
  set_property tooltip {Choice between the gated_integrator filter and the moving_average filter} ${FILTER_SEL}
  set NUMBER_OF_SAMPLE [ipgui::add_param $IPINST -name "NUMBER_OF_SAMPLE" -parent ${Average_Settings} -widget comboBox]
  set_property tooltip {Number of samples collected for the filter} ${NUMBER_OF_SAMPLE}


  set TIMEOUT_CLK_CYC [ipgui::add_param $IPINST -name "TIMEOUT_CLK_CYC"]
  set_property tooltip {The number of clock cycles without a measure after wich the period is considered invalid (m00_data = 0)} ${TIMEOUT_CLK_CYC}
  ipgui::add_param $IPINST -name "TIMEOUT_CNT_WIDTH"

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

proc update_PARAM_VALUE.DIVIDER { PARAM_VALUE.DIVIDER } {
	# Procedure called to update DIVIDER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DIVIDER { PARAM_VALUE.DIVIDER } {
	# Procedure called to validate DIVIDER
	return true
}

proc update_PARAM_VALUE.FILTER_SEL { PARAM_VALUE.FILTER_SEL } {
	# Procedure called to update FILTER_SEL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FILTER_SEL { PARAM_VALUE.FILTER_SEL } {
	# Procedure called to validate FILTER_SEL
	return true
}

proc update_PARAM_VALUE.FILTER_SEL_INT { PARAM_VALUE.FILTER_SEL_INT } {
	# Procedure called to update FILTER_SEL_INT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FILTER_SEL_INT { PARAM_VALUE.FILTER_SEL_INT } {
	# Procedure called to validate FILTER_SEL_INT
	return true
}

proc update_PARAM_VALUE.NUMBER_OF_SAMPLE { PARAM_VALUE.NUMBER_OF_SAMPLE } {
	# Procedure called to update NUMBER_OF_SAMPLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_OF_SAMPLE { PARAM_VALUE.NUMBER_OF_SAMPLE } {
	# Procedure called to validate NUMBER_OF_SAMPLE
	return true
}

proc update_PARAM_VALUE.NUN_CH_PERIOD { PARAM_VALUE.NUN_CH_PERIOD } {
	# Procedure called to update NUN_CH_PERIOD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUN_CH_PERIOD { PARAM_VALUE.NUN_CH_PERIOD } {
	# Procedure called to validate NUN_CH_PERIOD
	return true
}

proc update_PARAM_VALUE.TIMEOUT_CLK_CYC { PARAM_VALUE.TIMEOUT_CLK_CYC } {
	# Procedure called to update TIMEOUT_CLK_CYC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TIMEOUT_CLK_CYC { PARAM_VALUE.TIMEOUT_CLK_CYC } {
	# Procedure called to validate TIMEOUT_CLK_CYC
	return true
}

proc update_PARAM_VALUE.TIMEOUT_CNT_WIDTH { PARAM_VALUE.TIMEOUT_CNT_WIDTH } {
	# Procedure called to update TIMEOUT_CNT_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TIMEOUT_CNT_WIDTH { PARAM_VALUE.TIMEOUT_CNT_WIDTH } {
	# Procedure called to validate TIMEOUT_CNT_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.FILTER_SEL_INT { MODELPARAM_VALUE.FILTER_SEL_INT PARAM_VALUE.FILTER_SEL_INT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILTER_SEL_INT}] ${MODELPARAM_VALUE.FILTER_SEL_INT}
}

proc update_MODELPARAM_VALUE.NUN_CH_PERIOD { MODELPARAM_VALUE.NUN_CH_PERIOD PARAM_VALUE.NUN_CH_PERIOD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUN_CH_PERIOD}] ${MODELPARAM_VALUE.NUN_CH_PERIOD}
}

proc update_MODELPARAM_VALUE.NUMBER_OF_SAMPLE { MODELPARAM_VALUE.NUMBER_OF_SAMPLE PARAM_VALUE.NUMBER_OF_SAMPLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_OF_SAMPLE}] ${MODELPARAM_VALUE.NUMBER_OF_SAMPLE}
}

proc update_MODELPARAM_VALUE.DIVIDER { MODELPARAM_VALUE.DIVIDER PARAM_VALUE.DIVIDER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DIVIDER}] ${MODELPARAM_VALUE.DIVIDER}
}

proc update_MODELPARAM_VALUE.FILTER_SEL { MODELPARAM_VALUE.FILTER_SEL PARAM_VALUE.FILTER_SEL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILTER_SEL}] ${MODELPARAM_VALUE.FILTER_SEL}
}

proc update_MODELPARAM_VALUE.BIT_OVERFLOW { MODELPARAM_VALUE.BIT_OVERFLOW PARAM_VALUE.BIT_OVERFLOW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_OVERFLOW}] ${MODELPARAM_VALUE.BIT_OVERFLOW}
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

proc update_MODELPARAM_VALUE.TIMEOUT_CLK_CYC { MODELPARAM_VALUE.TIMEOUT_CLK_CYC PARAM_VALUE.TIMEOUT_CLK_CYC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TIMEOUT_CLK_CYC}] ${MODELPARAM_VALUE.TIMEOUT_CLK_CYC}
}

proc update_MODELPARAM_VALUE.TIMEOUT_CNT_WIDTH { MODELPARAM_VALUE.TIMEOUT_CNT_WIDTH PARAM_VALUE.TIMEOUT_CNT_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TIMEOUT_CNT_WIDTH}] ${MODELPARAM_VALUE.TIMEOUT_CNT_WIDTH}
}

