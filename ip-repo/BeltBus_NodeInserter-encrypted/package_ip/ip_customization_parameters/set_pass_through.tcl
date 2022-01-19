# Not implemented in the BeltBus
# PASS_THROUGH	:	STRING		:=	"Belt-Bus";


# ----------------- PASS_THROUGH -----------------
set LIST_DEFAULT {"Belt-Bus" "Timestamp" "Both"}
set DEFAULT_PASS_THROUGH "Belt-Bus"

set enablement {True}
set editable {}

set dependency {}

set tooltip "If Belt-Bus the NodeInserter is Implemented, with Timestamp not there is a simple parallel output"
set display_name "Pass Through"

set_param_string_list "PASS_THROUGH" $LIST_DEFAULT $DEFAULT_PASS_THROUGH $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
