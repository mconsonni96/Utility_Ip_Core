# Node number, intialized at zero.
# NUM_NODE		:	NATURAL	:=	0

# --------------- NUM_NODE ----------------
set MIN_NUM_NODE 0
set MAX_NUM_NODE 255
set DEFAULT_NUM_NODE 0

set enablement {True}
set editable {}

set dependency {}

set tooltip "Node number"
set display_name "Node Number"

set_param_long_range "NUM_NODE" $MIN_NUM_NODE $MAX_NUM_NODE $DEFAULT_NUM_NODE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
