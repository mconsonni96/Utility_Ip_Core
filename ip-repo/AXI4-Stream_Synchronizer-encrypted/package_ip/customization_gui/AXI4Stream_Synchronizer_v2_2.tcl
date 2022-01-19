
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/AXI4Stream_Synchronizer_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Synchronizer [ipgui::add_page $IPINST -name "Synchronizer"]
  set DATA_WIDTH [ipgui::add_param $IPINST -name "DATA_WIDTH" -parent ${Synchronizer}]
  set_property tooltip {Variable that sets the dimensions of the slave and master data} ${DATA_WIDTH}
  set MODE_SEL [ipgui::add_param $IPINST -name "MODE_SEL" -parent ${Synchronizer} -widget comboBox]
  set_property tooltip {Choice between the CDC_Synchronizer and the FIFO_Synchronizer} ${MODE_SEL}
  #Adding Group
  set FIFO_Dimensions [ipgui::add_group $IPINST -name "FIFO Dimensions" -parent ${Synchronizer}]
  set CDC_SYNC_STAGES [ipgui::add_param $IPINST -name "CDC_SYNC_STAGES" -parent ${FIFO_Dimensions}]
  set_property tooltip {Number of synchronization stages in the CDC path} ${CDC_SYNC_STAGES}
  set RELATED_CLOCKS [ipgui::add_param $IPINST -name "RELATED_CLOCKS" -parent ${FIFO_Dimensions}]
  set_property tooltip {It specifies if the two clocks are related or not} ${RELATED_CLOCKS}
  set FIFO_DEPTH [ipgui::add_param $IPINST -name "FIFO_DEPTH" -parent ${FIFO_Dimensions} -widget comboBox]
  set_property tooltip {Depth of the FIFO} ${FIFO_DEPTH}
  set FIFO_MEMORY_TYPE [ipgui::add_param $IPINST -name "FIFO_MEMORY_TYPE" -parent ${FIFO_Dimensions} -widget comboBox]
  set_property tooltip {Choice between the different types of FIFO memory, it can be: auto, block or distributed} ${FIFO_MEMORY_TYPE}

  #Adding Group
  set CDC_Dimensions [ipgui::add_group $IPINST -name "CDC Dimensions" -parent ${Synchronizer}]
  set SRC_SYNC_FF [ipgui::add_param $IPINST -name "SRC_SYNC_FF" -parent ${CDC_Dimensions}]
  set_property tooltip {Number of synchronization stages in the CDC path of the source(slave)} ${SRC_SYNC_FF}
  set DEST_SYNC_FF [ipgui::add_param $IPINST -name "DEST_SYNC_FF" -parent ${CDC_Dimensions}]
  set_property tooltip {Number of synchronization stages in the CDC path of the destination (master)} ${DEST_SYNC_FF}



}

proc update_PARAM_VALUE.CDC_SYNC_STAGES { PARAM_VALUE.CDC_SYNC_STAGES PARAM_VALUE.MODE_SEL PARAM_VALUE.RELATED_CLOCKS } {
	# Procedure called to update CDC_SYNC_STAGES when any of the dependent parameters in the arguments change

	set CDC_SYNC_STAGES ${PARAM_VALUE.CDC_SYNC_STAGES}
	set MODE_SEL ${PARAM_VALUE.MODE_SEL}
	set RELATED_CLOCKS ${PARAM_VALUE.RELATED_CLOCKS}
	set values(MODE_SEL) [get_property value $MODE_SEL]
	set values(RELATED_CLOCKS) [get_property value $RELATED_CLOCKS]
	if { [gen_USERPARAMETER_CDC_SYNC_STAGES_ENABLEMENT $values(MODE_SEL) $values(RELATED_CLOCKS)] } {
		set_property enabled true $CDC_SYNC_STAGES
	} else {
		set_property enabled false $CDC_SYNC_STAGES
	}
}

proc validate_PARAM_VALUE.CDC_SYNC_STAGES { PARAM_VALUE.CDC_SYNC_STAGES } {
	# Procedure called to validate CDC_SYNC_STAGES
	return true
}

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

