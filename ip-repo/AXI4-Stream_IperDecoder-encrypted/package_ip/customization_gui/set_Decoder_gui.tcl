#==================================== BIT_SUB_INT ==============================
proc update_PARAM_VALUE.BIT_SUB_INT { PARAM_VALUE.BIT_SUB_INT PARAM_VALUE.BIT_TDL PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update BIT_SUB_INT when any of the dependent parameters in the arguments change

	set BIT_SUB_INT ${PARAM_VALUE.BIT_SUB_INT}
	set BIT_TDL ${PARAM_VALUE.BIT_TDL}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(BIT_TDL) [get_property value $BIT_TDL]
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	set_property value [gen_USERPARAMETER_BIT_SUB_INT_VALUE $values(BIT_TDL) $values(NUMBER_OF_TDL)] $BIT_SUB_INT
}

proc validate_PARAM_VALUE.BIT_SUB_INT { PARAM_VALUE.BIT_SUB_INT } {
	# Procedure called to validate BIT_SUB_INT
	return true
}

proc update_MODELPARAM_VALUE.BIT_SUB_INT { MODELPARAM_VALUE.BIT_SUB_INT PARAM_VALUE.BIT_SUB_INT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_SUB_INT}] ${MODELPARAM_VALUE.BIT_SUB_INT}
}
#===============================================================================

#==================== DECO_LOG_MAX_INPUT_ENGINE_PIPELINE =======================
proc update_PARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0 { PARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0 PARAM_VALUE.TYPE_DECODER PARAM_VALUE.MD_VS_TD } {
	# Procedure called to update DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0 when any of the dependent parameters in the arguments change

	set DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0 ${PARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0}
	set TYPE_DECODER ${PARAM_VALUE.TYPE_DECODER}
	set MD_VS_TD ${PARAM_VALUE.MD_VS_TD}
	set values(TYPE_DECODER) [get_property value $TYPE_DECODER]
	set values(MD_VS_TD) [get_property value $MD_VS_TD]
	if { [gen_USERPARAMETER_DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0_ENABLEMENT $values(TYPE_DECODER) $values(MD_VS_TD)] } {
		set_property enabled true $DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0
	} else {
		set_property enabled false $DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0
	}
}

proc validate_PARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0 { PARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0 } {
	# Procedure called to validate DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0
	return true
}

proc update_MODELPARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0 { MODELPARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0 PARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0}] ${MODELPARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0}
}


proc update_PARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1 { PARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1 PARAM_VALUE.TYPE_DECODER PARAM_VALUE.MD_VS_TD } {
	# Procedure called to update DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1 when any of the dependent parameters in the arguments change

	set DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1 ${PARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1}
	set TYPE_DECODER ${PARAM_VALUE.TYPE_DECODER}
	set MD_VS_TD ${PARAM_VALUE.MD_VS_TD}
	set values(TYPE_DECODER) [get_property value $TYPE_DECODER]
	set values(MD_VS_TD) [get_property value $MD_VS_TD]
	if { [gen_USERPARAMETER_DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1_ENABLEMENT $values(TYPE_DECODER) $values(MD_VS_TD)] } {
		set_property enabled true $DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1
	} else {
		set_property enabled false $DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1
	}
}

proc validate_PARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1 { PARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1 } {
	# Procedure called to validate DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1
	return true
}

proc update_MODELPARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1 { MODELPARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1 PARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1}] ${MODELPARAM_VALUE.DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1}
}
#===============================================================================

#==================== DECO_T2B_MAX_INPUT_ENGINE_PIPELINE =======================
proc update_PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0 { PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0 PARAM_VALUE.TYPE_DECODER PARAM_VALUE.MD_VS_TD } {
	# Procedure called to update DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0 when any of the dependent parameters in the arguments change

	set DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0 ${PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0}
	set TYPE_DECODER ${PARAM_VALUE.TYPE_DECODER}
	set MD_VS_TD ${PARAM_VALUE.MD_VS_TD}
	set values(TYPE_DECODER) [get_property value $TYPE_DECODER]
	set values(MD_VS_TD) [get_property value $MD_VS_TD]
	if { [gen_USERPARAMETER_DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0_ENABLEMENT $values(TYPE_DECODER) $values(MD_VS_TD)] } {
		set_property enabled true $DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0
	} else {
		set_property enabled false $DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0
	}
}

