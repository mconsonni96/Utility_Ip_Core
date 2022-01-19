
# Select the max number of input per stage of TA inside DecoLog2
# ------ DecoLog2 -----
# DECO_LOG_MAX_INPUT_ENGINE_PIPELINE	:	MAX_INPUT_ENGINE_PIPELINE_TA_ARRAY_TYPE := (2,2);
# ---------------------

# --- DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_i ----
for {set i 0} {$i < 2} {incr i} {

	set deco_log_max_input_engine_pipelinel_i "DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_"
	append deco_log_max_input_engine_pipelinel_i $i

	set MIN_DECO_LOG_MAX_INPUT_ENGINE_PIPELINE 2
	set MAX_DECO_LOG_MAX_INPUT_ENGINE_PIPELINE 8
	set DEFAULT_DECO_LOG_MAX_INPUT_ENGINE_PIPELINE $MIN_DECO_LOG_MAX_INPUT_ENGINE_PIPELINE

	set enablement {False}
	set editable {expr [expr {$TYPE_DECODER} == "{LOG}"] && [expr {$MD_VS_TD} == "{MD}"]}
	set dependency {}

	set tooltip "Pipeline stage of the Tree Adder of Log2 Decoder used for solve bubble arrors"
	set display_name "Log2 Decoder Max Input Engine of Tree Adder at Pipeline Stage $i "

	set_param_long_range $deco_log_max_input_engine_pipelinel_i $MIN_DECO_LOG_MAX_INPUT_ENGINE_PIPELINE $MAX_DECO_LOG_MAX_INPUT_ENGINE_PIPELINE $DEFAULT_DECO_LOG_MAX_INPUT_ENGINE_PIPELINE $enablement $editable $dependency $tooltip $display_name

}
# ---------------------------------------------
