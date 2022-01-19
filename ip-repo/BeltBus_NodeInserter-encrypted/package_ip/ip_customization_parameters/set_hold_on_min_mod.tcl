# Da chiarire?
# HOLD_ON_MIN_MOD		:	INTEGER	:=	1

# ---------------HOLD_ON_MIN_MOD----------------
set MIN_HOLD_ON_MIN_MOD 0
set MAX_HOLD_ON_MIN_MOD [expr 2**31-1]
set DEFAULT_HOLD_ON_MIN_MOD 1

set enablement {True}
set editable {[expr {$PASS_THROUGH} == "{Both}" || {$PASS_THROUGH} == "{Belt-Bus}"] }

set dependency {}

set tooltip "Hold-On min mod"
set display_name "Hold-On Min Mod"

set_param_long_range "HOLD_ON_MIN_MOD" $MIN_HOLD_ON_MIN_MOD $MAX_HOLD_ON_MIN_MOD $DEFAULT_HOLD_ON_MIN_MOD $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
