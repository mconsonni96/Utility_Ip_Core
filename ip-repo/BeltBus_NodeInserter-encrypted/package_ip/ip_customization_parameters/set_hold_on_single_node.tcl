# Number of clock cycles after the RETAIN necessary to force the injection of a measure in a single node
# HOLD_ON_SINGLE_NODE		:	INTEGER	:=	1

# ---------------HOLD_ON_SINGLE_NODE----------------
set MIN_HOLD_ON_SINGLE_NODE 0
set MAX_HOLD_ON_SINGLE_NODE [expr 2**31-1]
set DEFAULT_HOLD_ON_SINGLE_NODE 1

set enablement {True}
set editable {[expr {$PASS_THROUGH} == "{Both}" || {$PASS_THROUGH} == "{Belt-Bus}"] }

set dependency {}

set tooltip "Hold-On Single Node"
set display_name "Number of clock cycles in Hold-on phase"

set_param_long_range "HOLD_ON_SINGLE_NODE" $MIN_HOLD_ON_SINGLE_NODE $MAX_HOLD_ON_SINGLE_NODE $DEFAULT_HOLD_ON_SINGLE_NODE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
