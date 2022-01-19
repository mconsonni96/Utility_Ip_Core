# 
# MEMORY_PRIMITIVE	: STRING	:= "auto"
# ------------- INTEGRATION_METHOD --------------
set LIST_MEMORY_PRIMITIVE {"auto"}
set DEFAULT_MEMORY_PRIMITIVE "auto"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Memory primitive to be used to istantiate SDPRAM"
set display_name "Memory Primitive"

set_param_string_list "MEMORY_PRIMITIVE" $LIST_MEMORY_PRIMITIVE $DEFAULT_MEMORY_PRIMITIVE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
