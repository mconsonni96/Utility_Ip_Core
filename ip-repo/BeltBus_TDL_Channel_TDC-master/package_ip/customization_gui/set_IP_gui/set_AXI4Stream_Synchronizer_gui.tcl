# ------------------------------------------ SYNCH_CDC_SYNC_STAGES-------------------------------------------------
proc update_PARAM_VALUE.SYNCH_CDC_SYNC_STAGES { PARAM_VALUE.SYNCH_CDC_SYNC_STAGES PARAM_VALUE.MODE_SEL PARAM_VALUE.SYNCH_RELATED_CLOCKS } {
	# Procedure called to update SYNCH_CDC_SYNC_STAGES when any of the dependent parameters in the arguments change

	set SYNCH_CDC_SYNC_STAGES ${PARAM_VALUE.SYNCH_CDC_SYNC_STAGES}
	set MODE_SEL ${PARAM_VALUE.MODE_SEL}
	set SYNCH_RELATED_CLOCKS ${PARAM_VALUE.SYNCH_RELATED_CLOCKS}
	set values(MODE_SEL) [get_property value $MODE_SEL]
	set values(SYNCH_RELATED_CLOCKS) [get_property value $SYNCH_RELATED_CLOCKS]
	if { [gen_USERPARAMETER_SYNCH_CDC_SYNC_STAGES_ENABLEMENT $values(MODE_SEL) $values(SYNCH_RELATED_CLOCKS)] } {
		set_property enabled true $SYNCH_CDC_SYNC_STAGES
	} else {
		set_property enabled false $SYNCH_CDC_SYNC_STAGES
	}
}

proc validate_PARAM_VALUE.SYNCH_CDC_SYNC_STAGES { PARAM_VALUE.SYNCH_CDC_SYNC_STAGES } {
	# Procedure called to validate SYNCH_CDC_SYNC_STAGES
	return true
}

proc update_MODELPARAM_VALUE.SYNCH_CDC_SYNC_STAGES { MODELPARAM_VALUE.SYNCH_CDC_SYNC_STAGES PARAM_VALUE.SYNCH_CDC_SYNC_STAGES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SYNCH_CDC_SYNC_STAGES}] ${MODELPARAM_VALUE.SYNCH_CDC_SYNC_STAGES}
}
# ----------------------------------------------------------------------------------------------------------------

#--------------------------------------------- DEST_SYNC_FF-------------------------------------------------------

proc update_PARAM_VALUE.DEST_SYNC_FF { PARAM_VALUE.DEST_SYNC_FF PARAM_VALUE.MODE_SEL } {
	# Procedure called to update DEST_SYNC_FF when any of the dependent parameters in the arguments change

	set DEST_SYNC_FF ${PARAM_VALUE.DEST_SYNC_FF}
	set MODE_SEL ${PARAM_VALUE.MODE_SEL}
	set values(MODE_SEL) [get_property value $MODE_SEL]
	if { [gen_USERPARAMETER_DEST_SYNC_FF_ENABLEMENT $values(MODE_SEL)] } {
		set_property enabled true $DEST_SYNC_FF
	} else {
		set_property enabled false $DEST_SYNC_FF
	}
}

proc validate_PARAM_VALUE.DEST_SYNC_FF { PARAM_VALUE.DEST_SYNC_FF } {
	# Procedure called to validate DEST_SYNC_FF
	return true
}

proc update_MODELPARAM_VALUE.DEST_SYNC_FF { MODELPARAM_VALUE.DEST_SYNC_FF PARAM_VALUE.DEST_SYNC_FF } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEST_SYNC_FF}] ${MODELPARAM_VALUE.DEST_SYNC_FF}
}
#------------------------------------------------------------------------------------------------------------------

#-------------------------------------------------- FIFO_WRITE_DEPTH ----------------------------------------------
proc update_PARAM_VALUE.FIFO_DEPTH { PARAM_VALUE.FIFO_DEPTH PARAM_VALUE.MODE_SEL } {
	# Procedure called to update FIFO_WRITE_DEPTH when any of the dependent parameters in the arguments change

	set FIFO_DEPTH ${PARAM_VALUE.FIFO_DEPTH}
	set MODE_SEL ${PARAM_VALUE.MODE_SEL}
	set values(MODE_SEL) [get_property value $MODE_SEL]
	if { [gen_USERPARAMETER_FIFO_DEPTH_ENABLEMENT $values(MODE_SEL)] } {
		set_property enabled true $FIFO_DEPTH
	} else {
		set_property enabled false $FIFO_DEPTH
	}
}

proc validate_PARAM_VALUE.FIFO_DEPTH { PARAM_VALUE.FIFO_DEPTH } {
	# Procedure called to validate FIFO_WRITE_DEPTH
	return true
}

proc update_MODELPARAM_VALUE.FIFO_DEPTH { MODELPARAM_VALUE.FIFO_DEPTH PARAM_VALUE.FIFO_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIFO_DEPTH}] ${MODELPARAM_VALUE.FIFO_DEPTH}
}
#--------------------------------------------------------------------------------------------------------------------

