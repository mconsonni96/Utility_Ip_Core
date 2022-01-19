
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/BeltBus_LedCounter_v1_2.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "NUM_CH" -parent ${Page_0} -show_range false
  set CONSTANT_LED_SPEED [ipgui::add_param $IPINST -name "CONSTANT_LED_SPEED" -parent ${Page_0}]
  set_property tooltip {Disable the BeltBus interface and use a constant speed for the LEDs. Use Counter Width to set the speed.} ${CONSTANT_LED_SPEED}
  #Adding Group
  set Belt_Bus [ipgui::add_group $IPINST -name "Belt Bus" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "BIT_NUM_CH" -parent ${Belt_Bus}
  ipgui::add_param $IPINST -name "BIT_FID" -parent ${Belt_Bus}
  ipgui::add_param $IPINST -name "BIT_COARSE" -parent ${Belt_Bus}
  ipgui::add_param $IPINST -name "BIT_FINE" -parent ${Belt_Bus}
  ipgui::add_param $IPINST -name "CDC_SYNC_STAGES" -parent ${Belt_Bus}

  #Adding Group
  set Counter [ipgui::add_group $IPINST -name "Counter" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "COUNTER_WIDTH" -parent ${Counter}

  #Adding Group
  set LEDs [ipgui::add_group $IPINST -name "LEDs" -parent ${Page_0}]
  set PWM_RES [ipgui::add_param $IPINST -name "PWM_RES" -parent ${LEDs}]
  set_property tooltip {You should leave this to the default value} ${PWM_RES}
  ipgui::add_param $IPINST -name "PWM_PRESCALER_BITS" -parent ${LEDs}
  ipgui::add_param $IPINST -name "PWM_INVERT_POLARITY" -parent ${LEDs}
  set LED_TIME_RES [ipgui::add_param $IPINST -name "LED_TIME_RES" -parent ${LEDs}]
  set_property tooltip {You should leave this to the default value} ${LED_TIME_RES}
  ipgui::add_param $IPINST -name "LED_PRESCALER_BITS" -parent ${LEDs}
  ipgui::add_param $IPINST -name "LED_SIGMA" -parent ${LEDs}


  ipgui::add_param $IPINST -name "RECOVERY_SPEED"
  ipgui::add_param $IPINST -name "CALIBRATION_SPEED"

}

proc update_PARAM_VALUE.BIT_COARSE { PARAM_VALUE.BIT_COARSE PARAM_VALUE.CONSTANT_LED_SPEED } {
	# Procedure called to update BIT_COARSE when any of the dependent parameters in the arguments change
	
	set BIT_COARSE ${PARAM_VALUE.BIT_COARSE}
	set CONSTANT_LED_SPEED ${PARAM_VALUE.CONSTANT_LED_SPEED}
	set values(CONSTANT_LED_SPEED) [get_property value $CONSTANT_LED_SPEED]
	if { [gen_USERPARAMETER_BIT_COARSE_ENABLEMENT $values(CONSTANT_LED_SPEED)] } {
		set_property enabled true $BIT_COARSE
	} else {
		set_property enabled false $BIT_COARSE
	}
}

proc validate_PARAM_VALUE.BIT_COARSE { PARAM_VALUE.BIT_COARSE } {
	# Procedure called to validate BIT_COARSE
	return true
}

proc update_PARAM_VALUE.BIT_FID { PARAM_VALUE.BIT_FID PARAM_VALUE.CONSTANT_LED_SPEED } {
	# Procedure called to update BIT_FID when any of the dependent parameters in the arguments change
	
	set BIT_FID ${PARAM_VALUE.BIT_FID}
	set CONSTANT_LED_SPEED ${PARAM_VALUE.CONSTANT_LED_SPEED}
	set values(CONSTANT_LED_SPEED) [get_property value $CONSTANT_LED_SPEED]
	if { [gen_USERPARAMETER_BIT_FID_ENABLEMENT $values(CONSTANT_LED_SPEED)] } {
		set_property enabled true $BIT_FID
	} else {
		set_property enabled false $BIT_FID
	}
}

proc validate_PARAM_VALUE.BIT_FID { PARAM_VALUE.BIT_FID } {
	# Procedure called to validate BIT_FID
	return true
}

proc update_PARAM_VALUE.BIT_FINE { PARAM_VALUE.BIT_FINE PARAM_VALUE.CONSTANT_LED_SPEED } {
	# Procedure called to update BIT_FINE when any of the dependent parameters in the arguments change
	
	set BIT_FINE ${PARAM_VALUE.BIT_FINE}
	set CONSTANT_LED_SPEED ${PARAM_VALUE.CONSTANT_LED_SPEED}
	set values(CONSTANT_LED_SPEED) [get_property value $CONSTANT_LED_SPEED]
	if { [gen_USERPARAMETER_BIT_FINE_ENABLEMENT $values(CONSTANT_LED_SPEED)] } {
		set_property enabled true $BIT_FINE
	} else {
		set_property enabled false $BIT_FINE
	}
}

proc validate_PARAM_VALUE.BIT_FINE { PARAM_VALUE.BIT_FINE } {
	# Procedure called to validate BIT_FINE
	return true
}

proc update_PARAM_VALUE.BIT_NUM_CH { PARAM_VALUE.BIT_NUM_CH PARAM_VALUE.CONSTANT_LED_SPEED } {
	# Procedure called to update BIT_NUM_CH when any of the dependent parameters in the arguments change
	
	set BIT_NUM_CH ${PARAM_VALUE.BIT_NUM_CH}
	set CONSTANT_LED_SPEED ${PARAM_VALUE.CONSTANT_LED_SPEED}
	set values(CONSTANT_LED_SPEED) [get_property value $CONSTANT_LED_SPEED]
	if { [gen_USERPARAMETER_BIT_NUM_CH_ENABLEMENT $values(CONSTANT_LED_SPEED)] } {
		set_property enabled true $BIT_NUM_CH
	} else {
		set_property enabled false $BIT_NUM_CH
	}
}

proc validate_PARAM_VALUE.BIT_NUM_CH { PARAM_VALUE.BIT_NUM_CH } {
	# Procedure called to validate BIT_NUM_CH
	return true
}

proc update_PARAM_VALUE.CDC_SYNC_STAGES { PARAM_VALUE.CDC_SYNC_STAGES PARAM_VALUE.CONSTANT_LED_SPEED } {
	# Procedure called to update CDC_SYNC_STAGES when any of the dependent parameters in the arguments change
	
	set CDC_SYNC_STAGES ${PARAM_VALUE.CDC_SYNC_STAGES}
	set CONSTANT_LED_SPEED ${PARAM_VALUE.CONSTANT_LED_SPEED}
	set values(CONSTANT_LED_SPEED) [get_property value $CONSTANT_LED_SPEED]
	if { [gen_USERPARAMETER_CDC_SYNC_STAGES_ENABLEMENT $values(CONSTANT_LED_SPEED)] } {
		set_property enabled true $CDC_SYNC_STAGES
	} else {
		set_property enabled false $CDC_SYNC_STAGES
	}
}

proc validate_PARAM_VALUE.CDC_SYNC_STAGES { PARAM_VALUE.CDC_SYNC_STAGES } {
	# Procedure called to validate CDC_SYNC_STAGES
	return true
}

proc update_PARAM_VALUE.CALIBRATION_SPEED { PARAM_VALUE.CALIBRATION_SPEED } {
	# Procedure called to update CALIBRATION_SPEED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CALIBRATION_SPEED { PARAM_VALUE.CALIBRATION_SPEED } {
	# Procedure called to validate CALIBRATION_SPEED
	return true
}

proc update_PARAM_VALUE.CONSTANT_LED_SPEED { PARAM_VALUE.CONSTANT_LED_SPEED } {
	# Procedure called to update CONSTANT_LED_SPEED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CONSTANT_LED_SPEED { PARAM_VALUE.CONSTANT_LED_SPEED } {
	# Procedure called to validate CONSTANT_LED_SPEED
	return true
}

proc update_PARAM_VALUE.COUNTER_WIDTH { PARAM_VALUE.COUNTER_WIDTH } {
	# Procedure called to update COUNTER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COUNTER_WIDTH { PARAM_VALUE.COUNTER_WIDTH } {
	# Procedure called to validate COUNTER_WIDTH
	return true
}

proc update_PARAM_VALUE.GREEN_LEDS_BOARD_INTERFACE { PARAM_VALUE.GREEN_LEDS_BOARD_INTERFACE } {
	# Procedure called to update GREEN_LEDS_BOARD_INTERFACE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GREEN_LEDS_BOARD_INTERFACE { PARAM_VALUE.GREEN_LEDS_BOARD_INTERFACE } {
	# Procedure called to validate GREEN_LEDS_BOARD_INTERFACE
	return true
}

proc update_PARAM_VALUE.LED_PRESCALER_BITS { PARAM_VALUE.LED_PRESCALER_BITS } {
	# Procedure called to update LED_PRESCALER_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LED_PRESCALER_BITS { PARAM_VALUE.LED_PRESCALER_BITS } {
	# Procedure called to validate LED_PRESCALER_BITS
	return true
}

proc update_PARAM_VALUE.LED_SIGMA { PARAM_VALUE.LED_SIGMA } {
	# Procedure called to update LED_SIGMA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LED_SIGMA { PARAM_VALUE.LED_SIGMA } {
	# Procedure called to validate LED_SIGMA
	return true
}

proc update_PARAM_VALUE.LED_TIME_RES { PARAM_VALUE.LED_TIME_RES } {
	# Procedure called to update LED_TIME_RES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LED_TIME_RES { PARAM_VALUE.LED_TIME_RES } {
	# Procedure called to validate LED_TIME_RES
	return true
}

proc update_PARAM_VALUE.NUM_CH { PARAM_VALUE.NUM_CH } {
	# Procedure called to update NUM_CH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_CH { PARAM_VALUE.NUM_CH } {
	# Procedure called to validate NUM_CH
	return true
}

proc update_PARAM_VALUE.PWM_INVERT_POLARITY { PARAM_VALUE.PWM_INVERT_POLARITY } {
	# Procedure called to update PWM_INVERT_POLARITY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PWM_INVERT_POLARITY { PARAM_VALUE.PWM_INVERT_POLARITY } {
	# Procedure called to validate PWM_INVERT_POLARITY
	return true
}

proc update_PARAM_VALUE.PWM_PRESCALER_BITS { PARAM_VALUE.PWM_PRESCALER_BITS } {
	# Procedure called to update PWM_PRESCALER_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PWM_PRESCALER_BITS { PARAM_VALUE.PWM_PRESCALER_BITS } {
	# Procedure called to validate PWM_PRESCALER_BITS
	return true
}

proc update_PARAM_VALUE.PWM_RES { PARAM_VALUE.PWM_RES } {
	# Procedure called to update PWM_RES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PWM_RES { PARAM_VALUE.PWM_RES } {
	# Procedure called to validate PWM_RES
	return true
}

proc update_PARAM_VALUE.RECOVERY_SPEED { PARAM_VALUE.RECOVERY_SPEED } {
	# Procedure called to update RECOVERY_SPEED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RECOVERY_SPEED { PARAM_VALUE.RECOVERY_SPEED } {
	# Procedure called to validate RECOVERY_SPEED
	return true
}

proc update_PARAM_VALUE.RED_LEDS_BOARD_INTERFACE { PARAM_VALUE.RED_LEDS_BOARD_INTERFACE } {
	# Procedure called to update RED_LEDS_BOARD_INTERFACE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RED_LEDS_BOARD_INTERFACE { PARAM_VALUE.RED_LEDS_BOARD_INTERFACE } {
	# Procedure called to validate RED_LEDS_BOARD_INTERFACE
	return true
}


proc update_MODELPARAM_VALUE.BIT_COARSE { MODELPARAM_VALUE.BIT_COARSE PARAM_VALUE.BIT_COARSE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_COARSE}] ${MODELPARAM_VALUE.BIT_COARSE}
}