proc validate_PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0 { PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0 } {
	# Procedure called to validate DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0
	return true
}

proc update_MODELPARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0 { MODELPARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0 PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0}] ${MODELPARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0}
}

proc update_PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1 { PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1 PARAM_VALUE.TYPE_DECODER PARAM_VALUE.MD_VS_TD } {
	# Procedure called to update DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1 when any of the dependent parameters in the arguments change

	set DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1 ${PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1}
	set TYPE_DECODER ${PARAM_VALUE.TYPE_DECODER}
	set MD_VS_TD ${PARAM_VALUE.MD_VS_TD}
	set values(TYPE_DECODER) [get_property value $TYPE_DECODER]
	set values(MD_VS_TD) [get_property value $MD_VS_TD]
	if { [gen_USERPARAMETER_DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1_ENABLEMENT $values(TYPE_DECODER) $values(MD_VS_TD)] } {
		set_property enabled true $DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1
	} else {
		set_property enabled false $DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1
	}
}

proc validate_PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1 { PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1 } {
	# Procedure called to validate DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1
	return true
}

proc update_MODELPARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1 { MODELPARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1 PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1}] ${MODELPARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1}
}

proc update_PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2 { PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2 PARAM_VALUE.TYPE_DECODER PARAM_VALUE.MD_VS_TD } {
	# Procedure called to update DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2 when any of the dependent parameters in the arguments change

	set DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2 ${PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2}
	set TYPE_DECODER ${PARAM_VALUE.TYPE_DECODER}
	set MD_VS_TD ${PARAM_VALUE.MD_VS_TD}
	set values(TYPE_DECODER) [get_property value $TYPE_DECODER]
	set values(MD_VS_TD) [get_property value $MD_VS_TD]
	if { [gen_USERPARAMETER_DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2_ENABLEMENT $values(TYPE_DECODER) $values(MD_VS_TD)] } {
		set_property enabled true $DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2
	} else {
		set_property enabled false $DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2
	}
}

proc validate_PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2 { PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2 } {
	# Procedure called to validate DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2
	return true
}

proc update_MODELPARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2 { MODELPARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2 PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2}] ${MODELPARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2}
}

proc update_PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3 { PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3 PARAM_VALUE.TYPE_DECODER PARAM_VALUE.MD_VS_TD } {
	# Procedure called to update DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3 when any of the dependent parameters in the arguments change

	set DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3 ${PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3}
	set TYPE_DECODER ${PARAM_VALUE.TYPE_DECODER}
	set MD_VS_TD ${PARAM_VALUE.MD_VS_TD}
	set values(TYPE_DECODER) [get_property value $TYPE_DECODER]
	set values(MD_VS_TD) [get_property value $MD_VS_TD]
	if { [gen_USERPARAMETER_DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3_ENABLEMENT $values(TYPE_DECODER) $values(MD_VS_TD)] } {
		set_property enabled true $DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3
	} else {
		set_property enabled false $DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3
	}
}

proc validate_PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3 { PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3 } {
	# Procedure called to validate DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3
	return true
}

proc update_MODELPARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3 { MODELPARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3 PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3}] ${MODELPARAM_VALUE.DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3}
}
#===============================================================================

#=============================== OPTIMIZATION_MODE =============================
proc update_PARAM_VALUE.OPTIMIZATION_MODE { PARAM_VALUE.OPTIMIZATION_MODE PARAM_VALUE.MD_VS_TD } {
	# Procedure called to update OPTIMIZATION_MODE when any of the dependent parameters in the arguments change

	set OPTIMIZATION_MODE ${PARAM_VALUE.OPTIMIZATION_MODE}
	set MD_VS_TD ${PARAM_VALUE.MD_VS_TD}
	set values(MD_VS_TD) [get_property value $MD_VS_TD]
	if { [gen_USERPARAMETER_OPTIMIZATION_MODE_ENABLEMENT $values(MD_VS_TD)] } {
		set_property enabled true $OPTIMIZATION_MODE
	} else {
		set_property enabled false $OPTIMIZATION_MODE
	}
}

proc validate_PARAM_VALUE.OPTIMIZATION_MODE { PARAM_VALUE.OPTIMIZATION_MODE } {
	# Procedure called to validate OPTIMIZATION_MODE
	return true
}

