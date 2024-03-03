# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "GRADUALLY_OFF" -parent ${Page_0}
  ipgui::add_param $IPINST -name "GRADUALLY_ON" -parent ${Page_0}
  ipgui::add_param $IPINST -name "INIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "OFF_STATE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ON_STATE" -parent ${Page_0}


}

proc update_PARAM_VALUE.GRADUALLY_OFF { PARAM_VALUE.GRADUALLY_OFF } {
	# Procedure called to update GRADUALLY_OFF when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GRADUALLY_OFF { PARAM_VALUE.GRADUALLY_OFF } {
	# Procedure called to validate GRADUALLY_OFF
	return true
}

proc update_PARAM_VALUE.GRADUALLY_ON { PARAM_VALUE.GRADUALLY_ON } {
	# Procedure called to update GRADUALLY_ON when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.GRADUALLY_ON { PARAM_VALUE.GRADUALLY_ON } {
	# Procedure called to validate GRADUALLY_ON
	return true
}

proc update_PARAM_VALUE.INIT { PARAM_VALUE.INIT } {
	# Procedure called to update INIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INIT { PARAM_VALUE.INIT } {
	# Procedure called to validate INIT
	return true
}

proc update_PARAM_VALUE.OFF_STATE { PARAM_VALUE.OFF_STATE } {
	# Procedure called to update OFF_STATE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OFF_STATE { PARAM_VALUE.OFF_STATE } {
	# Procedure called to validate OFF_STATE
	return true
}

proc update_PARAM_VALUE.ON_STATE { PARAM_VALUE.ON_STATE } {
	# Procedure called to update ON_STATE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ON_STATE { PARAM_VALUE.ON_STATE } {
	# Procedure called to validate ON_STATE
	return true
}


proc update_MODELPARAM_VALUE.INIT { MODELPARAM_VALUE.INIT PARAM_VALUE.INIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INIT}] ${MODELPARAM_VALUE.INIT}
}

proc update_MODELPARAM_VALUE.ON_STATE { MODELPARAM_VALUE.ON_STATE PARAM_VALUE.ON_STATE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ON_STATE}] ${MODELPARAM_VALUE.ON_STATE}
}

proc update_MODELPARAM_VALUE.GRADUALLY_ON { MODELPARAM_VALUE.GRADUALLY_ON PARAM_VALUE.GRADUALLY_ON } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GRADUALLY_ON}] ${MODELPARAM_VALUE.GRADUALLY_ON}
}

proc update_MODELPARAM_VALUE.GRADUALLY_OFF { MODELPARAM_VALUE.GRADUALLY_OFF PARAM_VALUE.GRADUALLY_OFF } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.GRADUALLY_OFF}] ${MODELPARAM_VALUE.GRADUALLY_OFF}
}

proc update_MODELPARAM_VALUE.OFF_STATE { MODELPARAM_VALUE.OFF_STATE PARAM_VALUE.OFF_STATE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFF_STATE}] ${MODELPARAM_VALUE.OFF_STATE}
}

