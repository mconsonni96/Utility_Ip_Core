# Number of clock cycles necessary to expose a measure
# RETAIN_SINGLE_NODE		:	INTEGER	:=	1

# ---------------RETAIN_SINGLE_NODE----------------
set MIN_RETAIN_SINGLE_NODE 0
set MAX_RETAIN_SINGLE_NODE [expr 2**31-1]
set DEFAULT_RETAIN_SINGLE_NODE 1

set enablement {True}
set editable {[expr {$PASS_THROUGH} == "{Both}" || {$PASS_THROUGH} == "{Belt-Bus}"] }


set dependency {}

set tooltip "Number of retain cycles in a single node"
set display_name "Retain Single Node"

set_param_long_range "RETAIN_SINGLE_NODE" $MIN_RETAIN_SINGLE_NODE $MAX_RETAIN_SINGLE_NODE $DEFAULT_RETAIN_SINGLE_NODE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
