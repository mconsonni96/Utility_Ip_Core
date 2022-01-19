#	True Active the Debug of CalibTable
#	DEBUG_MODE_CT		:	BOOLEAN	:=	FALSE;

# ----------------- DEBUG_MODE_CT -----------------
set DEFAULT_DEBUG_MODE_CT "FALSE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Allow to tune in real-time the calibration and read the CalibTable"
set display_name "Debug Port CalibTable"

set_param_bool "DEBUG_MODE_CT" $DEFAULT_DEBUG_MODE_CT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
