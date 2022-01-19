# Select the max number of inputs for the AND gates in the second stage
# MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1	:	POSITIVE := 3;

# ---------------- MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 -----------------
set MIN_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 2
set MAX_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 8
set DEFAULT_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 4

set enablement {True}
set editable {}

set dependency {}

set tooltip "Select the maximum number of inputs for the AND gates in the second stage"
set display_name "Maximum Number of inputs of the engines of the second stage"

set_param_long_range "MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1" $MIN_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 $MAX_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 $DEFAULT_MAX_INPUT_ENGINE_AND_PIPELINE_STAGE1 $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
