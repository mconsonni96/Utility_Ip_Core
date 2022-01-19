#	True Active the Debug of CharactCurve
#	DEBUG_MODE_CC		:	BOOLEAN	:=	FALSE;

# ----------------- DEBUG_MODE_CC -----------------
set DEFAULT_DEBUG_MODE_CC "FALSE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Allow to tune in real-time the calibration and read the Charact Curve"
set display_name "Debug Port CharactCurve"

set_param_bool "DEBUG_MODE_CC" $DEFAULT_DEBUG_MODE_CC $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
