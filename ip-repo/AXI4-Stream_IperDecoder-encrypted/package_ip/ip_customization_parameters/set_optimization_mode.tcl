# AREA vs TIME vs COST for set the vector listed in MacroDecoder
# OPTIMIZATION_MODE			:	STRING					:= "TIME";

# -------------- OPTIMIZATION_MODE -------------
set LIST_OPTIMIZATION_MODE {AREA TIME COST}
set DEFAULT_OPTIMIZATION_MODE "TIME"

set enablement {False}
set editable {expr [expr {$MD_VS_TD} == "{TD}"]}

set dependency {}

set tooltip "Choose the Turbo Decoder optimization mode setting to pre-processor "
set display_name "Turbo Decoder Optimization Mode"

set_param_string_list "OPTIMIZATION_MODE" $LIST_OPTIMIZATION_MODE $DEFAULT_OPTIMIZATION_MODE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
