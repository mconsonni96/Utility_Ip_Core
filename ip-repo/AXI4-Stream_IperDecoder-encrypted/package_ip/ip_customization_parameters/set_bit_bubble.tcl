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

set_param_long_range "BIT_BUBBLE" $MIN_BIT_BUBBLE $MAX_BIT_BUBBLE $DEFAULT_BIT_BUBBLE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
