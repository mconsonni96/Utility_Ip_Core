# Bit of the Tapped Delay-Line (number of buffers in the TDL)
# NUM_TAP_TDL		:	POSITIVE	RANGE 4 TO 4096	:= 32;

# ---------------- NUM_TAP_TDL -----------------
set MIN_NUM_TAP_TDL 4
set MAX_NUM_TAP_TDL 4096
set DEFAULT_NUM_TAP_TDL 256

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of Taps in each TDL"
set display_name "Number of Taps"

create_param_long_range "NUM_TAP_TDL" $MIN_NUM_TAP_TDL $MAX_NUM_TAP_TDL $DEFAULT_NUM_TAP_TDL $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# Number of TDL in parallel
# NUMBER_OF_TDL	:	POSITIVE	RANGE 1 TO 16 	:= 5;

# ---------------- NUMBER_OF_TDL -----------------
set MIN_NUMBER_OF_TDL 1
set MAX_NUMBER_OF_TDL 16
set DEFAULT_NUMBER_OF_TDL $MIN_NUMBER_OF_TDL

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of TDL sub-Interpolated in each TDC channel"
set display_name "Number of TDL"

create_param_long_range "NUMBER_OF_TDL" $MIN_NUMBER_OF_TDL $MAX_NUMBER_OF_TDL $DEFAULT_NUMBER_OF_TDL $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------



# Bit Sampled from the TDL each NUM_TAP_TDL/BIT_SMP_TDL after OFFSET_TAP_TDL, obviously equal in each TDLs.  Basically it is the number of Flip Flops
# BIT_SMP_TDL			:	POSITIVE	RANGE 1 TO 4096	:= 5

# ---------------- BIT_SMP_TDL -----------------
set MIN_BIT_SMP_TDL 1
# set MAX_BIT_SMP_TDL 4096
#set DEFAULT_BIT_SMP_TDL 256

set MAX_BIT_SMP_TDL [get_property value [ipx::get_user_parameters NUM_TAP_TDL -of_objects [ipx::current_core]]]
set DEFAULT_BIT_SMP_TDL $MAX_BIT_SMP_TDL

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of taps sampled on the TDL"
set display_name "Taps Sampled of the TDL"

create_param_long_range "BIT_SMP_TDL" $MIN_BIT_SMP_TDL $MAX_BIT_SMP_TDL $DEFAULT_BIT_SMP_TDL $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------

# Buffering stage for the valid synch, it allows us to allign the data and the corresponding valid to the same clock pulse
# BUFFERING_STAGE	:	BOOLEAN	:= TRUE;

# ------------- BUFFERING_STAGE ----------
set DEFAULT_BUFFERING_STAGE "FALSE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Insertion of a further buffering stage between TDL and decoder for bufferazing the generation of the valid"
set display_name "Buffering Stage inside TDL"

create_param_bool "BUFFERING_STAGE" $DEFAULT_BUFFERING_STAGE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# True Active the AXI port for moving the Valid Position (Sampled Tap used) and valid Number (TDL used). It allows us to choose the valid, in case of more TDL in parallel.
# DEBUG_MODE		:	BOOLEAN	:=	TRUE;

# ------------- DEBUG_MODE -------------
set DEFAULT_DEBUG_MODE "FALSE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Allow to tune in real-time the valid position for its generation"
set display_name "Debug Port V-TDL"

create_param_bool "DEBUG_MODE" $DEFAULT_DEBUG_MODE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------

# Simulation or Implementation
# SIM_VS_IMP	:	STRING(1 To 3)	:= "IMP";

# --------------SIM_VS_IMP---------------
set LIST_SIM_VS_IMP {SIM IMP}
set DEFAULT_SIM_VS_IMP "IMP"

set enablement {True}
set editable {}

set dependency {}


set tooltip "Use TDL for simulation or primitive for implementation"
set display_name "Simulation vs Implementation"

create_param_string_list "SIM_VS_IMP" $LIST_SIM_VS_IMP $DEFAULT_SIM_VS_IMP $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------



# ------ Simulation Delay ----
# FILE_PATH_NAME_CO_DELAY		:	STRING	:=													-- Delay for CO in Simulation
# "C:\Users\nicol\Desktop\MAGISTRALE\Tesi\tappeddelayline_nlusardi\TappedDelayLine.srcs\sim_1\new\CO_O_Delay.txt";
# --"/home/nicola/Documents/Vivado/Projects/Time-to-Digital_Converter/TappedDelayLine/TappedDelayLine.srcs/sim_1/new/CO_O_Delay.txt";

