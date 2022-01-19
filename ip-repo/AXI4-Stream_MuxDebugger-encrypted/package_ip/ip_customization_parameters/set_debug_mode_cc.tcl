#	True Active the Debug of CharactCurve
#	DEBUG_MODE_CC		:	BOOLEAN	:=	TRUE;

# ----------------- DEBUG_MODE_CC -----------------
set DEFAULT_DEBUG_MODE_CC "TRUE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Allow to generate the calibration mux to the debugger of the Charact Curve"
set display_name "Debug Port CharactCurve"

set_param_bool "DEBUG_MODE_CC" $DEFAULT_DEBUG_MODE_CC $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
