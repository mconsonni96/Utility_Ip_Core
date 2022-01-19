# MacroDecoder (MD) vs TurboDecoder (TD)
# MD_VS_TD		:	STRING			:= "TD";

# ------------------ MD_VS_TD -------------------
set LIST_MD_VS_TD {MD TD}
set DEFAULT_MD_VS_TD "MD"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Choose the modality for setting the paramiters of the Decoder, automatic (Turbo) or manual (Macro)"
set display_name "Macro vs Turbo Decoder"

create_param_string_list "MD_VS_TD" $LIST_MD_VS_TD $DEFAULT_MD_VS_TD $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------

# Bit of Bubble
# BIT_BUBBLE		:	POSITIVE	RANGE 1 TO 16	:= 4;

# ----------------- BIT_BUBBLE ----------------
set MIN_BIT_BUBBLE 1
set MAX_BIT_BUBBLE 16
set DEFAULT_BIT_BUBBLE 4

set enablement {True}
set editable {}

set dependency {}

set tooltip "Maximum estention of a bubble error over the TDL"
set display_name "Bit of Bubble"

create_param_long_range "BIT_BUBBLE" $MIN_BIT_BUBBLE $MAX_BIT_BUBBLE $DEFAULT_BIT_BUBBLE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------

# Bit of Coarse Counter, If 0 not Coarse counter is consider only Fine
# BIT_COARSE		:	NATURAL		RANGE	0	TO	32	:=	8;

# ---------------- BIT_COARSE -----------------
# set MIN_BIT_COARSE 0
# set MAX_BIT_COARSE 32
# set DEFAULT_BIT_COARSE 8

# set enablement {True}
# set editable {}

# set dependency {}

# set tooltip "Bit Coarse Counter dimension"
# set display_name "Bit Coarse"

# create_param_long_range "BIT_COARSE" $MIN_BIT_COARSE $MAX_BIT_COARSE $DEFAULT_BIT_COARSE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# Bit of Log2Dn/Up
# BIT_SUB_INT		:	POSITIVE RANGE	2 TO 12	:= 5;

# ------------------ BIT_SUB_INT ---------------------
set MIN_BIT_SUB_INT 2
set MAX_BIT_SUB_INT 16
set DEFAULT_BIT_SUB_INT 8

set enablement {False}
set editable {}

set dependency {[expr {int([expr [tcl::mathfunc::log [expr $BIT_SMP_TDL*$NUMBER_OF_TDL-1]]/[tcl::mathfunc::log 2] +1])}]}

set tooltip "Bit dimenstino of Bit Sub-Interpolated Output"
set display_name "Bit Sub-Interpolated"

create_param_long_range "BIT_SUB_INT" $MIN_BIT_SUB_INT $MAX_BIT_SUB_INT $DEFAULT_BIT_SUB_INT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# Debug port for sub interpolation in Decoder
# DEBUG_PORT_DECODER	:	BOOLEAN	:=	FALSE;

# ------------------------ DEBUG_PORT_DECODER ----------------------------
set DEFAULT_DEBUG_PORT_DECODER "FALSE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Debug port at clock TDC for the Iper Decoder"
set display_name "Debug Port Iper Decoder"

create_param_bool "DEBUG_PORT_DECODER" $DEFAULT_DEBUG_PORT_DECODER $enablement $editable $dependency $tooltip $display_name
# ------------------------------------------------------------------------


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

	create_param_long_range $deco_log_max_input_engine_pipelinel_i $MIN_DECO_LOG_MAX_INPUT_ENGINE_PIPELINE $MAX_DECO_LOG_MAX_INPUT_ENGINE_PIPELINE $DEFAULT_DECO_LOG_MAX_INPUT_ENGINE_PIPELINE $enablement $editable $dependency $tooltip $display_name

}
# ---------------------------------------------


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

	create_param_long_range $deco_t2b_max_input_engine_pipeline_i $MIN_DECO_T2B_MAX_INPUT_ENGINE_PIPELINE $MAX_DECO_T2B_MAX_INPUT_ENGINE_PIPELINE $DEFAULT_DECO_T2B_MAX_INPUT_ENGINE_PIPELINE $enablement $editable $dependency $tooltip $display_name

}
# ---------------------------------------------


# Control in pipeline if the input is all at "0" (Empty) or at "1" (Full)
# EDGE_CHECK		:	BOOLEAN	:= TRUE;

# ----------------- EDGE_CHECK -----------------
set DEFAULT_EDGE_CHECK "FALSE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Choose if the sub-modules of Iper Decoder that do the edge chack removing the valid if no edge is over the TDLs"
set display_name "Edge Check"

create_param_bool "EDGE_CHECK" $DEFAULT_EDGE_CHECK $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# FREE_RUNNING	:	BOOLEAN	:= TRUE;
# Enable/Disable the Free Running mode

# ---------------- FREE_RUNNING ----------------
set DEFAULT_FREE_RUNNING "TRUE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Choose if the sub-modules of Iper Decoder that do the decoding work each pulse of clock or only during the valid"
set display_name "Free Running"

