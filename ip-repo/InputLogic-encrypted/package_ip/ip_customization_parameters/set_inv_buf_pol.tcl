# Choice between generic and port, if TRUE we choose the signal coming from the port, if FALSE we choose the value of the generic
# INVERT_BUFFER_POLARITY	:	BOOLEAN	:=	FALSE;							--! Invert Buffer Polaraity, if you wrap an inverted buffer you can swap it;
# ------------- INTERNAL_OVERFLOW_CNT ----------
set DEFAULT_INVERT_BUFFER_POLARITY "FALSE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Select the buffer polarity if an hardware inversion is perfromed in PCB routing"
set display_name "Invert Buffer Polarity"

set_param_bool "INVERT_BUFFER_POLARITY" $DEFAULT_INVERT_BUFFER_POLARITY $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
