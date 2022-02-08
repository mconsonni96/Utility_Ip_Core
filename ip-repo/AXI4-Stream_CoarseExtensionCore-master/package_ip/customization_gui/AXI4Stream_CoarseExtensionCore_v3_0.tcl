
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/AXI4Stream_CoarseExtensionCore_v3_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  #Adding Group
  set Coarse_Extension_Core [ipgui::add_group $IPINST -name "Coarse Extension Core" -parent ${Page_0}]
  #Adding Group
  set FID_Part [ipgui::add_group $IPINST -name "FID Part" -parent ${Coarse_Extension_Core}]
  set BIT_FID [ipgui::add_param $IPINST -name "BIT_FID" -parent ${FID_Part}]
  set_property tooltip {Bit reserved to the FID of the Belt Bus used to identify properly the timestamps} ${BIT_FID}

  #Adding Group
  set Coarse_Part [ipgui::add_group $IPINST -name "Coarse Part" -parent ${Coarse_Extension_Core}]
  set CEC_VS_CTD_COUNTER [ipgui::add_param $IPINST -name "CEC_VS_CTD_COUNTER" -parent ${Coarse_Part} -widget comboBox]
  set_property tooltip {Choice between the interal Coarse Counter inside the Coarse Extension Core (CEC) sub-module and the external Coarse Tree Distributor (CTD)} ${CEC_VS_CTD_COUNTER}
  set CEC_COARSE_CNT_INIT [ipgui::add_param $IPINST -name "CEC_COARSE_CNT_INIT" -parent ${Coarse_Part}]
  set_property tooltip {Initialization value of the CEC Coarse Counter} ${CEC_COARSE_CNT_INIT}
  set BIT_COARSE [ipgui::add_param $IPINST -name "BIT_COARSE" -parent ${Coarse_Part}]
  set_property tooltip {Bit Coarse Counter dimension} ${BIT_COARSE}

  #Adding Group
  set Uncalibrated_Fine_Part [ipgui::add_group $IPINST -name "Uncalibrated Fine Part" -parent ${Coarse_Extension_Core}]
  set BIT_UNCALIBRATED [ipgui::add_param $IPINST -name "BIT_UNCALIBRATED" -parent ${Uncalibrated_Fine_Part}]
  set_property tooltip {Bit Dimension of Uncalibrated_TDL} ${BIT_UNCALIBRATED}
  set BIT_SUB_INT [ipgui::add_param $IPINST -name "BIT_SUB_INT" -parent ${Uncalibrated_Fine_Part}]
  set_property tooltip {Bit dimension of Bit Sub-Interpolated Output} ${BIT_SUB_INT}


  #Adding Group
  set xpm_fifo_async [ipgui::add_group $IPINST -name "xpm_fifo_async" -parent ${Page_0} -display_name {xpm_fifo_async}]
  set RELATED_CLOCKS [ipgui::add_param $IPINST -name "RELATED_CLOCKS" -parent ${xpm_fifo_async}]
  set_property tooltip {Phase relation between TDC and SYS clocks} ${RELATED_CLOCKS}
  set CDC_SYNC_STAGES [ipgui::add_param $IPINST -name "CDC_SYNC_STAGES" -parent ${xpm_fifo_async}]
  set_property tooltip {Synchronization CDC stages in the FIFO} ${CDC_SYNC_STAGES}
  set FIFO_MEMORY_TYPE [ipgui::add_param $IPINST -name "FIFO_MEMORY_TYPE" -parent ${xpm_fifo_async} -widget comboBox]
  set_property tooltip {Synchronizer FIFO type} ${FIFO_MEMORY_TYPE}
  set FIFO_WRITE_DEPTH [ipgui::add_param $IPINST -name "FIFO_WRITE_DEPTH" -parent ${xpm_fifo_async} -widget comboBox]
  set_property tooltip {Synchronizer FIFO Depth} ${FIFO_WRITE_DEPTH}

  #Adding Group
  set TreeComparator [ipgui::add_group $IPINST -name "TreeComparator" -parent ${Page_0}]
  #Adding Group
  set Stage_0 [ipgui::add_group $IPINST -name "Stage 0" -parent ${TreeComparator}]
  set MAX_NUM_BIT_EQ_PIPELINE_STAGE0 [ipgui::add_param $IPINST -name "MAX_NUM_BIT_EQ_PIPELINE_STAGE0" -parent ${Stage_0}]
  set_property tooltip {Blocks of bits of the inputs that we want to compare in the first stage} ${MAX_NUM_BIT_EQ_PIPELINE_STAGE0}

  #Adding Group
  set Other_stages [ipgui::add_group $IPINST -name "Other stages" -parent ${TreeComparator} -display_name {Other Stages}]
  set MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 [ipgui::add_param $IPINST -name "MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1" -parent ${Other_stages}]
  set_property tooltip {Select the maximum number of inputs for the AND gates in the second stage} ${MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1}
  set MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 [ipgui::add_param $IPINST -name "MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2" -parent ${Other_stages}]
  set_property tooltip {Select the maximum number of inputs for the AND gates in the third stage} ${MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2}
  set MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 [ipgui::add_param $IPINST -name "MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3" -parent ${Other_stages}]
  set_property tooltip {Select the maximum number of inputs for the AND gates in the fourth stage} ${MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3}




}

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

