# ------------------------------------------------------------------------------
# Global CLock
#create_clock -period 2.400 -name clk -waveform {0.000 1.200} [get_ports clk]
# ------------------------------------------------------------------------------

# -------------------------------- STRETCHER -----------------------------------
# Find the input of the Inst_EdgeTrigger_IL cell AsyncEventIn and set as clock
set str_name [get_pins -hierarchical -regexp .*Inst_StretcherToT_IL/AsyncEventIn.*]
create_clock -period 5.000 -name $str_name -waveform {0.000 2.500} [get_pins -hierarchical -regexp .*Inst_StretcherToT_IL/AsyncEventIn.*]


# Set false path between the real clock and str
# -quiet is used in the case that the Inst_StretcherToT_IL is not implemented
# It is better to use a better method that not ignbore the warning as -quit.
# Asked in the Xilinx Forum at the question "set_false_path in ip-core"
set_false_path -from [get_pins -hierarchical -regexp .*Inst_StretcherToT_IL/Inst_FDCE_rise/C -quiet] -to [get_pins -hierarchical -regexp .*Inst_StretcherToT_IL/Q_clk_rise_reg/D -quiet] -quiet
set_false_path -from [get_pins -hierarchical -regexp .*Inst_StretcherToT_IL/CLR_reg/C -quiet] -to [get_pins -hierarchical -regexp .*Inst_StretcherToT_IL/Inst_FDCE_rise/CLR -quiet] -quiet


set_false_path -from [get_pins -hierarchical -regexp .*Inst_StretcherToT_IL/Inst_FDCE_fall/C -quiet] -to [get_pins -hierarchical -regexp .*Inst_StretcherToT_IL/Q_clk_fall_reg/D -quiet] -quiet
set_false_path -from [get_pins -hierarchical -regexp .*Inst_StretcherToT_IL/CLR_reg/C -quiet] -to [get_pins -hierarchical -regexp .*Inst_StretcherToT_IL/Inst_FDCE_fall/CLR -quiet] -quiet
# ------------------------------------------------------------------------------

# --------------------------------- DIVIDER ------------------------------------
# Find the input of the Inst_Divider_IL cell AsyncEventIn and set as clock
set div_name [get_pins -hierarchical -regexp .*Inst_Divider_IL/AsyncEventIn.*]
create_clock -period 5.000 -name $div_name -waveform {0.000 2.500} [get_pins -hierarchical -regexp .*Inst_Divider_IL/AsyncEventIn.*]
# No Cross Domani between div and clk
# ------------------------------------------------------------------------------

# TODO Remove loop in RingOscillator
# TODO Define clk domanin or false path of StretcherLength
# TODO Define clk domanin or false path of Divider
# TODO Define clk domanin or false path of EdgeTrigger
