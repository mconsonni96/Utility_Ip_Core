# Definitional proc to organize Magic Calibrator widgets for parameters.
source [file join [file dirname [ file dirname [info script]]] package_ip/customization_gui/init_MagicCalibrator_gui.tcl]


# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page "Magic Calibrator"
  init_MagicCalibrator_gui $IPINST $Page
}

source [file join [file dirname [ file dirname [info script]]] package_ip/customization_gui/set_MagicCalibrator_gui.tcl]
