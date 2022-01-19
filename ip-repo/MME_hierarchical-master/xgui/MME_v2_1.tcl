# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_static_text $IPINST -name "Component_Name_Param" -text {Component_Name}
  ipgui::add_param $IPINST -name "Component_Name" -show_label false -show_range false
  #Adding Settings Page
  set Settings [ipgui::add_page $IPINST -name "Settings"]
  set PORTS_NUMBER [ipgui::add_param $IPINST -name "PORTS_NUMBER" -parent ${Settings} -widget comboBox]
  set_property tooltip {Set the number of ports of the cell} ${PORTS_NUMBER}
  set PTE_AUXILIARY_PORTS [ipgui::add_param $IPINST -name "PTE_AUXILIARY_PORTS" -parent ${Settings} -widget checkBox]

  #Adding DataMover Group in the Settings page
  set DataMover_settings [ipgui::add_group $IPINST -name "DataMover settings" -parent ${Settings}]
  set BURST_SIZE [ipgui::add_param $IPINST -name "BURST_SIZE" -parent ${DataMover_settings} -widget comboBox]
  set_property tooltip {Set the Maximum Burst Size of the Internal AXI Datamover. This option specifies the maximum size of the burst cycles on the AXI MM2S and S2MM Memory Map Read interfaces.} ${BURST_SIZE}
  set BTT_USED [ipgui::add_param $IPINST -name "BTT_USED" -parent ${DataMover_settings} -widget comboBox]
  set_property tooltip {Sets the Width of BTT field (bits) of the internal AXI DataMover. Specifies the valid number of bits in the number of BTT field of the MM2S and S2MM commands.} ${BTT_USED}
  # Adding packetfetcher and packetizer group in the settings Page
  set packetfetcher_and_packetizer_settings [ipgui::add_group $IPINST -name "Packetfetcher and packetizer settings" -parent ${Settings}]
  set MAX_PACKET_LENGTH_PACKETIZER [ipgui::add_param $IPINST -name "MAX_PACKET_LENGTH_PACKETIZER" -parent ${packetfetcher_and_packetizer_settings} -widget comboBox]
  set_property tooltip {Maximum length (in Bytes) of the input packet.} ${MAX_PACKET_LENGTH_PACKETIZER}
  set MAX_PACKET_LENGTH_PACKETFETCHER [ipgui::add_param $IPINST -name "MAX_PACKET_LENGTH_PACKETFETCHER" -parent ${packetfetcher_and_packetizer_settings} -widget comboBox]
  set_property tooltip {Maximum length (in Bytes) of the input packet.} ${MAX_PACKET_LENGTH_PACKETFETCHER}
  #Adding Routing Page
  set Routing [ipgui::add_page $IPINST -name "Routing"]
  set TDEST_ROUTING [ipgui::add_param $IPINST -name "TDEST_ROUTING" -parent ${Routing}]
  set_property tooltip {Set the output interface in case of autopush} ${TDEST_ROUTING}

  # Variables needed for tables generation
  set header_names {"Interface" "NUMBER OF BITS" "TLAST"}
  set row_name "M_AXIS_ "
  set row_name2 "S_AXIS_ "
  set widgets_type {comboBox comboBox}
  set widgets_type2 {comboBox}
  set param_prefix {BITSM TLAST}
  set param_prefix2 {BITS}

  # Slave table
  gen_table2 $IPINST TABLE2 15 2 $header_names $row_name2 $widgets_type2 $param_prefix2
  # Master table
  gen_table $IPINST TABLE 15 3 $header_names $row_name $widgets_type $param_prefix

}
# Master table
proc gen_table { IPINST table_name num_rows num_columns header_names row_name column_widgets param_prefix } {

    set Master [ipgui::add_page $IPINST -name "Master ports"]
    set Groupbox   [ipgui::add_group $IPINST -name "Master Interfaces" -parent ${Master}]
    set table [ipgui::add_table $IPINST -name $table_name -rows $num_rows -columns $num_columns -parent $Groupbox]

    # Set header names
	for {set i 0} {$i < $num_columns} {incr i} {
		# First create a parameter with table as parent
		set name [ipgui::add_static_text $IPINST -name [format "${table_name}_HEADER_%.2d" $i] -parent $table -text "<b>[lindex $header_names $i]</b>"]
  		# Second set the parameter cell_location
		set_property cell_location 0,$i $name
	}

	# Set row names
	for {set row 1} {$row < $num_rows} {incr row} {
		# First create a parameter with table as parent
        set row_zero [expr $row-1]
		set name [ipgui::add_static_text $IPINST -name [format "${table_name}_ROW_%.2d" $row] -parent $table -text [format "$row_name%.2d" $row_zero]]
  		# Second set the parameter cell_location
		set_property cell_location $row,0 $name
	}

	# Set others cells of table
	for {set row 1} {$row < $num_rows} {incr row} {
		for {set column 1} {$column < $num_columns} {incr column} {
			# Set a zero starting index variable
			set column_one [expr $column-1]
			# Set parameter name linked to the component.xml file
			set param_name [lindex $param_prefix $column_one]_[format "%.2d" [expr $row-1]]
			# Create a parameter with table as parent
        	set param [ipgui::add_param $IPINST -parent $table -widget [lindex $column_widgets $column_one] -name $param_name]
            # Set the tooltips basd on column
            if {$column_one == 0} {
                set_property tooltip {Set the width of TDATA on master port. If 8 bits is chosen, multicobs upsizers and datawidth converters are instantiated in the hierarchical cell.} ${param}
            }
            if {$column_one == 1} {
                 set_property tooltip {If true, assert m_axis_tlast on the last word of the packet (when all bytes are 0x00). If false, keep it always deasserted. May be useful to inform the downstream module when a packet has ended.} ${param}
            }
			# Set the parameter cell_location
        	set_property cell_location $row,$column $param
		}
	}
    return $table

}
# Slave table
proc gen_table2 { IPINST table_name num_rows num_columns header_names row_name2 column_widgets2 param_prefix2 } {

    set Slave [ipgui::add_page $IPINST -name "Slave ports"]
    set Groupbox   [ipgui::add_group $IPINST -name "Slave Interfaces" -parent ${Slave}]
    set table [ipgui::add_table $IPINST -name $table_name -rows $num_rows -columns $num_columns -parent $Groupbox]

    # Set header names
	for {set i 0} {$i < $num_columns} {incr i} {
		# First create a parameter with table as parent
		set name [ipgui::add_static_text $IPINST -name [format "${table_name}_HEADER_%.2d" $i] -parent $table -text "<b>[lindex $header_names $i]</b>"]
  		# Second set the parameter cell_location
		set_property cell_location 0,$i $name
	}

	# Set row names
	for {set row 1} {$row < $num_rows} {incr row} {
        set row_zero [expr $row-1]
		# First create a parameter with table as parent
		set name [ipgui::add_static_text $IPINST -name [format "${table_name}_ROW_%.2d" $row] -parent $table -text [format "$row_name2%.2d" $row_zero]]
  		# Second set the parameter cell_location
		set_property cell_location $row,0 $name
	}

	# Set others cells of table
	for {set row 1} {$row < $num_rows} {incr row} {
		for {set column 1} {$column < $num_columns} {incr column} {
			# Set a zero starting index variable
			set column_one [expr $column-1]
			# Set parameter name linked to the component.xml file
			set param_name [lindex $param_prefix2 $column_one]_[format "%.2d" [expr $row-1]]
			# Create a parameter with table as parent
        	set param [ipgui::add_param $IPINST -parent $table -widget [lindex $column_widgets2 $column_one] -name $param_name]

            set_property tooltip {Set the width of TDATA on slave port. If 8 bits is chosen, multicobs upsizers and datawidth converters are instantiated in the hierarchical cell.} ${param}
			# Set the parameter cell_location
        	set_property cell_location $row,$column $param
		}
	}
    return $table

}
proc update_gui_for_PARAM_VALUE.PORTS_NUMBER {IPINST PARAM_VALUE.PORTS_NUMBER } {
	# Read PORTS_NUMBER value
	set PORTS_NUMBER ${PARAM_VALUE.PORTS_NUMBER}
	set val [get_property value $PORTS_NUMBER]

	# Set rows to hide: start from $val+1 to last_row
	set hidden_rows ""
	for {set i [expr $val+1]} {$i < 17 } {incr i } {
		set hidden_rows [join [lappend hidden_rows $i] ,]
	}

	# Set hidden_rows property of table named "TABLE"
	set_property hidden_rows "$hidden_rows" [ipgui::get_tablespec "TABLE"  -of  $IPINST ]
    set_property hidden_rows "$hidden_rows" [ipgui::get_tablespec "TABLE2"  -of  $IPINST ]
}

