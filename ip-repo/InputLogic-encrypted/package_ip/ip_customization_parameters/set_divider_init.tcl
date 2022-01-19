# Initialization of Divider
# DIVIDER_INIT	:	NATURAL						:=	3;

# --------------- DIVIDER_INIT ----------------
set MIN_DIVIDER_INIT 0
set MAX_DIVIDER_INIT [expr 2**[get_property value [ipx::get_user_parameters BIT_DIVIDER -of_objects [ipx::current_core]]] -1]
set DEFAULT_DIVIDER_INIT $MIN_DIVIDER_INIT

set enablement {True}
set editable {$BIT_DIVIDER > 0}

set dependency {$BIT_DIVIDER > 0}

set tooltip "Divider Initialization"
set display_name "Divider Initialization"

set_param_long_range "DIVIDER_INIT" $MIN_DIVIDER_INIT $MAX_DIVIDER_INIT $DEFAULT_DIVIDER_INIT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
