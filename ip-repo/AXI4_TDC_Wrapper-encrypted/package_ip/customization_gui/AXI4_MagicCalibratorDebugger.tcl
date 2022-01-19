#Definitional proc to organize Magic Calibrtor Debugger widgets for parameters
source [file join [file dirname [ file dirname [info script]]] package_ip/customization_gui/init_MagicDebugger_gui.tcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page "Magic Debugger"
  init_MagicDebugger_gui $IPINST $Page
}

source [file join [file dirname [ file dirname [info script]]] package_ip/customization_gui/set_MagicDebugger_gui.tcl]
