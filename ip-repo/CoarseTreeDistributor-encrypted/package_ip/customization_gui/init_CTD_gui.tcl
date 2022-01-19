
# Definitional proc to organize widgets for parameters.
proc init_CTD_gui { IPINST Page} {

	#Adding Page
    set Page_0 [ipgui::add_page $IPINST -name $Page]

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
