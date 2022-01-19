


# ============================ Identification ==================================
set vendor "DigiLAB"
set_property vendor $vendor [ipx::current_core]

set library "ip"
set_property library $library [ipx::current_core]

set name "StartStopGenerator"
set_property name $name [ipx::current_core]

set version "2.1"
set_property version $version [ipx::current_core]

set display_name "Start Stop Generator"
set_property display_name $display_name [ipx::current_core]

set description "Start Stop Generator for testing TDCs tunabe"
set_property description $description [ipx::current_core]

set vendor_display_name "DigiLAB"
set_property vendor_display_name $vendor_display_name [ipx::current_core]

set company_url {}
set_property company_url $company_url [ipx::current_core]

set taxonomy {/TDC_Basic}
set_property taxonomy $taxonomy [ipx::current_core]
# ==============================================================================

# ========================== Import TCL Functions ==============================
set path [pwd]
regsub -all {(.)/logs} $path {\1} path
append path "/Utility_Ip_Core/ip_repo/TDC_Basic/StartStopGenerator/package_ip"
# ==============================================================================

# ====================== SET IP CUSTOMIZATION PARAMIETR ========================
set param_path $path
append param_path "/ip_customization_parameters/"
source [join [list $param_path "set_param_fx.tcl"] ""] -notrace



source [join [list $param_path "set_clk_select.tcl"] ""] -notrace
source [join [list $param_path "set_half_divider.tcl"] ""] -notrace
source [join [list $param_path "set_num_carry_block.tcl"] ""] -notrace
source [join [list $param_path "set_start_Stop_dalay_num_carry_block.tcl"] ""] -notrace

# ==============================================================================
