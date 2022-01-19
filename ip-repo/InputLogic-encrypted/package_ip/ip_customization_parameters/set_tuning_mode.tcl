# Choice between generic and port, if TRUE we choose the signal coming from the port, if FALSE we choose the value of the generic
# TUNING_MODE			:	BOOLEAN		:= TRUE;

# ------------- INTERNAL_OVERFLOW_CNT ----------
set DEFAULT_TUNING_MODE "FALSE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Choice between generic and port, if TRUE we choose the signal coming from the port, if FALSE we choose the value of the generic "
set display_name "Tuning Mode"

set_param_bool "TUNING_MODE" $DEFAULT_TUNING_MODE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
