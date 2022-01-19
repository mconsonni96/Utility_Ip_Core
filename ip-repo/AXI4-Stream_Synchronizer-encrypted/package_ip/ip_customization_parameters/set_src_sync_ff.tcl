# Specifies the number of  synchronization stages on the CDC path of the source (slave)
# SRC_SYNC_FF		:	INTEGER	RANGE	2	TO	10		:=	4;

# ------------- CDC_SYNC_STAGES -----------
set MIN_SRC_SYNC_FF 2
set MAX_SRC_SYNC_FF 8
set DEFAULT_SRC_SYNC_FF 4

set enablement {True}
set editable {[expr {$MODE_SEL} == "{CDC}"]}

set dependency {}

set tooltip "Number of synchronization stages in the CDC path of the source(slave)"
set display_name "Source Synchronization FF"

set_param_long_range "SRC_SYNC_FF" $MIN_SRC_SYNC_FF $MAX_SRC_SYNC_FF $DEFAULT_SRC_SYNC_FF $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
