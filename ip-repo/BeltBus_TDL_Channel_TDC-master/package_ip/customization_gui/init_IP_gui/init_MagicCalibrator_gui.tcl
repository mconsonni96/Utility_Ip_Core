# Definitional proc to organize Magic Calibrator widgets for parameters.

proc init_MagicCalibrator_gui { IPINST Page} {

set Page_0 [ipgui::add_page $IPINST -name $Page]
#Adding Group
set Calibrator_Dimenstion [ipgui::add_group $IPINST -name "Calibrator Dimension" -parent ${Page_0} -display_name {Calibrator Settings}]
set_property tooltip {Calibrator Settings} ${Calibrator_Dimenstion}
set SAVE_BIT [ipgui::add_param $IPINST -name "SAVE_BIT" -parent ${Calibrator_Dimenstion}]
set_property tooltip {Use 2^BIT_CALIBARTION (BIT_CALIBARTION +1 bits) if FALSE or 2^BIT_CALIBARTION -1 (BIT_CALIBARTION bits) if TRUE samples for performing the calibration} ${SAVE_BIT}
set BIT_CALIBRATION [ipgui::add_param $IPINST -name "BIT_CALIBRATION" -parent ${Calibrator_Dimenstion}]
set_property tooltip {Bit dimension of the calibration table} ${BIT_CALIBRATION}
set INTEGRATION_METHOD [ipgui::add_param $IPINST -name "INTEGRATION_METHOD" -parent ${Calibrator_Dimenstion} -widget comboBox]
set_property tooltip {integration method used in magic Calibrator} ${INTEGRATION_METHOD}

#Adding Group
set Timestamp_Dimension [ipgui::add_group $IPINST -name "Timestamp Dimension" -parent ${Page_0}]
set_property tooltip {Timestamp Dimension} ${Timestamp_Dimension}
set BIT_FID [ipgui::add_param $IPINST -name "BIT_FID" -parent ${Timestamp_Dimension}]
set_property tooltip {Bit reserver to the FID of the Belt Bus used to identify properly the timestamps} ${BIT_FID}
set BIT_COARSE [ipgui::add_param $IPINST -name "BIT_COARSE" -parent ${Timestamp_Dimension}]
set_property tooltip {Bit Coarse Counter dimension} ${BIT_COARSE}
set BIT_RESOLUTION [ipgui::add_param $IPINST -name "BIT_RESOLUTION" -parent ${Timestamp_Dimension}]
set_property tooltip {Bit used for the fine part of the timestamp} ${BIT_RESOLUTION}
set BIT_UNCALIBRATED [ipgui::add_param $IPINST -name "BIT_UNCALIBRATED" -parent ${Timestamp_Dimension}]
set_property tooltip {Bit reserver to the FID of the Belt Bus used to identify properly the timestamps} ${BIT_UNCALIBRATED}

#Adding Group
set Debug_Mode [ipgui::add_group $IPINST -name "Debug Mode" -parent ${Page_0}]
set_property tooltip {Debug Mode} ${Debug_Mode}
set DEBUG_MODE_CT [ipgui::add_param $IPINST -name "DEBUG_MODE_CT" -parent ${Debug_Mode}]
set_property tooltip {Allow to tune in real-time the calibration and read the CalibTable} ${DEBUG_MODE_CT}
set DEBUG_MODE_CC [ipgui::add_param $IPINST -name "DEBUG_MODE_CC" -parent ${Debug_Mode}]
set_property tooltip {Allow to tune in real-time the calibration and read the Charact Curve} ${DEBUG_MODE_CC}

}
