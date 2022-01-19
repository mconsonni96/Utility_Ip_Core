# Specifies the number of  bits for the number of channel field

# ------------- CDC_SYNC_STAGES -----------
set MIN_BIT_NUM_CH 1
set MAX_BIT_NUM_CH 16
set DEFAULT_BIT_NUM_CH 4

set enablement {True}
set editable {}

set dependency {}

set tooltip "Variable that sets the dimension of the number of channel field"
set display_name "Bit Number of Channel"

set_param_long_range "BIT_NUM_CH" $MIN_BIT_NUM_CH $MAX_BIT_NUM_CH $DEFAULT_BIT_NUM_CH $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
