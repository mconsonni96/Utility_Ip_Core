# Initialization of StretchLength
# STRETCH_LENGTH_INIT	:	NATURAL		:=	4;


# --------------- STRETCH_LENGTH_INIT ----------------
set MIN_STRETCH_LENGTH_INIT 0
set MAX_STRETCH_LENGTH_INIT [expr 2**[get_property value [ipx::get_user_parameters BIT_STRETCH_LENGTH -of_objects [ipx::current_core]]] -1]
set DEFAULT_STRETCH_LENGTH_INIT $MIN_STRETCH_LENGTH_INIT

set enablement {True}
set editable {$BIT_STRETCH_LENGTH > 0}

set dependency {$BIT_STRETCH_LENGTH > 0}

set tooltip "Duration of the stretched pulse, multiple of clock pulses"
set display_name "Stretch Length Initialization"

set_param_long_range "STRETCH_LENGTH_INIT" $MIN_STRETCH_LENGTH_INIT $MAX_STRETCH_LENGTH_INIT $DEFAULT_STRETCH_LENGTH_INIT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
