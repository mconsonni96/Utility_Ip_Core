# Specifies the number of  synchronization stages on the CDC path of the destination (master)
# DEST_SYNC_FF		:	INTEGER	RANGE	2	TO	10		:=	4;

# ------------- CDC_SYNC_STAGES -----------
set MIN_DEST_SYNC_FF 2
set MAX_DEST_SYNC_FF 8
set DEFAULT_DEST_SYNC_FF 4

set enablement {True}
set editable {[expr {$MODE_SEL} == "{CDC}"]}

set dependency {}

set tooltip "Number of synchronization stages in the CDC path of the destination (master)"
set display_name "Destination Synchronization FF"

set_param_long_range "DEST_SYNC_FF" $MIN_DEST_SYNC_FF $MAX_DEST_SYNC_FF $DEFAULT_DEST_SYNC_FF $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
