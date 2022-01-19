
# IBUF is the Single-Ended and IBUFDS is the Fully-Differential ones available inot Xilinx FPGA
# INPUT_BUFFER_TYPE	:	STRING	:=	"IBUF";

# -------------- INPUT_BUFFER_TYPE --------------
set LIST_INPUT_BUFFER_TYPE {IBUF IBUFDS}
set DEFAULT_INPUT_BUFFER_TYPE "IBUFDS"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Choose between Single-Ended (IBUF) and Fully-Differential (IBUFDS) input buffer"
set display_name "Input Buffer Type"

set_param_string_list "INPUT_BUFFER_TYPE" $LIST_INPUT_BUFFER_TYPE $DEFAULT_INPUT_BUFFER_TYPE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
