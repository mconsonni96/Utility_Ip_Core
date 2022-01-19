# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {Main}]
  ipgui::add_static_text $IPINST -name "Spansion_alert" -parent ${Page_0} -text {WARNING: only Spansion memories with Quad SPI interface are supported!}
  ipgui::add_param $IPINST -name "MEMORY_CODE" -parent ${Page_0} -widget comboBox
  set C_M_AXI_TARGET_SLAVE_BASE_ADDR [ipgui::add_param $IPINST -name "C_M_AXI_TARGET_SLAVE_BASE_ADDR" -parent ${Page_0}]
  set_property tooltip {Insert here the address of the AXI Quad SPI IP-Core connected to the Master AXI interface} ${C_M_AXI_TARGET_SLAVE_BASE_ADDR}
  ipgui::add_param $IPINST -name "AXI_QSPI_FIFO_DEPTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "SECTOR_SIZE" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "PAGE_SIZE" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "MEMORY_SIZE" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "START_ADDRESS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "END_ADDRESS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WRITE_SR_CR" -parent ${Page_0}

  #Adding Page
  set Page_1 [ipgui::add_page $IPINST -name "Page 1" -display_name {Status and config registers}]
  set_property visible false $Page_1
  ipgui::add_param $IPINST -name "WRITE_SR_CR_ON_BOOT" -parent ${Page_1}
  ipgui::add_param $IPINST -name "ENABLE_QUAD" -parent ${Page_1}
  ipgui::add_param $IPINST -name "ENABLE_PROT" -parent ${Page_1}


}

proc update_PARAM_VALUE.AXI_QSPI_FIFO_DEPTH { PARAM_VALUE.AXI_QSPI_FIFO_DEPTH } {
	# Procedure called to update AXI_QSPI_FIFO_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_QSPI_FIFO_DEPTH { PARAM_VALUE.AXI_QSPI_FIFO_DEPTH } {
	# Procedure called to validate AXI_QSPI_FIFO_DEPTH
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_STS_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_STS_TDATA_WIDTH } {
	# Procedure called to update C_M_AXIS_STS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_STS_TDATA_WIDTH { PARAM_VALUE.C_M_AXIS_STS_TDATA_WIDTH } {
	# Procedure called to validate C_M_AXIS_STS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXI_BURST_LEN { PARAM_VALUE.C_M_AXI_BURST_LEN } {
	# Procedure called to update C_M_AXI_BURST_LEN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_BURST_LEN { PARAM_VALUE.C_M_AXI_BURST_LEN } {
	# Procedure called to validate C_M_AXI_BURST_LEN
	return true
}

proc update_PARAM_VALUE.ENABLE_PROT { PARAM_VALUE.ENABLE_PROT } {
	# Procedure called to update ENABLE_PROT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ENABLE_PROT { PARAM_VALUE.ENABLE_PROT } {
	# Procedure called to validate ENABLE_PROT
	return true
}

proc update_PARAM_VALUE.ENABLE_QUAD { PARAM_VALUE.ENABLE_QUAD } {
	# Procedure called to update ENABLE_QUAD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ENABLE_QUAD { PARAM_VALUE.ENABLE_QUAD } {
	# Procedure called to validate ENABLE_QUAD
	return true
}

proc update_PARAM_VALUE.END_ADDRESS { PARAM_VALUE.END_ADDRESS } {
	# Procedure called to update END_ADDRESS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.END_ADDRESS { PARAM_VALUE.END_ADDRESS } {
	# Procedure called to validate END_ADDRESS
	return true
}

proc update_PARAM_VALUE.MEMORY_CODE { PARAM_VALUE.MEMORY_CODE } {
	# Procedure called to update MEMORY_CODE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MEMORY_CODE { PARAM_VALUE.MEMORY_CODE } {
	# Procedure called to validate MEMORY_CODE
	return true
}

