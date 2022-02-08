# Generic used for deciding whether to count the overflows in the CEC (if *INTERNAL_OVERFLOW_CNT* is TRUE) or leave the Overfow Counter the task of counting (if *INTERNAL_OVERFLOW_CNT* is FALSE)
# INTERNAL_OVERFLOW_CNT	:	BOOLEAN		:=	FALSE

# ------------- INTERNAL_OVERFLOW_CNT ----------
set DEFAULT_INTERNAL_OVERFLOW_CNT "FALSE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Enabling the CEC (if TRUE) or the OC (if FALSE) to count the overflows"
set display_name "Overflow Counter in CEC or in OC"

set_param_bool "INTERNAL_OVERFLOW_CNT" $DEFAULT_INTERNAL_OVERFLOW_CNT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
