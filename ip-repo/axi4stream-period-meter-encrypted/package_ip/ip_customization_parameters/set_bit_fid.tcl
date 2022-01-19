# Specifies the number of  bits for the fid field

# ------------- CDC_SYNC_STAGES -----------
set MIN_BIT_FID 1
set MAX_BIT_FID 4
set DEFAULT_BIT_FID 1

set enablement {True}
set editable {}

set dependency {}

set tooltip "Variable that sets the dimension of the fid field"
set display_name "Bit Fid"

set_param_long_range "BIT_FID" $MIN_BIT_FID $MAX_BIT_FID $DEFAULT_BIT_FID $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
