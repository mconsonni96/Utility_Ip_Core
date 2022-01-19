# Number of Bit of SubInterpolated TDL
# BIT_SUB_INT		:	POSITIVE RANGE	2 TO 12	:= 5;

# ------------------ BIT_SUB_INT ---------------------
set MIN_BIT_SUB_INT 2
set MAX_BIT_SUB_INT 16
set DEFAULT_BIT_SUB_INT 10

set enablement {True}
set editable {}

set dependency {}

set tooltip "Bit dimension of Bit Sub-Interpolated Output"
set display_name "Bit Sub-Interpolated"

set_param_long_range "BIT_SUB_INT" $MIN_BIT_SUB_INT $MAX_BIT_SUB_INT $DEFAULT_BIT_SUB_INT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
