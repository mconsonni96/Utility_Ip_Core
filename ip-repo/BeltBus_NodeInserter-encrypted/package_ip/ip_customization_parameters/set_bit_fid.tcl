#  Function ID of the Belt Bus 0 = OVERLOW Coarse, 1 = MEASURE, 0 Belt Bus --> AXI4 Stream
# BIT_FID		:	NATURAL	:=	1

# ---------------BIT_FID----------------
set MIN_BIT_FID 1
set MAX_BIT_FID 8
set DEFAULT_BIT_FID 1

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of bits of the Function ID"
set display_name "Bit FID"

set_param_long_range "BIT_FID" $MIN_BIT_FID $MAX_BIT_FID $DEFAULT_BIT_FID $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
