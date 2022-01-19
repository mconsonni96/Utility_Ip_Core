# NUMBER_OF_SAMPLE is the number of samples collected

# ------------------ DATA_WIDTH -------------------
set LIST_NUMBER_OF_SAMPLE {}
for {set i 0} {$i < 9} {incr i} {
	lappend LIST_NUMBER_OF_SAMPLE "[expr 2**$i]"
}
set DEFAULT_NUMBER_OF_SAMPLE [lindex $LIST_DIVIDER 5]

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of samples collected for the filter"
set display_name "Number of Samples"

set_param_long_list "NUMBER_OF_SAMPLE" $LIST_NUMBER_OF_SAMPLE $DEFAULT_NUMBER_OF_SAMPLE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
