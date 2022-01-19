
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/AXI4Stream_CoarseExtensionCore_v3_0.gtcl]

# Definitional proc to organize Coarse Extension Core widgets for parameters.
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/init_CEC_gui.tcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {

	ipgui::add_param $IPINST -name "Component_Name"

	set Page "Coarse Extension Core"
	init_CEC_gui $IPINST $Page

}

source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/set_CEC_gui.tcl]
