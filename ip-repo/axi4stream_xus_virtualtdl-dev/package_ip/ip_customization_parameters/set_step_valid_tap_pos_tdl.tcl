# Step used between MAX_VALID_TAP_POS and MIM_VALID_POS for assigned ValidPositionTap
# STEP_VALID_TAP_POS	:	POSITIVE	:=	1;

# ---------------- STEP_VALID_TAP_POS -----------------
set name "STEP_VALID_TAP_POS"

set MIN_STEP_VALID_TAP_POS 1
set MAX_STEP_VALID_TAP_POS [expr [get_property value [ipx::get_user_parameters BIT_SMP_TDL -of_objects [ipx::current_core]]] + [get_property value [ipx::get_user_parameters BIT_SMP_PRE_TDL -of_objects [ipx::current_core]]] -1]
set DEFAULT_STEP_VALID_TAP_POS 1

set enablement {False}
set editable {$DEBUG_MODE == true}

set dependency {}

set tooltip "Select the step between consecuteve position of the bit of sampled taps of TDL to insert in the MUX using in DEBUGle for valid generation"
set display_name "Step of Valid Position"

ipgui::add_param -name $name -component [ipx::current_core] -display_name $display_name -show_label {true} -show_range {true} -widget {}
set_param_long_range $name $MIN_STEP_VALID_TAP_POS $MAX_STEP_VALID_TAP_POS $DEFAULT_STEP_VALID_TAP_POS $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
