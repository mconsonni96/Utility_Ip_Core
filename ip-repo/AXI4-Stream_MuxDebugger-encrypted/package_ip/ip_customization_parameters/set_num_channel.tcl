# Tot number of Channels
# NUM_CHANNEL	:	NATURAL range 1 to 16 := 16;

# --------------- BIT_CALIBRATION ---------------
set MIN_NUM_CHANNEL 1
set MAX_NUM_CHANNEL 16
set DEFAULT_NUM_CHANNEL 2

set enablement {True}
set editable {}

set dependency {}

set tooltip "Tot number of Channels"
set display_name "Number of Channels"

set_param_long_range "NUM_CHANNEL" $MIN_NUM_CHANNEL $MAX_NUM_CHANNEL $DEFAULT_NUM_CHANNEL $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
