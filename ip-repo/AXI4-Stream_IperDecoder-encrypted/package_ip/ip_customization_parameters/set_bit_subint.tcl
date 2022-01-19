# Bit of Log2Dn/Up
# BIT_SUB_INT		:	POSITIVE RANGE	2 TO 12	:= 5;

# ------------------ BIT_SUB_INT ---------------------
set MIN_BIT_SUB_INT 2
set MAX_BIT_SUB_INT 16
set DEFAULT_BIT_SUB_INT 8

set enablement {False}
set editable {}

set dependency {[expr {int([expr [tcl::mathfunc::log [expr $BIT_TDL*$NUMBER_OF_TDL-1]]/[tcl::mathfunc::log 2] +1])}]}

set tooltip "Bit dimenstino of Bit Sub-Interpolated Output"
set display_name "Bit Sub-Interpolated"

set_param_long_range "BIT_SUB_INT" $MIN_BIT_SUB_INT $MAX_BIT_SUB_INT $DEFAULT_BIT_SUB_INT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
