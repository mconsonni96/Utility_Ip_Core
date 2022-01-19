# DN vs UP Detection
# ------------- Select Types of Edge of the Tapped Delay-Line ------------
# TYPE_EDGE_ARRAY	:	DN_VS_UP_ARRAY_STRING	:= ("DN", "UP", Others => "DN");
# ------------------------------------------------------------------------

# ---------------- TYPE_EDGE_i --------------------

# TODO DYNAMICALLY IN AXI4Stream_Channel_TDC_v1_0.tcl
# TODO Do not show the TDL not used

for {set i 0} {$i < 16} {incr i} {

	set type_edge_i "TYPE_EDGE_"
	append type_edge_i $i


	set LIST_TYPE_EDGE {DN UP}
	set DEFAULT_TYPE_EDGE "DN"

	if {$i < 1} {
		set enablement {True}
	} else {
		set enablement {False}
	}



	set editable "$"
	append editable "NUMBER_OF_TDL > "
	append editable $i
	set dependency {}

	set tooltip "Edge to detect over TDL"
	set display_name "Type Edge TDL $i"

	set_param_string_list $type_edge_i $LIST_TYPE_EDGE $DEFAULT_TYPE_EDGE $enablement $editable $dependency $tooltip $display_name

}
# ---------------------------------------------
