# Select the max number of inputs for the AND gates in the third stage
# MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2	:	POSITIVE := 3;

# ---------------- MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 -----------------
set MIN_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 2
set MAX_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 8
set DEFAULT_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 4

set enablement {True}
set editable {}

set dependency {}

set tooltip "Select the maximum number of inputs for the AND gates in the third stage"
set display_name "Maximum Number of inputs of the engines of the third stage"

set_param_long_range "MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2" $MIN_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 $MAX_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 $DEFAULT_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE2 $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
