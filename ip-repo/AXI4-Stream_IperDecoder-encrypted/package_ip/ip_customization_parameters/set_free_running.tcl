# FREE_RUNNING	:	BOOLEAN	:= TRUE;
# Enable/Disable the Free Running mode

# ---------------- FREE_RUNNING ----------------
set DEFAULT_FREE_RUNNING "TRUE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Choose if the sub-modules of Iper Decoder that do the decoding work each pulse of clock or only during the valid"
set display_name "Free Running"

set_param_bool "FREE_RUNNING" $DEFAULT_FREE_RUNNING $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
