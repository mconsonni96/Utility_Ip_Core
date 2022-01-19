
# Bit of Tapped Delay-Line
# BIT_TDL			:	POSITIVE	RANGE 4 TO 4096	:= 256;

# ------------------- BIT_TDL -------------------
set MIN_BIT_TDL 4
set MAX_BIT_TDL 4096
set DEFAULT_BIT_TDL 256

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of Taps in each TDL"
set display_name "Number of Taps"

set_param_long_range "BIT_TDL" $MIN_BIT_TDL $MAX_BIT_TDL $DEFAULT_BIT_TDL $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
