
# =========================== SET PATH =========================================
set path "D:/Xilinx_bis/Utility_Ip_Core/ip_repo/axi4stream_iperdecoder/package_ip"
# ==============================================================================


# ============================ Identification ==================================
set vendor "DigiLAB"
set_property vendor $vendor [ipx::current_core]

set library "ip"
set_property library $library [ipx::current_core]

set name "AXI4Stream_IperDecoder"
set_property name $name [ipx::current_core]

set version "1.2"
set_property version $version [ipx::current_core]

set display_name "AXI4-Stream Iper Decoder"
set_property display_name $display_name [ipx::current_core]

set description "Detection selection between Macro and Turbo Decoder (MD/TD) based on Log2 and Thermo-to-Binary edge detectors"
set_property description $description [ipx::current_core]

set vendor_display_name {}
set_property vendor_display_name $vendor_display_name [ipx::current_core]

set company_url {}
set_property company_url $company_url [ipx::current_core]

set taxonomy {/TDC_Basic/Decoder}
set_property taxonomy $taxonomy [ipx::current_core]
# ==============================================================================



# ========================== Import TCL Functions ==============================
#set path [pwd]
#regsub -all {(.)/logs} $path {\1} path
#append path "/Utility_Ip_Core/ip_repo/TDC_Basic_IPs/iper-decoder/package_ip"
# ==============================================================================

# ====================== SET IP CUSTOMIZATION PARAMIETR ========================
set param_path $path
append param_path "/ip_customization_parameters/"
source [join [list $param_path "set_param_fx.tcl"] ""] -notrace

# -------------------------------- Debug Port ----------------------------------
source [join [list $param_path "set_debug_mode_iperdecoder.tcl"] ""] -notrace
# ------------------------------------------------------------------------------

# --------------------------- Common Parameters --------------------------------
source [join [list $param_path "set_free_running.tcl"] ""] -notrace
source [join [list $param_path "set_edge_check.tcl"] ""] -notrace

source [join [list $param_path "set_md_vs_td.tcl"] ""] -notrace
source [join [list $param_path "set_type_decoder.tcl"] ""] -notrace

source [join [list $param_path "set_type_edge.tcl"] ""] -notrace
# ------------------------------------------------------------------------------

# --------------------------------- Dimension ---------------------------------`
source [join [list $param_path "set_number_of_tdl.tcl"] ""] -notrace

source [join [list $param_path "set_bit_coarse.tcl"] ""] -notrace
source [join [list $param_path "set_bit_tdl.tcl"] ""] -notrace
source [join [list $param_path "set_bit_bubble.tcl"] ""] -notrace
source [join [list $param_path "set_bit_subint.tcl"] ""] -notrace
# ------------------------------------------------------------------------------

# -------------------- Macro Decoder Set Parameters ----------------------------
source [join [list $param_path "set_deco_log_max_input_engine_pipeline.tcl"] ""] -notrace
source [join [list $param_path "set_deco_t2b_max_input_engine_pipeline.tcl"] ""] -notrace
source [join [list $param_path "set_sub_int_max_input_engine_pipeline.tcl"] ""] -notrace
# ------------------------------------------------------------------------------

# -------------------- Turbo Decoder Auto Tune Parameters ----------------------
source [join [list $param_path "set_print_full_report.tcl"] ""] -notrace
source [join [list $param_path "set_optimization_mode.tcl"] ""] -notrace
source [join [list $param_path "set_weight_area_vs_time_percent.tcl"] ""] -notrace
# ------------------------------------------------------------------------------


# ==============================================================================


# ========================= SET PORT AND INTERFACES ============================
set param_path $path
append param_path "/ip_ports_and_interfaces/"
source [join [list $param_path "set_if_fx.tcl"] ""] -notrace

source [join [list $param_path "set_clock_undeco_subint.tcl"] ""] -notrace
source [join [list $param_path "set_reset_high.tcl"] ""] -notrace
# ==============================================================================
