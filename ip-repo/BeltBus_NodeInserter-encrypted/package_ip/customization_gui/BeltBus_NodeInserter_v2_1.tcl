
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/BeltBus_NodeInserter_v1_2.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set NodeInserter [ipgui::add_page $IPINST -name "NodeInserter"]
  #Adding Group
  set Channel_number [ipgui::add_group $IPINST -name "Channel number" -parent ${NodeInserter}]
  set NUM_CH [ipgui::add_param $IPINST -name "NUM_CH" -parent ${Channel_number}]
  set_property tooltip {Number of channel} ${NUM_CH}
  set NUM_NODE [ipgui::add_param $IPINST -name "NUM_NODE" -parent ${Channel_number}]
  set_property tooltip {Node number} ${NUM_NODE}

  #Adding Group
  set Data [ipgui::add_group $IPINST -name "Data" -parent ${NodeInserter}]
  set BIT_NUM_CH [ipgui::add_param $IPINST -name "BIT_NUM_CH" -parent ${Data}]
  set_property tooltip {Number of bits used for the number of channel} ${BIT_NUM_CH}
  set BIT_FID [ipgui::add_param $IPINST -name "BIT_FID" -parent ${Data}]
  set_property tooltip {Number of bits of the Function ID} ${BIT_FID}
  set BIT_COARSE [ipgui::add_param $IPINST -name "BIT_COARSE" -parent ${Data}]
  set_property tooltip {Numbero of bits of the coarse counter} ${BIT_COARSE}
  set BIT_RESOLUTION [ipgui::add_param $IPINST -name "BIT_RESOLUTION" -parent ${Data}]
  set_property tooltip {Number of Bits used for sub-clock resolution} ${BIT_RESOLUTION}

  #Adding Group
  set Tunable_Generics [ipgui::add_group $IPINST -name "Tunable Generics" -parent ${NodeInserter}]
  set HOLD_ON_INTEGRAL [ipgui::add_param $IPINST -name "HOLD_ON_INTEGRAL" -parent ${Tunable_Generics}]
  set_property tooltip {Hold-On integral} ${HOLD_ON_INTEGRAL}
  set HOLD_ON_MIN_MOD [ipgui::add_param $IPINST -name "HOLD_ON_MIN_MOD" -parent ${Tunable_Generics}]
  set_property tooltip {Hold-On min mod} ${HOLD_ON_MIN_MOD}
  set HOLD_ON_SINGLE_NODE [ipgui::add_param $IPINST -name "HOLD_ON_SINGLE_NODE" -parent ${Tunable_Generics}]
  set_property tooltip {Hold-On Single Node} ${HOLD_ON_SINGLE_NODE}
  set INJECT_CYCLES [ipgui::add_param $IPINST -name "INJECT_CYCLES" -parent ${Tunable_Generics}]
  set_property tooltip {Inject Cycles} ${INJECT_CYCLES}
  set RETAIN_SINGLE_NODE [ipgui::add_param $IPINST -name "RETAIN_SINGLE_NODE" -parent ${Tunable_Generics}]
  set_property tooltip {Number of retain cycles in a single node} ${RETAIN_SINGLE_NODE}

  #Adding Group
  set Pass_Through [ipgui::add_group $IPINST -name "Pass Through" -parent ${NodeInserter}]
  set_property tooltip {Pass Through} ${Pass_Through}
  set PASS_THROUGH [ipgui::add_param $IPINST -name "PASS_THROUGH" -parent ${Pass_Through} -widget comboBox]
  set_property tooltip {If Belt-Bus the NodeInserter is Implemented, with Timestamp not there is a simple parallel output} ${PASS_THROUGH}



}

proc update_PARAM_VALUE.HOLD_ON_INTEGRAL { PARAM_VALUE.HOLD_ON_INTEGRAL PARAM_VALUE.PASS_THROUGH } {
	# Procedure called to update HOLD_ON_INTEGRAL when any of the dependent parameters in the arguments change
	
	set HOLD_ON_INTEGRAL ${PARAM_VALUE.HOLD_ON_INTEGRAL}
	set PASS_THROUGH ${PARAM_VALUE.PASS_THROUGH}
	set values(PASS_THROUGH) [get_property value $PASS_THROUGH]
	if { [gen_USERPARAMETER_HOLD_ON_INTEGRAL_ENABLEMENT $values(PASS_THROUGH)] } {
		set_property enabled true $HOLD_ON_INTEGRAL
	} else {
		set_property enabled false $HOLD_ON_INTEGRAL
	}
}

