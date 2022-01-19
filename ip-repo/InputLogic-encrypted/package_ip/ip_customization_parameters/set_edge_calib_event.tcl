# Initialization of the Edge Trigger of the stretcher, *RISE* if we sample on the rising edge of the input or *FALL* if we sample on the falling edge of the input
# EDGE_TRIGGER_INIT		:	STRING		:=	"RISE";

# ------------EDGE_TRIGGER_INIT---------------
set LIST_CALIB_EVENT {"INTERNAL" "EXTERNAL" "NOT REQUIRED"}
set DEFAULT_CALIB_EVENT "EXTERNAL"

set enablement {True}
set editable {}

set dependency {}


set tooltip "Choose how to generate CalibEvent"
set display_name "Calibartion Event"

set_param_string_list "CALIB_EVENT" $LIST_CALIB_EVENT $DEFAULT_CALIB_EVENT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