proc update_PARAM_VALUE.MEMORY_SIZE { PARAM_VALUE.MEMORY_SIZE } {
	# Procedure called to update MEMORY_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MEMORY_SIZE { PARAM_VALUE.MEMORY_SIZE } {
	# Procedure called to validate MEMORY_SIZE
	return true
}

proc update_PARAM_VALUE.PAGE_SIZE { PARAM_VALUE.PAGE_SIZE } {
	# Procedure called to update PAGE_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PAGE_SIZE { PARAM_VALUE.PAGE_SIZE } {
	# Procedure called to validate PAGE_SIZE
	return true
}

proc update_PARAM_VALUE.SECTOR_SIZE { PARAM_VALUE.SECTOR_SIZE } {
	# Procedure called to update SECTOR_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SECTOR_SIZE { PARAM_VALUE.SECTOR_SIZE } {
	# Procedure called to validate SECTOR_SIZE
	return true
}

proc update_PARAM_VALUE.START_ADDRESS { PARAM_VALUE.START_ADDRESS } {
	# Procedure called to update START_ADDRESS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.START_ADDRESS { PARAM_VALUE.START_ADDRESS } {
	# Procedure called to validate START_ADDRESS
	return true
}

proc update_PARAM_VALUE.WRITE_SR_CR { PARAM_VALUE.WRITE_SR_CR } {
	# Procedure called to update WRITE_SR_CR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WRITE_SR_CR { PARAM_VALUE.WRITE_SR_CR } {
	# Procedure called to validate WRITE_SR_CR
	return true
}

proc update_PARAM_VALUE.WRITE_SR_CR_ON_BOOT { PARAM_VALUE.WRITE_SR_CR_ON_BOOT } {
	# Procedure called to update WRITE_SR_CR_ON_BOOT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WRITE_SR_CR_ON_BOOT { PARAM_VALUE.WRITE_SR_CR_ON_BOOT } {
	# Procedure called to validate WRITE_SR_CR_ON_BOOT
	return true
}

proc update_PARAM_VALUE.C_M_AXI_TARGET_SLAVE_BASE_ADDR { PARAM_VALUE.C_M_AXI_TARGET_SLAVE_BASE_ADDR } {
	# Procedure called to update C_M_AXI_TARGET_SLAVE_BASE_ADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_TARGET_SLAVE_BASE_ADDR { PARAM_VALUE.C_M_AXI_TARGET_SLAVE_BASE_ADDR } {
	# Procedure called to validate C_M_AXI_TARGET_SLAVE_BASE_ADDR
	return true
}

proc update_PARAM_VALUE.C_M_AXI_ADDR_WIDTH { PARAM_VALUE.C_M_AXI_ADDR_WIDTH } {
	# Procedure called to update C_M_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_ADDR_WIDTH { PARAM_VALUE.C_M_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_M_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M_AXI_DATA_WIDTH { PARAM_VALUE.C_M_AXI_DATA_WIDTH } {
	# Procedure called to update C_M_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXI_DATA_WIDTH { PARAM_VALUE.C_M_AXI_DATA_WIDTH } {
	# Procedure called to validate C_M_AXI_DATA_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.C_M_AXI_TARGET_SLAVE_BASE_ADDR { MODELPARAM_VALUE.C_M_AXI_TARGET_SLAVE_BASE_ADDR PARAM_VALUE.C_M_AXI_TARGET_SLAVE_BASE_ADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_TARGET_SLAVE_BASE_ADDR}] ${MODELPARAM_VALUE.C_M_AXI_TARGET_SLAVE_BASE_ADDR}
}

proc update_MODELPARAM_VALUE.C_M_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_M_AXI_ADDR_WIDTH PARAM_VALUE.C_M_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_M_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_M_AXI_DATA_WIDTH PARAM_VALUE.C_M_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.PAGE_SIZE { MODELPARAM_VALUE.PAGE_SIZE PARAM_VALUE.PAGE_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PAGE_SIZE}] ${MODELPARAM_VALUE.PAGE_SIZE}
}

