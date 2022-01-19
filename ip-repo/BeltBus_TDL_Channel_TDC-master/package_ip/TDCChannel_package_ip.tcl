
# =========================== SET PATH =========================================
# set path "/home/nicola/Documents/Vivado/Utility_Ip_Core/ip_repo/TDC_Basic_IPs/coarseextensioncore/package_ip"
# set path "D:/Xilinx_bis/Utility_Ip_Core/ip_repo/TDC_hierarchical/package_ip"
# ==============================================================================


# ============================ Identification ==================================
set vendor "DigiLAB"
set_property vendor $vendor [ipx::current_core]

set library "hier"
set_property library $library [ipx::current_core]

set name "BeltBus_TDL_Channel_TDC"
set_property name $name [ipx::current_core]

set version "3.5"
set_property version $version [ipx::current_core]

set display_name "BeltBus TDL Channel TDC"
set_property display_name $display_name [ipx::current_core]

set description "Single channel of the TDL-TDC"
set_property description $description [ipx::current_core]

set vendor_display_name {}
set_property vendor_display_name $vendor_display_name [ipx::current_core]

set company_url {}
set_property company_url $company_url [ipx::current_core]

set taxonomy {/TDC_Basic}
set_property taxonomy $taxonomy [ipx::current_core]
# ==============================================================================



# ========================== Import TCL Functions ==============================
set path [pwd]
regsub -all {(.)/logs} $path {\1} path
append path "/Repositories/2020.2/Utility_Ip_Core/ip_user_files/ip_repo/TDC_Basic/BeltBus_TDL_Channel_TDC/package_ip"
# ==============================================================================

# ====================== SET IP CUSTOMIZATION PARAMIETR ========================
set param_path $path
append param_path "/ip_customization_parameters/"
source [join [list $param_path "create_param_fx.tcl"] ""] -notrace

# -------------------------------- IP_COREs ------------------------------------
# source [join [list $param_path "create_IL_param.tcl"] ""] -notrace
source [join [list $param_path "create_TDL_param.tcl"] ""] -notrace
source [join [list $param_path "create_DEC_param.tcl"] ""] -notrace
source [join [list $param_path "create_CEC_param.tcl"] ""] -notrace
source [join [list $param_path "create_CAL_param.tcl"] ""] -notrace
source [join [list $param_path "create_SYNCH_param.tcl"] ""] -notrace
source [join [list $param_path "create_BB_param.tcl"] ""] -notrace
# ------------------------------------------------------------------------------



# ==============================================================================
