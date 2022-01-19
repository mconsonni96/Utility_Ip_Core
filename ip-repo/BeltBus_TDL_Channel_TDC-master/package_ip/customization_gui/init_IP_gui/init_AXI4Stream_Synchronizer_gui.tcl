
# Definitional proc to organize AXI4Stream Sycnhronizer widgets for parameters.
proc init_AXI4Stream_Synchronizer_gui { IPINST Page} {

	#Adding Page
    set Synchronizer [ipgui::add_page $IPINST -name $Page]
    set DATA_WIDTH [ipgui::add_param $IPINST -name "DATA_WIDTH" -parent ${Synchronizer}]
    set_property tooltip {Variable that sets the dimensions of the slave and master data} ${DATA_WIDTH}
    set MODE_SEL [ipgui::add_param $IPINST -name "MODE_SEL" -parent ${Synchronizer} -widget comboBox]
    set_property tooltip {Choice between the CDC_Synchronizer and the FIFO_Synchronizer} ${MODE_SEL}
    #Adding Group
    set FIFO_Dimensions [ipgui::add_group $IPINST -name "FIFO Dimensions" -parent ${Synchronizer}]
    set SYNCH_CDC_SYNC_STAGES [ipgui::add_param $IPINST -name "SYNCH_CDC_SYNC_STAGES" -parent ${FIFO_Dimensions}]
    set_property tooltip {Number of synchronization stages in the CDC path} ${SYNCH_CDC_SYNC_STAGES}
    set SYNCH_RELATED_CLOCKS [ipgui::add_param $IPINST -name "SYNCH_RELATED_CLOCKS" -parent ${FIFO_Dimensions}]
    set_property tooltip {It specifies if the two clocks are related or not} ${SYNCH_RELATED_CLOCKS}
    set FIFO_DEPTH [ipgui::add_param $IPINST -name "FIFO_DEPTH" -parent ${FIFO_Dimensions} -widget comboBox]
    set_property tooltip {Depth of the FIFO} ${FIFO_DEPTH}
    set SYNCH_FIFO_MEMORY_TYPE [ipgui::add_param $IPINST -name "SYNCH_FIFO_MEMORY_TYPE" -parent ${FIFO_Dimensions} -widget comboBox]
    set_property tooltip {Choice between the different types of FIFO memory, it can be: auto, block or distributed} ${SYNCH_FIFO_MEMORY_TYPE}

    #Adding Group
    set CDC_Dimensions [ipgui::add_group $IPINST -name "CDC Dimensions" -parent ${Synchronizer}]
    set SRC_SYNC_FF [ipgui::add_param $IPINST -name "SRC_SYNC_FF" -parent ${CDC_Dimensions}]
    set_property tooltip {Number of synchronization stages in the CDC path of the source(slave)} ${SRC_SYNC_FF}
    set DEST_SYNC_FF [ipgui::add_param $IPINST -name "DEST_SYNC_FF" -parent ${CDC_Dimensions}]
    set_property tooltip {Number of synchronization stages in the CDC path of the destination (master)} ${DEST_SYNC_FF}

}
