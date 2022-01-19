# Number od Bit of Uncalibrated_TDL (0 : 2^BIT_UNCALIBRATED-1 is the memory length)
# BIT_UNCALIBRATED	:	POSITIVE	RANGE	2	TO	16	:=	8;

# -------------- BIT_UNCALIBRATED --------------
set MIN_BIT_UNCALIBRATED 2
set MAX_BIT_UNCALIBRATED 16
set DEFAULT_BIT_UNCALIBRATED 11

set enablement {True}
set editable {}

set dependency {}

set tooltip "Bit reserver to the FID of the Belt Bus used to identify properly the timestamps"
set display_name "Bit Uncalibrated"

set_param_long_range "BIT_UNCALIBRATED" $MIN_BIT_UNCALIBRATED $MAX_BIT_UNCALIBRATED $DEFAULT_BIT_UNCALIBRATED $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
