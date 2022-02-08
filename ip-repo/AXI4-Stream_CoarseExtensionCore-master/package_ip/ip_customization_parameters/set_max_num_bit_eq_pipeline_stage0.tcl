# Blocks of bits of the inputs that we want to compare in the first stage (Equality comparison)
# MAX_NUM_BIT_EQ_PIPELINE_STAGE0		: 	POSITIVE 	RANGE 1 TO 16   := 3;

# ---------------- MAX_NUM_BIT_EQ_PIPELINE_STAGE0 -----------------
set MIN_MAX_NUM_BIT_EQ_PIPELINE_STAGE0 1
set MAX_MAX_NUM_BIT_EQ_PIPELINE_STAGE0 [expr [get_property value [ipx::get_user_parameters BIT_COARSE -of_objects [ipx::current_core]]]]
set DEFAULT_MAX_NUM_BIT_EQ_PIPELINE_STAGE0 4

set enablement {True}
set editable {}

set dependency {}

set tooltip "Blocks of bits of the inputs that we want to compare in the first stage"
set display_name "Blocks of bits to be compared in the first stage"

set_param_long_range "MAX_NUM_BIT_EQ_PIPELINE_STAGE0" $MIN_MAX_NUM_BIT_EQ_PIPELINE_STAGE0 $MAX_MAX_NUM_BIT_EQ_PIPELINE_STAGE0 $DEFAULT_MAX_NUM_BIT_EQ_PIPELINE_STAGE0 $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
