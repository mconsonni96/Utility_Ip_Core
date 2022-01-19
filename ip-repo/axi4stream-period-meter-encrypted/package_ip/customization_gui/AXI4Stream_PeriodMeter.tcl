
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/AXI4Stream_Synchronizer_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	ipgui::add_param $IPINST -name "Component_Name"
    #Adding Page
    set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
    #Adding Group
    set Number_of_Synchronization_Channel [ipgui::add_group $IPINST -name "Number of Synchronization Channel" -parent ${Page_0}]
    set CH_SYNC [ipgui::add_param $IPINST -name "CH_SYNC" -parent ${Number_of_Synchronization_Channel}]
    set_property tooltip {Variable that specifies the synchronization channel} ${CH_SYNC}

    #Adding Group
    set Selection_of_the_filter [ipgui::add_group $IPINST -name "Selection of the filter" -parent ${Page_0}]
    set FILTER_SEL [ipgui::add_param $IPINST -name "FILTER_SEL" -parent ${Selection_of_the_filter} -widget comboBox]
    set_property tooltip {Choice between the gated_integrator filter and the moving_average filter} ${FILTER_SEL}

    #Adding Group
    set Number_of_Samples [ipgui::add_group $IPINST -name "Number of Samples" -parent ${Page_0}]
    set EXPSAMPLE [ipgui::add_param $IPINST -name "EXPSAMPLE" -parent ${Number_of_Samples}]
    set_property tooltip {2**EXPSAMPLE is the number of samples collected for the filter} ${EXPSAMPLE}

    #Adding Group
    set Dimensions [ipgui::add_group $IPINST -name "Dimensions" -parent ${Page_0}]
    set BIT_NUM_CH [ipgui::add_param $IPINST -name "BIT_NUM_CH" -parent ${Dimensions}]
    set_property tooltip {Variable that sets the dimension of the number of channel field} ${BIT_NUM_CH}
    set BIT_FID [ipgui::add_param $IPINST -name "BIT_FID" -parent ${Dimensions}]
    set_property tooltip {Variable that sets the dimension of the fid field} ${BIT_FID}
    set BIT_OVERFLOW [ipgui::add_param $IPINST -name "BIT_OVERFLOW" -parent ${Dimensions}]
    set_property tooltip {Variable that sets the dimension of the overflow field} ${BIT_OVERFLOW}
    set BIT_COARSE [ipgui::add_param $IPINST -name "BIT_COARSE" -parent ${Dimensions}]
    set_property tooltip {Variable that sets the dimension of the coarse field} ${BIT_COARSE}
    set BIT_RESOLUTION [ipgui::add_param $IPINST -name "BIT_RESOLUTION" -parent ${Dimensions}]
    set_property tooltip {Variable that sets the dimension of the resolution field} ${BIT_RESOLUTION}



}

# Definitional proc to dynamic set for parameters in GUI.
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/set_AXI4Stream_PeriodMeter_gui.tcl]
