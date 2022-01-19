# Bit for Number of Channels
# BIT_NUM_CH		:	NATURAL	:=	4

# ---------------BIT_NUM_CH----------------
set MIN_BIT_NUM_CH 1
set MAX_BIT_NUM_CH 8
set DEFAULT_BIT_NUM_CH 4

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of bits used for the number of channel"
set display_name "Bit Number of Channel"

set_param_long_range "BIT_NUM_CH" $MIN_BIT_NUM_CH $MAX_BIT_NUM_CH $DEFAULT_BIT_NUM_CH $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