proc update_PARAM_VALUE.BITS_00 { PARAM_VALUE.BITS_00 } {
	# Procedure called to update BITS_00 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS_00 { PARAM_VALUE.BITS_00 } {
	# Procedure called to validate BITS_00
	return true
}

proc update_PARAM_VALUE.BITS_01 { PARAM_VALUE.BITS_01 } {
	# Procedure called to update BITS_01 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS_01 { PARAM_VALUE.BITS_01 } {
	# Procedure called to validate BITS_01
	return true
}

proc update_PARAM_VALUE.BITS_02 { PARAM_VALUE.BITS_02 } {
	# Procedure called to update TLAST_02 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS_02 { PARAM_VALUE.BITS_02 } {
	# Procedure called to validate BITS_02
	return true
}

proc update_PARAM_VALUE.BITS_03 { PARAM_VALUE.BITS_03 } {
	# Procedure called to update BITS_03 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS_03 { PARAM_VALUE.BITS_03 } {
	# Procedure called to validate BITS_03
	return true
}

proc update_PARAM_VALUE.BITS_04 { PARAM_VALUE.BITS_04 } {
	# Procedure called to update BITS_04 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS_04 { PARAM_VALUE.BITS_04 } {
	# Procedure called to validate BITS_04
	return true
}

proc update_PARAM_VALUE.BITS_05 { PARAM_VALUE.BITS_05 } {
	# Procedure called to update BITS_05 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS_05 { PARAM_VALUE.BITS_05 } {
	# Procedure called to validate BITS_05
	return true
}