proc update_PARAM_VALUE.FIFO_DEPTH { PARAM_VALUE.FIFO_DEPTH PARAM_VALUE.MODE_SEL } {
	# Procedure called to update FIFO_DEPTH when any of the dependent parameters in the arguments change

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
	# Procedure called to validate FIFO_DEPTH
	return true
}

proc update_PARAM_VALUE.FIFO_MEMORY_TYPE { PARAM_VALUE.FIFO_MEMORY_TYPE PARAM_VALUE.MODE_SEL } {
	# Procedure called to update FIFO_MEMORY_TYPE when any of the dependent parameters in the arguments change

	set FIFO_MEMORY_TYPE ${PARAM_VALUE.FIFO_MEMORY_TYPE}
	set MODE_SEL ${PARAM_VALUE.MODE_SEL}
	set values(MODE_SEL) [get_property value $MODE_SEL]
	if { [gen_USERPARAMETER_FIFO_MEMORY_TYPE_ENABLEMENT $values(MODE_SEL)] } {
		set_property enabled true $FIFO_MEMORY_TYPE
	} else {
		set_property enabled false $FIFO_MEMORY_TYPE
	}
}

proc validate_PARAM_VALUE.FIFO_MEMORY_TYPE { PARAM_VALUE.FIFO_MEMORY_TYPE } {
	# Procedure called to validate FIFO_MEMORY_TYPE
	return true
}

proc update_PARAM_VALUE.RELATED_CLOCKS { PARAM_VALUE.RELATED_CLOCKS PARAM_VALUE.MODE_SEL } {
	# Procedure called to update RELATED_CLOCKS when any of the dependent parameters in the arguments change

	set RELATED_CLOCKS ${PARAM_VALUE.RELATED_CLOCKS}
	set MODE_SEL ${PARAM_VALUE.MODE_SEL}
	set values(MODE_SEL) [get_property value $MODE_SEL]
	if { [gen_USERPARAMETER_RELATED_CLOCKS_ENABLEMENT $values(MODE_SEL)] } {
		set_property enabled true $RELATED_CLOCKS
	} else {
		set_property enabled false $RELATED_CLOCKS
	}
}

proc validate_PARAM_VALUE.RELATED_CLOCKS { PARAM_VALUE.RELATED_CLOCKS } {
	# Procedure called to validate RELATED_CLOCKS
	return true
}

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

proc update_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to update DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to validate DATA_WIDTH
	return true
}

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

proc update_MODELPARAM_VALUE.DATA_WIDTH { MODELPARAM_VALUE.DATA_WIDTH PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH}] ${MODELPARAM_VALUE.DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.FIFO_MEMORY_TYPE { MODELPARAM_VALUE.FIFO_MEMORY_TYPE PARAM_VALUE.FIFO_MEMORY_TYPE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIFO_MEMORY_TYPE}] ${MODELPARAM_VALUE.FIFO_MEMORY_TYPE}
}

proc update_MODELPARAM_VALUE.RELATED_CLOCKS { MODELPARAM_VALUE.RELATED_CLOCKS PARAM_VALUE.RELATED_CLOCKS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RELATED_CLOCKS}] ${MODELPARAM_VALUE.RELATED_CLOCKS}
}

proc update_MODELPARAM_VALUE.CDC_SYNC_STAGES { MODELPARAM_VALUE.CDC_SYNC_STAGES PARAM_VALUE.CDC_SYNC_STAGES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CDC_SYNC_STAGES}] ${MODELPARAM_VALUE.CDC_SYNC_STAGES}
}

proc update_MODELPARAM_VALUE.DEST_SYNC_FF { MODELPARAM_VALUE.DEST_SYNC_FF PARAM_VALUE.DEST_SYNC_FF } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEST_SYNC_FF}] ${MODELPARAM_VALUE.DEST_SYNC_FF}
}

proc update_MODELPARAM_VALUE.SRC_SYNC_FF { MODELPARAM_VALUE.SRC_SYNC_FF PARAM_VALUE.SRC_SYNC_FF } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SRC_SYNC_FF}] ${MODELPARAM_VALUE.SRC_SYNC_FF}
}

proc update_MODELPARAM_VALUE.FIFO_DEPTH { MODELPARAM_VALUE.FIFO_DEPTH PARAM_VALUE.FIFO_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIFO_DEPTH}] ${MODELPARAM_VALUE.FIFO_DEPTH}
}
