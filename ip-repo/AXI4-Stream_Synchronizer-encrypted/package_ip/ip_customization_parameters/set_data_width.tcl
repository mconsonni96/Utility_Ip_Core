# Dimesion of the data both on the slave and on the master ports
#DATA_WIDTH			:	POSITIVE						:=	16;

# ------------------ DATA_WIDTH -------------------
set MIN_DATA_WIDTH 1
set MAX_DATA_WIDTH 100
set DEFAULT_DATA_WIDTH 16

set enablement {True}
set editable {}

set dependency {}

set tooltip "Variable that sets the dimensions of the slave and master data"
set display_name "Input/Output Data Width"

set_param_long_range "DATA_WIDTH" $MIN_DATA_WIDTH $MAX_DATA_WIDTH $DEFAULT_DATA_WIDTH $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
