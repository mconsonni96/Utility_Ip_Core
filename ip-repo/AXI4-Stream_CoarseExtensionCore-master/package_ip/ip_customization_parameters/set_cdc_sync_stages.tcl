#Cross Domain Clock Synch Stages: specifies the number of synchronization stages on the CDC path. It must be < 5 if *FIFO_WRITE_DEPTH = 16*
#CDC_SYNC_STAGES		:	INTEGER	RANGE	2	TO	8		:=	4;

# --------------- CDC_SYNC_STAGES --------------
set MIN_CDC_SYNC_STAGES 2
set MAX_CDC_SYNC_STAGES 8
set DEFAULT_CDC_SYNC_STAGES 4

set enablement {True}
set editable {expr [expr {$RELATED_CLOCKS} != "{true}"]}


set dependency {}

set tooltip "Synchronization CDC stages in the FIFO"
set display_name "Synchronizer FIFO CDC Stages"

set_param_long_range "CDC_SYNC_STAGES" $MIN_CDC_SYNC_STAGES $MAX_CDC_SYNC_STAGES $DEFAULT_CDC_SYNC_STAGES $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
