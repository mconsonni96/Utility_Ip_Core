# Initialization of the Edge Trigger of the stretcher, *RISE* if we sample on the rising edge of the input or *FALL* if we sample on the falling edge of the input
# EDGE_TRIGGER_INIT		:	STRING		:=	"RISE";

# ------------EDGE_TRIGGER_INIT---------------
set LIST_CLK_SELECT {"EXTERNAL" "RING OSCILLATOR"}
set DEFAULT_EDGE_TRIGGER_INIT "RING OSCILLATOR"

set enablement {True}
set editable {}

set dependency {}


set tooltip "Choose type of clock External or a RingOscillator"
set display_name "Clk Select"

set_param_string_list "CLK_SELECT" $LIST_CLK_SELECT $DEFAULT_EDGE_TRIGGER_INIT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
