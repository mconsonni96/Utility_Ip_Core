#String for filter selection, if "GI" the module instatiates the gated_integrator, if "MA" the module instantiates the moving_average
# FILTER_SEL	:	STRING						:= "GI";

# --------------FILTER SELECTION FOR THE CHOOSING OF THE FILTER-------------
set LIST_FILTER_SEL {GI MA}
set DEFAULT_FILTER_SEL "MA"

set enablement {True}
set editable {}

set dependency {}


set tooltip "Choice between the gated_integrator filter and the moving_average filter"
set display_name "Filter Selection"

set_param_string_list "FILTER_SEL" $LIST_FILTER_SEL $DEFAULT_FILTER_SEL $enablement $editable $dependency $tooltip $display_name
# ------------------------------------------------------------------------------
