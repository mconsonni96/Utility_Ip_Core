# Initialization Value of the Coarse Counter (External to Channel TDC)
# CTD_COARSE_CNT_INIT	:	NATURAL						:= 1;

# ---------------- CTD_COARSE_CNT_INIT -----------------
set MIN_CTD_COARSE_CNT_INIT 1
set MAX_CTD_COARSE_CNT_INIT [expr 2**[get_property value [ipx::get_user_parameters BIT_COARSE -of_objects [ipx::current_core]]] -1]
set DEFAULT_CTD_COARSE_CNT_INIT 1

set enablement {True}
set editable {}

set dependency {}

set tooltip "Initialization Value of the Coarse Counter (External to Channel TDC)"
set display_name "Coarse Counter Initialization"

set_param_long_range "CTD_COARSE_CNT_INIT" $MIN_CTD_COARSE_CNT_INIT $MAX_CTD_COARSE_CNT_INIT $DEFAULT_CTD_COARSE_CNT_INIT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