proc update_PARAM_VALUE.BITS_06 { PARAM_VALUE.BITS_06 } {
	# Procedure called to update BITS_06 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS_06 { PARAM_VALUE.BITS_06 } {
	# Procedure called to validate BITS_06
	return true
}

proc update_PARAM_VALUE.BITS_07 { PARAM_VALUE.BITS_07 } {
	# Procedure called to update BITS_07 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS_07 { PARAM_VALUE.BITS_07 } {
	# Procedure called to validate BITS_07
	return true
}

proc update_PARAM_VALUE.BITS_08 { PARAM_VALUE.BITS_08 } {
	# Procedure called to update BITS_08 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS_08 { PARAM_VALUE.BITS_08 } {
	# Procedure called to validate BITS_08
	return true
}

proc update_PARAM_VALUE.BITS_09 { PARAM_VALUE.BITS_09 } {
	# Procedure called to update BITS_09 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS_09 { PARAM_VALUE.BITS_09 } {
	# Procedure called to validate BITS_09
	return true
}

proc update_PARAM_VALUE.BITS_10 { PARAM_VALUE.BITS_10 } {
	# Procedure called to update BITS_10 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS_10 { PARAM_VALUE.BITS_10 } {
	# Procedure called to validate BITS_10
	return true
}

proc update_PARAM_VALUE.BITS_11 { PARAM_VALUE.BITS_11 } {
	# Procedure called to update BITS_11 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS_11 { PARAM_VALUE.BITS_11 } {
	# Procedure called to validate BITS_11
	return true
}