#------------------------------------------------ FIFO_MEMORY_TYPE-------------------------------------------------
proc update_PARAM_VALUE.SYNCH_FIFO_MEMORY_TYPE { PARAM_VALUE.SYNCH_FIFO_MEMORY_TYPE PARAM_VALUE.MODE_SEL } {
	# Procedure called to update FIFO_MEMORY_TYPE when any of the dependent parameters in the arguments change

	set SYNCH_FIFO_MEMORY_TYPE ${PARAM_VALUE.SYNCH_FIFO_MEMORY_TYPE}
	set MODE_SEL ${PARAM_VALUE.MODE_SEL}
	set values(MODE_SEL) [get_property value $MODE_SEL]
	if { [gen_USERPARAMETER_SYNCH_FIFO_MEMORY_TYPE_ENABLEMENT $values(MODE_SEL)] } {
		set_property enabled true $SYNCH_FIFO_MEMORY_TYPE
	} else {
		set_property enabled false $SYNCH_FIFO_MEMORY_TYPE
	}
}

proc validate_PARAM_VALUE.SYNCH_FIFO_MEMORY_TYPE { PARAM_VALUE.SYNCH_FIFO_MEMORY_TYPE } {
	# Procedure called to validate FIFO_MEMORY_TYPE
	return true
}

proc update_MODELPARAM_VALUE.SYNCH_FIFO_MEMORY_TYPE { MODELPARAM_VALUE.SYNCH_FIFO_MEMORY_TYPE PARAM_VALUE.SYNCH_FIFO_MEMORY_TYPE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SYNCH_FIFO_MEMORY_TYPE}] ${MODELPARAM_VALUE.SYNCH_FIFO_MEMORY_TYPE}
}
#------------------------------------------------------------------------------------------------------------------

#------------------------------------------------- RELATED_CLOCKS ---------------------------------------------------
proc update_PARAM_VALUE.SYNCH_RELATED_CLOCKS { PARAM_VALUE.SYNCH_RELATED_CLOCKS PARAM_VALUE.MODE_SEL } {
	# Procedure called to update RELATED_CLOCKS when any of the dependent parameters in the arguments change

	set SYNCH_RELATED_CLOCKS ${PARAM_VALUE.SYNCH_RELATED_CLOCKS}
	set MODE_SEL ${PARAM_VALUE.MODE_SEL}
	set values(MODE_SEL) [get_property value $MODE_SEL]
	if { [gen_USERPARAMETER_SYNCH_RELATED_CLOCKS_ENABLEMENT $values(MODE_SEL)] } {
		set_property enabled true $SYNCH_RELATED_CLOCKS
	} else {
		set_property enabled false $SYNCH_RELATED_CLOCKS
	}
}

proc validate_PARAM_VALUE.SYNCH_RELATED_CLOCKS { PARAM_VALUE.SYNCH_RELATED_CLOCKS } {
	# Procedure called to validate RELATED_CLOCKS
	return true
}

proc update_MODELPARAM_VALUE.SYNCH_RELATED_CLOCKS { MODELPARAM_VALUE.SYNCH_RELATED_CLOCKS PARAM_VALUE.SYNCH_RELATED_CLOCKS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SYNCH_RELATED_CLOCKS}] ${MODELPARAM_VALUE.SYNCH_RELATED_CLOCKS}
}
#--------------------------------------------------------------------------------------------------------------------

#--------------------------------------------SRC_SYNC_FF ------------------------------------------------------------
proc update_PARAM_VALUE.SRC_SYNC_FF { PARAM_VALUE.SRC_SYNC_FF PARAM_VALUE.MODE_SEL } {
	# Procedure called to update SRC_SYNC_FF when any of the dependent parameters in the arguments change

	set SRC_SYNC_FF ${PARAM_VALUE.SRC_SYNC_FF}
	set MODE_SEL ${PARAM_VALUE.MODE_SEL}
	set values(MODE_SEL) [get_property value $MODE_SEL]
	if { [gen_USERPARAMETER_SRC_SYNC_FF_ENABLEMENT $values(MODE_SEL)] } {
		set_property enabled true $SRC_SYNC_FF
	} else {
		set_property enabled false $SRC_SYNC_FF
	}
}

proc validate_PARAM_VALUE.SRC_SYNC_FF { PARAM_VALUE.SRC_SYNC_FF } {
	# Procedure called to validate SRC_SYNC_FF
	return true
}

proc update_MODELPARAM_VALUE.SRC_SYNC_FF { MODELPARAM_VALUE.SRC_SYNC_FF PARAM_VALUE.SRC_SYNC_FF } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SRC_SYNC_FF}] ${MODELPARAM_VALUE.SRC_SYNC_FF}
}
#-------------------------------------------------------------------------------------------------------------------

#-------------------------------------------- DATA_WIDTH -----------------------------------------------------------
proc update_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to update DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to validate DATA_WIDTH
	return true
}

proc update_MODELPARAM_VALUE.DATA_WIDTH { MODELPARAM_VALUE.DATA_WIDTH PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH}] ${MODELPARAM_VALUE.DATA_WIDTH}
}
#---------------------------------------------------------------------------------------------------------------------

#--------------------------------------------- MODE_SEL --------------------------------------------------------------
proc update_PARAM_VALUE.MODE_SEL { PARAM_VALUE.MODE_SEL } {
	# Procedure called to update MODE_SEL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MODE_SEL { PARAM_VALUE.MODE_SEL } {
	# Procedure called to validate MODE_SEL
	return true
}

proc update_MODELPARAM_VALUE.MODE_SEL { MODELPARAM_VALUE.MODE_SEL PARAM_VALUE.MODE_SEL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MODE_SEL}] ${MODELPARAM_VALUE.MODE_SEL}
}
#---------------------------------------------------------------------------------------------------------------------
