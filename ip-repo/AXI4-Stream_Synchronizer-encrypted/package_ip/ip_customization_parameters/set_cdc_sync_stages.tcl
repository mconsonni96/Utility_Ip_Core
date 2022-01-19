# Specifies the number of  synchronization stages on the CDC path.
# CDC_SYNC_STAGES		:	INTEGER	RANGE	2	TO	8		:=	4;

# ------------- CDC_SYNC_STAGES -----------
set MIN_CDC_SYNC_STAGES 2
set MAX_CDC_SYNC_STAGES 8
set DEFAULT_CDC_SYNC_STAGES 2

set enablement {False}
set editable {[expr {$MODE_SEL} == "{FIFO}" && {$RELATED_CLOCKS} != "{true}"]}

set dependency {}

set tooltip "Number of synchronization stages in the CDC path"
set display_name "CDC Syncronization Stages"

set_param_long_range "CDC_SYNC_STAGES" $MIN_CDC_SYNC_STAGES $MAX_CDC_SYNC_STAGES $DEFAULT_CDC_SYNC_STAGES $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