proc update_PARAM_VALUE.BITS_12 { PARAM_VALUE.BITS_12 } {
	# Procedure called to update BITS_12 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS_12 { PARAM_VALUE.BITS_12 } {
	# Procedure called to validate BITS_12
	return true
}

proc update_PARAM_VALUE.BITS_13 { PARAM_VALUE.BITS_13 } {
	# Procedure called to update BITS_13 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS_13 { PARAM_VALUE.BITS_13 } {
	# Procedure called to validate BITS_13
	return true
}

proc update_PARAM_VALUE.BITS_14 { PARAM_VALUE.BITS_14 } {
	# Procedure called to update BITS_14 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS_14 { PARAM_VALUE.BITS_14 } {
	# Procedure called to validate BITS_14
	return true
}

proc update_PARAM_VALUE.BITS_15 { PARAM_VALUE.BITS_15 } {
	# Procedure called to update BITS_15 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITS_15 { PARAM_VALUE.BITS_15 } {
	# Procedure called to validate BITS_15
	return true
}

proc update_PARAM_VALUE.BITSM_00 { PARAM_VALUE.BITSM_00 } {
	# Procedure called to update BITSM_00 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSM_00 { PARAM_VALUE.BITSM_00 } {
	# Procedure called to validate BITSM_00
	return true
}

proc update_PARAM_VALUE.BITSM_01 { PARAM_VALUE.BITSM_01 } {
	# Procedure called to update BITSM_01 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSM_01 { PARAM_VALUE.BITSM_01 } {
	# Procedure called to validate BITSM_01
	return true
}

proc update_PARAM_VALUE.BITSM_02 { PARAM_VALUE.BITSM_02 } {
	# Procedure called to update BITSM_02 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSM_02 { PARAM_VALUE.BITSM_02 } {
	# Procedure called to validate BITSM_02
	return true
}

proc update_PARAM_VALUE.BITSM_03 { PARAM_VALUE.BITSM_03 } {
	# Procedure called to update BITSM_03 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSM_03 { PARAM_VALUE.BITSM_03 } {
	# Procedure called to validate BITSM_03
	return true
}

proc update_PARAM_VALUE.BITSM_04 { PARAM_VALUE.BITSM_04 } {
	# Procedure called to update BITSM_04 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSM_04 { PARAM_VALUE.BITSM_04 } {
	# Procedure called to validate BITSM_04
	return true
}

proc update_PARAM_VALUE.BITSM_05 { PARAM_VALUE.BITSM_05 } {
	# Procedure called to update BITSM_05 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSM_05 { PARAM_VALUE.BITSM_05 } {
	# Procedure called to validate BITSM_05
	return true
}

proc update_PARAM_VALUE.BITSM_06 { PARAM_VALUE.BITSM_06 } {
	# Procedure called to update BITSM_06 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSM_06 { PARAM_VALUE.BITSM_06 } {
	# Procedure called to validate BITSM_06
	return true
}

proc update_PARAM_VALUE.BITSM_07 { PARAM_VALUE.BITSM_07 } {
	# Procedure called to update BITSM_07 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSM_07 { PARAM_VALUE.BITSM_07 } {
	# Procedure called to validate BITSM_07
	return true
}

proc update_PARAM_VALUE.BITSM_08 { PARAM_VALUE.BITSM_08 } {
	# Procedure called to update BITSM_08 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSM_08 { PARAM_VALUE.BITSM_08 } {
	# Procedure called to validate BITSM_08
	return true
}

proc update_PARAM_VALUE.BITSM_09 { PARAM_VALUE.BITSM_09 } {
	# Procedure called to update BITSM_09 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSM_09 { PARAM_VALUE.BITSM_09 } {
	# Procedure called to validate BITSM_09
	return true
}

