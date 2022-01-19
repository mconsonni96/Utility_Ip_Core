#Specifies if the wr_clk (s00_uncalibTDC_aclk) and rd_clk (m00_uncalibSYS_aclk) are related, if 1 clk_TDC and clk_SYS are locked
#RELATED_CLOCKS		:	INTEGER	RANGE	0	TO	1		:=	0;

# --------------- RELATED_CLOCKS ---------------
set DEFAULT_RELATED_CLOCKS "FALSE"

set enablement {True}
set editable {}

set dependency {}

set tooltip "Phase relation between TDC and SYS clocks"
set display_name "TDC and SYS Clocks Relation"

set_param_bool "RELATED_CLOCKS" $DEFAULT_RELATED_CLOCKS $enablement $editable $dependency $tooltip $display_name
# ----------------------------------------------
