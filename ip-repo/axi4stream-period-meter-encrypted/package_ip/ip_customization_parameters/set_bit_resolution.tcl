# Specifies the number of  bits for the resolution field

# ------------- CDC_SYNC_STAGES -----------
set MIN_BIT_RESOLUTION 1
set MAX_BIT_RESOLUTION 31
set DEFAULT_BIT_RESOLUTION 16

set enablement {True}
set editable {}

set dependency {}

set tooltip "Variable that sets the dimension of the resolution field"
set display_name "Bit Resolution"

set_param_long_range "BIT_RESOLUTION" $MIN_BIT_RESOLUTION $MAX_BIT_RESOLUTION $DEFAULT_BIT_RESOLUTION $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