proc update_MODELPARAM_VALUE.OPTIMIZATION_MODE { MODELPARAM_VALUE.OPTIMIZATION_MODE PARAM_VALUE.OPTIMIZATION_MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OPTIMIZATION_MODE}] ${MODELPARAM_VALUE.OPTIMIZATION_MODE}
}
#===============================================================================

#=============================== PRINT_FULL_REPORT =============================
proc update_PARAM_VALUE.PRINT_FULL_REPORT { PARAM_VALUE.PRINT_FULL_REPORT PARAM_VALUE.MD_VS_TD } {
	# Procedure called to update PRINT_FULL_REPORT when any of the dependent parameters in the arguments change

	set PRINT_FULL_REPORT ${PARAM_VALUE.PRINT_FULL_REPORT}
	set MD_VS_TD ${PARAM_VALUE.MD_VS_TD}
	set values(MD_VS_TD) [get_property value $MD_VS_TD]
	if { [gen_USERPARAMETER_PRINT_FULL_REPORT_ENABLEMENT $values(MD_VS_TD)] } {
		set_property enabled true $PRINT_FULL_REPORT
	} else {
		set_property enabled false $PRINT_FULL_REPORT
	}
}

proc validate_PARAM_VALUE.PRINT_FULL_REPORT { PARAM_VALUE.PRINT_FULL_REPORT } {
	# Procedure called to validate PRINT_FULL_REPORT
	return true
}

proc update_MODELPARAM_VALUE.PRINT_FULL_REPORT { MODELPARAM_VALUE.PRINT_FULL_REPORT PARAM_VALUE.PRINT_FULL_REPORT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PRINT_FULL_REPORT}] ${MODELPARAM_VALUE.PRINT_FULL_REPORT}
}
#===============================================================================

#======================= SUB_INT_MAX_INPUT_ENGINE_PIPELINE =====================
proc update_PARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0 { PARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0 PARAM_VALUE.MD_VS_TD } {
	# Procedure called to update SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0 when any of the dependent parameters in the arguments change

	set SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0 ${PARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0}
	set MD_VS_TD ${PARAM_VALUE.MD_VS_TD}
	set values(MD_VS_TD) [get_property value $MD_VS_TD]
	if { [gen_USERPARAMETER_SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0_ENABLEMENT $values(MD_VS_TD)] } {
		set_property enabled true $SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0
	} else {
		set_property enabled false $SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0
	}
}

proc validate_PARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0 { PARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0 } {
	# Procedure called to validate SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0
	return true
}

proc update_MODELPARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0 { MODELPARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0 PARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0}] ${MODELPARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0}
}

proc update_PARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1 { PARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1 PARAM_VALUE.MD_VS_TD } {
	# Procedure called to update SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1 when any of the dependent parameters in the arguments change

	set SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1 ${PARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1}
	set MD_VS_TD ${PARAM_VALUE.MD_VS_TD}
	set values(MD_VS_TD) [get_property value $MD_VS_TD]
	if { [gen_USERPARAMETER_SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1_ENABLEMENT $values(MD_VS_TD)] } {
		set_property enabled true $SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1
	} else {
		set_property enabled false $SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1
	}
}

proc validate_PARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1 { PARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1 } {
	# Procedure called to validate SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1
	return true
}

proc update_MODELPARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1 { MODELPARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1 PARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1}] ${MODELPARAM_VALUE.SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1}
}
#===============================================================================

#================================ TYPE_EDGE ====================================
proc update_PARAM_VALUE.TYPE_EDGE_0 { PARAM_VALUE.TYPE_EDGE_0 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_EDGE_0 when any of the dependent parameters in the arguments change

	set TYPE_EDGE_0 ${PARAM_VALUE.TYPE_EDGE_0}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_EDGE_0_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_EDGE_0
	} else {
		set_property enabled false $TYPE_EDGE_0
	}
}

proc validate_PARAM_VALUE.TYPE_EDGE_0 { PARAM_VALUE.TYPE_EDGE_0 } {
	# Procedure called to validate TYPE_EDGE_0
	return true
}

proc update_MODELPARAM_VALUE.TYPE_EDGE_0 { MODELPARAM_VALUE.TYPE_EDGE_0 PARAM_VALUE.TYPE_EDGE_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_EDGE_0}] ${MODELPARAM_VALUE.TYPE_EDGE_0}
}

