#FIFO Depth, Power of 2
#FIFO_WRITE_DEPTH	:	INTEGER	RANGE	16	TO	4194304	:=	16;

# -------------- FIFO_WRITE_DEPTH ---------------
set LIST_FIFO_WRITE_DEPTH "[expr 2**4]"
for {set i 5} {$i < 23} {incr i} {
	lappend LIST_FIFO_WRITE_DEPTH "[expr 2**$i]"
}

set DEFAULT_FIFO_WRITE_DEPTH [lindex $LIST_FIFO_WRITE_DEPTH 0]

set enablement {True}

set editable {}
set dependency {}

set tooltip "Synchronizer FIFO Depth"
set display_name "Synchronizer FIFO Depth"

set_param_long_list "FIFO_WRITE_DEPTH" $LIST_FIFO_WRITE_DEPTH $DEFAULT_FIFO_WRITE_DEPTH $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
