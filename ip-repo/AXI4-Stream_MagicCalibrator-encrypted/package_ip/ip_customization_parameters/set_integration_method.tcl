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

set_param_string_list "INTEGRATION_METHOD" $LIST_INTEGRATION_METHOD $DEFAULT_INTEGRATION_METHOD $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