proc update_PARAM_VALUE.TYPE_EDGE_1 { PARAM_VALUE.TYPE_EDGE_1 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_EDGE_1 when any of the dependent parameters in the arguments change

	set TYPE_EDGE_1 ${PARAM_VALUE.TYPE_EDGE_1}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_EDGE_1_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_EDGE_1
	} else {
		set_property enabled false $TYPE_EDGE_1
	}
}

proc validate_PARAM_VALUE.TYPE_EDGE_1 { PARAM_VALUE.TYPE_EDGE_1 } {
	# Procedure called to validate TYPE_EDGE_1
	return true
}


proc update_MODELPARAM_VALUE.TYPE_EDGE_1 { MODELPARAM_VALUE.TYPE_EDGE_1 PARAM_VALUE.TYPE_EDGE_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_EDGE_1}] ${MODELPARAM_VALUE.TYPE_EDGE_1}
}

proc update_PARAM_VALUE.TYPE_EDGE_2 { PARAM_VALUE.TYPE_EDGE_2 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_EDGE_2 when any of the dependent parameters in the arguments change

	set TYPE_EDGE_2 ${PARAM_VALUE.TYPE_EDGE_2}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_EDGE_2_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_EDGE_2
	} else {
		set_property enabled false $TYPE_EDGE_2
	}
}

proc validate_PARAM_VALUE.TYPE_EDGE_2 { PARAM_VALUE.TYPE_EDGE_2 } {
	# Procedure called to validate TYPE_EDGE_2
	return true
}

proc update_MODELPARAM_VALUE.TYPE_EDGE_2 { MODELPARAM_VALUE.TYPE_EDGE_2 PARAM_VALUE.TYPE_EDGE_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_EDGE_2}] ${MODELPARAM_VALUE.TYPE_EDGE_2}
}

proc update_PARAM_VALUE.TYPE_EDGE_3 { PARAM_VALUE.TYPE_EDGE_3 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_EDGE_3 when any of the dependent parameters in the arguments change

	set TYPE_EDGE_3 ${PARAM_VALUE.TYPE_EDGE_3}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_EDGE_3_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_EDGE_3
	} else {
		set_property enabled false $TYPE_EDGE_3
	}
}

proc validate_PARAM_VALUE.TYPE_EDGE_3 { PARAM_VALUE.TYPE_EDGE_3 } {
	# Procedure called to validate TYPE_EDGE_3
	return true
}

proc update_MODELPARAM_VALUE.TYPE_EDGE_3 { MODELPARAM_VALUE.TYPE_EDGE_3 PARAM_VALUE.TYPE_EDGE_3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_EDGE_3}] ${MODELPARAM_VALUE.TYPE_EDGE_3}
}

proc update_PARAM_VALUE.TYPE_EDGE_4 { PARAM_VALUE.TYPE_EDGE_4 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_EDGE_4 when any of the dependent parameters in the arguments change

	set TYPE_EDGE_4 ${PARAM_VALUE.TYPE_EDGE_4}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_EDGE_4_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_EDGE_4
	} else {
		set_property enabled false $TYPE_EDGE_4
	}
}

proc validate_PARAM_VALUE.TYPE_EDGE_4 { PARAM_VALUE.TYPE_EDGE_4 } {
	# Procedure called to validate TYPE_EDGE_4
	return true
}

proc update_MODELPARAM_VALUE.TYPE_EDGE_4 { MODELPARAM_VALUE.TYPE_EDGE_4 PARAM_VALUE.TYPE_EDGE_4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_EDGE_4}] ${MODELPARAM_VALUE.TYPE_EDGE_4}
}

proc update_PARAM_VALUE.TYPE_EDGE_5 { PARAM_VALUE.TYPE_EDGE_5 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_EDGE_5 when any of the dependent parameters in the arguments change

	set TYPE_EDGE_5 ${PARAM_VALUE.TYPE_EDGE_5}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_EDGE_5_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_EDGE_5
	} else {
		set_property enabled false $TYPE_EDGE_5
	}
}

proc validate_PARAM_VALUE.TYPE_EDGE_5 { PARAM_VALUE.TYPE_EDGE_5 } {
	# Procedure called to validate TYPE_EDGE_5
	return true
}