proc update_MODELPARAM_VALUE.BIT_FID { MODELPARAM_VALUE.BIT_FID PARAM_VALUE.BIT_FID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_FID}] ${MODELPARAM_VALUE.BIT_FID}
}

proc update_MODELPARAM_VALUE.BIT_NUM_CH { MODELPARAM_VALUE.BIT_NUM_CH PARAM_VALUE.BIT_NUM_CH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_NUM_CH}] ${MODELPARAM_VALUE.BIT_NUM_CH}
}

proc update_MODELPARAM_VALUE.NUM_CH { MODELPARAM_VALUE.NUM_CH PARAM_VALUE.NUM_CH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_CH}] ${MODELPARAM_VALUE.NUM_CH}
}

proc update_MODELPARAM_VALUE.COUNTER_WIDTH { MODELPARAM_VALUE.COUNTER_WIDTH PARAM_VALUE.COUNTER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COUNTER_WIDTH}] ${MODELPARAM_VALUE.COUNTER_WIDTH}
}

proc update_MODELPARAM_VALUE.PWM_RES { MODELPARAM_VALUE.PWM_RES PARAM_VALUE.PWM_RES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PWM_RES}] ${MODELPARAM_VALUE.PWM_RES}
}

proc update_MODELPARAM_VALUE.PWM_PRESCALER_BITS { MODELPARAM_VALUE.PWM_PRESCALER_BITS PARAM_VALUE.PWM_PRESCALER_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PWM_PRESCALER_BITS}] ${MODELPARAM_VALUE.PWM_PRESCALER_BITS}
}

