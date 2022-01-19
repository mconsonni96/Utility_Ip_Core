# Select the max number of input per stage	in TA of sub-interpolator

# -- SubInterpolator --
# SUB_INT_MAX_INPUT_ENGINE_PIPELINE		:	TA_POSITIVE_ARRAY_TYPE := (2,2);
# ---------------------

# --- SUB_INT_MAX_INPUT_ENGINE_PIPELINE_i ----
for {set i 0} {$i < 2} {incr i} {

	set SUB_INT_max_input_engine_pipeline_i "SUB_INT_MAX_INPUT_ENGINE_PIPELINE_"
	append SUB_INT_max_input_engine_pipeline_i $i

	set MIN_SUB_INT_MAX_INPUT_ENGINE_PIPELINE 2
	set MAX_SUB_INT_MAX_INPUT_ENGINE_PIPELINE 8

	if {$i eq 0} {
		set DEFAULT_SUB_INT_MAX_INPUT_ENGINE_PIPELINE 4
	} else {
		set DEFAULT_SUB_INT_MAX_INPUT_ENGINE_PIPELINE $MIN_DECO_LOG_MAX_INPUT_ENGINE_PIPELINE
	}

	set enablement {True}
	set editable {expr [expr {$MD_VS_TD} == "{MD}"]}

	set dependency {}

	set tooltip "Pipeline stage of the Tree Adder of used as Sub_interpolator of the TDLs"
	set display_name "Sub-Interpolator  Max Input Engine of Tree Adder at Pipeline Stage $i "

	set_param_long_range $SUB_INT_max_input_engine_pipeline_i $MIN_SUB_INT_MAX_INPUT_ENGINE_PIPELINE $MAX_SUB_INT_MAX_INPUT_ENGINE_PIPELINE $DEFAULT_SUB_INT_MAX_INPUT_ENGINE_PIPELINE $enablement $editable $dependency $tooltip $display_name

}
# ---------------------------------------------