proc update_MODELPARAM_VALUE.TYPE_EDGE_5 { MODELPARAM_VALUE.TYPE_EDGE_5 PARAM_VALUE.TYPE_EDGE_5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_EDGE_5}] ${MODELPARAM_VALUE.TYPE_EDGE_5}
}

proc update_PARAM_VALUE.TYPE_EDGE_6 { PARAM_VALUE.TYPE_EDGE_6 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_EDGE_6 when any of the dependent parameters in the arguments change

	set TYPE_EDGE_6 ${PARAM_VALUE.TYPE_EDGE_6}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_EDGE_6_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_EDGE_6
	} else {
		set_property enabled false $TYPE_EDGE_6
	}
}

proc validate_PARAM_VALUE.TYPE_EDGE_6 { PARAM_VALUE.TYPE_EDGE_6 } {
	# Procedure called to validate TYPE_EDGE_6
	return true
}

proc update_MODELPARAM_VALUE.TYPE_EDGE_6 { MODELPARAM_VALUE.TYPE_EDGE_6 PARAM_VALUE.TYPE_EDGE_6 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_EDGE_6}] ${MODELPARAM_VALUE.TYPE_EDGE_6}
}

proc update_PARAM_VALUE.TYPE_EDGE_7 { PARAM_VALUE.TYPE_EDGE_7 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_EDGE_7 when any of the dependent parameters in the arguments change

	set TYPE_EDGE_7 ${PARAM_VALUE.TYPE_EDGE_7}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_EDGE_7_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_EDGE_7
	} else {
		set_property enabled false $TYPE_EDGE_7
	}
}

proc validate_PARAM_VALUE.TYPE_EDGE_7 { PARAM_VALUE.TYPE_EDGE_7 } {
	# Procedure called to validate TYPE_EDGE_7
	return true
}


proc update_MODELPARAM_VALUE.TYPE_EDGE_7 { MODELPARAM_VALUE.TYPE_EDGE_7 PARAM_VALUE.TYPE_EDGE_7 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_EDGE_7}] ${MODELPARAM_VALUE.TYPE_EDGE_7}
}

proc update_PARAM_VALUE.TYPE_EDGE_8 { PARAM_VALUE.TYPE_EDGE_8 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_EDGE_8 when any of the dependent parameters in the arguments change

	set TYPE_EDGE_8 ${PARAM_VALUE.TYPE_EDGE_8}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_EDGE_8_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_EDGE_8
	} else {
		set_property enabled false $TYPE_EDGE_8
	}
}

proc validate_PARAM_VALUE.TYPE_EDGE_8 { PARAM_VALUE.TYPE_EDGE_8 } {
	# Procedure called to validate TYPE_EDGE_8
	return true
}

proc update_MODELPARAM_VALUE.TYPE_EDGE_8 { MODELPARAM_VALUE.TYPE_EDGE_8 PARAM_VALUE.TYPE_EDGE_8 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_EDGE_8}] ${MODELPARAM_VALUE.TYPE_EDGE_8}
}

proc update_PARAM_VALUE.TYPE_EDGE_9 { PARAM_VALUE.TYPE_EDGE_9 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_EDGE_9 when any of the dependent parameters in the arguments change

	set TYPE_EDGE_9 ${PARAM_VALUE.TYPE_EDGE_9}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_EDGE_9_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_EDGE_9
	} else {
		set_property enabled false $TYPE_EDGE_9
	}
}

proc validate_PARAM_VALUE.TYPE_EDGE_9 { PARAM_VALUE.TYPE_EDGE_9 } {
	# Procedure called to validate TYPE_EDGE_9
	return true
}


proc update_MODELPARAM_VALUE.TYPE_EDGE_9 { MODELPARAM_VALUE.TYPE_EDGE_9 PARAM_VALUE.TYPE_EDGE_9 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_EDGE_9}] ${MODELPARAM_VALUE.TYPE_EDGE_9}
}

proc update_PARAM_VALUE.TYPE_EDGE_10 { PARAM_VALUE.TYPE_EDGE_10 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_EDGE_10 when any of the dependent parameters in the arguments change

	set TYPE_EDGE_10 ${PARAM_VALUE.TYPE_EDGE_10}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_EDGE_10_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_EDGE_10
	} else {
		set_property enabled false $TYPE_EDGE_10
	}
}

proc validate_PARAM_VALUE.TYPE_EDGE_10 { PARAM_VALUE.TYPE_EDGE_10 } {
	# Procedure called to validate TYPE_EDGE_10
	return true
}