proc update_PARAM_VALUE.BIT_SUB_INT { PARAM_VALUE.BIT_SUB_INT } {
	# Procedure called to update BIT_SUB_INT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_SUB_INT { PARAM_VALUE.BIT_SUB_INT } {
	# Procedure called to validate BIT_SUB_INT
	return true
}

proc update_PARAM_VALUE.BIT_UNCALIBRATED { PARAM_VALUE.BIT_UNCALIBRATED } {
	# Procedure called to update BIT_UNCALIBRATED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BIT_UNCALIBRATED { PARAM_VALUE.BIT_UNCALIBRATED } {
	# Procedure called to validate BIT_UNCALIBRATED
	return true
}

proc update_PARAM_VALUE.CDC_SYNC_STAGES { PARAM_VALUE.CDC_SYNC_STAGES } {
	# Procedure called to update CDC_SYNC_STAGES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CDC_SYNC_STAGES { PARAM_VALUE.CDC_SYNC_STAGES } {
	# Procedure called to validate CDC_SYNC_STAGES
	return true
}

proc update_PARAM_VALUE.CEC_VS_CTD_COUNTER { PARAM_VALUE.CEC_VS_CTD_COUNTER } {
	# Procedure called to update CEC_VS_CTD_COUNTER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CEC_VS_CTD_COUNTER { PARAM_VALUE.CEC_VS_CTD_COUNTER } {
	# Procedure called to validate CEC_VS_CTD_COUNTER
	return true
}

proc update_PARAM_VALUE.FIFO_MEMORY_TYPE { PARAM_VALUE.FIFO_MEMORY_TYPE } {
	# Procedure called to update FIFO_MEMORY_TYPE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIFO_MEMORY_TYPE { PARAM_VALUE.FIFO_MEMORY_TYPE } {
	# Procedure called to validate FIFO_MEMORY_TYPE
	return true
}

proc update_PARAM_VALUE.FIFO_WRITE_DEPTH { PARAM_VALUE.FIFO_WRITE_DEPTH } {
	# Procedure called to update FIFO_WRITE_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIFO_WRITE_DEPTH { PARAM_VALUE.FIFO_WRITE_DEPTH } {
	# Procedure called to validate FIFO_WRITE_DEPTH
	return true
}

proc update_PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 { PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 } {
	# Procedure called to update MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 { PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 } {
	# Procedure called to validate MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1
	return true
}

proc update_PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 { PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 } {
	# Procedure called to update MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 { PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 } {
	# Procedure called to validate MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2
	return true
}

proc update_PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 { PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 } {
	# Procedure called to update MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 { PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 } {
	# Procedure called to validate MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3
	return true
}

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