create_param_bool "FREE_RUNNING" $DEFAULT_FREE_RUNNING $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------





# AREA vs TIME vs COST for set the vector listed in MacroDecoder
# OPTIMIZATION_MODE			:	STRING					:= "TIME";

# -------------- OPTIMIZATION_MODE -------------
set LIST_OPTIMIZATION_MODE {AREA TIME COST}
set DEFAULT_OPTIMIZATION_MODE "TIME"

set enablement {False}
set editable {expr [expr {$MD_VS_TD} == "{TD}"]}

set dependency {}

set tooltip "Choose the Turbo Decoder optimization mode setting to pre-processor "
set display_name "Turbo Decoder Optimization Mode"

create_param_string_list "OPTIMIZATION_MODE" $LIST_OPTIMIZATION_MODE $DEFAULT_OPTIMIZATION_MODE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------

# Print the report generated by the Turbo optimization
# PRINT_FULL_REPORT			:	BOOLEAN					:= TRUE;

# -------------- PRINT_FULL_REPORT ------------
set DEFAULT_PRINT_FULL_REPORT "FALSE"

set enablement {False}
set editable {expr [expr {$MD_VS_TD} == "{TD}"]}

set dependency {}

set tooltip "Print the report of the Turbo Decoder pre-processor"
set display_name "Print Full Report"

create_param_bool "PRINT_FULL_REPORT" $DEFAULT_PRINT_FULL_REPORT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


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

	create_param_long_range $SUB_INT_max_input_engine_pipeline_i $MIN_SUB_INT_MAX_INPUT_ENGINE_PIPELINE $MAX_SUB_INT_MAX_INPUT_ENGINE_PIPELINE $DEFAULT_SUB_INT_MAX_INPUT_ENGINE_PIPELINE $enablement $editable $dependency $tooltip $display_name

}
# ---------------------------------------------


# Decoder based on DecoLog2 or DecoT2B
# TYPE_DECODER	:	STRING			:= "T2B";

# ---------------- TYPE_DECODER ----------------
set LIST_TYPE_DECODER {T2B LOG}
set DEFAULT_TYPE_DECODER "T2B"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Choose the type of the sub-module that do the decoding, thermo-to-binary (T2B) or log2 (LOG)"
set display_name "Thermo-to-Binary vs Log2 Decoder"

create_param_string_list "TYPE_DECODER" $LIST_TYPE_DECODER $DEFAULT_TYPE_DECODER $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------

# DN vs UP Detection
# ------------- Select Types of Edge of the Tapped Delay-Line ------------
# TYPE_EDGE_ARRAY	:	DN_VS_UP_ARRAY_STRING	:= ("DN", "UP", Others => "DN");
# ------------------------------------------------------------------------

# ---------------- TYPE_EDGE_i --------------------

# TODO DYNAMICALLY IN AXI4Stream_Channel_TDC_v1_0.tcl
# TODO Do not show the TDL not used

for {set i 0} {$i < 16} {incr i} {

	set type_edge_i "TYPE_EDGE_"
	append type_edge_i $i


	set LIST_TYPE_EDGE {DN UP}
	set DEFAULT_TYPE_EDGE "DN"

	if {$i < 1} {
		set enablement {True}
	} else {
		set enablement {False}
	}



	set editable "$"
	append editable "NUMBER_OF_TDL > "
	append editable $i
	set dependency {}

	set tooltip "Edge to detect over TDL"
	set display_name "Type Edge TDL $i"

	create_param_string_list $type_edge_i $LIST_TYPE_EDGE $DEFAULT_TYPE_EDGE $enablement $editable $dependency $tooltip $display_name

}
# ---------------------------------------------



# Weight between Time and Area performance
# WEIGHT_AREA_VS_TIME_PERCENT	:	INTEGER	RANGE 0 TO 100	:= 50

# --------- WEIGHT_AREA_VS_TIME_PERCENT -------
set MIN_WEIGHT_AREA_VS_TIME_PERCENT 0
set MAX_WEIGHT_AREA_VS_TIME_PERCENT 100
set DEFAULT_WEIGHT_AREA_VS_TIME_PERCENT $MAX_WEIGHT_AREA_VS_TIME_PERCENT

set enablement {False}
set editable {expr [expr {$OPTIMIZATION_MODE} == "{COST}"] && [expr {$MD_VS_TD} == "{TD}"]}

set dependency {}

set tooltip "Weigth Percent of the Cost to tune the settings of the pre-processor, Area is 0 Time is 100"
set display_name "Weigth Percent of Cost"

create_param_long_range "WEIGHT_AREA_VS_TIME_PERCENT" $MIN_WEIGHT_AREA_VS_TIME_PERCENT $MAX_WEIGHT_AREA_VS_TIME_PERCENT $DEFAULT_WEIGHT_AREA_VS_TIME_PERCENT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
