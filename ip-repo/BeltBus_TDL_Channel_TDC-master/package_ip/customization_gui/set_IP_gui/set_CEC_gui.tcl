# ---------------------------- CEC_COARSE_CNT_INIT -----------------------------
proc update_PARAM_VALUE.CEC_COARSE_CNT_INIT { PARAM_VALUE.CEC_COARSE_CNT_INIT PARAM_VALUE.CEC_VS_CTD_COUNTER PARAM_VALUE.BIT_COARSE} {
	# Procedure called to update CEC_COARSE_CNT_INIT when any of the dependent parameters in the arguments change

	set CEC_COARSE_CNT_INIT ${PARAM_VALUE.CEC_COARSE_CNT_INIT}
	set CEC_VS_CTD_COUNTER ${PARAM_VALUE.CEC_VS_CTD_COUNTER}
    set BIT_COARSE ${PARAM_VALUE.BIT_COARSE}

    set values(CEC_COARSE_CNT_INIT) [get_property value $CEC_COARSE_CNT_INIT]
    set values(BIT_COARSE) [get_property value $BIT_COARSE]
	set values(CEC_VS_CTD_COUNTER) [get_property value $CEC_VS_CTD_COUNTER]

	if { [gen_USERPARAMETER_CEC_COARSE_CNT_INIT_ENABLEMENT $values(CEC_VS_CTD_COUNTER)] } {
		set_property enabled true $CEC_COARSE_CNT_INIT
	} else {
		set_property enabled false $CEC_COARSE_CNT_INIT
	}

    # Refresh the new range
    set MIN_CEC_COARSE_CNT_INIT 0
    set MAX_CEC_COARSE_CNT_INIT [expr 2**$values(BIT_COARSE) -1]
    set_property range  "$MIN_CEC_COARSE_CNT_INIT,$MAX_CEC_COARSE_CNT_INIT" $CEC_COARSE_CNT_INIT

}

proc validate_PARAM_VALUE.CEC_COARSE_CNT_INIT { PARAM_VALUE.CEC_COARSE_CNT_INIT } {
	# Procedure called to validate CEC_COARSE_CNT_INIT
	return true
}

proc update_MODELPARAM_VALUE.CEC_COARSE_CNT_INIT { MODELPARAM_VALUE.CEC_COARSE_CNT_INIT PARAM_VALUE.CEC_COARSE_CNT_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CEC_COARSE_CNT_INIT}] ${MODELPARAM_VALUE.CEC_COARSE_CNT_INIT}
}
# ------------------------------------------------------------------------------


# -------------------------------- BIT_COARSE ----------------------------------
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
# ------------------------------------------------------------------------------


# ---------------------------------- BIT_FID -----------------------------------
proc update_PARAM_VALUE.BIT_FID { PARAM_VALUE.BIT_FID } {
	# Procedure called to update BIT_FID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_FID { PARAM_VALUE.BIT_FID } {
	# Procedure called to validate BIT_FID
	return true
}

proc update_MODELPARAM_VALUE.BIT_FID { MODELPARAM_VALUE.BIT_FID PARAM_VALUE.BIT_FID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_FID}] ${MODELPARAM_VALUE.BIT_FID}
}
# ------------------------------------------------------------------------------

# ------------------------------- BIT_SUB_INT ----------------------------------
#proc update_PARAM_VALUE.BIT_SUB_INT { PARAM_VALUE.BIT_SUB_INT } {
	# Procedure called to update BIT_SUB_INT when any of the dependent parameters in the arguments change
#}

#proc validate_PARAM_VALUE.BIT_SUB_INT { PARAM_VALUE.BIT_SUB_INT } {
	# Procedure called to validate BIT_SUB_INT
#	return true
#}

#proc update_MODELPARAM_VALUE.BIT_SUB_INT { MODELPARAM_VALUE.BIT_SUB_INT PARAM_VALUE.BIT_SUB_INT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	#set_property value [get_property value ${PARAM_VALUE.BIT_SUB_INT}] ${MODELPARAM_VALUE.BIT_SUB_INT}
#}
# ------------------------------------------------------------------------------


# ------------------------------ BIT_UNCALIBRATED ------------------------------
proc update_PARAM_VALUE.BIT_UNCALIBRATED { PARAM_VALUE.BIT_UNCALIBRATED } {
	# Procedure called to update BIT_UNCALIBRATED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_UNCALIBRATED { PARAM_VALUE.BIT_UNCALIBRATED } {
	# Procedure called to validate BIT_UNCALIBRATED
	return true
}

proc update_MODELPARAM_VALUE.BIT_UNCALIBRATED { MODELPARAM_VALUE.BIT_UNCALIBRATED PARAM_VALUE.BIT_UNCALIBRATED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_UNCALIBRATED}] ${MODELPARAM_VALUE.BIT_UNCALIBRATED}
}
# ------------------------------------------------------------------------------


