
# Definitional proc to organize AXI4Stream Sycnhronizer widgets for parameters.
proc init_TDC_Channel_gui { IPINST Page} {

	#Adding Page
    set TDC_Channel [ipgui::add_page $IPINST -name $Page]
    #Adding Group
    # set Input_Buffer [ipgui::add_group $IPINST -name "Input Buffer" -parent ${TDC_Channel}]
	# set INPUT_BUFFER_TYPE [ipgui::add_param $IPINST -name "INPUT_BUFFER_TYPE" -parent ${Input_Buffer} -widget comboBox]
    # set_property tooltip {Choose between Single-Ended (IBUF) and Fully-Differential (IBUFDS) input buffer} ${INPUT_BUFFER_TYPE}

	#Adding Group
    set TDL_Dimensions [ipgui::add_group $IPINST -name "Tapped Delay-Line Dimensions" -parent ${TDC_Channel}]
    set NUM_TAP_TDL [ipgui::add_param $IPINST -name "NUM_TAP_TDL" -parent ${TDL_Dimensions}]
    set_property tooltip {Number of Taps in each TDL} ${NUM_TAP_TDL}
    set NUMBER_OF_TDL [ipgui::add_param $IPINST -name "NUMBER_OF_TDL" -parent ${TDL_Dimensions}]
    set_property tooltip {Number of TDL sub-Interpolated in each TDC channel} ${NUMBER_OF_TDL}
    set BIT_SMP_TDL [ipgui::add_param $IPINST -name "BIT_SMP_TDL" -parent ${TDL_Dimensions}]
    set_property tooltip {Number of taps sampled on the TDL} ${BIT_SMP_TDL}

    #Adding Group
    set Decoder_Dimensions [ipgui::add_group $IPINST -name "Decoder Dimensions" -parent ${TDC_Channel}]
    set BIT_BUBBLE [ipgui::add_param $IPINST -name "BIT_BUBBLE" -parent ${Decoder_Dimensions}]
    set_property tooltip {Maximum estention of a bubble error over the TDL} ${BIT_BUBBLE}


	#Adding Group
    set CEC_Dimensions [ipgui::add_group $IPINST -name "Coarse Extension Core Dimensions" -parent ${TDC_Channel}]
	set BIT_FID [ipgui::add_param $IPINST -name "BIT_FID" -parent ${CEC_Dimensions}]
    set_property tooltip {Bit reserved to the FID of the Belt Bus used to identify properly the timestamps} ${BIT_FID}
    set BIT_COARSE [ipgui::add_param $IPINST -name "BIT_COARSE" -parent ${CEC_Dimensions}]
    set_property tooltip {Bit Coarse Counter dimension} ${BIT_COARSE}

	#Adding Groupss
    set Calibrator_Dimensions [ipgui::add_group $IPINST -name "Calibrator Dimensions" -parent ${TDC_Channel}]
	set BIT_CALIBRATION [ipgui::add_param $IPINST -name "BIT_CALIBRATION" -parent ${Calibrator_Dimensions}]
	set_property tooltip {Bit dimension of the calibration table} ${BIT_CALIBRATION}
	set BIT_RESOLUTION [ipgui::add_param $IPINST -name "BIT_RESOLUTION" -parent ${Calibrator_Dimensions}]
	set_property tooltip {Bit used for the fine part of the timestamp} ${BIT_RESOLUTION}

	#Adding Group
    set BeltBus_Dimensions [ipgui::add_group $IPINST -name "BeltBus Dimensions" -parent ${TDC_Channel}]
	ipgui::add_param $IPINST -name "NUM_CH" -parent ${BeltBus_Dimensions}
    ipgui::add_param $IPINST -name "NUM_NODE" -parent ${BeltBus_Dimensions}
	set BIT_NUM_CH [ipgui::add_param $IPINST -name "BIT_NUM_CH" -parent ${BeltBus_Dimensions}]
    set_property tooltip {Number of bits used for the number of channel} ${BIT_NUM_CH}
	#Adding Group
	set Pass_Through [ipgui::add_group $IPINST -name "Pass Through" -parent ${TDC_Channel}]
	set_property tooltip {Pass Through} ${Pass_Through}
	set PASS_THROUGH [ipgui::add_param $IPINST -name "PASS_THROUGH" -parent ${Pass_Through} -widget comboBox]
	set_property tooltip {If Belt-Bus the NodeInserter is Implemented, with Timestamp not there is a simple parallel output} ${PASS_THROUGH}

}
