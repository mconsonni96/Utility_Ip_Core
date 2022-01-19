
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

set_param_long_range "WEIGHT_AREA_VS_TIME_PERCENT" $MIN_WEIGHT_AREA_VS_TIME_PERCENT $MAX_WEIGHT_AREA_VS_TIME_PERCENT $DEFAULT_WEIGHT_AREA_VS_TIME_PERCENT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
