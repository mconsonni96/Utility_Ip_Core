# Specifies the number of  bits for the coarse field

# ------------- CDC_SYNC_STAGES -----------
set MIN_BIT_COARSE 1
set MAX_BIT_COARSE 32
set DEFAULT_BIT_COARSE 4

set enablement {True}
set editable {}

set dependency {}

set tooltip "Variable that sets the dimension of the coarse field"
set display_name "Bit Coarse"

set_param_long_range "BIT_COARSE" $MIN_BIT_COARSE $MAX_BIT_COARSE $DEFAULT_BIT_COARSE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
