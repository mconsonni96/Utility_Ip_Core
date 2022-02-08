
# =========================== SET PATH =========================================
#set path [pwd]
#regsub -all {(.)/logs} $path {\1} path

#append path "/Utility_Ip_Core/ip_repo/TDC_Basic_IPs/beltbus/package_ip"

set path "/home/nicola/Documenti/Vivado/Repositories/Utility/ip_repo/TDC_Basic/BeltBus_NodeInserter/package_ip"
#set path "D:/Xilinx_bis/Utility_Ip_Core/ip_repo/beltbus_nodeinserter/package_ip"
# ==============================================================================


# ============================ Identification ==================================
set vendor "DigiLAB"
set_property vendor $vendor [ipx::current_core]

set library "ip"
set_property library $library [ipx::current_core]

set name "BeltBus_NodeInserter"
set_property name $name [ipx::current_core]

set version "2.4"
set_property version $version [ipx::current_core]

set display_name "BeltBus Node Inserter"
set_property display_name $display_name [ipx::current_core]

set description "Belt-Bus of the TDC"
set_property description $description [ipx::current_core]

set vendor_display_name {}
set_property vendor_display_name $vendor_display_name [ipx::current_core]

set company_url {}
set_property company_url $company_url [ipx::current_core]

set taxonomy {/TDC_Basic}
set_property taxonomy $taxonomy [ipx::current_core]
# ==============================================================================



# ========================== Import TCL Functions ==============================
#set path [pwd]
#regsub -all {(.)/logs} $path {\1} path
#append path "/Desktop/TDC/Utility_IP_Core/IP_Repo/beltbus_node_inserter/package_ip"

# ==============================================================================

# ====================== SET IP CUSTOMIZATION PARAMIETR ========================
set param_path $path
append param_path "/ip_customization_parameters/"
source [join [list $param_path "set_param_fx.tcl"] ""] -notrace
#append overflowcounter_param_path "/ip_customization_parameters/"

source [join [list $param_path "set_bit_coarse.tcl"] ""] -notrace
source [join [list $param_path "set_bit_fid.tcl"] ""] -notrace
source [join [list $param_path "set_bit_num_ch.tcl"] ""] -notrace
source [join [list $param_path "set_bit_resolution.tcl"] ""] -notrace
source [join [list $param_path "set_hold_on_integral.tcl"] ""] -notrace
source [join [list $param_path "set_hold_on_min_mod.tcl"] ""] -notrace
source [join [list $param_path "set_hold_on_single_node.tcl"] ""] -notrace
source [join [list $param_path "set_inject_cycles.tcl"] ""] -notrace
source [join [list $param_path "set_num_ch.tcl"] ""] -notrace
source [join [list $param_path "set_num_node.tcl"] ""] -notrace
source [join [list $param_path "set_pass_through.tcl"] ""] -notrace
source [join [list $param_path "set_retain_single_node.tcl"] ""] -notrace
# ==============================================================================
