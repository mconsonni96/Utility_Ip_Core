# If RELATED_CLOCKS = True the two clocks are locked, otherwise they are not locked
# RELATED_CLOCKS		:		BOOLEAN							:= False ;

# ------------------ RELATED_CLOCKS ---------------------
set DEFAULT_RELATED_CLOCKS "FALSE"

set enablement {False}
set editable {[expr {$MODE_SEL} == "{FIFO}"]}

set dependency {}

set tooltip "It specifies if the two clocks are related or not"
set display_name "Related Clocks"

set_param_bool "RELATED_CLOCKS" $DEFAULT_RELATED_CLOCKS $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
