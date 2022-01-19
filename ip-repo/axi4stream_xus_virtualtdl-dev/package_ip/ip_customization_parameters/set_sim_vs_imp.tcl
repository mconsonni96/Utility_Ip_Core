# Simulation or Implementation
# SIM_VS_IMP	:	STRING(1 To 3)	:= "IMP";

# --------------SIM_VS_IMP---------------
set name "SIM_VS_IMP"

set LIST_SIM_VS_IMP {SIM IMP}
set DEFAULT_SIM_VS_IMP "IMP"

set enablement {True}
set editable {}

set dependency {}


set tooltip "Use TDL for simulation or primitive for implementation"
set display_name "Simulation vs Implementation"

ipgui::add_param -name $name -component [ipx::current_core] -display_name $display_name -show_label {true} -show_range {true} -widget {}
set_param_string_list $name $LIST_SIM_VS_IMP $DEFAULT_SIM_VS_IMP $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
