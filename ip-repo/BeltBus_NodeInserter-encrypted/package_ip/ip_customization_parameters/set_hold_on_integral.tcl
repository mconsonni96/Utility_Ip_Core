# Da chiarire
# HOLD_ON_INTEGRAL		:	INTEGER	:=	5

# ---------------HOLD_ON_INTEGRAL----------------
set MIN_HOLD_ON_INTEGRAL 0
set MAX_HOLD_ON_INTEGRAL [expr 2**31-1]
set DEFAULT_HOLD_ON_INTEGRAL 5

set enablement {True}
set editable {[expr {$PASS_THROUGH} == "{Both}" || {$PASS_THROUGH} == "{Belt-Bus}"] }

set dependency {}

set tooltip "Hold-On integral"
set display_name "Hold-On Integral"

set_param_long_range "HOLD_ON_INTEGRAL" $MIN_HOLD_ON_INTEGRAL $MAX_HOLD_ON_INTEGRAL $DEFAULT_HOLD_ON_INTEGRAL $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
