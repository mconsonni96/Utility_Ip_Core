


# ============================ Identification ==================================
set vendor "DigiLAB"
set_property vendor $vendor [ipx::current_core]

set library "user"
set_property library $library [ipx::current_core]

set name "InputLogic"
set_property name $name [ipx::current_core]

set version "4.0"
set_property version $version [ipx::current_core]

set display_name "Input Logic"
set_property display_name $display_name [ipx::current_core]

set description "Input Logic of the TDC with Time-Over-Threshold modality"
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
append path "/Repositories/2020.2/Utility_Ip_Core/ip_user_files/ip_repo/TDC_Basic/InputLogic/package_ip"
# ==============================================================================

# ====================== SET IP CUSTOMIZATION PARAMIETR ========================
set param_path $path
append param_path "/ip_customization_parameters/"
source [join [list $param_path "set_param_fx.tcl"] ""] -notrace



source [join [list $param_path "set_bit_divider.tcl"] ""] -notrace
source [join [list $param_path "set_bit_stretch_length.tcl"] ""] -notrace
source [join [list $param_path "set_divider_init.tcl"] ""] -notrace
source [join [list $param_path "set_edge_trigger_init.tcl"] ""] -notrace
source [join [list $param_path "set_stretch_length_init.tcl"] ""] -notrace
source [join [list $param_path "set_tuning_mode.tcl"] ""] -notrace
source [join [list $param_path "set_in_buf_type.tcl"] ""] -notrace
source [join [list $param_path "set_inv_buf_pol.tcl"] ""] -notrace
# ==============================================================================