# FILE_PATH_NAME_O_DELAY		:	STRING	:=													-- Delay for O in Simulation
# "C:\Users\nicol\Desktop\MAGISTRALE\Tesi\tappeddelayline_nlusardi\TappedDelayLine.srcs\sim_1\new\CO_O_Delay.txt";
# --"/home/nicola/Documents/Vivado/Projects/Time-to-Digital_Converter/TappedDelayLine/TappedDelayLine.srcs/sim_1/new/CO_O_Delay.txt";
# ----------------------------


# ----------- FILE_PATH_NAME_CO_DELAY ----------
set DEFAULT_FILE_PATH_NAME_CO_DELAY "/home/nicola/Documents/Vivado/Projects/Time-to-Digital_Converter/TappedDelayLine/TappedDelayLine.srcs/sim_1/new/CO_O_Delay.txt"

set enablement {False}
set editable {expr {$SIM_VS_IMP} == "{SIM}"}

set dependency {}

set tooltip "CO Delay Path Used for simulated TDL"
set display_name "CO Delay Path"

create_param_string_text "FILE_PATH_NAME_CO_DELAY" $DEFAULT_FILE_PATH_NAME_CO_DELAY $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------



# ----------- FILE_PATH_NAME_O_DELAY ----------
set DEFAULT_FILE_PATH_NAME_O_DELAY "/home/nicola/Documents/Vivado/Projects/Time-to-Digital_Converter/TappedDelayLine/TappedDelayLine.srcs/sim_1/new/CO_O_Delay.txt"

set enablement {False}
set editable {expr {$SIM_VS_IMP} == "{SIM}"}

set dependency {}

set tooltip "O Delay Path Used for simulated TDL"
set display_name "O Delay Path"

create_param_string_text "FILE_PATH_NAME_O_DELAY" $DEFAULT_FILE_PATH_NAME_O_DELAY $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# Maximal position inside SampledTaps used by ValidPositionTap to extract the valid (MAX = HIGH that is LEFT attribute downto vect)
# MAX_VALID_TAP_POS	:	NATURAL		:=	3;

# ---------------- MAX_VALID_TAP_POS -----------------
set MIN_MAX_VALID_TAP_POS 0
set MAX_MAX_VALID_TAP_POS [expr [get_property value [ipx::get_user_parameters BIT_SMP_TDL -of_objects [ipx::current_core]]] -1]
set DEFAULT_MAX_VALID_TAP_POS $MAX_MAX_VALID_TAP_POS

set enablement {False}
set editable {$DEBUG_MODE == {true}}

set dependency {}

set tooltip "Select the maximum position of the bit of sampled taps of TDL to insert in the MUX using in DEBUG for valid generation"
set display_name "Maximum Valid Position"

create_param_long_range "MAX_VALID_TAP_POS" $MIN_MAX_VALID_TAP_POS $MAX_MAX_VALID_TAP_POS $DEFAULT_MAX_VALID_TAP_POS $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# Minimal position inside SampledTaps used by ValidPositionTap to extract the valid (MIN = LOW that is RIGTH attribute in downto vect)
# MIN_VALID_TAP_POS	:	NATURAL		:=	1;

# ---------------- MIN_VALID_TAP_POS -----------------
set MIN_MIN_VALID_TAP_POS [expr 0 - [get_property value [ipx::get_user_parameters BIT_SMP_PRE_TDL -of_objects [ipx::current_core]]]]
#set MAX_MIN_VALID_TAP_POS 4096
set MAX_MIN_VALID_TAP_POS [expr [get_property value [ipx::get_user_parameters MAX_VALID_TAP_POS -of_objects [ipx::current_core]]] -1]
#set DEFAULT_MIN_VALID_TAP_POS 0
set DEFAULT_MIN_VALID_TAP_POS 0

set enablement {False}
set editable {$DEBUG_MODE == {true}}

set dependency {}

set tooltip "Select the minimum position of the bit of sampled taps of TDL to insert in the MUX using in DEBUG for valid generation"
set display_name "Minimum Valid Position"

create_param_long_range "MIN_VALID_TAP_POS" $MIN_MIN_VALID_TAP_POS $MAX_MIN_VALID_TAP_POS $DEFAULT_MIN_VALID_TAP_POS $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------






