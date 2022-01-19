
# =========================== SET PATH =========================================
set path "C:/Users/Andrea/Desktop/Vivado/Utility_IP_Core/ip_repo/AXI4Stream_MuxDebugger/package_ip"
#set path [pwd]
#regsub -all {(.)/logs} $path {\1} path */

# append path "/Utility_Ip_Core/ip_repo/TDC_Basic_IPs/calibrator/package_ip"
# set path "/home/nicola/Documents/Vivado/Utility_Ip_Core/ip_repo/TDC_Basic_IPs/synchronizer"
# ==============================================================================


# ============================ Identification ==================================
set vendor "DigiLAB"
set_property vendor $vendor [ipx::current_core]

set library "ip"
set_property library $library [ipx::current_core]

set name "AXI4Stream_MuxDebugger"
set_property name $name [ipx::current_core]

set version "1.1"
set_property version $version [ipx::current_core]

set display_name "AXI4-Stream Mux Debugger"
set_property display_name $display_name [ipx::current_core]

set description "Multiplexer for Debugging of MC among different channels"
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
#append path "/Utility_Ip_Core/ip_repo/TDC_Basic_IPs/calibrator/package_ip"
#append path "/Scrivania/Vivado/Utility_IP_Core/ip_repo/magiccalibrator_ac/package_ip"
# ==============================================================================

# ====================== SET IP CUSTOMIZATION PARAMIETR ========================
set param_path $path
append param_path "/ip_customization_parameters/"
source [join [list $param_path "set_param_fx.tcl"] ""] -notrace


source [join [list $param_path "set_default_bit_sel.tcl"] ""] -notrace
source [join [list $param_path "set_max_channel.tcl"] ""] -notrace
source [join [list $param_path "set_num_channel.tcl"] ""] -notrace
source [join [list $param_path "set_mux_type.tcl"] ""] -notrace
source [join [list $param_path "set_debug_mode_cc.tcl"] ""] -notrace
source [join [list $param_path "set_debug_mode_ct.tcl"] ""] -notrace

# ==============================================================================
