# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set TMDS_Settings [ipgui::add_page $IPINST -name "TMDS Settings"]
  ipgui::add_param $IPINST -name "no_codec" -parent ${TMDS_Settings}


}

proc update_PARAM_VALUE.no_codec { PARAM_VALUE.no_codec } {
	# Procedure called to update no_codec when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.no_codec { PARAM_VALUE.no_codec } {
	# Procedure called to validate no_codec
	return true
}


proc update_MODELPARAM_VALUE.no_codec { MODELPARAM_VALUE.no_codec PARAM_VALUE.no_codec } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.no_codec}] ${MODELPARAM_VALUE.no_codec}
}

