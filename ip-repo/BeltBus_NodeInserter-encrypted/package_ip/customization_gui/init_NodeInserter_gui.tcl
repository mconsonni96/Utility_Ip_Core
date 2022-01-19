# Definitional proc to organize Counter widgets for parameters.
proc init_NodeInserter_gui { IPINST Page} {

    #Adding Page
    set Page_0 [ipgui::add_page $IPINST -name $Page]

    #Adding Group
    set Channel_number [ipgui::add_group $IPINST -name "Channel number" -parent ${Page_0}]
    ipgui::add_param $IPINST -name "NUM_CH" -parent ${Channel_number}
    ipgui::add_param $IPINST -name "NUM_NODE" -parent ${Channel_number}

    #Adding Group
    set Data [ipgui::add_group $IPINST -name "Data" -parent ${Page_0}]
    set BIT_NUM_CH [ipgui::add_param $IPINST -name "BIT_NUM_CH" -parent ${Data}]
    set_property tooltip {Number of bits used for the number of channel} ${BIT_NUM_CH}
    set BIT_FID [ipgui::add_param $IPINST -name "BIT_FID" -parent ${Data}]
    set_property tooltip {Number of bits of the Function ID} ${BIT_FID}
    set BIT_COARSE [ipgui::add_param $IPINST -name "BIT_COARSE" -parent ${Data}]
    set_property tooltip {Numbero of bits of the coarse counter} ${BIT_COARSE}
    set BIT_RESOLUTION [ipgui::add_param $IPINST -name "BIT_RESOLUTION" -parent ${Data}]
    set_property tooltip {Number of Bits used for sub-clock resolution} ${BIT_RESOLUTION}

    #Adding Group
    set Tunable_Generics [ipgui::add_group $IPINST -name "Tunable Generics" -parent ${Page_0}]
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
    set Pass_Through [ipgui::add_group $IPINST -name "Pass Through" -parent ${Page_0}]
    set_property tooltip {Pass Through} ${Pass_Through}
    set PASS_THROUGH [ipgui::add_param $IPINST -name "PASS_THROUGH" -parent ${Pass_Through} -widget comboBox]
    set_property tooltip {If Belt-Bus the NodeInserter is Implemented, with Timestamp not there is a simple parallel output} ${PASS_THROUGH}

}
