# Specifies the number of  bits for the overflow field

# ------------- CDC_SYNC_STAGES -----------
set MIN_BIT_OVERFLOW 1
set MAX_BIT_OVERFLOW 16
set DEFAULT_BIT_OVERFLOW 16

set enablement {True}
set editable {}

set dependency {}

set tooltip "Variable that sets the dimension of the overflow field"
set display_name "Bit Overflow"

set_param_long_range "BIT_OVERFLOW" $MIN_BIT_OVERFLOW $MAX_BIT_OVERFLOW $DEFAULT_BIT_OVERFLOW $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
