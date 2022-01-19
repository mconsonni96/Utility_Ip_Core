
# Select the max number of input per stage in T2B inside DecoT2B

# ------ DecoT2B ------
# DECO_T2B_MAX_INPUT_ENGINE_PIPELINE	:	T2B_POSITIVE_ARRAY_TYPE := (4,2,2,2);
# ---------------------


# --- DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_i ----
for {set i 0} {$i < 4} {incr i} {

	set deco_t2b_max_input_engine_pipeline_i "DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_"
	append deco_t2b_max_input_engine_pipeline_i $i

	set MIN_DECO_T2B_MAX_INPUT_ENGINE_PIPELINE 2
	set MAX_DECO_T2B_MAX_INPUT_ENGINE_PIPELINE 8

	if {$i eq 0} {
		set DEFAULT_DECO_T2B_MAX_INPUT_ENGINE_PIPELINE 4
	} else {
		set DEFAULT_DECO_T2B_MAX_INPUT_ENGINE_PIPELINE $MIN_DECO_LOG_MAX_INPUT_ENGINE_PIPELINE
	}

	set enablement {True}
	set editable {expr [expr {$TYPE_DECODER} == "{T2B}"] && [expr {$MD_VS_TD} == "{MD}"]}

	set dependency {}

	set tooltip "Pipeline stage of the Thermo-to-Binary of T2B Decoder that intrinsecally solve the bubble errors"
	set display_name "T2B Decoder Max Input Engine of Thermo-to-Binary at Pipeline Stage $i "

	set_param_long_range $deco_t2b_max_input_engine_pipeline_i $MIN_DECO_T2B_MAX_INPUT_ENGINE_PIPELINE $MAX_DECO_T2B_MAX_INPUT_ENGINE_PIPELINE $DEFAULT_DECO_T2B_MAX_INPUT_ENGINE_PIPELINE $enablement $editable $dependency $tooltip $display_name

}
# ---------------------------------------------
