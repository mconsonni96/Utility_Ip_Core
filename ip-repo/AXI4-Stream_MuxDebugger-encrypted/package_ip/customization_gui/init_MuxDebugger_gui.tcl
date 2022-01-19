# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Group
  set TDC_Channels [ipgui::add_group $IPINST -name "TDC Channels"]
  set NUM_CHANNEL [ipgui::add_param $IPINST -name "NUM_CHANNEL" -parent ${TDC_Channels}]
  set_property tooltip {Tot number of Channels} ${NUM_CHANNEL}

  #Adding Group
  set Debug_properties [ipgui::add_group $IPINST -name "Debug properties"]
  set DEBUG_MODE_CC [ipgui::add_param $IPINST -name "DEBUG_MODE_CC" -parent ${Debug_properties}]
  set_property tooltip {Allow to generate the calibration mux to the debugger of the Charact Curve} ${DEBUG_MODE_CC}
  set DEBUG_MODE_CT [ipgui::add_param $IPINST -name "DEBUG_MODE_CT" -parent ${Debug_properties}]
  set_property tooltip {Allow to generate the calibration mux to the debugger of the CalibTable} ${DEBUG_MODE_CT}

  #Adding Group
  set Mux_settings [ipgui::add_group $IPINST -name "Mux settings"]
  ipgui::add_param $IPINST -name "MUX_TYPE" -parent ${Mux_settings} -widget comboBox


}
