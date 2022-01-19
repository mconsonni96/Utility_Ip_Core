
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/InputLogic_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Input_Logic [ipgui::add_page $IPINST -name "Input Logic"]
  set INPUT_BUFFER_TYPE [ipgui::add_param $IPINST -name "INPUT_BUFFER_TYPE" -parent ${Input_Logic} -widget comboBox]
  set_property tooltip {Choose between Single-Ended (IBUF) and Fully-Differential (IBUFDS) input buffer} ${INPUT_BUFFER_TYPE}
  set TUNING_MODE [ipgui::add_param $IPINST -name "TUNING_MODE" -parent ${Input_Logic}]
  set_property tooltip {Choice between generic and port, if TRUE we choose the signal coming from the port, if FALSE we choose the value of the generic } ${TUNING_MODE}
  set CALIB_EVENT [ipgui::add_param $IPINST -name "CALIB_EVENT" -parent ${Input_Logic} -widget comboBox]
  set_property tooltip {Choose how to generate CalibEvent} ${CALIB_EVENT}
  set EDGE_TRIGGER_INIT [ipgui::add_param $IPINST -name "EDGE_TRIGGER_INIT" -parent ${Input_Logic} -widget comboBox]
  set_property tooltip {Choose the edge trigger of AsyncEventIn} ${EDGE_TRIGGER_INIT}
  #Adding Group
  set Stretcher [ipgui::add_group $IPINST -name "Stretcher" -parent ${Input_Logic}]
  set BIT_STRETCH_LENGTH [ipgui::add_param $IPINST -name "BIT_STRETCH_LENGTH" -parent ${Stretcher}]
  set_property tooltip {Bit length of StretchLength} ${BIT_STRETCH_LENGTH}
  set STRETCH_LENGTH_INIT [ipgui::add_param $IPINST -name "STRETCH_LENGTH_INIT" -parent ${Stretcher}]
  set_property tooltip {Duration of the stretched pulse, multiple of clock pulses} ${STRETCH_LENGTH_INIT}

  #Adding Group
  set Divider [ipgui::add_group $IPINST -name "Divider" -parent ${Input_Logic}]
  set BIT_DIVIDER [ipgui::add_param $IPINST -name "BIT_DIVIDER" -parent ${Divider}]
  set_property tooltip {Bit length of the Divider} ${BIT_DIVIDER}
  ipgui::add_param $IPINST -name "DIVIDER_INIT" -parent ${Divider}



}

proc update_PARAM_VALUE.DIVIDER_INIT { PARAM_VALUE.DIVIDER_INIT PARAM_VALUE.BIT_DIVIDER } {
	# Procedure called to update DIVIDER_INIT when any of the dependent parameters in the arguments change
	
	set DIVIDER_INIT ${PARAM_VALUE.DIVIDER_INIT}
	set BIT_DIVIDER ${PARAM_VALUE.BIT_DIVIDER}
	set values(BIT_DIVIDER) [get_property value $BIT_DIVIDER]
	if { [gen_USERPARAMETER_DIVIDER_INIT_ENABLEMENT $values(BIT_DIVIDER)] } {
		set_property enabled true $DIVIDER_INIT
	} else {
		set_property enabled false $DIVIDER_INIT
		set_property value [gen_USERPARAMETER_DIVIDER_INIT_VALUE $values(BIT_DIVIDER)] $DIVIDER_INIT
	}
}

proc validate_PARAM_VALUE.DIVIDER_INIT { PARAM_VALUE.DIVIDER_INIT } {
	# Procedure called to validate DIVIDER_INIT
	return true
}

proc update_PARAM_VALUE.STRETCH_LENGTH_INIT { PARAM_VALUE.STRETCH_LENGTH_INIT PARAM_VALUE.BIT_STRETCH_LENGTH } {
	# Procedure called to update STRETCH_LENGTH_INIT when any of the dependent parameters in the arguments change
	
	set STRETCH_LENGTH_INIT ${PARAM_VALUE.STRETCH_LENGTH_INIT}
	set BIT_STRETCH_LENGTH ${PARAM_VALUE.BIT_STRETCH_LENGTH}
	set values(BIT_STRETCH_LENGTH) [get_property value $BIT_STRETCH_LENGTH]
	if { [gen_USERPARAMETER_STRETCH_LENGTH_INIT_ENABLEMENT $values(BIT_STRETCH_LENGTH)] } {
		set_property enabled true $STRETCH_LENGTH_INIT
	} else {
		set_property enabled false $STRETCH_LENGTH_INIT
	}
}