proc update_MODELPARAM_VALUE.TYPE_EDGE_10 { MODELPARAM_VALUE.TYPE_EDGE_10 PARAM_VALUE.TYPE_EDGE_10 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_EDGE_10}] ${MODELPARAM_VALUE.TYPE_EDGE_10}
}

proc update_PARAM_VALUE.TYPE_EDGE_11 { PARAM_VALUE.TYPE_EDGE_11 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_EDGE_11 when any of the dependent parameters in the arguments change

	set TYPE_EDGE_11 ${PARAM_VALUE.TYPE_EDGE_11}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_EDGE_11_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_EDGE_11
	} else {
		set_property enabled false $TYPE_EDGE_11
	}
}

proc validate_PARAM_VALUE.TYPE_EDGE_11 { PARAM_VALUE.TYPE_EDGE_11 } {
	# Procedure called to validate TYPE_EDGE_11
	return true
}

proc update_MODELPARAM_VALUE.TYPE_EDGE_11 { MODELPARAM_VALUE.TYPE_EDGE_11 PARAM_VALUE.TYPE_EDGE_11 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_EDGE_11}] ${MODELPARAM_VALUE.TYPE_EDGE_11}
}

proc update_PARAM_VALUE.TYPE_EDGE_12 { PARAM_VALUE.TYPE_EDGE_12 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_EDGE_12 when any of the dependent parameters in the arguments change

	set TYPE_EDGE_12 ${PARAM_VALUE.TYPE_EDGE_12}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_EDGE_12_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_EDGE_12
	} else {
		set_property enabled false $TYPE_EDGE_12
	}
}

proc validate_PARAM_VALUE.TYPE_EDGE_12 { PARAM_VALUE.TYPE_EDGE_12 } {
	# Procedure called to validate TYPE_EDGE_12
	return true
}

proc update_MODELPARAM_VALUE.TYPE_EDGE_12 { MODELPARAM_VALUE.TYPE_EDGE_12 PARAM_VALUE.TYPE_EDGE_12 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_EDGE_12}] ${MODELPARAM_VALUE.TYPE_EDGE_12}
}

proc update_PARAM_VALUE.TYPE_EDGE_13 { PARAM_VALUE.TYPE_EDGE_13 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_EDGE_13 when any of the dependent parameters in the arguments change

	set TYPE_EDGE_13 ${PARAM_VALUE.TYPE_EDGE_13}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_EDGE_13_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_EDGE_13
	} else {
		set_property enabled false $TYPE_EDGE_13
	}
}

proc validate_PARAM_VALUE.TYPE_EDGE_13 { PARAM_VALUE.TYPE_EDGE_13 } {
	# Procedure called to validate TYPE_EDGE_13
	return true
}

proc update_MODELPARAM_VALUE.TYPE_EDGE_13 { MODELPARAM_VALUE.TYPE_EDGE_13 PARAM_VALUE.TYPE_EDGE_13 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_EDGE_13}] ${MODELPARAM_VALUE.TYPE_EDGE_13}
}

proc update_PARAM_VALUE.TYPE_EDGE_14 { PARAM_VALUE.TYPE_EDGE_14 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_EDGE_14 when any of the dependent parameters in the arguments change

	set TYPE_EDGE_14 ${PARAM_VALUE.TYPE_EDGE_14}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_EDGE_14_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_EDGE_14
	} else {
		set_property enabled false $TYPE_EDGE_14
	}
}

proc validate_PARAM_VALUE.TYPE_EDGE_14 { PARAM_VALUE.TYPE_EDGE_14 } {
	# Procedure called to validate TYPE_EDGE_14
	return true
}

proc update_MODELPARAM_VALUE.TYPE_EDGE_14 { MODELPARAM_VALUE.TYPE_EDGE_14 PARAM_VALUE.TYPE_EDGE_14 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_EDGE_14}] ${MODELPARAM_VALUE.TYPE_EDGE_14}
}

