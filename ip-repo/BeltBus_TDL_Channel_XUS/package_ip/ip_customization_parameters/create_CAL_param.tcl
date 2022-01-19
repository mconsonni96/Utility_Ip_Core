#	Length of the axi4 ports to set the debug ports length
#	AXI4_LENGTH : POSITIVE := 32

# -------------- AXI4 LENGTH --------------
set LIST_AXI4_LENGTH {32}
#set MIN_AXI4_LENGTH 32
#set MAX_AXI4_LENGTH 32
set DEFAULT_AXI4_LENGTH 32

set enablement {True}
set editable {}

set dependency {}

set tooltip "Positive to specify the length of the data of AXI"
set display_name "AXI4 Length"

#set_param_long_range "AXI4_LENGTH" $MIN_AXI4_LENGTH $MAX_AXI4_LENGTH $DEFAULT_AXI4_LENGTH $enablement $editable $dependency $tooltip $display_name

create_param_long_list "AXI4_LENGTH" $LIST_AXI4_LENGTH $DEFAULT_AXI4_LENGTH $enablement $editable $dependency $tooltip $display_name

# Number of Sample (2^BIT_CALIBRATION) Used to Calibrate (BIT_CALIBRATION is the memory width)
# BIT_CALIBRATION	:	POSITIVE	RANGE	1	TO	32	:=	24;


# --------------- BIT_CALIBRATION ---------------
set MIN_BIT_CALIBRATION 1
set MAX_BIT_CALIBRATION 32
set DEFAULT_BIT_CALIBRATION 24

set enablement {True}
set editable {}

set dependency {}

set tooltip "Bit dimension of the calibration table"
set display_name "Bit Calibration"

create_param_long_range "BIT_CALIBRATION" $MIN_BIT_CALIBRATION $MAX_BIT_CALIBRATION $DEFAULT_BIT_CALIBRATION $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------



# Number of Bits of the Calibrated_TDL
# BIT_RESOLUTION	:	POSITIVE	RANGE	1	TO	32	:=	16

# --------------- BIT_RESOLUTION ---------------
set MIN_BIT_RESOLUTION 1
set MAX_BIT_RESOLUTION 32
set DEFAULT_BIT_RESOLUTION 16

set enablement {True}
set editable {}

set dependency {}

set tooltip "Bit used for the fine part of the timestamp"
set display_name "Bit Resolution"

create_param_long_range "BIT_RESOLUTION" $MIN_BIT_RESOLUTION $MAX_BIT_RESOLUTION $DEFAULT_BIT_RESOLUTION $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------



#	True Active the Debug of CharactCurve
#	DEBUG_MODE_CC		:	BOOLEAN	:=	FALSE;

# ----------------- DEBUG_MODE_CC -----------------
set DEFAULT_DEBUG_MODE_CC "FALSE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Allow to tune in real-time the calibration and read the Charact Curve"
set display_name "Debug Port CharactCurve"

create_param_bool "DEBUG_MODE_CC" $DEFAULT_DEBUG_MODE_CC $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------

#	True Active the Debug of CalibTable
#	DEBUG_MODE_CT		:	BOOLEAN	:=	FALSE;

# ----------------- DEBUG_MODE_CT -----------------
set DEFAULT_DEBUG_MODE_CT "FALSE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Allow to tune in real-time the calibration and read the CalibTable"
set display_name "Debug Port CalibTable"

create_param_bool "DEBUG_MODE_CT" $DEFAULT_DEBUG_MODE_CT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# "+"/"-" we perform the Positive/Negative integration of Calibration Table
# INTEGRATION_METHOD	:	STRING	:=	"-";

# ------------- INTEGRATION_METHOD --------------
set LIST_INTEGRATION_METHOD {"-" "+"}
set DEFAULT_INTEGRATION_METHOD "-"

set enablement {True}
set editable {}

set dependency {}

set tooltip "integration method used in magic Calibrator"
set display_name "Integration Method"

create_param_string_list "INTEGRATION_METHOD" $LIST_INTEGRATION_METHOD $DEFAULT_INTEGRATION_METHOD $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------




# Save one bit in CharactCurveSPRAM
# SAVE_BIT			:	BOOLEAN							:=	TRUE;

# ------------------ SAVE_BIT ------------------
set DEFAULT_SAVE_BIT "TRUE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Use 2^BIT_CALIBARTION (BIT_CALIBARTION +1 bits) if FALSE or 2^BIT_CALIBARTION -1 (BIT_CALIBARTION bits) if TRUE samples for performing the calibration"
set display_name "Save One Bit in Magic Calibrator"

create_param_bool "SAVE_BIT" $DEFAULT_SAVE_BIT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
