# Bit Length of StretchLength, 0 NOT instantiated, No Range because is synchronous to clk domain
# BIT_STRETCH_LENGTH	:	NATURAL		:=	4;

# --------------- BIT_STRETCH_LENGTH ----------------
set MIN_BIT_STRETCH_LENGTH 0
set MAX_BIT_STRETCH_LENGTH 4
set DEFAULT_BIT_STRETCH_LENGTH $MIN_BIT_STRETCH_LENGTH

set enablement {True}
set editable {}

set dependency {}

set tooltip "Bit length of StretchLength"
set display_name "Bit Stretch Length"

set_param_long_range "BIT_STRETCH_LENGTH" $MIN_BIT_STRETCH_LENGTH $MAX_BIT_STRETCH_LENGTH $DEFAULT_BIT_STRETCH_LENGTH $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
