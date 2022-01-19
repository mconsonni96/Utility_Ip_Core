
# TO DO editable $clk_select == "ring oscillator"

# --------------- NUM_CARRY_BLOCK ----------------
set MIN_NUM_CARRY_BLOCK 0
set MAX_NUM_CARRY_BLOCK 16
set DEFAULT_NUM_CARRY_BLOCK 8

set enablement {True}
set editable {}

set dependency {}

set tooltip "Num Carry Block"
set display_name "Num Carry Block"

set_param_long_range "NUM_CARRY_BLOCK" $MIN_NUM_CARRY_BLOCK $MAX_NUM_CARRY_BLOCK $DEFAULT_NUM_CARRY_BLOCK $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
