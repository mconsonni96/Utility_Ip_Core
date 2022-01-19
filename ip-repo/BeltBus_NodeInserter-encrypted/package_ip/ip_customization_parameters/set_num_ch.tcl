# Number of Channels [1:16], Synq 0
# NUM_CH		:	NATURAL	RANGE	0	TO	255	:=	2

# ---------------NUM_CH----------------
set MIN_NUM_CH 0
set MAX_NUM_CH 255
set DEFAULT_NUM_CH 0

set enablement {True}
set editable {}

set dependency {}

set display_name "Number of Channel"
set tooltip "Number of channel"

set_param_long_range "NUM_CH" $MIN_NUM_CH $MAX_NUM_CH $DEFAULT_NUM_CH $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