proc update_MODELPARAM_VALUE.SECTOR_SIZE { MODELPARAM_VALUE.SECTOR_SIZE PARAM_VALUE.SECTOR_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SECTOR_SIZE}] ${MODELPARAM_VALUE.SECTOR_SIZE}
}

proc update_MODELPARAM_VALUE.START_ADDRESS { MODELPARAM_VALUE.START_ADDRESS PARAM_VALUE.START_ADDRESS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.START_ADDRESS}] ${MODELPARAM_VALUE.START_ADDRESS}
}

proc update_MODELPARAM_VALUE.AXI_QSPI_FIFO_DEPTH { MODELPARAM_VALUE.AXI_QSPI_FIFO_DEPTH PARAM_VALUE.AXI_QSPI_FIFO_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_QSPI_FIFO_DEPTH}] ${MODELPARAM_VALUE.AXI_QSPI_FIFO_DEPTH}
}

proc update_MODELPARAM_VALUE.C_M_AXI_BURST_LEN { MODELPARAM_VALUE.C_M_AXI_BURST_LEN PARAM_VALUE.C_M_AXI_BURST_LEN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXI_BURST_LEN}] ${MODELPARAM_VALUE.C_M_AXI_BURST_LEN}
}

proc update_MODELPARAM_VALUE.END_ADDRESS { MODELPARAM_VALUE.END_ADDRESS PARAM_VALUE.END_ADDRESS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.END_ADDRESS}] ${MODELPARAM_VALUE.END_ADDRESS}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_STS_TDATA_WIDTH { MODELPARAM_VALUE.C_M_AXIS_STS_TDATA_WIDTH PARAM_VALUE.C_M_AXIS_STS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_STS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_STS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.WRITE_SR_CR { MODELPARAM_VALUE.WRITE_SR_CR PARAM_VALUE.WRITE_SR_CR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WRITE_SR_CR}] ${MODELPARAM_VALUE.WRITE_SR_CR}
}

proc update_MODELPARAM_VALUE.ENABLE_QUAD { MODELPARAM_VALUE.ENABLE_QUAD PARAM_VALUE.ENABLE_QUAD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ENABLE_QUAD}] ${MODELPARAM_VALUE.ENABLE_QUAD}
}

proc update_MODELPARAM_VALUE.ENABLE_PROT { MODELPARAM_VALUE.ENABLE_PROT PARAM_VALUE.ENABLE_PROT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ENABLE_PROT}] ${MODELPARAM_VALUE.ENABLE_PROT}
}

proc update_MODELPARAM_VALUE.MEMORY_SIZE { MODELPARAM_VALUE.MEMORY_SIZE PARAM_VALUE.MEMORY_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MEMORY_SIZE}] ${MODELPARAM_VALUE.MEMORY_SIZE}
}

proc update_MODELPARAM_VALUE.MEMORY_CODE { MODELPARAM_VALUE.MEMORY_CODE PARAM_VALUE.MEMORY_CODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MEMORY_CODE}] ${MODELPARAM_VALUE.MEMORY_CODE}
}

proc update_MODELPARAM_VALUE.WRITE_SR_CR_ON_BOOT { MODELPARAM_VALUE.WRITE_SR_CR_ON_BOOT PARAM_VALUE.WRITE_SR_CR_ON_BOOT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WRITE_SR_CR_ON_BOOT}] ${MODELPARAM_VALUE.WRITE_SR_CR_ON_BOOT}
}

proc update_gui_for_PARAM_VALUE.WRITE_SR_CR { IPINST PARAM_VALUE.WRITE_SR_CR } {
    set vis [get_property value ${PARAM_VALUE.WRITE_SR_CR}]
    if {$vis == true} {
      set vis true
    } else {
      set vis false
    }
    set_property visible $vis [ipgui::get_pagespec {Page 1}  -of  $IPINST ]
}