proc validate_PARAM_VALUE.HOLD_ON_INTEGRAL { PARAM_VALUE.HOLD_ON_INTEGRAL } {
	# Procedure called to validate HOLD_ON_INTEGRAL
	return true
}

proc update_PARAM_VALUE.HOLD_ON_MIN_MOD { PARAM_VALUE.HOLD_ON_MIN_MOD PARAM_VALUE.PASS_THROUGH } {
	# Procedure called to update HOLD_ON_MIN_MOD when any of the dependent parameters in the arguments change
	
	set HOLD_ON_MIN_MOD ${PARAM_VALUE.HOLD_ON_MIN_MOD}
	set PASS_THROUGH ${PARAM_VALUE.PASS_THROUGH}
	set values(PASS_THROUGH) [get_property value $PASS_THROUGH]
	if { [gen_USERPARAMETER_HOLD_ON_MIN_MOD_ENABLEMENT $values(PASS_THROUGH)] } {
		set_property enabled true $HOLD_ON_MIN_MOD
	} else {
		set_property enabled false $HOLD_ON_MIN_MOD
	}
}

proc validate_PARAM_VALUE.HOLD_ON_MIN_MOD { PARAM_VALUE.HOLD_ON_MIN_MOD } {
	# Procedure called to validate HOLD_ON_MIN_MOD
	return true
}

proc update_PARAM_VALUE.HOLD_ON_SINGLE_NODE { PARAM_VALUE.HOLD_ON_SINGLE_NODE PARAM_VALUE.PASS_THROUGH } {
	# Procedure called to update HOLD_ON_SINGLE_NODE when any of the dependent parameters in the arguments change
	
	set HOLD_ON_SINGLE_NODE ${PARAM_VALUE.HOLD_ON_SINGLE_NODE}
	set PASS_THROUGH ${PARAM_VALUE.PASS_THROUGH}
	set values(PASS_THROUGH) [get_property value $PASS_THROUGH]
	if { [gen_USERPARAMETER_HOLD_ON_SINGLE_NODE_ENABLEMENT $values(PASS_THROUGH)] } {
		set_property enabled true $HOLD_ON_SINGLE_NODE
	} else {
		set_property enabled false $HOLD_ON_SINGLE_NODE
	}
}

proc validate_PARAM_VALUE.HOLD_ON_SINGLE_NODE { PARAM_VALUE.HOLD_ON_SINGLE_NODE } {
	# Procedure called to validate HOLD_ON_SINGLE_NODE
	return true
}

proc update_PARAM_VALUE.INJECT_CYCLES { PARAM_VALUE.INJECT_CYCLES PARAM_VALUE.PASS_THROUGH } {
	# Procedure called to update INJECT_CYCLES when any of the dependent parameters in the arguments change
	
	set INJECT_CYCLES ${PARAM_VALUE.INJECT_CYCLES}
	set PASS_THROUGH ${PARAM_VALUE.PASS_THROUGH}
	set values(PASS_THROUGH) [get_property value $PASS_THROUGH]
	if { [gen_USERPARAMETER_INJECT_CYCLES_ENABLEMENT $values(PASS_THROUGH)] } {
		set_property enabled true $INJECT_CYCLES
	} else {
		set_property enabled false $INJECT_CYCLES
	}
}

proc validate_PARAM_VALUE.INJECT_CYCLES { PARAM_VALUE.INJECT_CYCLES } {
	# Procedure called to validate INJECT_CYCLES
	return true
}

proc update_PARAM_VALUE.RETAIN_SINGLE_NODE { PARAM_VALUE.RETAIN_SINGLE_NODE PARAM_VALUE.PASS_THROUGH } {
	# Procedure called to update RETAIN_SINGLE_NODE when any of the dependent parameters in the arguments change
	
	set RETAIN_SINGLE_NODE ${PARAM_VALUE.RETAIN_SINGLE_NODE}
	set PASS_THROUGH ${PARAM_VALUE.PASS_THROUGH}
	set values(PASS_THROUGH) [get_property value $PASS_THROUGH]
	if { [gen_USERPARAMETER_RETAIN_SINGLE_NODE_ENABLEMENT $values(PASS_THROUGH)] } {
		set_property enabled true $RETAIN_SINGLE_NODE
	} else {
		set_property enabled false $RETAIN_SINGLE_NODE
	}
}

