# Initialization Value of the Internal Coarse Counter in CoarseExtensionCore
# CEC_COARSE_CNT_INIT	:	NATURAL						:= 0;

# ------------- CEC_COARSE_CNT_INIT -----------
set MIN_CEC_COARSE_CNT_INIT 0
set MAX_CEC_COARSE_CNT_INIT [expr 2**[get_property value [ipx::get_user_parameters BIT_COARSE -of_objects [ipx::current_core]]] -1]
set DEFAULT_CEC_COARSE_CNT_INIT 0

set enablement {True}
set editable {[expr {$CEC_VS_CTD_COUNTER} == "{CEC}"]}

set dependency {}

set tooltip "Initialization value of the CEC Coarse Counter"
set display_name "CEC Coarse Counter Initialization"

set_param_long_range "CEC_COARSE_CNT_INIT" $MIN_CEC_COARSE_CNT_INIT $MAX_CEC_COARSE_CNT_INIT $DEFAULT_CEC_COARSE_CNT_INIT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
