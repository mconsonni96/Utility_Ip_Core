
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/AXI4Stream_IperDecoder_v1_0.gtcl]

# Definitional proc to organize Iper Decoder widgets for parameters.
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/init_DECODER_gui.tcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {

	ipgui::add_param $IPINST -name "Component_Name"

 	set Page "Decoder"
	init_DECODER_gui $IPINST $Page

}

# Definition proc to dynamic set parameters
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/set_Decoder_gui.tcl]
