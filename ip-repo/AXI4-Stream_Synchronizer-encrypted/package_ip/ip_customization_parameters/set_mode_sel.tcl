#String for mode selection, if "CDC" the module instatiates the CDC_Synchronizer, if "FIFO" the module instantiates the FIFO_Synchronizer
# MODE_SEL	:	STRING						:= "CDC";

# --------------MODE SELECTION FOR THE CHOOSING OF THE SYNCHRONIZER-------------
set LIST_MODE_SEL {CDC FIFO}
set DEFAULT_MODE_SEL "CDC"

set enablement {True}
set editable {}

set dependency {}


set tooltip "Choice between the CDC_Synchronizer and the FIFO_Synchronizer"
set display_name "Mode Selection"

set_param_string_list "MODE_SEL" $LIST_MODE_SEL $DEFAULT_MODE_SEL $enablement $editable $dependency $tooltip $display_name
# ------------------------------------------------------------------------------
