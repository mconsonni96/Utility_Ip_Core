# Control in pipeline if the input is all at "0" (Empty) or at "1" (Full)
# EDGE_CHECK		:	BOOLEAN	:= TRUE;

# ----------------- EDGE_CHECK -----------------
set DEFAULT_EDGE_CHECK "FALSE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Choose if the sub-modules of Iper Decoder that do the edge chack removing the valid if no edge is over the TDLs"
set display_name "Edge Check"

set_param_bool "EDGE_CHECK" $DEFAULT_EDGE_CHECK $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
