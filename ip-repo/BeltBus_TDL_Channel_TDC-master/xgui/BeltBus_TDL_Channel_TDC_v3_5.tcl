
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/TDC_Channel_v1_0.gtcl]

# Definitional proc to organize TDC Channel widgets for parameters.
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/init_IP_gui/init_TDC_Channel_gui.tcl]

# Definitional proc to organize Input Logic widgets for parameters.
# source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/init_IP_gui/init_IL_gui.tcl]

# Definitional proc to organize Tapped Delay Line widgets for parameters.
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/init_IP_gui/init_TDL_gui.tcl]

# Definitional proc to organize Iper Decoder widgets for parameters.
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/init_IP_gui/init_Decoder_gui.tcl]

# Definitional proc to organize Coarse Extension Core widgets for parameters.
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/init_IP_gui/init_CEC_gui.tcl]

# Definitional proc to organize Magic Calibrator widgets for parameters.
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/init_IP_gui/init_MagicCalibrator_gui.tcl]

# Definitional proc to organize Synchronizer widgets for parameters.
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/init_IP_gui/init_AXI4Stream_Synchronizer_gui.tcl]

# Definitional proc to organize Belt Bus widgets for parameters.
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/init_IP_gui/init_NodeInserter_gui.tcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"

  set Page_TDC "TDC Channel"
  init_TDC_Channel_gui $IPINST $Page_TDC

  # set Page_IL "Input Logic"
  # init_IL_gui $IPINST $Page_IL

  set Page_TDL "Tapped Delay Line"
  init_TDL_gui $IPINST $Page_TDL

  set Page_DEC "Iper Decoder"
  init_Decoder_gui $IPINST $Page_DEC

  set Page_CEC "Coarse Extension Core"
  init_CEC_gui $IPINST $Page_CEC

  set Page_MC "Magic Calibrator"
  init_MagicCalibrator_gui $IPINST $Page_MC

  set Page_Synch "Synchronizer"
  init_AXI4Stream_Synchronizer_gui $IPINST $Page_Synch

  set Page_BB "Belt Bus"
  init_NodeInserter_gui $IPINST $Page_BB

}

# source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/set_IP_gui/set_IL_gui.tcl]
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/set_IP_gui/set_TappedDelayLine_gui.tcl]
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/set_IP_gui/set_Decoder_gui.tcl]
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/set_IP_gui/set_CEC_gui.tcl]
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/set_IP_gui/set_MagicCalibrator_gui.tcl]
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/set_IP_gui/set_AXI4Stream_Synchronizer_gui.tcl]
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/set_IP_gui/set_NodeInserter_gui.tcl]
