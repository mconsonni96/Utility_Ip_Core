# Number of clock cycles after the HOLDON necessary to eliminate a measure
# INJECT_CYCLES		:	INTEGER	:=	15

# ---------------INJECT_CYCLES----------------
set MIN_INJECT_CYCLES 0
set MAX_INJECT_CYCLES [expr 2**31-1]
set DEFAULT_INJECT_CYCLES 15


set enablement {True}
set editable {[expr {$PASS_THROUGH} == "{Both}" || {$PASS_THROUGH} == "{Belt-Bus}"] }

set dependency {}

set tooltip "Inject Cycles"
set display_name "Number of inject cycles"

set_param_long_range "INJECT_CYCLES" $MIN_INJECT_CYCLES $MAX_INJECT_CYCLES $DEFAULT_INJECT_CYCLES $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
