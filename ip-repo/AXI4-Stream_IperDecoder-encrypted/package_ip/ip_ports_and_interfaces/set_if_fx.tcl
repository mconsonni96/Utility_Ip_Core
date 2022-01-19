# ===================== SET IF PROPERTY IN CUSTOMIZATION GUI ===================
# ------------------------- Assocaite BUSIF Clock ------------------------------
proc set_associated_busif {clk_name if_list} \
{

	ipx::add_bus_parameter ASSOCIATED_BUSIF [ipx::get_bus_interfaces $clk_name -of_objects [ipx::current_core]]
	set_property value $if_list [ipx::get_bus_parameters ASSOCIATED_BUSIF -of_objects [ipx::get_bus_interfaces $clk_name -of_objects [ipx::current_core]]]


}
# ------------------------------------------------------------------------------

# -------------------------- Polarity of Reset ---------------------------------
proc set_polarity {reset_name polarity_value} \
{

	ipx::add_bus_parameter POLARITY [ipx::get_bus_interfaces $reset_name -of_objects [ipx::current_core]]
	set_property value $polarity_value [ipx::get_bus_parameters POLARITY -of_objects [ipx::get_bus_interfaces $reset_name -of_objects [ipx::current_core]]]

}
# ------------------------------------------------------------------------------

# ==============================================================================
