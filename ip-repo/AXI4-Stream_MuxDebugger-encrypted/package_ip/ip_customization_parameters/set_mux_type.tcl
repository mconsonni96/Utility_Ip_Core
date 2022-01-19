# Number of input of the single MUX
# MUX_TYPE	:	STRING	:=	"4to1";

# --------------- BIT_RESOLUTION ---------------
set LIST_MUX_TYPE {"2to1" "4to1"}
set DEFAULT_MUX_TYPE "4to1"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of input of the single MUX"
set display_name "Mux type"

set_param_string_list "MUX_TYPE" $LIST_MUX_TYPE $DEFAULT_MUX_TYPE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
