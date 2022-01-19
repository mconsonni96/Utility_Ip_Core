# Bit Length of Divider, 0 NOT instantiated, 1 TO 4 for having small FSM and clk domain
# HALF_DIVIDER		:	NATURAL	RANGE	0	TO	8	:=	2

# --------------- HALF_DIVIDER ----------------
set MIN_HALF_DIVIDER 0
set MAX_HALF_DIVIDER 8
set DEFAULT_HALF_DIVIDER 16

set enablement {True}
set editable {}

set dependency {}

set tooltip "Half Divider"
set display_name "Half Divider"

set_param_long_range "HALF_DIVIDER" $MIN_HALF_DIVIDER $MAX_HALF_DIVIDER $DEFAULT_HALF_DIVIDER $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
