# Specifies the Write depth of the FIFO
# FIFO_DEPTH	:	INTEGER	RANGE	16	TO	4194304	:=	16;

# ------------------FIFO_DEPTH ------------------
set LIST_FIFO_DEPTH "[expr 2**4]"
for {set i 5} {$i < 23} {incr i} {
	lappend LIST_FIFO_DEPTH "[expr 2**$i]"
}
set DEFAULT_FIFO_DEPTH [lindex $LIST_FIFO_DEPTH 0]

set enablement {False}
set editable {[expr {$MODE_SEL} == "{FIFO}"]}

set dependency {}

set tooltip "Depth of the FIFO"
set display_name "FIFO Depth"

set_param_long_list "FIFO_DEPTH" $LIST_FIFO_DEPTH $DEFAULT_FIFO_DEPTH $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
