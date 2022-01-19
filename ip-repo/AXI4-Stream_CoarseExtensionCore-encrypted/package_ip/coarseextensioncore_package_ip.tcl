
# =========================== SET PATH =========================================
# set path "/home/nicola/Documents/Vivado/Utility_Ip_Core/ip_repo/TDC_Basic_IPs/coarseextensioncore/package_ip"
# set path "D:/Xilinx_bis/Utility_Ip_Core/ip_repo/axi4stream_coarseextensioncore/package_ip"
# ==============================================================================


# ============================ Identification ==================================
set vendor "DigiLAB"
set_property vendor $vendor [ipx::current_core]

set library "ip"
set_property library $library [ipx::current_core]

set name "AXI4Stream_CoarseExtensionCore"
set_property name $name [ipx::current_core]

set version "3.5"
set_property version $version [ipx::current_core]

set display_name "AXI4-Stream Coarse Extension Core"
set_property display_name $display_name [ipx::current_core]

set description "Coarse Extension Core of the TDC, with the Tree Comparator, the FIFO_Synchronizer and the Overflow Counter inside"
set_property description $description [ipx::current_core]

set vendor_display_name {}
set_property vendor_display_name $vendor_display_name [ipx::current_core]

set company_url {https://bitbucket.org/TimeEngineers/coarseextensioncore/src/master/}
set_property company_url $company_url [ipx::current_core]

set taxonomy {/TDC_Basic}
set_property taxonomy $taxonomy [ipx::current_core]
# ==============================================================================



# ========================== Import TCL Functions ==============================
set path [pwd]
regsub -all {(.)/logs} $path {\1} path
append path "/Utility_Ip_Core/ip_repo/TDC_Basic/AXI4Stream_CoarseExtensionCore/package_ip"
# ==============================================================================

# ====================== SET IP CUSTOMIZATION PARAMIETR ========================
set param_path $path
append param_path "/ip_customization_parameters/"
source [join [list $param_path "set_param_fx.tcl"] ""] -notrace

# ----------------------------------- CEC --------------------------------------
source [join [list $param_path "set_bit_coarse.tcl"] ""] -notrace
source [join [list $param_path "set_bit_fid.tcl"] ""] -notrace
source [join [list $param_path "set_bit_uncalibrated.tcl"] ""] -notrace
source [join [list $param_path "set_bit_sub_int_CEC.tcl"] ""] -notrace
source [join [list $param_path "set_cec_coarse_cnt_init.tcl"] ""] -notrace
source [join [list $param_path "set_cec_vs_ctd_counter.tcl"] ""] -notrace
source [join [list $param_path "set_internal_overflow_cnt.tcl"] ""] -notrace
# ------------------------------------------------------------------------------

# ------------------------------ Tree Comparator -------------------------------
source [join [list $param_path "set_max_num_bit_eq_pipeline_stage0.tcl"] ""] -notrace
source [join [list $param_path "set_max_input_engine_and_pipeline_stage1.tcl"] ""] -notrace
source [join [list $param_path "set_max_input_engine_and_pipeline_stage2.tcl"] ""] -notrace
source [join [list $param_path "set_max_input_engine_and_pipeline_stage3.tcl"] ""] -notrace
# ------------------------------------------------------------------------------

# ------------------------------- xpm_fifo_async -------------------------------
source [join [list $param_path "set_fifo_memory_type.tcl"] ""] -notrace
source [join [list $param_path "set_cdc_sync_stages.tcl"] ""] -notrace
source [join [list $param_path "set_related_clocks.tcl"] ""] -notrace
source [join [list $param_path "set_fifo_write_depth.tcl"] ""] -notrace
# ------------------------------------------------------------------------------

# ==============================================================================
