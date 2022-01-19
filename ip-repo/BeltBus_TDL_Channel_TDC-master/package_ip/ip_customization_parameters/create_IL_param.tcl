# Bit Length of Divider, 0 NOT instantiated, 1 TO 4 for having small FSM and clk domain
# BIT_DIVIDER		:	NATURAL	RANGE	0	TO	4	:=	2

# --------------- BIT_DIVIDER ----------------
set MIN_BIT_DIVIDER 0
set MAX_BIT_DIVIDER 4
set DEFAULT_BIT_DIVIDER $MAX_BIT_DIVIDER

set enablement {True}
set editable {}

set dependency {}

set tooltip "Bit length of the Divider"
set display_name "Bit Divider"

create_param_long_range "BIT_DIVIDER" $MIN_BIT_DIVIDER $MAX_BIT_DIVIDER $DEFAULT_BIT_DIVIDER $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------

# Bit Length of StretchLength, 0 NOT instantiated, No Range because is synchronous to clk domain
# BIT_STRETCH_LENGTH	:	NATURAL		:=	4;

# --------------- BIT_STRETCH_LENGTH ----------------
set MIN_BIT_STRETCH_LENGTH 0
set MAX_BIT_STRETCH_LENGTH 4
set DEFAULT_BIT_STRETCH_LENGTH $MAX_BIT_STRETCH_LENGTH

set enablement {True}
set editable {}

set dependency {}

set tooltip "Bit length of StretchLength"
set display_name "Bit Stretch Length"

create_param_long_range "BIT_STRETCH_LENGTH" $MIN_BIT_STRETCH_LENGTH $MAX_BIT_STRETCH_LENGTH $DEFAULT_BIT_STRETCH_LENGTH $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------

# Initialization of Divider
# DIVIDER_INIT	:	NATURAL						:=	3;

# --------------- DIVIDER_INIT ----------------
set MIN_DIVIDER_INIT 0
set MAX_DIVIDER_INIT [expr 2**[get_property value [ipx::get_user_parameters BIT_DIVIDER -of_objects [ipx::current_core]]] -1]
set DEFAULT_DIVIDER_INIT $MIN_DIVIDER_INIT

set enablement {True}
set editable {$BIT_DIVIDER > 0}

set dependency {}

set tooltip "Divider Initialization"
set display_name "Divider Initialization"

create_param_long_range "DIVIDER_INIT" $MIN_DIVIDER_INIT $MAX_DIVIDER_INIT $DEFAULT_DIVIDER_INIT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------

# Initialization of the Edge Trigger of the stretcher, *RISE* if we sample on the rising edge of the input or *FALL* if we sample on the falling edge of the input
# EDGE_TRIGGER_INIT		:	STRING		:=	"RISE";

# ------------EDGE_TRIGGER_INIT---------------
set LIST_EDGE_TRIGGER_INIT {RISE FALL}
set DEFAULT_EDGE_TRIGGER_INIT "RISE"

set enablement {True}
set editable {}

set dependency {}


set tooltip "Choose the edge trigger of AsyncEventIn"
set display_name "Edge Trigger Initialization"

create_param_string_list "EDGE_TRIGGER_INIT" $LIST_EDGE_TRIGGER_INIT $DEFAULT_EDGE_TRIGGER_INIT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


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

create_param_string_list "INPUT_BUFFER_TYPE" $LIST_INPUT_BUFFER_TYPE $DEFAULT_INPUT_BUFFER_TYPE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------

# Initialization of StretchLength
# STRETCH_LENGTH_INIT	:	NATURAL		:=	4;


# --------------- STRETCH_LENGTH_INIT ----------------
set MIN_STRETCH_LENGTH_INIT 0
set MAX_STRETCH_LENGTH_INIT [expr 2**[get_property value [ipx::get_user_parameters BIT_STRETCH_LENGTH -of_objects [ipx::current_core]]] -1]
set DEFAULT_STRETCH_LENGTH_INIT $MAX_STRETCH_LENGTH_INIT

set enablement {True}
set editable {$BIT_STRETCH_LENGTH > 0}

set dependency {}

set tooltip "Duration of the stretched pulse, multiple of clock pulses"
set display_name "Stretch Length Initialization"

create_param_long_range "STRETCH_LENGTH_INIT" $MIN_STRETCH_LENGTH_INIT $MAX_STRETCH_LENGTH_INIT $DEFAULT_STRETCH_LENGTH_INIT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# Choice between generic and port, if TRUE we choose the signal coming from the port, if FALSE we choose the value of the generic
# TUNING_MODE			:	BOOLEAN		:= TRUE;

# ------------- INTERNAL_OVERFLOW_CNT ----------
set DEFAULT_TUNING_MODE "TRUE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Choice between generic and port, if TRUE we choose the signal coming from the port, if FALSE we choose the value of the generic "
set display_name "Tuning Mode"

create_param_bool "TUNING_MODE" $DEFAULT_TUNING_MODE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------




# Select internal Ring Oscillator "INTERNAL", "EXTERNAL", "NOT REQUIRED"
# CALIB_EVENT		:	STRING		:=	"EXTERNAL";

# ------------EDGE_TRIGGER_INIT---------------
set LIST_CALIB_EVENT {"INTERNAL" "EXTERNAL" "NOT REQUIRED"}
set DEFAULT_CALIB_EVENT "INTERNAL"

set enablement {True}
set editable {}

set dependency {}


set tooltip "Choose how to generate CalibEvent"
set display_name "Calibartion Event"

create_param_string_list "CALIB_EVENT" $LIST_CALIB_EVENT $DEFAULT_CALIB_EVENT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------




# -------INPUT_DIFF_CH_TDC_BOARD_INTERFACE-------
create_param_string_boardfile "INPUT_DIFF_CH_TDC_BOARD_INTERFACE"
# ----------------------------------------------
