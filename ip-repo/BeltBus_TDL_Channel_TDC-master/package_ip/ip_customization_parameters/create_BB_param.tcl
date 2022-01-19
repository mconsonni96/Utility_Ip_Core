# Bit for Number of Channels
# BIT_NUM_CH		:	NATURAL	:=	4

# ---------------BIT_NUM_CH----------------
set MIN_BIT_NUM_CH 1
set MAX_BIT_NUM_CH 8
set DEFAULT_BIT_NUM_CH 4

set enablement {True}
set editable {}

set dependency {}

set tooltip "Number of bits used for the number of channel"
set display_name "Bit Number of Channel"

create_param_long_range "BIT_NUM_CH" $MIN_BIT_NUM_CH $MAX_BIT_NUM_CH $DEFAULT_BIT_NUM_CH $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------

# Da chiarire
# HOLD_ON_INTEGRAL		:	INTEGER	:=	5

# ---------------HOLD_ON_INTEGRAL----------------
set MIN_HOLD_ON_INTEGRAL 0
set MAX_HOLD_ON_INTEGRAL [expr 2**31-1]
set DEFAULT_HOLD_ON_INTEGRAL 5

set enablement {True}
set editable {[expr {$PASS_THROUGH} == "{Both}" || {$PASS_THROUGH} == "{Belt-Bus}"] }

set dependency {}

set tooltip "Hold-On integral"
set display_name "Hold-On Integral"

create_param_long_range "HOLD_ON_INTEGRAL" $MIN_HOLD_ON_INTEGRAL $MAX_HOLD_ON_INTEGRAL $DEFAULT_HOLD_ON_INTEGRAL $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# Da chiarire?
# HOLD_ON_MIN_MOD		:	INTEGER	:=	1

# ---------------HOLD_ON_MIN_MOD----------------
set MIN_HOLD_ON_MIN_MOD 0
set MAX_HOLD_ON_MIN_MOD [expr 2**31-1]
set DEFAULT_HOLD_ON_MIN_MOD 1

set enablement {True}
set editable {[expr {$PASS_THROUGH} == "{Both}" || {$PASS_THROUGH} == "{Belt-Bus}"] }

set dependency {}

set tooltip "Hold-On min mod"
set display_name "Hold-On Min Mod"

create_param_long_range "HOLD_ON_MIN_MOD" $MIN_HOLD_ON_MIN_MOD $MAX_HOLD_ON_MIN_MOD $DEFAULT_HOLD_ON_MIN_MOD $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# Number of clock cycles after the RETAIN necessary to force the injection of a measure in a single node
# HOLD_ON_SINGLE_NODE		:	INTEGER	:=	1

# ---------------HOLD_ON_SINGLE_NODE----------------
set MIN_HOLD_ON_SINGLE_NODE 0
set MAX_HOLD_ON_SINGLE_NODE [expr 2**31-1]
set DEFAULT_HOLD_ON_SINGLE_NODE 1

set enablement {True}
set editable {[expr {$PASS_THROUGH} == "{Both}" || {$PASS_THROUGH} == "{Belt-Bus}"] }

set dependency {}

set tooltip "Hold-On Single Node"
set display_name "Number of clock cycles in Hold-on phase"

create_param_long_range "HOLD_ON_SINGLE_NODE" $MIN_HOLD_ON_SINGLE_NODE $MAX_HOLD_ON_SINGLE_NODE $DEFAULT_HOLD_ON_SINGLE_NODE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# Number of clock cycles after the HOLDON necessary to eliminate a measure
# INJECT_CYCLES		:	INTEGER	:=	15

# ---------------INJECT_CYCLES----------------
set MIN_INJECT_CYCLES 0
set MAX_INJECT_CYCLES [expr 2**31-1]
set DEFAULT_INJECT_CYCLES 15


set enablement {True}
set editable {[expr {$PASS_THROUGH} == "{Both}" || {$PASS_THROUGH} == "{Belt-Bus}"] }

set dependency {}

set tooltip "Inject Cycles"
set display_name "Number of inject cycles"

create_param_long_range "INJECT_CYCLES" $MIN_INJECT_CYCLES $MAX_INJECT_CYCLES $DEFAULT_INJECT_CYCLES $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# Number of Channels [1:16], Synq 0
# NUM_CH		:	NATURAL	RANGE	0	TO	16	:=	2

# ---------------NUM_CH----------------
set MIN_NUM_CH 0
set MAX_NUM_CH 255
set DEFAULT_NUM_CH 0

set enablement {True}
set editable {}

set dependency {}

set display_name "Number of Channel"
set tooltip "Number of channel"

create_param_long_range "NUM_CH" $MIN_NUM_CH $MAX_NUM_CH $DEFAULT_NUM_CH $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# Node number, intialized at zero.
# NUM_NODE		:	NATURAL	:=	0

# --------------- NUM_NODE ----------------
set MIN_NUM_NODE 0
set MAX_NUM_NODE 255
set DEFAULT_NUM_NODE 0

set enablement {True}
set editable {}

set dependency {}

set tooltip "Node number"
set display_name "Node Number"

create_param_long_range "NUM_NODE" $MIN_NUM_NODE $MAX_NUM_NODE $DEFAULT_NUM_NODE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------


# Not implemented in the BeltBus
# PASS_THROUGH		:	BOOLEAN := FALSE

# ----------------- PASS_THROUGH -----------------
set LIST_DEFAULT {"Belt-Bus" "Timestamp" "Both"}
set DEFAULT_PASS_THROUGH "Belt-Bus"

set enablement {True}
set editable {}

set dependency {}

set tooltip "If Belt-Bus the NodeInserter is Implemented, with Timestamp not there is a simple parallel output"
set display_name "Pass Through"

create_param_string_list "PASS_THROUGH" $LIST_DEFAULT $DEFAULT_PASS_THROUGH $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------

# Number of clock cycles necessary to expose a measure
# RETAIN_SINGLE_NODE		:	INTEGER	:=	1

# ---------------RETAIN_SINGLE_NODE----------------
set MIN_RETAIN_SINGLE_NODE 0
set MAX_RETAIN_SINGLE_NODE [expr 2**31-1]
set DEFAULT_RETAIN_SINGLE_NODE 1

set enablement {True}
set editable {[expr {$PASS_THROUGH} == "{Both}" || {$PASS_THROUGH} == "{Belt-Bus}"] }


set dependency {}

set tooltip "Number of retain cycles in a single node"
set display_name "Retain Single Node"

create_param_long_range "RETAIN_SINGLE_NODE" $MIN_RETAIN_SINGLE_NODE $MAX_RETAIN_SINGLE_NODE $DEFAULT_RETAIN_SINGLE_NODE $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