proc update_PARAM_VALUE.RELATED_CLOCKS { PARAM_VALUE.RELATED_CLOCKS } {
	# Procedure called to update RELATED_CLOCKS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RELATED_CLOCKS { PARAM_VALUE.RELATED_CLOCKS } {
	# Procedure called to validate RELATED_CLOCKS
	return true
}


proc update_MODELPARAM_VALUE.CEC_VS_CTD_COUNTER { MODELPARAM_VALUE.CEC_VS_CTD_COUNTER PARAM_VALUE.CEC_VS_CTD_COUNTER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CEC_VS_CTD_COUNTER}] ${MODELPARAM_VALUE.CEC_VS_CTD_COUNTER}
}

proc update_MODELPARAM_VALUE.CEC_COARSE_CNT_INIT { MODELPARAM_VALUE.CEC_COARSE_CNT_INIT PARAM_VALUE.CEC_COARSE_CNT_INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CEC_COARSE_CNT_INIT}] ${MODELPARAM_VALUE.CEC_COARSE_CNT_INIT}
}

proc update_MODELPARAM_VALUE.BIT_COARSE { MODELPARAM_VALUE.BIT_COARSE PARAM_VALUE.BIT_COARSE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_COARSE}] ${MODELPARAM_VALUE.BIT_COARSE}
}

proc update_MODELPARAM_VALUE.BIT_SUB_INT { MODELPARAM_VALUE.BIT_SUB_INT PARAM_VALUE.BIT_SUB_INT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_SUB_INT}] ${MODELPARAM_VALUE.BIT_SUB_INT}
}

proc update_MODELPARAM_VALUE.BIT_UNCALIBRATED { MODELPARAM_VALUE.BIT_UNCALIBRATED PARAM_VALUE.BIT_UNCALIBRATED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_UNCALIBRATED}] ${MODELPARAM_VALUE.BIT_UNCALIBRATED}
}

proc update_MODELPARAM_VALUE.BIT_FID { MODELPARAM_VALUE.BIT_FID PARAM_VALUE.BIT_FID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_FID}] ${MODELPARAM_VALUE.BIT_FID}
}

proc update_MODELPARAM_VALUE.FIFO_MEMORY_TYPE { MODELPARAM_VALUE.FIFO_MEMORY_TYPE PARAM_VALUE.FIFO_MEMORY_TYPE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIFO_MEMORY_TYPE}] ${MODELPARAM_VALUE.FIFO_MEMORY_TYPE}
}

proc update_MODELPARAM_VALUE.RELATED_CLOCKS { MODELPARAM_VALUE.RELATED_CLOCKS PARAM_VALUE.RELATED_CLOCKS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RELATED_CLOCKS}] ${MODELPARAM_VALUE.RELATED_CLOCKS}
}

proc update_MODELPARAM_VALUE.FIFO_WRITE_DEPTH { MODELPARAM_VALUE.FIFO_WRITE_DEPTH PARAM_VALUE.FIFO_WRITE_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIFO_WRITE_DEPTH}] ${MODELPARAM_VALUE.FIFO_WRITE_DEPTH}
}

proc update_MODELPARAM_VALUE.CDC_SYNC_STAGES { MODELPARAM_VALUE.CDC_SYNC_STAGES PARAM_VALUE.CDC_SYNC_STAGES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CDC_SYNC_STAGES}] ${MODELPARAM_VALUE.CDC_SYNC_STAGES}
}

proc update_MODELPARAM_VALUE.MAX_NUM_BIT_EQ_PIPELINE_STAGE0 { MODELPARAM_VALUE.MAX_NUM_BIT_EQ_PIPELINE_STAGE0 PARAM_VALUE.MAX_NUM_BIT_EQ_PIPELINE_STAGE0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_NUM_BIT_EQ_PIPELINE_STAGE0}] ${MODELPARAM_VALUE.MAX_NUM_BIT_EQ_PIPELINE_STAGE0}
}

proc update_MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 { MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1}] ${MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1}
}

proc update_MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 { MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2}] ${MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2}
}

proc update_MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 { MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3}] ${MODELPARAM_VALUE.MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3}
}
