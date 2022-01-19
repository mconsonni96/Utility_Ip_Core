
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/AXI4Stream_Synchronizer_v1_0.gtcl]

# Definitional proc to organize Input Logic widgets for parameters.
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/init_AXI4Stream_Synchronizer_gui.tcl]


# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {

	ipgui::add_param $IPINST -name "Component_Name"

 	set Page "Synchronizer"
	init_AXI4Stream_Synchronizer_gui $IPINST $Page

}

# Definitional proc to dynamic set for parameters in GUI.
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/set_AXI4Stream_Synchronizer_gui.tcl]
