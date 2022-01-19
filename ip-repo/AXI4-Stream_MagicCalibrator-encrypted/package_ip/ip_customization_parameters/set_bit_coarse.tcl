# Bit of Coarse Counter, If 0 --> no Coarse counter, only fine is considered
# BIT_COARSE		:	NATURAL		RANGE	0	TO	32	:=	8;

# ---------------- BIT_COARSE -----------------
set MIN_BIT_COARSE 0
set MAX_BIT_COARSE 32
set DEFAULT_BIT_COARSE 8

set enablement {True}
set editable {}

set dependency {}

set tooltip "Bit Coarse Counter dimension"
set display_name "Bit Coarse"

set_param_long_range "BIT_COARSE" $MIN_BIT_COARSE $MAX_BIT_COARSE $DEFAULT_BIT_COARSE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
