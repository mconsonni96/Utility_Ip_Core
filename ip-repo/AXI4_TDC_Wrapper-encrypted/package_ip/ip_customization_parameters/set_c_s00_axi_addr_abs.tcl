
# Starting address of Debugger Module
# 		C_S00_AXI_ADDR_ABS		: unsigned(31 downto 0) := (others => '0');

# --------------- BIT_RESOLUTION ---------------
set DEFAULT_C_S00_AXI_ADDR_ABS 0x00000000
set LENGTH_C_S00_AXI_ADDR_ABS 32

set enablement {True}
set editable {}

set dependency {}

set tooltip "Starting address of Debugger Module"
set display_name "Address"

set_param_bitString "C_S00_AXI_ADDR_ABS" $DEFAULT_C_S00_AXI_ADDR_ABS $LENGTH_C_S00_AXI_ADDR_ABS $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
