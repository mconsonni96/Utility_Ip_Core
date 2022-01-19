# Number of Bits of the Calibrated_TDL
# MAX_CHANNEL	:	POSITIVE := 16;

# --------------- BIT_RESOLUTION ---------------
set LIST_MAX_CHANNEL {16}
set DEFAULT_MAX_CHANNEL 16

set enablement {False}
set editable {}

set dependency {}

set tooltip "Maximum number of channels to be multiplexed"
set display_name "Max Channel"

set_param_long_list "MAX_CHANNEL" $LIST_MAX_CHANNEL $DEFAULT_MAX_CHANNEL $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