# ---------------------------- CEC_VS_CTD_COUNTER ------------------------------
proc update_PARAM_VALUE.CEC_VS_CTD_COUNTER { PARAM_VALUE.CEC_VS_CTD_COUNTER } {
	# Procedure called to update CEC_VS_CTD_COUNTER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CEC_VS_CTD_COUNTER { PARAM_VALUE.CEC_VS_CTD_COUNTER } {
	# Procedure called to validate CEC_VS_CTD_COUNTER
	return true
}

proc update_MODELPARAM_VALUE.CEC_VS_CTD_COUNTER { MODELPARAM_VALUE.CEC_VS_CTD_COUNTER PARAM_VALUE.CEC_VS_CTD_COUNTER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CEC_VS_CTD_COUNTER}] ${MODELPARAM_VALUE.CEC_VS_CTD_COUNTER}
}
# ------------------------------------------------------------------------------

# -------------------------- INTERNAL_OVERFLOW_CNT -----------------------------
proc update_PARAM_VALUE.INTERNAL_OVERFLOW_CNT { PARAM_VALUE.INTERNAL_OVERFLOW_CNT } {
	# Procedure called to update INTERNAL_OVERFLOW_CNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INTERNAL_OVERFLOW_CNT { PARAM_VALUE.INTERNAL_OVERFLOW_CNT } {
	# Procedure called to validate INTERNAL_OVERFLOW_CNT
	return true
}

proc update_MODELPARAM_VALUE.INTERNAL_OVERFLOW_CNT { MODELPARAM_VALUE.INTERNAL_OVERFLOW_CNT PARAM_VALUE.INTERNAL_OVERFLOW_CNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INTERNAL_OVERFLOW_CNT}] ${MODELPARAM_VALUE.INTERNAL_OVERFLOW_CNT}
}
# ------------------------------------------------------------------------------



#=================== MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 ======================

proc update_PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 { PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 } {
	# Procedure called to update MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 { PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 } {
	# Procedure called to validate MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1
	return true
}

proc update_MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 { MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1}] ${MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1}
}
#===============================================================================

#=================== MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 ======================
proc update_PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 { PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 } {
	# Procedure called to update MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 { PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 } {
	# Procedure called to validate MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2
	return true
}

proc update_MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 { MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2}] ${MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2}
}
#===============================================================================

#=================== MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 ======================
proc update_PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 { PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 } {
	# Procedure called to update MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 { PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 } {
	# Procedure called to validate MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3
	return true
}

proc update_MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 { MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3}] ${MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3}
}
#===============================================================================

#======================= MAX_NUM_BIT_EQ_PIPELINE_STAGE0 ========================

proc update_PARAM_VALUE.MAX_NUM_BIT_EQ_PIPELINE_STAGE0 { PARAM_VALUE.MAX_NUM_BIT_EQ_PIPELINE_STAGE0 PARAM_VALUE.BIT_COARSE } {
	# Procedure called to update MAX_NUM_BIT_EQ_PIPELINE_STAGE0 when any of the dependent parameters in the arguments change
	set MAX_NUM_BIT_EQ_PIPELINE_STAGE0 ${PARAM_VALUE.MAX_NUM_BIT_EQ_PIPELINE_STAGE0}
    set BIT_COARSE ${PARAM_VALUE.BIT_COARSE}

    set values(MAX_NUM_BIT_EQ_PIPELINE_STAGE0) [get_property value $MAX_NUM_BIT_EQ_PIPELINE_STAGE0]
    set values(BIT_COARSE) [get_property value $BIT_COARSE]

    # Refresh the new range
    set MIN_MAX_NUM_BIT_EQ_PIPELINE_STAGE0 1
    set MAX_MAX_NUM_BIT_EQ_PIPELINE_STAGE0 [expr $values(BIT_COARSE)]
    set_property range  "$MIN_MAX_NUM_BIT_EQ_PIPELINE_STAGE0,$MAX_MAX_NUM_BIT_EQ_PIPELINE_STAGE0" $MAX_NUM_BIT_EQ_PIPELINE_STAGE0
}

proc validate_PARAM_VALUE.MAX_NUM_BIT_EQ_PIPELINE_STAGE0 { PARAM_VALUE.MAX_NUM_BIT_EQ_PIPELINE_STAGE0 } {
	# Procedure called to validate MAX_NUM_BIT_EQ_PIPELINE_STAGE0
	return true
}

proc update_MODELPARAM_VALUE.MAX_NUM_BIT_EQ_PIPELINE_STAGE0 { MODELPARAM_VALUE.MAX_NUM_BIT_EQ_PIPELINE_STAGE0 PARAM_VALUE.MAX_NUM_BIT_EQ_PIPELINE_STAGE0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_NUM_BIT_EQ_PIPELINE_STAGE0}] ${MODELPARAM_VALUE.MAX_NUM_BIT_EQ_PIPELINE_STAGE0}
}
#===============================================================================

