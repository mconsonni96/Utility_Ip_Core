
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/InputLogic_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  set INPUT_BUFFER_TYPE [ipgui::add_param $IPINST -name "INPUT_BUFFER_TYPE" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Choose between Single-Ended (IBUF) and Fully-Differential (IBUFDS) input buffer} ${INPUT_BUFFER_TYPE}
  set TUNING_MODE [ipgui::add_param $IPINST -name "TUNING_MODE" -parent ${Page_0}]
  set_property tooltip {Choice between generic and port, if TRUE we choose the signal coming from the port, if FALSE we choose the value of the generic } ${TUNING_MODE}
  set EDGE_TRIGGER_INIT [ipgui::add_param $IPINST -name "EDGE_TRIGGER_INIT" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Choose the edge trigger of AsyncEventIn} ${EDGE_TRIGGER_INIT}
  #Adding Group
  set Stretcher [ipgui::add_group $IPINST -name "Stretcher" -parent ${Page_0}]
  set BIT_STRETCH_LENGTH [ipgui::add_param $IPINST -name "BIT_STRETCH_LENGTH" -parent ${Stretcher}]
  set_property tooltip {Bit length of StretchLength} ${BIT_STRETCH_LENGTH}
  set STRETCH_LENGTH_INIT [ipgui::add_param $IPINST -name "STRETCH_LENGTH_INIT" -parent ${Stretcher}]
  set_property tooltip {Duration of the stretched pulse, multiple of clock pulses} ${STRETCH_LENGTH_INIT}

  #Adding Group
  set Divider [ipgui::add_group $IPINST -name "Divider" -parent ${Page_0}]
  set BIT_DIVIDER [ipgui::add_param $IPINST -name "BIT_DIVIDER" -parent ${Divider}]
  set_property tooltip {Bit length of the Divider} ${BIT_DIVIDER}
  ipgui::add_param $IPINST -name "DIVIDER_INIT" -parent ${Divider}



}


source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/set_IL_gui.tcl]
