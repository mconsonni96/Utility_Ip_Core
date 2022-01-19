# Length of the axi4 ports to set the debug ports length
# AXI4_LENGTH : POSITIVE := 32

# ---------------- AXI4_LENGTH -----------------
set MIN_AXI4_LENGTH 32
set MAX_AXI4_LENGTH 32
set DEFAULT_AXI4_LENGTH 32

set enablement {True}
set editable {}

set dependency {}

set tooltip "Axi4 Length Counter dimension"
set display_name "Axi4 Length"

set_param_long_range "AXI4_LENGTH" $MIN_AXI4_LENGTH $MAX_AXI4_LENGTH $DEFAULT_AXI4_LENGTH $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