# The TDL #i is sampled with an initial offset of bit respect to the Tap step of NUM_TAP_TDL/BIT_SMP_TDL, one different for TDL for more flexibility
# OFFSET_TAP_TDL_i	:	NATURAL		RANGE 0 TO 2047	:=	7;


# ---_OFFSET_TAP_TDL_i -----
for {set i 0} {$i < 16} {incr i} {

	set offset_tap_i "OFFSET_TAP_TDL_"
	append offset_tap_i $i

	#set_property value_validation_type range_long [ipx::get_user_parameters $offset_tap_i -of_objects [ipx::current_core]]
	#set_property value_validation_range_minimum 0 [ipx::get_user_parameters $offset_tap_i -of_objects [ipx::current_core]]
	#set_property value_validation_range_maximum 2047 [ipx::get_user_parameters $offset_tap_i -of_objects [ipx::current_core]]

	#set_property tooltip {Offset Taps of TDL [puts $i] Sampled} [ipgui::get_guiparamspec -name $offset_tap_i -component [ipx::current_core] ]



	set MIN_OFFSET_TAP_TDL 0
	# set MAX_OFFSET_TAP_TDL 4095
	set MAX_OFFSET_TAP_TDL [expr [get_property value [ipx::get_user_parameters NUM_TAP_TDL -of_objects [ipx::current_core]]] / [get_property value [ipx::get_user_parameters BIT_SMP_TDL -of_objects [ipx::current_core]]] -1]
	set DEFAULT_OFFSET_TAP_TDL 0

	if {$i < 1} {
		set enablement {True}
	} else {
		set enablement {False}
	}

	set editable "$"
	append editable "NUMBER_OF_TDL > "
	append editable $i
	append editable "&&"
	append editable "$"
	append editable "BIT_SMP_TDL < "
	append editable "$"
	append editable "NUM_TAP_TDL"

	set dependency {}

	set tooltip "Offset Between consecutive Sampled Taps over the TDL $i"
	set display_name "Offset Sampled Taps TDL $i"

	create_param_long_range $offset_tap_i $MIN_OFFSET_TAP_TDL $MAX_OFFSET_TAP_TDL $DEFAULT_OFFSET_TAP_TDL $enablement $editable $dependency $tooltip $display_name

}
# ---------------------------------------------


# Step used between MAX_VALID_TAP_POS and MIM_VALID_POS for assigned ValidPositionTap
# STEP_VALID_TAP_POS	:	POSITIVE	:=	1;

# ---------------- STEP_VALID_TAP_POS -----------------
set MIN_STEP_VALID_TAP_POS 1
set MAX_STEP_VALID_TAP_POS [expr [get_property value [ipx::get_user_parameters BIT_SMP_TDL -of_objects [ipx::current_core]]] + [get_property value [ipx::get_user_parameters BIT_SMP_PRE_TDL -of_objects [ipx::current_core]]] -1]
set DEFAULT_STEP_VALID_TAP_POS 1

set enablement {False}
set editable {$DEBUG_MODE == true}

set dependency {}

set tooltip "Select the step between consecuteve position of the bit of sampled taps of TDL to insert in the MUX using in DEBUGle for valid generation"
set display_name "Step of Valid Position"

create_param_long_range "STEP_VALID_TAP_POS" $MIN_STEP_VALID_TAP_POS $MAX_STEP_VALID_TAP_POS $DEFAULT_STEP_VALID_TAP_POS $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# CO vs O Sampling TDL #i
# TYPE_TDL_i		:	STRING	:= "C";

# ---------------- TYPE_TDL_0_i --------------------

for {set i 0} {$i < 16} {incr i} {

	set type_tdl_i "TYPE_TDL_"
	append type_tdl_i $i


	set LIST_TYPE_TDL {C O}
	set DEFAULT_TYPE_TDL "C"

	if {$i < 1} {
		set enablement {True}
	} else {
		set enablement {False}
	}

	set editable "$"
	append editable "NUMBER_OF_TDL > "
	append editable $i
	set dependency {}

	set tooltip "CO vs O Sampling TDL $i"
	set display_name "Type TDL $i"

	create_param_string_list $type_tdl_i $LIST_TYPE_TDL $DEFAULT_TYPE_TDL $enablement $editable $dependency $tooltip $display_name

}
# ---------------------------------------------



