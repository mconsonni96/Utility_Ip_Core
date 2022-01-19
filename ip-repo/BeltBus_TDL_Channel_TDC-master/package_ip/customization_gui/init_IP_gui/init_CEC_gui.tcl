
# Definitional proc to organize widgets for parameters.
proc init_CEC_gui { IPINST Page} {

  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name $Page]
  #Adding Group
  set Coarse_Extension_Core [ipgui::add_group $IPINST -name "Coarse Extension Core" -parent ${Page_0}]

  #Adding Group
  set Overflow_counter [ipgui::add_group $IPINST -name "Overflow Counter Enablement" -parent ${Coarse_Extension_Core}]
  set INTERNAL_OVERFLOW_CNT [ipgui::add_param $IPINST -name "INTERNAL_OVERFLOW_CNT" -parent ${Overflow_counter}]
  set_property tooltip {# Generic used for deciding whether to count the overflows in the CEC (if *INTERNAL_OVERFLOW_CNT* is TRUE) or leave the Overfow Counter the task of counting (if *INTERNAL_OVERFLOW_CNT* is FALSE)} ${INTERNAL_OVERFLOW_CNT}
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
  #set BIT_COARSE [ipgui::add_param $IPINST -name "BIT_COARSE" -parent ${Coarse_Part}]
  #set_property tooltip {Bit Coarse Counter dimension} ${BIT_COARSE}

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
