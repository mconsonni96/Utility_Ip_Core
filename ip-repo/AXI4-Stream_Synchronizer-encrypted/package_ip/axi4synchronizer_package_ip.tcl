
# =========================== SET PATH =========================================
# set path "/home/nicola/Documents/Vivado/Utility_Ip_Core/ip_repo/TDC_Basic_IPs/coarseextensioncore/package_ip"
 set path "C:/Users/meant/Desktop/tesi/utility_IP_core/ip_repo/axi4stream_synchronizer_tcl/package_ip"
# ==============================================================================


# ============================ Identification ==================================
set vendor "DigiLAB"
set_property vendor $vendor [ipx::current_core]

set library "ip"
set_property library $library [ipx::current_core]

set name "AXI4Stream_Synchronizer"
set_property name $name [ipx::current_core]

set version "2.3"
set_property version $version [ipx::current_core]

set display_name "AXI4-Stream Synchronizer"
set_property display_name $display_name [ipx::current_core]

set description "AXI4-Stream (tvalid, tdata, tready) Cross-Domain Clock (CDC) Synchronizer"
set_property description $description [ipx::current_core]

set vendor_display_name {}
set_property vendor_display_name $vendor_display_name [ipx::current_core]

set company_url {}
set_property company_url $company_url [ipx::current_core]

set taxonomy {/UserIP}
set_property taxonomy $taxonomy [ipx::current_core]
# ==============================================================================



# ========================== Import TCL Functions ==============================
#set path [pwd]
#regsub -all {(.)/logs} $path {\1} path
#append path "/Utility_Ip_Core/ip_repo/TDC_Basic_IPs/coarseextensioncore_ip/package_ip"
# ==============================================================================

# ====================== SET IP CUSTOMIZATION PARAMIETR ========================
set param_path $path
append param_path "/ip_customization_parameters/"
source [join [list $param_path "set_param_fx.tcl"] ""] -notrace

source [join [list $param_path "set_mode_sel.tcl"] ""] -notrace
source [join [list $param_path "set_data_width.tcl"] ""] -notrace
source [join [list $param_path "set_fifo_memory_type.tcl"] ""] -notrace
source [join [list $param_path "set_related_clocks.tcl"] ""] -notrace
source [join [list $param_path "set_fifo_depth.tcl"] ""] -notrace
source [join [list $param_path "set_cdc_sync_stages.tcl"] ""] -notrace
source [join [list $param_path "set_dest_sync_ff.tcl"] ""] -notrace
source [join [list $param_path "set_src_sync_ff.tcl"] ""] -notrace

# ==============================================================================