# Bit of the Tapped Delay-Line (number of buffers in the TDL)
# NUM_TAP_PRE_TDL		:	POSITIVE	RANGE 4 TO 4096	:= 32;

# ---------------- NUM_TAP_PRE_TDL -----------------
set MIN_NUM_TAP_PRE_TDL 0
set MAX_NUM_TAP_PRE_TDL 256
set DEFAULT_NUM_TAP_PRE_TDL 0

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of Taps in each TDL"
set display_name "Number of Taps"

create_param_long_range "NUM_TAP_PRE_TDL" $MIN_NUM_TAP_PRE_TDL $MAX_NUM_TAP_PRE_TDL $DEFAULT_NUM_TAP_PRE_TDL $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------



# Bit Sampled from the TDL each NUM_TAP_TDL/BIT_SMP_PRE_TDL after OFFSET_TAP_TDL, obviously equal in each TDLs.  Basically it is the number of Flip Flops
# BIT_SMP_PRE_TDL			:	POSITIVE	RANGE 1 TO 4096	:= 5

# ---------------- BIT_SMP_PRE_TDL -----------------
set MIN_BIT_SMP_PRE_TDL 0
# set MAX_BIT_SMP_PRE_TDL 4096
#set DEFAULT_BIT_SMP_PRE_TDL 256

set MAX_BIT_SMP_PRE_TDL [get_property value [ipx::get_user_parameters NUM_TAP_PRE_TDL -of_objects [ipx::current_core]]]
set DEFAULT_BIT_SMP_PRE_TDL $MAX_BIT_SMP_PRE_TDL

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of taps sampled on the PRE-TDL"
set display_name "Taps Sampled of the PRE-TDL"

create_param_long_range "BIT_SMP_PRE_TDL" $MIN_BIT_SMP_PRE_TDL $MAX_BIT_SMP_PRE_TDL $DEFAULT_BIT_SMP_PRE_TDL $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------



# Initial number of TDL from which we want to extract the valid
# VALID_NUMBER_OF_TDL_INIT	:	INTEGER	RANGE 0 TO 15		:=	1;


# ---------------- VALID_NUMBER_OF_TDL_INIT -----------------
set MIN_VALID_NUMBER_OF_TDL_INIT 0
set MAX_VALID_NUMBER_OF_TDL_INIT [expr [get_property value [ipx::get_user_parameters NUMBER_OF_TDL -of_objects [ipx::current_core]]] -1]
set DEFAULT_VALID_NUMBER_OF_TDL_INIT 0

set enablement {True}
set editable {}

set dependency {}

set tooltip "Select the TDL for the valid position (if TDL Debug FALSE) or initalize the TDL to choose the valid position (if TDL Debug TRUE)"
set display_name "Valid Position TDL Initialization"

create_param_long_range "VALID_NUMBER_OF_TDL_INIT" $MIN_VALID_NUMBER_OF_TDL_INIT $MAX_VALID_NUMBER_OF_TDL_INIT $DEFAULT_VALID_NUMBER_OF_TDL_INIT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------



# Initial position along the TDL from which we want to extract the valid in case of DEBUG_MODE= FALSE
# VALID_POSITION_TAP_INIT		:	INTEGER	RANGE 0 TO 4095		:=	3;


# ---------------- VALID_POSITION_TAP_INIT -----------------
set MIN_VALID_POSITION_TAP_INIT 0
set MAX_VALID_POSITION_TAP_INIT [expr [get_property value [ipx::get_user_parameters BIT_SMP_TDL -of_objects [ipx::current_core]]] + [get_property value [ipx::get_user_parameters BIT_SMP_PRE_TDL -of_objects [ipx::current_core]]] -1]



if {$MAX_VALID_POSITION_TAP_INIT > 31} {
	set DEFAULT_VALID_POSITION_TAP_INIT 31

} else {
	set DEFAULT_VALID_POSITION_TAP_INIT 0

}

set enablement {True}
set editable {}

set dependency {}

set tooltip "Select the tap position for the valid (if TDL Debug FALSE) or initalize the position (if TDL Debug TRUE)"
set display_name "Valid Position Tap Initialization"

create_param_long_range "VALID_POSITION_TAP_INIT" $MIN_VALID_POSITION_TAP_INIT $MAX_VALID_POSITION_TAP_INIT $DEFAULT_VALID_POSITION_TAP_INIT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
