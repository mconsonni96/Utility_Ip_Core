# Number of outputs at the end of the Tree of the *CoarseTreeDistributor*
# NUMBER_OF_OUTPUT	:	POSITIVE	RANGE 2 TO 16 	:= 2;

# --------------- NUMBER_OF_OUTPUT ----------------
set MIN_NUMBER_OF_OUTPUT 2
set MAX_NUMBER_OF_OUTPUT 16
set DEFAULT_NUMBER_OF_OUTPUT $MIN_NUMBER_OF_OUTPUT

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of Output"
set display_name "Number of Output"

set_param_long_range "NUMBER_OF_OUTPUT" $MIN_NUMBER_OF_OUTPUT $MAX_NUMBER_OF_OUTPUT $DEFAULT_NUMBER_OF_OUTPUT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
