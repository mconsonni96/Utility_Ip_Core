#Specifies the number of the synchronization channel

# ------------- CDC_SYNC_STAGES -----------
set MIN_CH_SYNC 0
set MAX_CH_SYNC [expr 2**[get_property value [ipx::get_user_parameters BIT_NUM_CH -of_objects [ipx::current_core]]] -1]
set DEFAULT_CH_SYNC 0

set enablement {True}
set editable {}

set dependency {}

set tooltip "Channel over compute the Period"
set display_name "Number of Channel Period"

set_param_long_range "NUN_CH_PERIOD" $MIN_CH_SYNC $MAX_CH_SYNC $DEFAULT_CH_SYNC $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