proc update_PARAM_VALUE.TYPE_EDGE_15 { PARAM_VALUE.TYPE_EDGE_15 PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update TYPE_EDGE_15 when any of the dependent parameters in the arguments change

	set TYPE_EDGE_15 ${PARAM_VALUE.TYPE_EDGE_15}
	set NUMBER_OF_TDL ${PARAM_VALUE.NUMBER_OF_TDL}
	set values(NUMBER_OF_TDL) [get_property value $NUMBER_OF_TDL]
	if { [gen_USERPARAMETER_TYPE_EDGE_15_ENABLEMENT $values(NUMBER_OF_TDL)] } {
		set_property enabled true $TYPE_EDGE_15
	} else {
		set_property enabled false $TYPE_EDGE_15
	}
}

proc validate_PARAM_VALUE.TYPE_EDGE_15 { PARAM_VALUE.TYPE_EDGE_15 } {
	# Procedure called to validate TYPE_EDGE_15
	return true
}

proc update_MODELPARAM_VALUE.TYPE_EDGE_15 { MODELPARAM_VALUE.TYPE_EDGE_15 PARAM_VALUE.TYPE_EDGE_15 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_EDGE_15}] ${MODELPARAM_VALUE.TYPE_EDGE_15}
}
#===============================================================================

#===================== WEIGHT_AREA_VS_TIME_PERCENT =============================
proc update_PARAM_VALUE.WEIGHT_AREA_VS_TIME_PERCENT { PARAM_VALUE.WEIGHT_AREA_VS_TIME_PERCENT PARAM_VALUE.OPTIMIZATION_MODE PARAM_VALUE.MD_VS_TD } {
	# Procedure called to update WEIGHT_AREA_VS_TIME_PERCENT when any of the dependent parameters in the arguments change

	set WEIGHT_AREA_VS_TIME_PERCENT ${PARAM_VALUE.WEIGHT_AREA_VS_TIME_PERCENT}
	set OPTIMIZATION_MODE ${PARAM_VALUE.OPTIMIZATION_MODE}
	set MD_VS_TD ${PARAM_VALUE.MD_VS_TD}
	set values(OPTIMIZATION_MODE) [get_property value $OPTIMIZATION_MODE]
	set values(MD_VS_TD) [get_property value $MD_VS_TD]
	if { [gen_USERPARAMETER_WEIGHT_AREA_VS_TIME_PERCENT_ENABLEMENT $values(OPTIMIZATION_MODE) $values(MD_VS_TD)] } {
		set_property enabled true $WEIGHT_AREA_VS_TIME_PERCENT
	} else {
		set_property enabled false $WEIGHT_AREA_VS_TIME_PERCENT
	}
}

proc validate_PARAM_VALUE.WEIGHT_AREA_VS_TIME_PERCENT { PARAM_VALUE.WEIGHT_AREA_VS_TIME_PERCENT } {
	# Procedure called to validate WEIGHT_AREA_VS_TIME_PERCENT
	return true
}

proc update_MODELPARAM_VALUE.WEIGHT_AREA_VS_TIME_PERCENT { MODELPARAM_VALUE.WEIGHT_AREA_VS_TIME_PERCENT PARAM_VALUE.WEIGHT_AREA_VS_TIME_PERCENT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WEIGHT_AREA_VS_TIME_PERCENT}] ${MODELPARAM_VALUE.WEIGHT_AREA_VS_TIME_PERCENT}
}
#===============================================================================

#================================== BIT_BUBBLE =================================
proc update_PARAM_VALUE.BIT_BUBBLE { PARAM_VALUE.BIT_BUBBLE } {
	# Procedure called to update BIT_BUBBLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_BUBBLE { PARAM_VALUE.BIT_BUBBLE } {
	# Procedure called to validate BIT_BUBBLE
	return true
}

proc update_MODELPARAM_VALUE.BIT_BUBBLE { MODELPARAM_VALUE.BIT_BUBBLE PARAM_VALUE.BIT_BUBBLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_BUBBLE}] ${MODELPARAM_VALUE.BIT_BUBBLE}
}
#===============================================================================

#================================== BIT_COARSE =================================
proc update_PARAM_VALUE.BIT_COARSE { PARAM_VALUE.BIT_COARSE } {
	# Procedure called to update BIT_COARSE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_COARSE { PARAM_VALUE.BIT_COARSE } {
	# Procedure called to validate BIT_COARSE
	return true
}

proc update_MODELPARAM_VALUE.BIT_COARSE { MODELPARAM_VALUE.BIT_COARSE PARAM_VALUE.BIT_COARSE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_COARSE}] ${MODELPARAM_VALUE.BIT_COARSE}
}
#===============================================================================

