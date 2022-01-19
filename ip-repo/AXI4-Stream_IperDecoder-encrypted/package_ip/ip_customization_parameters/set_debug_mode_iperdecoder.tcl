# Debug port for sub interpolation in Decoder
# DEBUG_MODE	:	BOOLEAN	:=	FALSE;

# ------------------------ DEBUG_MODE ----------------------------
set DEFAULT_DEBUG_MODE "FALSE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Debug port at clock TDC for the Iper Decoder"
set display_name "Debug Port Iper Decoder"

set_param_bool "DEBUG_MODE" $DEFAULT_DEBUG_MODE $enablement $editable $dependency $tooltip $display_name
# ------------------------------------------------------------------------