#================================ CDC_SYNC_STAGES ==============================
proc update_PARAM_VALUE.CDC_SYNC_STAGES { PARAM_VALUE.CDC_SYNC_STAGES PARAM_VALUE.RELATED_CLOCKS } {
	# Procedure called to update CDC_SYNC_STAGES when any of the dependent parameters in the arguments change

	set CDC_SYNC_STAGES ${PARAM_VALUE.CDC_SYNC_STAGES}
	set RELATED_CLOCKS ${PARAM_VALUE.RELATED_CLOCKS}
	set values(RELATED_CLOCKS) [get_property value $RELATED_CLOCKS]
	if { [gen_USERPARAMETER_CDC_SYNC_STAGES_ENABLEMENT $values(RELATED_CLOCKS)] } {
		set_property enabled true $CDC_SYNC_STAGES
	} else {
		set_property enabled false $CDC_SYNC_STAGES
	}


}

proc validate_PARAM_VALUE.CDC_SYNC_STAGES { PARAM_VALUE.CDC_SYNC_STAGES } {
	# Procedure called to validate CDC_SYNC_STAGES
	return true
}

proc update_MODELPARAM_VALUE.CDC_SYNC_STAGES { MODELPARAM_VALUE.CDC_SYNC_STAGES PARAM_VALUE.CDC_SYNC_STAGES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CDC_SYNC_STAGES}] ${MODELPARAM_VALUE.CDC_SYNC_STAGES}
}

#===============================================================================

#=============================== FIFO_MEMORY_TYPE ==============================
proc update_PARAM_VALUE.FIFO_MEMORY_TYPE { PARAM_VALUE.FIFO_MEMORY_TYPE } {
	# Procedure called to update FIFO_MEMORY_TYPE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIFO_MEMORY_TYPE { PARAM_VALUE.FIFO_MEMORY_TYPE } {
	# Procedure called to validate FIFO_MEMORY_TYPE
	return true
}

proc update_MODELPARAM_VALUE.FIFO_MEMORY_TYPE { MODELPARAM_VALUE.FIFO_MEMORY_TYPE PARAM_VALUE.FIFO_MEMORY_TYPE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIFO_MEMORY_TYPE}] ${MODELPARAM_VALUE.FIFO_MEMORY_TYPE}
}
#===============================================================================

#=============================== FIFO_WRITE_DEPTH ==============================
proc update_PARAM_VALUE.FIFO_WRITE_DEPTH { PARAM_VALUE.FIFO_WRITE_DEPTH } {
	# Procedure called to update FIFO_WRITE_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIFO_WRITE_DEPTH { PARAM_VALUE.FIFO_WRITE_DEPTH } {
	# Procedure called to validate FIFO_WRITE_DEPTH
	return true
}

proc update_MODELPARAM_VALUE.FIFO_WRITE_DEPTH { MODELPARAM_VALUE.FIFO_WRITE_DEPTH PARAM_VALUE.FIFO_WRITE_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIFO_WRITE_DEPTH}] ${MODELPARAM_VALUE.FIFO_WRITE_DEPTH}
}
#===============================================================================

#================================ RELATED_CLOCKS ===============================
proc update_PARAM_VALUE.RELATED_CLOCKS { PARAM_VALUE.RELATED_CLOCKS } {
	# Procedure called to update RELATED_CLOCKS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RELATED_CLOCKS { PARAM_VALUE.RELATED_CLOCKS } {
	# Procedure called to validate RELATED_CLOCKS
	return true
}

proc update_MODELPARAM_VALUE.RELATED_CLOCKS { MODELPARAM_VALUE.RELATED_CLOCKS PARAM_VALUE.RELATED_CLOCKS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RELATED_CLOCKS}] ${MODELPARAM_VALUE.RELATED_CLOCKS}
}
#===============================================================================

#================================ INTERNAL_OVERFLOW_CNT ========================
proc update_PARAM_VALUE.INTERNAL_OVERFLOW_CNT { PARAM_VALUE.INTERNAL_OVERFLOW_CNT } {
	# Procedure called to update INTERNAL_OVERFLOW_CNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INTERNAL_OVERFLOW_CNT { PARAM_VALUE.INTERNAL_OVERFLOW_CNT } {
	# Procedure called to validate INTERNAL_OVERFLOW_CNT
	return true
}

proc update_MODELPARAM_VALUE.INTERNAL_OVERFLOW_CNT { MODELPARAM_VALUE.INTERNAL_OVERFLOW_CNT PARAM_VALUE.INTERNAL_OVERFLOW_CNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INTERNAL_OVERFLOW_CNT}] ${MODELPARAM_VALUE.INTERNAL_OVERFLOW_CNT}
}

#===============================================================================