proc update_PARAM_VALUE.BITSM_10 { PARAM_VALUE.BITSM_10 } {
	# Procedure called to update BITSM_10 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSM_10 { PARAM_VALUE.BITSM_10 } {
	# Procedure called to validate BITSM_10
	return true
}

proc update_PARAM_VALUE.BITSM_11 { PARAM_VALUE.BITSM_11 } {
	# Procedure called to update BITSM_11 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSM_11 { PARAM_VALUE.BITSM_11 } {
	# Procedure called to validate BITSM_11
	return true
}

proc update_PARAM_VALUE.BITSM_12 { PARAM_VALUE.BITSM_12 } {
	# Procedure called to update BITSM_12 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSM_12 { PARAM_VALUE.BITSM_12 } {
	# Procedure called to validate BITSM_12
	return true
}

proc update_PARAM_VALUE.BITSM_13 { PARAM_VALUE.BITSM_13 } {
	# Procedure called to update BITSM_13 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSM_13 { PARAM_VALUE.BITSM_13 } {
	# Procedure called to validate BITSM_13
	return true
}

proc update_PARAM_VALUE.BITSM_14 { PARAM_VALUE.BITSM_14 } {
	# Procedure called to update BITSM_14 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSM_14 { PARAM_VALUE.BITSM_14 } {
	# Procedure called to validate BITSM_14
	return true
}

proc update_PARAM_VALUE.BITSM_15 { PARAM_VALUE.BITSM_15 } {
	# Procedure called to update BITSM_15 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSM_15 { PARAM_VALUE.BITSM_15 } {
	# Procedure called to validate BITSM_15
	return true
}

proc update_PARAM_VALUE.BTT_USED { PARAM_VALUE.BTT_USED } {
	# Procedure called to update BTT_USED when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BTT_USED { PARAM_VALUE.BTT_USED } {
	# Procedure called to validate BTT_USED
	return true
}

proc update_PARAM_VALUE.BURST_SIZE { PARAM_VALUE.BURST_SIZE } {
	# Procedure called to update BURST_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BURST_SIZE { PARAM_VALUE.BURST_SIZE } {
	# Procedure called to validate BURST_SIZE
	return true
}

proc update_PARAM_VALUE.PORTS_NUMBER { PARAM_VALUE.PORTS_NUMBER } {
	# Procedure called to update PORTS_NUMBER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PORTS_NUMBER { PARAM_VALUE.PORTS_NUMBER } {
	# Procedure called to validate PORTS_NUMBER
	return true
}

proc update_PARAM_VALUE.TDEST_ROUTING { PARAM_VALUE.TDEST_ROUTING PARAM_VALUE.PORTS_NUMBER} {
	# Procedure called to update TDEST_ROUTING when any of the dependent parameters in the arguments change4
    set PORTS_NUMBER ${PARAM_VALUE.PORTS_NUMBER}
    set values(PORTS_NUMBER) [get_property value $PORTS_NUMBER]

    set min_value 0
    set max_value [expr $values(PORTS_NUMBER) -1]
    set_property range "$min_value,$max_value" ${PARAM_VALUE.TDEST_ROUTING}

}

proc validate_PARAM_VALUE.TDEST_ROUTING { PARAM_VALUE.TDEST_ROUTING } {
	# Procedure called to validate TDEST_ROUTING
	return true
}

proc update_PARAM_VALUE.TLAST_00 { PARAM_VALUE.TLAST_00 } {
	# Procedure called to update TLAST_00 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TLAST_00 { PARAM_VALUE.TLAST_00 } {
	# Procedure called to validate TLAST_00
	return true
}

proc update_PARAM_VALUE.TLAST_01 { PARAM_VALUE.TLAST_01 } {
	# Procedure called to update TLAST_01 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TLAST_01 { PARAM_VALUE.TLAST_01 } {
	# Procedure called to validate TLAST_01
	return true
}

