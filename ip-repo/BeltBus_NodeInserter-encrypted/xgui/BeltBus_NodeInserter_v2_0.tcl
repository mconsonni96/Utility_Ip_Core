# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/BeltBus_NodeInserter_v1_2.gtcl]

# Definitional proc to organize Input Logic widgets for parameters.
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/init_NodeInserter_gui.tcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {

    ipgui::add_param $IPINST -name "Component_Name"

    set Page "NodeInserter"
    init_NodeInserter_gui $IPINST $Page
}

# Definition proc to dynamic set parameters
source [file join [file dirname [file dirname [info script]]] package_ip/customization_gui/set_NodeInserter_gui.tcl]
