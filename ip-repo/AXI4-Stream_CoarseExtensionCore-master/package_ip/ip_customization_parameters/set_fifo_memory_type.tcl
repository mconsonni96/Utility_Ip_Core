#Type of FIFO; "auto", "block", or "distributed";
#FIFO_MEMORY_TYPE	:	STRING							:=	"distributed";

# -------------- FIFO_MEMORY_TYPE ---------------
set LIST_FIFO_MEMORY_TYPE {auto block distributed}
set DEFAULT_FIFO_MEMORY_TYPE "distributed"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Synchronizer FIFO type"
set display_name "Synchronizer FIFO Type"

set_param_string_list "FIFO_MEMORY_TYPE" $LIST_FIFO_MEMORY_TYPE $DEFAULT_FIFO_MEMORY_TYPE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
