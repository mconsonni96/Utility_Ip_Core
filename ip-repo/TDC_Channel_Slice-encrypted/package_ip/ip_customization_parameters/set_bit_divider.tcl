# Bit Length of Divider, 0 NOT instantiated, 1 TO 4 for having small FSM and clk domain
# BIT_DIVIDER		:	NATURAL	RANGE	0	TO	4	:=	2

# --------------- BIT_DIVIDER ----------------
set MIN_BIT_DIVIDER 0
set MAX_BIT_DIVIDER 4
set DEFAULT_BIT_DIVIDER $MIN_BIT_DIVIDER

set enablement {True}
set editable {}

set dependency {}

set tooltip "Bit length of the Divider"
set display_name "Bit Divider"

set_param_long_range "BIT_DIVIDER" $MIN_BIT_DIVIDER $MAX_BIT_DIVIDER $DEFAULT_BIT_DIVIDER $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
