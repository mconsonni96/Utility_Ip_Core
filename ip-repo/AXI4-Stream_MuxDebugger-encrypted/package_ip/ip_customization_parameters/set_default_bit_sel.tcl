# Number of bits needed for selection
# DEFAULT_BIT_SEL : POSITIVE := 4

# --------------- BIT_RESOLUTION ---------------
set MIN_DEFAULT_BIT_SEL 1
set MAX_DEFAULT_BIT_SEL 4
set DEFAULT_DEFAULT_BIT_SEL 4

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of bits needed for selection"
set display_name "Number of selection bits"

set_param_long_range "DEFAULT_BIT_SEL" $MIN_DEFAULT_BIT_SEL $MAX_DEFAULT_BIT_SEL $DEFAULT_DEFAULT_BIT_SEL $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