proc update_MODELPARAM_VALUE.PWM_INVERT_POLARITY { MODELPARAM_VALUE.PWM_INVERT_POLARITY PARAM_VALUE.PWM_INVERT_POLARITY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PWM_INVERT_POLARITY}] ${MODELPARAM_VALUE.PWM_INVERT_POLARITY}
}

proc update_MODELPARAM_VALUE.LED_TIME_RES { MODELPARAM_VALUE.LED_TIME_RES PARAM_VALUE.LED_TIME_RES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LED_TIME_RES}] ${MODELPARAM_VALUE.LED_TIME_RES}
}

proc update_MODELPARAM_VALUE.LED_PRESCALER_BITS { MODELPARAM_VALUE.LED_PRESCALER_BITS PARAM_VALUE.LED_PRESCALER_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LED_PRESCALER_BITS}] ${MODELPARAM_VALUE.LED_PRESCALER_BITS}
}

proc update_MODELPARAM_VALUE.LED_SIGMA { MODELPARAM_VALUE.LED_SIGMA PARAM_VALUE.LED_SIGMA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LED_SIGMA}] ${MODELPARAM_VALUE.LED_SIGMA}
}

proc update_MODELPARAM_VALUE.BIT_FINE { MODELPARAM_VALUE.BIT_FINE PARAM_VALUE.BIT_FINE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BIT_FINE}] ${MODELPARAM_VALUE.BIT_FINE}
}

proc update_MODELPARAM_VALUE.CDC_SYNC_STAGES { MODELPARAM_VALUE.CDC_SYNC_STAGES PARAM_VALUE.CDC_SYNC_STAGES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CDC_SYNC_STAGES}] ${MODELPARAM_VALUE.CDC_SYNC_STAGES}
}

proc update_MODELPARAM_VALUE.CONSTANT_LED_SPEED { MODELPARAM_VALUE.CONSTANT_LED_SPEED PARAM_VALUE.CONSTANT_LED_SPEED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CONSTANT_LED_SPEED}] ${MODELPARAM_VALUE.CONSTANT_LED_SPEED}
}

proc update_MODELPARAM_VALUE.RECOVERY_SPEED { MODELPARAM_VALUE.RECOVERY_SPEED PARAM_VALUE.RECOVERY_SPEED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RECOVERY_SPEED}] ${MODELPARAM_VALUE.RECOVERY_SPEED}
}

proc update_MODELPARAM_VALUE.CALIBRATION_SPEED { MODELPARAM_VALUE.CALIBRATION_SPEED PARAM_VALUE.CALIBRATION_SPEED } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CALIBRATION_SPEED}] ${MODELPARAM_VALUE.CALIBRATION_SPEED}
}

