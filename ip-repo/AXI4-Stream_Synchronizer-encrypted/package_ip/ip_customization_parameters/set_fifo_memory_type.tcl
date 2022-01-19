# Type of the FIFO memory, it can be: block, auto or distributed
# FIFO_MEMORY_TYPE	:	STRING							:=	"distributed";

# --------------CEC_VS_CTD_COUNTER---------------
set LIST_FIFO_MEMORY_TYPE {auto block distributed}
set DEFAULT_FIFO_MEMORY_TYPE "distributed"

set enablement {False}
set editable {[expr {$MODE_SEL} == "{FIFO}"]}

set dependency {}


set tooltip "Choice between the different types of FIFO memory, it can be: auto, block or distributed"
set display_name "FIFO Memory Type"

set_param_string_list "FIFO_MEMORY_TYPE" $LIST_FIFO_MEMORY_TYPE $DEFAULT_FIFO_MEMORY_TYPE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
