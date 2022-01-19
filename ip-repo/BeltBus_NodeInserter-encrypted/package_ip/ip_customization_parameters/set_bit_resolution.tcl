# Number of Bits of the Calibrated_TDL
# BIT_RESOLUTION		:	POSITIVE	RANGE	0	TO	32	:=	16

# ---------------BIT_RESOLUTION----------------
set MIN_BIT_RESOLUTION 0
set MAX_BIT_RESOLUTION 32
set DEFAULT_BIT_RESOLUTION 16

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of Bits used for sub-clock resolution"
set display_name "Bit of Resolution"

set_param_long_range "BIT_RESOLUTION" $MIN_BIT_RESOLUTION $MAX_BIT_RESOLUTION $DEFAULT_BIT_RESOLUTION $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
