# Bit of Coarse Counter, if 0 the Coarse Pipeline is removed
# BIT_COARSE		: POSITIVE	RANGE	1	TO	32	:=	4

# ---------------BIT_COARSE----------------
set MIN_BIT_COARSE 1
set MAX_BIT_COARSE 32
set DEFAULT_BIT_COARSE 8

set enablement {True}
set editable {}

set dependency {}

set tooltip "Numbero of bits of the coarse counter"
set display_name "Bit Coarse"

set_param_long_range "BIT_COARSE" $MIN_BIT_COARSE $MAX_BIT_COARSE $DEFAULT_BIT_COARSE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
