# Select the max number of outputs per stage
# MAX_OUTPUT_ENGINE_PIPELINE_STAGE0	:	POSITIVE	RANGE 1 TO 8	:= 3;


# ---_MAX_OUTPUT_ENGINE_PIPELINE_STAGE_i -----
for {set i 0} {$i < 4} {incr i} {

	set max_output_engine_pipeline_stage_i "MAX_OUTPUT_ENGINE_PIPELINE_"
	append max_output_engine_pipeline_stage_i $i

	set MIN_MAX_OUTPUT_ENGINE_PIPELINE_STAGE 1
	set MAX_MAX_OUTPUT_ENGINE_PIPELINE_STAGE 8

	if {$i eq 0} {
		set DEFAULT_MAX_OUTPUT_ENGINE_PIPELINE_STAGE 2
	} else {
		set DEFAULT_MAX_OUTPUT_ENGINE_PIPELINE_STAGE $MIN_MAX_OUTPUT_ENGINE_PIPELINE_STAGE
	}

	set enablement {True}
	set editable {}

	set dependency {}

	set tooltip "This generic allows us to select the max number of outputs per stage"
	set display_name "Max output engine pipeline $i"

	set_param_long_range $max_output_engine_pipeline_stage_i $MIN_MAX_OUTPUT_ENGINE_PIPELINE_STAGE $MAX_MAX_OUTPUT_ENGINE_PIPELINE_STAGE $DEFAULT_MAX_OUTPUT_ENGINE_PIPELINE_STAGE $enablement $editable $dependency $tooltip $display_name

}
# ---------------------------------------------