proc validate_PARAM_VALUE.STRETCH_LENGTH_INIT { PARAM_VALUE.STRETCH_LENGTH_INIT } {
	# Procedure called to validate STRETCH_LENGTH_INIT
	return true
}

proc update_PARAM_VALUE.BIT_DIVIDER { PARAM_VALUE.BIT_DIVIDER } {
	# Procedure called to update BIT_DIVIDER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_DIVIDER { PARAM_VALUE.BIT_DIVIDER } {
	# Procedure called to validate BIT_DIVIDER
	return true
}

proc update_PARAM_VALUE.BIT_STRETCH_LENGTH { PARAM_VALUE.BIT_STRETCH_LENGTH } {
	# Procedure called to update BIT_STRETCH_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_STRETCH_LENGTH { PARAM_VALUE.BIT_STRETCH_LENGTH } {
	# Procedure called to validate BIT_STRETCH_LENGTH
	return true
}

proc update_PARAM_VALUE.CALIB_EVENT { PARAM_VALUE.CALIB_EVENT } {
	# Procedure called to update CALIB_EVENT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CALIB_EVENT { PARAM_VALUE.CALIB_EVENT } {
	# Procedure called to validate CALIB_EVENT
	return true
}

proc update_PARAM_VALUE.EDGE_TRIGGER_INIT { PARAM_VALUE.EDGE_TRIGGER_INIT } {
	# Procedure called to update EDGE_TRIGGER_INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EDGE_TRIGGER_INIT { PARAM_VALUE.EDGE_TRIGGER_INIT } {
	# Procedure called to validate EDGE_TRIGGER_INIT
	return true
}

proc update_PARAM_VALUE.INPUT_BUFFER_TYPE { PARAM_VALUE.INPUT_BUFFER_TYPE } {
	# Procedure called to update INPUT_BUFFER_TYPE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INPUT_BUFFER_TYPE { PARAM_VALUE.INPUT_BUFFER_TYPE } {
	# Procedure called to validate INPUT_BUFFER_TYPE
	return true
}

proc update_PARAM_VALUE.TUNING_MODE { PARAM_VALUE.TUNING_MODE } {
	# Procedure called to update TUNING_MODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TUNING_MODE { PARAM_VALUE.TUNING_MODE } {
	# Procedure called to validate TUNING_MODE
	return true
}


proc update_MODELPARAM_VALUE.TUNING_MODE { MODELPARAM_VALUE.TUNING_MODE PARAM_VALUE.TUNING_MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TUNING_MODE}] ${MODELPARAM_VALUE.TUNING_MODE}
}

proc update_MODELPARAM_VALUE.EDGE_TRIGGER_INIT { MODELPARAM_VALUE.EDGE_TRIGGER_INIT PARAM_VALUE.EDGE_TRIGGER_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EDGE_TRIGGER_INIT}] ${MODELPARAM_VALUE.EDGE_TRIGGER_INIT}
}

proc update_MODELPARAM_VALUE.STRETCH_LENGTH_INIT { MODELPARAM_VALUE.STRETCH_LENGTH_INIT PARAM_VALUE.STRETCH_LENGTH_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.STRETCH_LENGTH_INIT}] ${MODELPARAM_VALUE.STRETCH_LENGTH_INIT}
}

proc update_MODELPARAM_VALUE.BIT_STRETCH_LENGTH { MODELPARAM_VALUE.BIT_STRETCH_LENGTH PARAM_VALUE.BIT_STRETCH_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_STRETCH_LENGTH}] ${MODELPARAM_VALUE.BIT_STRETCH_LENGTH}
}

proc update_MODELPARAM_VALUE.DIVIDER_INIT { MODELPARAM_VALUE.DIVIDER_INIT PARAM_VALUE.DIVIDER_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DIVIDER_INIT}] ${MODELPARAM_VALUE.DIVIDER_INIT}
}

proc update_MODELPARAM_VALUE.BIT_DIVIDER { MODELPARAM_VALUE.BIT_DIVIDER PARAM_VALUE.BIT_DIVIDER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_DIVIDER}] ${MODELPARAM_VALUE.BIT_DIVIDER}
}

proc update_MODELPARAM_VALUE.INPUT_BUFFER_TYPE { MODELPARAM_VALUE.INPUT_BUFFER_TYPE PARAM_VALUE.INPUT_BUFFER_TYPE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INPUT_BUFFER_TYPE}] ${MODELPARAM_VALUE.INPUT_BUFFER_TYPE}
}

proc update_MODELPARAM_VALUE.CALIB_EVENT { MODELPARAM_VALUE.CALIB_EVENT PARAM_VALUE.CALIB_EVENT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CALIB_EVENT}] ${MODELPARAM_VALUE.CALIB_EVENT}
}

