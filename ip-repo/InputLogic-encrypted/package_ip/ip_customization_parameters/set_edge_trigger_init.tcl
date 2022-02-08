# Initialization of the Edge Trigger of the stretcher, *RISE* if we sample on the rising edge of the input or *FALL* if we sample on the falling edge of the input
# EDGE_TRIGGER_INIT		:	STRING		:=	"RISE";

# ------------EDGE_TRIGGER_INIT---------------
set LIST_EDGE_TRIGGER_INIT {RISE FALL BOTH}
set DEFAULT_EDGE_TRIGGER_INIT "RISE"

set enablement {True}
set editable {}

set dependency {}


set tooltip "Choose the edge trigger of AsyncEventIn"
set display_name "Edge Trigger Initialization"

set_param_string_list "EDGE_TRIGGER_INIT" $LIST_EDGE_TRIGGER_INIT $DEFAULT_EDGE_TRIGGER_INIT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
