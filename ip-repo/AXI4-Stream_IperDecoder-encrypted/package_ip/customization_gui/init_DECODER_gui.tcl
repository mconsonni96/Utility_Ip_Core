
# Definitional proc to organize widgets for parameters.
proc init_DECODER_gui { IPINST Page} {

  #Adding Page
  set Decoder [ipgui::add_page $IPINST -name $Page]

  #Adding Group
  set Pipeline_Type_Management [ipgui::add_group $IPINST -name "Pipeline Type Management" -parent ${Decoder}]
  set FREE_RUNNING [ipgui::add_param $IPINST -name "FREE_RUNNING" -parent ${Pipeline_Type_Management}]
  set_property tooltip {Choose if the sub-modules of Iper Decoder that do the decoding work each pulse of clock or only during the valid} ${FREE_RUNNING}
  set EDGE_CHECK [ipgui::add_param $IPINST -name "EDGE_CHECK" -parent ${Pipeline_Type_Management}]
  set_property tooltip {Choose if the sub-modules of Iper Decoder that do the edge chack removing the valid if no edge is over the TDLs} ${EDGE_CHECK}

  #Adding Group
  set Dimensions [ipgui::add_group $IPINST -name "Dimensions" -parent ${Decoder}]
  set NUMBER_OF_TDL [ipgui::add_param $IPINST -name "NUMBER_OF_TDL" -parent ${Dimensions}]
  set_property tooltip {Number of TDL sub-Interpolated in each TDC channel} ${NUMBER_OF_TDL}
  set BIT_TDL [ipgui::add_param $IPINST -name "BIT_TDL" -parent ${Dimensions}]
  set_property tooltip {Number of Taps in each TDL} ${BIT_TDL}
  set BIT_COARSE [ipgui::add_param $IPINST -name "BIT_COARSE" -parent ${Dimensions}]
  set_property tooltip {Bit Coarse Counter dimension} ${BIT_COARSE}
  set BIT_BUBBLE [ipgui::add_param $IPINST -name "BIT_BUBBLE" -parent ${Dimensions}]
  set_property tooltip {Maximum estention of a bubble error over the TDL} ${BIT_BUBBLE}
  set BIT_SUB_INT [ipgui::add_param $IPINST -name "BIT_SUB_INT" -parent ${Dimensions}]
  set_property tooltip {Bit dimenstino of Bit Sub-Interpolated Output} ${BIT_SUB_INT}

  #Adding Group
  set Type_of_Decoder [ipgui::add_group $IPINST -name "Type of Decoder" -parent ${Decoder}]
  set MD_VS_TD [ipgui::add_param $IPINST -name "MD_VS_TD" -parent ${Type_of_Decoder} -widget comboBox]
  set_property tooltip {Choose the modality for setting the paramiters of the Decoder, automatic (Turbo) or manual (Macro)} ${MD_VS_TD}
  set TYPE_DECODER [ipgui::add_param $IPINST -name "TYPE_DECODER" -parent ${Type_of_Decoder} -widget comboBox]
  set_property tooltip {Choose the type of the sub-module that do the decoding, thermo-to-binary (T2B) or log2 (LOG)} ${TYPE_DECODER}
  #Adding Group
  set Macro_Decoder [ipgui::add_group $IPINST -name "Macro Decoder" -parent ${Type_of_Decoder}]
  #Adding Group
  set T2B_Decoder [ipgui::add_group $IPINST -name "T2B Decoder" -parent ${Macro_Decoder}]
  set_property tooltip {T2B Decoder} ${T2B_Decoder}
  set DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0 [ipgui::add_param $IPINST -name "DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0" -parent ${T2B_Decoder}]
  set_property tooltip {Pipeline stage of the Thermo-to-Binary of T2B Decoder that intrinsecally solve the bubble errors} ${DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0}
  set DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1 [ipgui::add_param $IPINST -name "DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1" -parent ${T2B_Decoder}]
  set_property tooltip {Pipeline stage of the Thermo-to-Binary of T2B Decoder that intrinsecally solve the bubble errors} ${DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1}
  set DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2 [ipgui::add_param $IPINST -name "DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2" -parent ${T2B_Decoder}]
  set_property tooltip {Pipeline stage of the Thermo-to-Binary of T2B Decoder that intrinsecally solve the bubble errors} ${DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2}
  set DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3 [ipgui::add_param $IPINST -name "DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3" -parent ${T2B_Decoder}]
  set_property tooltip {Pipeline stage of the Thermo-to-Binary of T2B Decoder that intrinsecally solve the bubble errors} ${DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3}

  #Adding Group
  set Log2_Decoder [ipgui::add_group $IPINST -name "Log2 Decoder" -parent ${Macro_Decoder}]
  set DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0 [ipgui::add_param $IPINST -name "DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0" -parent ${Log2_Decoder}]
  set_property tooltip {Pipeline stage of the Tree Adder of Log2 Decoder used for solve bubble arrors} ${DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0}
  set DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1 [ipgui::add_param $IPINST -name "DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1" -parent ${Log2_Decoder}]
  set_property tooltip {Pipeline stage of the Tree Adder of Log2 Decoder used for solve bubble arrors} ${DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1}

  #Adding Group
  set Sub-Interpolator [ipgui::add_group $IPINST -name "Sub-Interpolator" -parent ${Macro_Decoder}]
  set_property tooltip {Sub-Interpolator} ${Sub-Interpolator}
  set SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0 [ipgui::add_param $IPINST -name "SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0" -parent ${Sub-Interpolator}]
  set_property tooltip {Pipeline stage of the Tree Adder of used as Sub_interpolator of the TDLs} ${SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0}
  set SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1 [ipgui::add_param $IPINST -name "SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1" -parent ${Sub-Interpolator}]
  set_property tooltip {Pipeline stage of the Tree Adder of used as Sub_interpolator of the TDLs} ${SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1}


  #Adding Group
  set Turbo_Decoder [ipgui::add_group $IPINST -name "Turbo Decoder" -parent ${Type_of_Decoder}]
  set PRINT_FULL_REPORT [ipgui::add_param $IPINST -name "PRINT_FULL_REPORT" -parent ${Turbo_Decoder}]
  set_property tooltip {Print the report of the Turbo Decoder pre-processor} ${PRINT_FULL_REPORT}
  set WEIGHT_AREA_VS_TIME_PERCENT [ipgui::add_param $IPINST -name "WEIGHT_AREA_VS_TIME_PERCENT" -parent ${Turbo_Decoder}]
  set_property tooltip {Weigth Percent of the Cost to tune the settings of the pre-processor, Area is 0 Time is 100} ${WEIGHT_AREA_VS_TIME_PERCENT}
  set OPTIMIZATION_MODE [ipgui::add_param $IPINST -name "OPTIMIZATION_MODE" -parent ${Turbo_Decoder} -widget comboBox]
  set_property tooltip {Choose the Turbo Decoder optimization mode setting to pre-processor } ${OPTIMIZATION_MODE}


  #Adding Group
  set Type_Edge [ipgui::add_group $IPINST -name "Type Edge" -parent ${Decoder}]
  set TYPE_EDGE_0 [ipgui::add_param $IPINST -name "TYPE_EDGE_0" -parent ${Type_Edge} -widget comboBox]
  set_property tooltip {Edge to detect over TDL} ${TYPE_EDGE_0}
  set TYPE_EDGE_1 [ipgui::add_param $IPINST -name "TYPE_EDGE_1" -parent ${Type_Edge} -widget comboBox]
  set_property tooltip {Edge to detect over TDL} ${TYPE_EDGE_1}
  set TYPE_EDGE_2 [ipgui::add_param $IPINST -name "TYPE_EDGE_2" -parent ${Type_Edge} -widget comboBox]
  set_property tooltip {Edge to detect over TDL} ${TYPE_EDGE_2}
  set TYPE_EDGE_3 [ipgui::add_param $IPINST -name "TYPE_EDGE_3" -parent ${Type_Edge} -widget comboBox]
  set_property tooltip {Edge to detect over TDL} ${TYPE_EDGE_3}
  set TYPE_EDGE_4 [ipgui::add_param $IPINST -name "TYPE_EDGE_4" -parent ${Type_Edge} -widget comboBox]
  set_property tooltip {Edge to detect over TDL} ${TYPE_EDGE_4}
  set TYPE_EDGE_5 [ipgui::add_param $IPINST -name "TYPE_EDGE_5" -parent ${Type_Edge} -widget comboBox]
  set_property tooltip {Edge to detect over TDL} ${TYPE_EDGE_5}
  set TYPE_EDGE_6 [ipgui::add_param $IPINST -name "TYPE_EDGE_6" -parent ${Type_Edge} -widget comboBox]
  set_property tooltip {Edge to detect over TDL} ${TYPE_EDGE_6}
  set TYPE_EDGE_7 [ipgui::add_param $IPINST -name "TYPE_EDGE_7" -parent ${Type_Edge} -widget comboBox]
  set_property tooltip {Edge to detect over TDL} ${TYPE_EDGE_7}
  set TYPE_EDGE_8 [ipgui::add_param $IPINST -name "TYPE_EDGE_8" -parent ${Type_Edge} -widget comboBox]
  set_property tooltip {Edge to detect over TDL} ${TYPE_EDGE_8}
  set TYPE_EDGE_9 [ipgui::add_param $IPINST -name "TYPE_EDGE_9" -parent ${Type_Edge} -widget comboBox]
  set_property tooltip {Edge to detect over TDL} ${TYPE_EDGE_9}
  set TYPE_EDGE_10 [ipgui::add_param $IPINST -name "TYPE_EDGE_10" -parent ${Type_Edge} -widget comboBox]
  set_property tooltip {Edge to detect over TDL} ${TYPE_EDGE_10}
  set TYPE_EDGE_11 [ipgui::add_param $IPINST -name "TYPE_EDGE_11" -parent ${Type_Edge} -widget comboBox]
  set_property tooltip {Edge to detect over TDL} ${TYPE_EDGE_11}
  set TYPE_EDGE_12 [ipgui::add_param $IPINST -name "TYPE_EDGE_12" -parent ${Type_Edge} -widget comboBox]
  set_property tooltip {Edge to detect over TDL} ${TYPE_EDGE_12}
  set TYPE_EDGE_13 [ipgui::add_param $IPINST -name "TYPE_EDGE_13" -parent ${Type_Edge} -widget comboBox]
  set_property tooltip {Edge to detect over TDL} ${TYPE_EDGE_13}
  set TYPE_EDGE_14 [ipgui::add_param $IPINST -name "TYPE_EDGE_14" -parent ${Type_Edge} -widget comboBox]
  set_property tooltip {Edge to detect over TDL} ${TYPE_EDGE_14}
  set TYPE_EDGE_15 [ipgui::add_param $IPINST -name "TYPE_EDGE_15" -parent ${Type_Edge} -widget comboBox]
  set_property tooltip {Edge to detect over TDL} ${TYPE_EDGE_15}

  #Adding Group
  set Debug_Section [ipgui::add_group $IPINST -name "Debug Section" -parent ${Decoder}]
  set_property tooltip {Debug Section} ${Debug_Section}
  set DEBUG_MODE [ipgui::add_param $IPINST -name "DEBUG_MODE" -parent ${Debug_Section}]
  set_property tooltip {Debug port at clock TDC for the Iper Decoder} ${DEBUG_MODE}



}
