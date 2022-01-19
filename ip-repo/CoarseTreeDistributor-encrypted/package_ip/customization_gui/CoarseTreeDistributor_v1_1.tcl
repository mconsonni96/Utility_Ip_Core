# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  set BIT_COARSE [ipgui::add_param $IPINST -name "BIT_COARSE" -parent ${Page_0}]
  set_property tooltip {Bit Coarse Counter dimension} ${BIT_COARSE}
  set CTD_COARSE_CNT_INIT [ipgui::add_param $IPINST -name "CTD_COARSE_CNT_INIT" -parent ${Page_0}]
  set_property tooltip {Initialization Value of the Coarse Counter (External to Channel TDC)} ${CTD_COARSE_CNT_INIT}
  ipgui::add_param $IPINST -name "NUMBER_OF_OUTPUT" -parent ${Page_0}
  #Adding Group
  set Max_Output_Engine_Pipeline [ipgui::add_group $IPINST -name "Max Output Engine Pipeline" -parent ${Page_0}]
  set MAX_OUTPUT_ENGINE_PIPELINE_0 [ipgui::add_param $IPINST -name "MAX_OUTPUT_ENGINE_PIPELINE_0" -parent ${Max_Output_Engine_Pipeline}]
  set_property tooltip {This generic allows us to select the max number of outputs per stage} ${MAX_OUTPUT_ENGINE_PIPELINE_0}
  set MAX_OUTPUT_ENGINE_PIPELINE_1 [ipgui::add_param $IPINST -name "MAX_OUTPUT_ENGINE_PIPELINE_1" -parent ${Max_Output_Engine_Pipeline}]
  set_property tooltip {This generic allows us to select the max number of outputs per stage} ${MAX_OUTPUT_ENGINE_PIPELINE_1}
  set MAX_OUTPUT_ENGINE_PIPELINE_2 [ipgui::add_param $IPINST -name "MAX_OUTPUT_ENGINE_PIPELINE_2" -parent ${Max_Output_Engine_Pipeline}]
  set_property tooltip {This generic allows us to select the max number of outputs per stage} ${MAX_OUTPUT_ENGINE_PIPELINE_2}
  set MAX_OUTPUT_ENGINE_PIPELINE_3 [ipgui::add_param $IPINST -name "MAX_OUTPUT_ENGINE_PIPELINE_3" -parent ${Max_Output_Engine_Pipeline}]
  set_property tooltip {This generic allows us to select the max number of outputs per stage} ${MAX_OUTPUT_ENGINE_PIPELINE_3}



}

proc update_PARAM_VALUE.BIT_COARSE { PARAM_VALUE.BIT_COARSE } {
	# Procedure called to update BIT_COARSE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_COARSE { PARAM_VALUE.BIT_COARSE } {
	# Procedure called to validate BIT_COARSE
	return true
}

proc update_PARAM_VALUE.CTD_COARSE_CNT_INIT { PARAM_VALUE.CTD_COARSE_CNT_INIT } {
	# Procedure called to update CTD_COARSE_CNT_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CTD_COARSE_CNT_INIT { PARAM_VALUE.CTD_COARSE_CNT_INIT } {
	# Procedure called to validate CTD_COARSE_CNT_INIT
	return true
}

proc update_PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0 { PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0 } {
	# Procedure called to update MAX_OUTPUT_ENGINE_PIPELINE_0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0 { PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0 } {
	# Procedure called to validate MAX_OUTPUT_ENGINE_PIPELINE_0
	return true
}

proc update_PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1 { PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1 } {
	# Procedure called to update MAX_OUTPUT_ENGINE_PIPELINE_1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1 { PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1 } {
	# Procedure called to validate MAX_OUTPUT_ENGINE_PIPELINE_1
	return true
}

proc update_PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2 { PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2 } {
	# Procedure called to update MAX_OUTPUT_ENGINE_PIPELINE_2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2 { PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2 } {
	# Procedure called to validate MAX_OUTPUT_ENGINE_PIPELINE_2
	return true
}

proc update_PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3 { PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3 } {
	# Procedure called to update MAX_OUTPUT_ENGINE_PIPELINE_3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3 { PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3 } {
	# Procedure called to validate MAX_OUTPUT_ENGINE_PIPELINE_3
	return true
}

proc update_PARAM_VALUE.NUMBER_OF_OUTPUT { PARAM_VALUE.NUMBER_OF_OUTPUT } {
	# Procedure called to update NUMBER_OF_OUTPUT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_OF_OUTPUT { PARAM_VALUE.NUMBER_OF_OUTPUT } {
	# Procedure called to validate NUMBER_OF_OUTPUT
	return true
}


proc update_MODELPARAM_VALUE.CTD_COARSE_CNT_INIT { MODELPARAM_VALUE.CTD_COARSE_CNT_INIT PARAM_VALUE.CTD_COARSE_CNT_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CTD_COARSE_CNT_INIT}] ${MODELPARAM_VALUE.CTD_COARSE_CNT_INIT}
}

proc update_MODELPARAM_VALUE.BIT_COARSE { MODELPARAM_VALUE.BIT_COARSE PARAM_VALUE.BIT_COARSE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_COARSE}] ${MODELPARAM_VALUE.BIT_COARSE}
}

proc update_MODELPARAM_VALUE.NUMBER_OF_OUTPUT { MODELPARAM_VALUE.NUMBER_OF_OUTPUT PARAM_VALUE.NUMBER_OF_OUTPUT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_OF_OUTPUT}] ${MODELPARAM_VALUE.NUMBER_OF_OUTPUT}
}

proc update_MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0 { MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0 PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0}] ${MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_0}
}

proc update_MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1 { MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1 PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1}] ${MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_1}
}

proc update_MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2 { MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2 PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2}] ${MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_2}
}

proc update_MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3 { MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3 PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3}] ${MODELPARAM_VALUE.MAX_OUTPUT_ENGINE_PIPELINE_3}
}