proc validate_PARAM_VALUE.RETAIN_SINGLE_NODE { PARAM_VALUE.RETAIN_SINGLE_NODE } {
	# Procedure called to validate RETAIN_SINGLE_NODE
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

proc update_PARAM_VALUE.BIT_NUM_CH { PARAM_VALUE.BIT_NUM_CH } {
	# Procedure called to update BIT_NUM_CH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_NUM_CH { PARAM_VALUE.BIT_NUM_CH } {
	# Procedure called to validate BIT_NUM_CH
	return true
}

proc update_PARAM_VALUE.BIT_RESOLUTION { PARAM_VALUE.BIT_RESOLUTION } {
	# Procedure called to update BIT_RESOLUTION when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_RESOLUTION { PARAM_VALUE.BIT_RESOLUTION } {
	# Procedure called to validate BIT_RESOLUTION
	return true
}

proc update_PARAM_VALUE.NUM_CH { PARAM_VALUE.NUM_CH } {
	# Procedure called to update NUM_CH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_CH { PARAM_VALUE.NUM_CH } {
	# Procedure called to validate NUM_CH
	return true
}

proc update_PARAM_VALUE.NUM_NODE { PARAM_VALUE.NUM_NODE } {
	# Procedure called to update NUM_NODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_NODE { PARAM_VALUE.NUM_NODE } {
	# Procedure called to validate NUM_NODE
	return true
}

proc update_PARAM_VALUE.PASS_THROUGH { PARAM_VALUE.PASS_THROUGH } {
	# Procedure called to update PASS_THROUGH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PASS_THROUGH { PARAM_VALUE.PASS_THROUGH } {
	# Procedure called to validate PASS_THROUGH
	return true
}


proc update_MODELPARAM_VALUE.NUM_CH { MODELPARAM_VALUE.NUM_CH PARAM_VALUE.NUM_CH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_CH}] ${MODELPARAM_VALUE.NUM_CH}
}

proc update_MODELPARAM_VALUE.NUM_NODE { MODELPARAM_VALUE.NUM_NODE PARAM_VALUE.NUM_NODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_NODE}] ${MODELPARAM_VALUE.NUM_NODE}
}

proc update_MODELPARAM_VALUE.PASS_THROUGH { MODELPARAM_VALUE.PASS_THROUGH PARAM_VALUE.PASS_THROUGH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PASS_THROUGH}] ${MODELPARAM_VALUE.PASS_THROUGH}
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

proc update_MODELPARAM_VALUE.RETAIN_SINGLE_NODE { MODELPARAM_VALUE.RETAIN_SINGLE_NODE PARAM_VALUE.RETAIN_SINGLE_NODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RETAIN_SINGLE_NODE}] ${MODELPARAM_VALUE.RETAIN_SINGLE_NODE}
}

proc update_MODELPARAM_VALUE.HOLD_ON_SINGLE_NODE { MODELPARAM_VALUE.HOLD_ON_SINGLE_NODE PARAM_VALUE.HOLD_ON_SINGLE_NODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HOLD_ON_SINGLE_NODE}] ${MODELPARAM_VALUE.HOLD_ON_SINGLE_NODE}
}

proc update_MODELPARAM_VALUE.HOLD_ON_MIN_MOD { MODELPARAM_VALUE.HOLD_ON_MIN_MOD PARAM_VALUE.HOLD_ON_MIN_MOD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HOLD_ON_MIN_MOD}] ${MODELPARAM_VALUE.HOLD_ON_MIN_MOD}
}

proc update_MODELPARAM_VALUE.HOLD_ON_INTEGRAL { MODELPARAM_VALUE.HOLD_ON_INTEGRAL PARAM_VALUE.HOLD_ON_INTEGRAL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HOLD_ON_INTEGRAL}] ${MODELPARAM_VALUE.HOLD_ON_INTEGRAL}
}

proc update_MODELPARAM_VALUE.INJECT_CYCLES { MODELPARAM_VALUE.INJECT_CYCLES PARAM_VALUE.INJECT_CYCLES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INJECT_CYCLES}] ${MODELPARAM_VALUE.INJECT_CYCLES}
}

