# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Magic_Debugger [ipgui::add_page $IPINST -name "AXI4 Magic Calibrator Debugger"]


  #Adding Group
  set Uncalibrated_Dimension [ipgui::add_group $IPINST -name "Uncalibrated Dimension" -parent ${Magic_Debugger}]
  set BIT_UNCALIBRATED [ipgui::add_param $IPINST -name "BIT_UNCALIBRATED" -parent ${Uncalibrated_Dimension}]
  set_property tooltip {Bit reserver to the FID of the Belt Bus used to identify properly the timestamps} ${BIT_UNCALIBRATED}

  #Adding Group
  set Calibrated_Dimension [ipgui::add_group $IPINST -name "Calibrated Dimension" -parent ${Magic_Debugger}]
  set SAVE_BIT [ipgui::add_param $IPINST -name "SAVE_BIT" -parent ${Calibrated_Dimension}]
  set_property tooltip {Use 2^BIT_CALIBARTION (BIT_CALIBARTION +1 bits) if FALSE or 2^BIT_CALIBARTION -1 (BIT_CALIBARTION bits) if TRUE samples for performing the calibration} ${SAVE_BIT}
  set BIT_RESOLUTION [ipgui::add_param $IPINST -name "BIT_RESOLUTION" -parent ${Calibrated_Dimension}]
  set_property tooltip {Bit used for the fine part of the timestamp} ${BIT_RESOLUTION}
  set BIT_CALIBRATION [ipgui::add_param $IPINST -name "BIT_CALIBRATION" -parent ${Calibrated_Dimension}]
  set_property tooltip {Bit dimension of the calibration table} ${BIT_CALIBRATION}


  #Adding Group
  set Debug_Mode [ipgui::add_group $IPINST -name "Debug Mode" -parent ${Magic_Debugger}]
  set DEBUG_MODE_CT [ipgui::add_param $IPINST -name "DEBUG_MODE_CT" -parent ${Debug_Mode}]
  set_property tooltip {Allow to tune in real-time the calibration and read the CalibTable} ${DEBUG_MODE_CT}
  set DEBUG_MODE_CC [ipgui::add_param $IPINST -name "DEBUG_MODE_CC" -parent ${Debug_Mode}]
  set_property tooltip {Allow to tune in real-time the calibration and read the Charact Curve} ${DEBUG_MODE_CC}

  #Adding Group
  set Module_Address [ipgui::add_group $IPINST -name "Module Address" -parent ${Magic_Debugger}]
  set C_S00_AXI_ADDR_ABS [ipgui::add_param $IPINST -name "C_S00_AXI_ADDR_ABS" -parent ${Module_Address}]
  set_property tooltip {Starting address of Debugger Module} ${C_S00_AXI_ADDR_ABS}





}
