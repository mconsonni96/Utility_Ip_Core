#	Length of the axi4 ports to set the debug ports length
#	AXI4_LENGTH : POSITIVE := 32

# -------------- AXI4 LENGTH --------------
set LIST_AXI4_LENGTH {32}
#set MIN_AXI4_LENGTH 32
#set MAX_AXI4_LENGTH 32
set DEFAULT_AXI4_LENGTH 32

set enablement {True}
set editable {}

set dependency {}

set tooltip "Positive to specify the length of the data of AXI"
set display_name "AXI4 Length"

#set_param_long_range "AXI4_LENGTH" $MIN_AXI4_LENGTH $MAX_AXI4_LENGTH $DEFAULT_AXI4_LENGTH $enablement $editable $dependency $tooltip $display_name

set_param_long_list "AXI4_LENGTH" $LIST_AXI4_LENGTH $DEFAULT_AXI4_LENGTH $enablement $editable $dependency $tooltip $display_name

# Hidden Fix to 32
ipgui::remove_param -component [ipx::current_core] [ipgui::get_guiparamspec -name "AXI4_LENGTH" -component [ipx::current_core]]
# ----------------------------------------------