proc update_PARAM_VALUE.TLAST_02 { PARAM_VALUE.TLAST_02 } {
	# Procedure called to update TLAST_02 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TLAST_02 { PARAM_VALUE.TLAST_02 } {
	# Procedure called to validate TLAST_02
	return true
}

proc update_PARAM_VALUE.TLAST_03 { PARAM_VALUE.TLAST_03 } {
	# Procedure called to update TLAST_03 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TLAST_03 { PARAM_VALUE.TLAST_03 } {
	# Procedure called to validate TLAST_03
	return true
}

proc update_PARAM_VALUE.TLAST_04 { PARAM_VALUE.TLAST_04 } {
	# Procedure called to update TLAST_04 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TLAST_04 { PARAM_VALUE.TLAST_04 } {
	# Procedure called to validate TLAST_04
	return true
}

proc update_PARAM_VALUE.TLAST_05 { PARAM_VALUE.TLAST_05 } {
	# Procedure called to update TLAST_05 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TLAST_05 { PARAM_VALUE.TLAST_05 } {
	# Procedure called to validate TLAST_05
	return true
}

proc update_PARAM_VALUE.TLAST_06 { PARAM_VALUE.TLAST_06 } {
	# Procedure called to update TLAST_06 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TLAST_06 { PARAM_VALUE.TLAST_06 } {
	# Procedure called to validate TLAST_06
	return true
}

proc update_PARAM_VALUE.TLAST_07 { PARAM_VALUE.TLAST_07 } {
	# Procedure called to update TLAST_07 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TLAST_07 { PARAM_VALUE.TLAST_07 } {
	# Procedure called to validate TLAST_07
	return true
}

proc update_PARAM_VALUE.TLAST_08 { PARAM_VALUE.TLAST_08 } {
	# Procedure called to update TLAST_08 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TLAST_08 { PARAM_VALUE.TLAST_08 } {
	# Procedure called to validate TLAST_08
	return true
}

proc update_PARAM_VALUE.TLAST_09 { PARAM_VALUE.TLAST_09 } {
	# Procedure called to update TLAST_09 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TLAST_09 { PARAM_VALUE.TLAST_09 } {
	# Procedure called to validate TLAST_09
	return true
}

proc update_PARAM_VALUE.TLAST_10 { PARAM_VALUE.TLAST_10 } {
	# Procedure called to update TLAST_10 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TLAST_10 { PARAM_VALUE.TLAST_10 } {
	# Procedure called to validate TLAST_10
	return true
}

proc update_PARAM_VALUE.TLAST_11 { PARAM_VALUE.TLAST_11 } {
	# Procedure called to update TLAST_11 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TLAST_11 { PARAM_VALUE.TLAST_11 } {
	# Procedure called to validate TLAST_11
	return true
}

proc update_PARAM_VALUE.TLAST_12 { PARAM_VALUE.TLAST_12 } {
	# Procedure called to update TLAST_12 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TLAST_12 { PARAM_VALUE.TLAST_12 } {
	# Procedure called to validate TLAST_12
	return true
}

proc update_PARAM_VALUE.TLAST_13 { PARAM_VALUE.TLAST_13 } {
	# Procedure called to update TLAST_13 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TLAST_13 { PARAM_VALUE.TLAST_13 } {
	# Procedure called to validate TLAST_13
	return true
}

proc update_PARAM_VALUE.TLAST_14 { PARAM_VALUE.TLAST_14 } {
	# Procedure called to update TLAST_14 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TLAST_14 { PARAM_VALUE.TLAST_14 } {
	# Procedure called to validate TLAST_14
	return true
}

proc update_PARAM_VALUE.TLAST_15 { PARAM_VALUE.TLAST_15 } {
	# Procedure called to update TLAST_15 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TLAST_15 { PARAM_VALUE.TLAST_15 } {
	# Procedure called to validate TLAST_15
	return true
}
