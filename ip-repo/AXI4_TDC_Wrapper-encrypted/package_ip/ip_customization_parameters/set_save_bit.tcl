
# Save one bit in CharactCurveSPRAM
# SAVE_BIT			:	BOOLEAN							:=	TRUE;

# ------------------ SAVE_BIT ------------------
set DEFAULT_SAVE_BIT "TRUE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Use 2^BIT_CALIBARTION (BIT_CALIBARTION +1 bits) if FALSE or 2^BIT_CALIBARTION -1 (BIT_CALIBARTION bits) if TRUE samples for performing the calibration"
set display_name "Save One Bit in Magic Calibrator"

set_param_bool "SAVE_BIT" $DEFAULT_SAVE_BIT $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
