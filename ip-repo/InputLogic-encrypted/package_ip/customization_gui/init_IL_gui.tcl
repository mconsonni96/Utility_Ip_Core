
# Definitional proc to organize Input Logic widgets for parameters.
proc init_IL_gui { IPINST Page} {

    #Adding Page
    set Input_Logic [ipgui::add_page $IPINST -name "Input Logic"]
    set TUNING_MODE [ipgui::add_param $IPINST -name "TUNING_MODE" -parent ${Input_Logic}]
    set_property tooltip {Choice between generic and port, if TRUE we choose the signal coming from the port, if FALSE we choose the value of the generic } ${TUNING_MODE}
    set CALIB_EVENT [ipgui::add_param $IPINST -name "CALIB_EVENT" -parent ${Input_Logic} -widget comboBox]
    set_property tooltip {Choose how to generate CalibEvent} ${CALIB_EVENT}
    #Adding Group
    set BUffer [ipgui::add_group $IPINST -name "Buffer" -parent ${Input_Logic} -display_name {Input Buffer}]
    set_property tooltip {Input Buffer} ${BUffer}
    set INPUT_BUFFER_TYPE [ipgui::add_param $IPINST -name "INPUT_BUFFER_TYPE" -parent ${BUffer} -widget comboBox]
    set_property tooltip {Choose between Single-Ended (IBUF) and Fully-Differential (IBUFDS) input buffer} ${INPUT_BUFFER_TYPE}
    set INVERT_BUFFER_POLARITY [ipgui::add_param $IPINST -name "INVERT_BUFFER_POLARITY" -parent ${BUffer}]
    set_property tooltip {Select the buffer polarity if an hardware inversion is perfromed in PCB routing} ${INVERT_BUFFER_POLARITY}

    #Adding Group
    set Trigger [ipgui::add_group $IPINST -name "Trigger" -parent ${Input_Logic}]
    set_property tooltip {Trigger} ${Trigger}
    set EDGE_TRIGGER_INIT [ipgui::add_param $IPINST -name "EDGE_TRIGGER_INIT" -parent ${Trigger} -widget comboBox]
    set_property tooltip {Choose the edge trigger of AsyncEventIn} ${EDGE_TRIGGER_INIT}

    #Adding Group
    set Stretcher [ipgui::add_group $IPINST -name "Stretcher" -parent ${Input_Logic}]
    set BIT_STRETCH_LENGTH [ipgui::add_param $IPINST -name "BIT_STRETCH_LENGTH" -parent ${Stretcher}]
    set_property tooltip {Bit length of StretchLength} ${BIT_STRETCH_LENGTH}
    set STRETCH_LENGTH_INIT [ipgui::add_param $IPINST -name "STRETCH_LENGTH_INIT" -parent ${Stretcher}]
    set_property tooltip {Duration of the stretched pulse, multiple of clock pulses} ${STRETCH_LENGTH_INIT}

    #Adding Group
    set Divider [ipgui::add_group $IPINST -name "Divider" -parent ${Input_Logic}]
    set BIT_DIVIDER [ipgui::add_param $IPINST -name "BIT_DIVIDER" -parent ${Divider}]
    set_property tooltip {Bit length of the Divider} ${BIT_DIVIDER}
    ipgui::add_param $IPINST -name "DIVIDER_INIT" -parent ${Divider}
}
