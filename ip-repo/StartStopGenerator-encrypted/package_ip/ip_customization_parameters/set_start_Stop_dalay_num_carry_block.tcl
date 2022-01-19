# Initialization of Divider
# DIVIDER_INIT	:	NATURAL						:=	3;

# --------------- DIVIDER_INIT ----------------
set MIN_START_STOP_DALAY_NUM_CARRY_BLOCK 0
set MAX_START_STOP_DALAY_NUM_CARRY_BLOCK 8
set DEFAULT_START_STOP_DALAY_NUM_CARRY_BLOCK 4

set enablement {True}
set editable {}

set dependency {}

set tooltip "Start Stop Dalay Num Carry Block"
set display_name "Start Stop Dalay Num Carry Block"

set_param_long_range "START_STOP_DALAY_NUM_CARRY_BLOCK" $MIN_START_STOP_DALAY_NUM_CARRY_BLOCK $MAX_START_STOP_DALAY_NUM_CARRY_BLOCK $DEFAULT_START_STOP_DALAY_NUM_CARRY_BLOCK $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
