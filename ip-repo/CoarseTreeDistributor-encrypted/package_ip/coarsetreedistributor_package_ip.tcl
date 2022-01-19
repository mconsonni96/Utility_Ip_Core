
# ============================ Identification ==================================
set vendor "DigiLAB"
set_property vendor $vendor [ipx::current_core]

set library "ip"
set_property library $library [ipx::current_core]

set name "CoarseTreeDistributor"
set_property name $name [ipx::current_core]

set version "1.2"
set_property version $version [ipx::current_core]

set display_name "Coarse Tree Distributor"
set_property display_name $display_name [ipx::current_core]

set description "Coarse Tree Distributor of the TDC"
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
append path "/Utility_Ip_Core/ip_repo/TDC_Basic_IPs/coarse-tree-distributor/package_ip"
# ==============================================================================

# ====================== SET IP CUSTOMIZATION PARAMIETR ========================
set param_path $path
append param_path "/ip_customization_parameters/"
source [join [list $param_path "set_param_fx.tcl"] ""] -notrace


source [join [list $param_path "set_bit_coarse.tcl"] ""] -notrace
source [join [list $param_path "set_ctd_coarse_cnt_init.tcl"] ""] -notrace
source [join [list $param_path "set_number_of_output.tcl"] ""] -notrace
source [join [list $param_path "set_max_output_engine_pipeline_stage_CTD.tcl"] ""] -notrace
# ==============================================================================
