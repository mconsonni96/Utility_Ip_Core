# Select the max number of inputs for the AND gates in the fourth stage
# MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3	:	POSITIVE := 3;

# ---------------- MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 -----------------
set MIN_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 2
set MAX_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 8
set DEFAULT_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 4

set enablement {True}
set editable {}

set dependency {}

set tooltip "Select the maximum number of inputs for the AND gates in the fourth stage"
set display_name "Maximum Number of inputs of the engines of the fourth stage"

set_param_long_range "MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3" $MIN_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 $MAX_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 $DEFAULT_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE3 $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
