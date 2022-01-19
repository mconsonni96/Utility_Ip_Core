#	True Active the Debug of CalibTable
#	DEBUG_MODE_CT		:	BOOLEAN	:=	TRUE;

# ----------------- DEBUG_MODE_CT -----------------
set DEFAULT_DEBUG_MODE_CT "TRUE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Allow to generate the calibration mux to the debugger of the CalibTable"
set display_name "Debug Port CalibTable"

set_param_bool "DEBUG_MODE_CT" $DEFAULT_DEBUG_MODE_CT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
