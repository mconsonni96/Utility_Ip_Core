
# =========================== SET PATH =========================================
# set path "/home/nicola/Documents/Vivado/Utility_Ip_Core/ip_repo/TDC_Basic_IPs/coarseextensioncore/package_ip"
# set path "C:/Users/meant/Desktop/tesi/utility_IP_core/ip_repo/AXI4Stream_PeriodMeter/package_ip"
# ==============================================================================


# ============================ Identification ==================================
set vendor "DigiLAB"
set_property vendor $vendor [ipx::current_core]

set library "ip"
set_property library $library [ipx::current_core]

set name "BeltBus_PeriodMeter"
set_property name $name [ipx::current_core]


set version "3.0"
set_property version $version [ipx::current_core]

set display_name "Belt-Bus Period Meter"
set_property display_name $display_name [ipx::current_core]

set description "Belt-Bus input and AXI4-Stream output (tvalid, tdata) Period Meter"
set_property description $description [ipx::current_core]

set vendor_display_name {}
set_property vendor_display_name $vendor_display_name [ipx::current_core]

set company_url {}
set_property company_url $company_url [ipx::current_core]

set taxonomy {/TDC_Basic}
set_property taxonomy $taxonomy [ipx::current_core]
# ==============================================================================



# ========================== Import TCL Functions ==============================
# set path [pwd]
# regsub -all {(.)/logs} $path {\1} path
# append path "/Utility_Ip_Core/ip_repo/TDC_Basic_IPs/coarseextensioncore_ip/package_ip"
# ==============================================================================

# ====================== SET IP CUSTOMIZATION PARAMIETR ========================
set param_path $path
append param_path "/ip_customization_parameters/"
source [join [list $param_path "set_param_fx.tcl"] ""] -notrace

source [join [list $param_path "set_ch_sync.tcl"] ""] -notrace
source [join [list $param_path "set_expsample.tcl"] ""] -notrace
source [join [list $param_path "set_bit_overflow.tcl"] ""] -notrace
source [join [list $param_path "set_bit_num_ch.tcl"] ""] -notrace
source [join [list $param_path "set_bit_fid.tcl"] ""] -notrace
source [join [list $param_path "set_bit_coarse.tcl"] ""] -notrace
source [join [list $param_path "set_bit_resolution.tcl"] ""] -notrace
source [join [list $param_path "set_filter_sel.tcl"] ""] -notrace
source [join [list $param_path "set_expdivision.tcl"] ""] -notrace

# ==============================================================================
