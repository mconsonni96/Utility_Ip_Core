# Number of Sample (2^BIT_CALIBRATION) Used to Calibrate (BIT_CALIBRATION is the memory width)
# BIT_CALIBRATION	:	POSITIVE	RANGE	1	TO	31	:=	24;

# --------------- BIT_CALIBRATION ---------------
set MIN_BIT_CALIBRATION 1
set MAX_BIT_CALIBRATION 31
set DEFAULT_BIT_CALIBRATION 24

set enablement {True}
set editable {}

set dependency {}

set tooltip "Bit dimension of the calibration table"
set display_name "Bit Calibration"

set_param_long_range "BIT_CALIBRATION" $MIN_BIT_CALIBRATION $MAX_BIT_CALIBRATION $DEFAULT_BIT_CALIBRATION $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
