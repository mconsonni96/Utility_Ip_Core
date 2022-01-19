#String for mode selection, if "CDC" the module instatiates the CDC_Synchronizer, if "FIFO" the module instantiates the FIFO_Synchronizer
# MODE_SEL	:	STRING						:= "CDC";

# --------------MODE SELECTION FOR THE CHOOSING OF THE SYNCHRONIZER-------------
set LIST_MODE_SEL {CDC FIFO}
set DEFAULT_MODE_SEL "FIFO"

set enablement {True}
set editable {}

set dependency {}


set tooltip "Choice between the CDC_Synchronizer and the FIFO_Synchronizer"
set display_name "Mode Selection"

create_param_string_list "MODE_SEL" $LIST_MODE_SEL $DEFAULT_MODE_SEL $enablement $editable $dependency $tooltip $display_name
# ------------------------------------------------------------------------------

# If SYNCH_RELATED_CLOCKS = True the two clocks are locked, otherwise they are not locked
# SYNCH_RELATED_CLOCKS		:		BOOLEAN							:= False ;

# ------------------ SYNCH_RELATED_CLOCKS ---------------------
set DEFAULT_SYNCH_RELATED_CLOCKS "FALSE"

set enablement {True}
set editable {[expr {$MODE_SEL} == "{FIFO}"]}

set dependency {}

set tooltip "It specifies if the two clocks are related or not"
set display_name "Related Clocks"

create_param_bool "SYNCH_RELATED_CLOCKS" $DEFAULT_SYNCH_RELATED_CLOCKS $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# Specifies the number of  synchronization stages on the CDC path.
# CDC_SYNC_STAGES		:	INTEGER	RANGE	2	TO	8		:=	4;

# ------------- SYNCH_CDC_SYNC_STAGES -----------
set MIN_SYNCH_CDC_SYNC_STAGES 2
set MAX_SYNCH_CDC_SYNC_STAGES 8
set DEFAULT_SYNCH_CDC_SYNC_STAGES 4

set enablement {True}
set editable {[expr {$MODE_SEL} == "{FIFO}" && {$RELATED_CLOCKS} != "{true}"]}

set dependency {}

set tooltip "Number of synchronization stages in the CDC path"
set display_name "CDC Syncronization Stages"

create_param_long_range "SYNCH_CDC_SYNC_STAGES" $MIN_SYNCH_CDC_SYNC_STAGES $MAX_SYNCH_CDC_SYNC_STAGES $DEFAULT_SYNCH_CDC_SYNC_STAGES $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# Dimesion of the data both on the slave and on the master ports
#DATA_WIDTH			:	POSITIVE						:=	16;

# ------------------ DATA_WIDTH -------------------
set MIN_DATA_WIDTH 1
set MAX_DATA_WIDTH 100
set DEFAULT_DATA_WIDTH 32

set enablement {True}
set editable {}

set dependency {}

set tooltip "Variable that sets the dimensions of the slave and master data"
set display_name "Input/Output Data Width"

create_param_long_range "DATA_WIDTH" $MIN_DATA_WIDTH $MAX_DATA_WIDTH $DEFAULT_DATA_WIDTH $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# Specifies the number of  synchronization stages on the CDC path of the destination (master)
# DEST_SYNC_FF		:	INTEGER	RANGE	2	TO	10		:=	4;

# ------------- CDC_SYNC_STAGES -----------
set MIN_DEST_SYNC_FF 2
set MAX_DEST_SYNC_FF 8
set DEFAULT_DEST_SYNC_FF 4

set enablement {False}
set editable {[expr {$MODE_SEL} == "{CDC}"]}

set dependency {}

set tooltip "Number of synchronization stages in the CDC path of the destination (master)"
set display_name "Destination Synchronization FF"

create_param_long_range "DEST_SYNC_FF" $MIN_DEST_SYNC_FF $MAX_DEST_SYNC_FF $DEFAULT_DEST_SYNC_FF $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# Type of the FIFO memory, it can be: block, auto or distributed
# SYNCH_FIFO_MEMORY_TYPE	:	STRING							:=	"distributed";

# --------------CEC_VS_CTD_COUNTER---------------
set LIST_SYNCH_FIFO_MEMORY_TYPE {auto block distributed}
set DEFAULT_SYNCH_FIFO_MEMORY_TYPE "distributed"

set enablement {True}
set editable {[expr {$MODE_SEL} == "{FIFO}"]}

set dependency {}


set tooltip "Choice between the different types of FIFO memory, it can be: auto, block or distributed"
set display_name "FIFO Memory Type"

create_param_string_list "SYNCH_FIFO_MEMORY_TYPE" $LIST_SYNCH_FIFO_MEMORY_TYPE $DEFAULT_SYNCH_FIFO_MEMORY_TYPE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# Specifies the Write depth of the FIFO
# FIFO_DEPTH	:	INTEGER	RANGE	16	TO	4194304	:=	16;

# ------------------FIFO_DEPTH ------------------
set LIST_FIFO_DEPTH "[expr 2**4]"
for {set i 5} {$i < 23} {incr i} {
	lappend LIST_FIFO_DEPTH "[expr 2**$i]"
}
set DEFAULT_FIFO_DEPTH [lindex $LIST_FIFO_DEPTH 0]

set enablement {True}
set editable {[expr {$MODE_SEL} == "{FIFO}"]}

set dependency {}

set tooltip "Depth of the FIFO"
set display_name "FIFO Depth"

create_param_long_list "FIFO_DEPTH" $LIST_FIFO_DEPTH $DEFAULT_FIFO_DEPTH $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------





# Specifies the number of  synchronization stages on the CDC path of the source (slave)
# SRC_SYNC_FF		:	INTEGER	RANGE	2	TO	10		:=	4;

# ------------- CDC_SYNC_STAGES -----------
set MIN_SRC_SYNC_FF 2
set MAX_SRC_SYNC_FF 8
set DEFAULT_SRC_SYNC_FF 4

set enablement {False}
set editable {[expr {$MODE_SEL} == "{CDC}"]}

set dependency {}

set tooltip "Number of synchronization stages in the CDC path of the source(slave)"
set display_name "Source Synchronization FF"

create_param_long_range "SRC_SYNC_FF" $MIN_SRC_SYNC_FF $MAX_SRC_SYNC_FF $DEFAULT_SRC_SYNC_FF $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