#=================================== BIT_TDL ===================================
proc update_PARAM_VALUE.BIT_TDL { PARAM_VALUE.BIT_TDL } {
	# Procedure called to update BIT_TDL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_TDL { PARAM_VALUE.BIT_TDL } {
	# Procedure called to validate BIT_TDL
	return true
}

proc update_MODELPARAM_VALUE.BIT_TDL { MODELPARAM_VALUE.BIT_TDL PARAM_VALUE.BIT_TDL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_TDL}] ${MODELPARAM_VALUE.BIT_TDL}
}
#===============================================================================

#================================== DEBUG_MODE =================================
proc update_PARAM_VALUE.DEBUG_MODE { PARAM_VALUE.DEBUG_MODE } {
	# Procedure called to update DEBUG_MODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEBUG_MODE { PARAM_VALUE.DEBUG_MODE } {
	# Procedure called to validate DEBUG_MODE
	return true
}

proc update_MODELPARAM_VALUE.DEBUG_MODE { MODELPARAM_VALUE.DEBUG_MODE PARAM_VALUE.DEBUG_MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEBUG_MODE}] ${MODELPARAM_VALUE.DEBUG_MODE}
}
#===============================================================================

#================================== EDGE_CHECK =================================
proc update_PARAM_VALUE.EDGE_CHECK { PARAM_VALUE.EDGE_CHECK } {
	# Procedure called to update EDGE_CHECK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EDGE_CHECK { PARAM_VALUE.EDGE_CHECK } {
	# Procedure called to validate EDGE_CHECK
	return true
}

proc update_MODELPARAM_VALUE.EDGE_CHECK { MODELPARAM_VALUE.EDGE_CHECK PARAM_VALUE.EDGE_CHECK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EDGE_CHECK}] ${MODELPARAM_VALUE.EDGE_CHECK}
}
#===============================================================================

#================================== FREE_RUNNING =================================
proc update_PARAM_VALUE.FREE_RUNNING { PARAM_VALUE.FREE_RUNNING } {
	# Procedure called to update FREE_RUNNING when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FREE_RUNNING { PARAM_VALUE.FREE_RUNNING } {
	# Procedure called to validate FREE_RUNNING
	return true
}

proc update_MODELPARAM_VALUE.FREE_RUNNING { MODELPARAM_VALUE.FREE_RUNNING PARAM_VALUE.FREE_RUNNING } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FREE_RUNNING}] ${MODELPARAM_VALUE.FREE_RUNNING}
}
#===============================================================================

#================================== MD_VS_TD ===================================
proc update_PARAM_VALUE.MD_VS_TD { PARAM_VALUE.MD_VS_TD } {
	# Procedure called to update MD_VS_TD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MD_VS_TD { PARAM_VALUE.MD_VS_TD } {
	# Procedure called to validate MD_VS_TD
	return true
}

proc update_MODELPARAM_VALUE.MD_VS_TD { MODELPARAM_VALUE.MD_VS_TD PARAM_VALUE.MD_VS_TD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MD_VS_TD}] ${MODELPARAM_VALUE.MD_VS_TD}
}
#===============================================================================

#=============================== NUMBER_OF_TDL =================================
proc update_PARAM_VALUE.NUMBER_OF_TDL { PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to update NUMBER_OF_TDL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUMBER_OF_TDL { PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to validate NUMBER_OF_TDL
	return true
}

proc update_MODELPARAM_VALUE.NUMBER_OF_TDL { MODELPARAM_VALUE.NUMBER_OF_TDL PARAM_VALUE.NUMBER_OF_TDL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUMBER_OF_TDL}] ${MODELPARAM_VALUE.NUMBER_OF_TDL}
}
#===============================================================================

#================================== TYPE_DECODER =================================
proc update_PARAM_VALUE.TYPE_DECODER { PARAM_VALUE.TYPE_DECODER } {
	# Procedure called to update TYPE_DECODER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TYPE_DECODER { PARAM_VALUE.TYPE_DECODER } {
	# Procedure called to validate TYPE_DECODER
	return true
}

proc update_MODELPARAM_VALUE.TYPE_DECODER { MODELPARAM_VALUE.TYPE_DECODER PARAM_VALUE.TYPE_DECODER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TYPE_DECODER}] ${MODELPARAM_VALUE.TYPE_DECODER}
}
#===============================================================================
