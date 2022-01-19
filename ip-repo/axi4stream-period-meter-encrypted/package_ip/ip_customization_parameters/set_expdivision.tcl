# The period measured over NUN_CH_PERIOD in output is divided by DIVIDER

# ------------------ DIVIDER-------------------
set LIST_DIVIDER {}
for {set i 0} {$i < 9} {incr i} {
	lappend LIST_DIVIDER "[expr 2**$i]"
}
set DEFAULT_DIVIDER [lindex $LIST_DIVIDER 4]

set enablement {True}
set editable {}

set dependency {}

set tooltip "tThe avaraged value is divided by Divider"
set display_name "Divider"


set_param_long_list "DIVIDER" $LIST_DIVIDER $DEFAULT_DIVIDER $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
