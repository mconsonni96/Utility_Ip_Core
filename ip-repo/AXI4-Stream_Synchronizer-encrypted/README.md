# AXI4Stream Synchronizer
This is a Vivado project used to synchronize the stream of data from a clock domain to another one. This module instantiates the component *CDC_Synchronizer* or the *FIFO_Synchronizer* depending on the value of the generic *MODE_SEL*. In both cases the module manages a slave AXI4 port clocked at *s00_axis_aclk* and a master AXI4 port clocked at *m00_axis_aclk*. In both cases the dimension of the data (both slave and master) is given by the generic *DATA_WIDTH*.
![Chhosing of the instantiation] (doc/img/disegno.png)


We can now better explain the two cases:

- In case the generic *MODE_SEL* is set to *CDC*, the module instantiates the component *CDC_Synchronizer*, it uses the component *cdc_xpm_handshake* that can be seen in the following image

![cdc_xpm_handshake] (doc/img/cdc_xpm_handshake_component.png)

This component is used in order to manage the flow of data with two different clock domains without saving them into a memory. When a valid data arrives at the slave port (it can be recognized because in this case the signal *s00_axis_tvalid* goes high) and the signal *s00_axis_tready* is high, then the data is passed to *s00_axis_tdata*. We have a valid data on the master port when the *m00_axis_tvalid* is high,  when also the signal *m00_axis_tready* is high ( that means that the receiver is ready to receive a new data) the data *m00_axis_tdata* are send to the destination. In the following image we can see how data are madaged by the *CDC_Synchronizer* considering the two different clocks.

![Data on the CDC_Synchronizer] (doc/img/data_cdc.png)

- In case the generic *MODE_SEL* is set to *FIFO* , the module instantiates the component *FIFO_Synchronizer*, it uses the component *fifo_xpm_async* that can be seen in the following image

![fifo_xpm_async] (doc/img/fifo_xpm_async_component.png)

This component is used in order to manage the flow of data with two different clock domains saving them into a FIFO memory. The type of the fifo is given by the generic *FIFO_MEMORY_TYPE*. Input data are stored into the fifo if it is not full (*full* is low) and if the data on the slave port are valid (*s00_axis_tvalid* is high). Data can go to output and can be removed from the fifo when the fifo is not empty (*empty* low) and when the destination is ready to receive (*m00_axis_tready* is high). In the following image we can see how data are managed by the *FIFO_Synchronizer*, we can notice that data stay on the slave port one period of *s00_axis_aclk*, while on the master port they stay one period of *m00_axis_aclk* and since the periods of the two clock cycles are different, the data spend a different amount of time in the two ports. In addition we can notice that data arrive to the master port with a certain delay that is determined by the generic *CDC_SYNC_STAGES*.

![Data on the FIFO_Synchronizer] (doc/img/data_fifo.png)

# IP-Core

Wrapping of the *AXI4Stream_Synchronizer* gives the following IP-Core:

![IP-core image] (doc/img/ip.png)

## Generic

- **MODE_SEL**:	CDC_Synchronizer is instantiated if MODE_SEL = "CDC", while FIFO_Synchronizer is instantiated if MODE_SEL = "FIFO", *STRING* type.

- **DATA_WIDTH**: Dimension of the data vectors, *POSITIVE* type.

- **FIFO_MEMORY_TYPE**: Type of FIFO, it can be "auto", "block", or "distributed", *STRING* type.

- **RELATED_CLOCKS**: Specifies if the s00_axis_clk and m00_axis_clk are related, if RELATED_CLOCKS=True the two clocks are locked, *BOOLEAN* type.

- **FIFO_WRITE_DEPTH** :FIFO Depth, Power of 2, *INTEGER* type *RANGE 16 to 4194304*.

- **CDC_SYNC_STAGES**: Cross Domain Clock Synch Stages: specifies the number of synchronization stages on the CDC path, *INTEGER* type *RANGE 2 TO 8*.

- **DEST_SYNC_FF**: Cross Domain Clock Synch Stages of the destination (master), *INTEGER* type *RANGE 2 TO 10*.

- **SRC_SYNC_FF**: Cross Domain Clock Synch Stages of the source (slave), *INTEGER* type *RANGE 2 TO 10*.

![Generics image] (doc/img/ip_generics.png)

## Port

- **s00_axis_aclk**: Clock of the slave port, *STD_LOGIC* type

- **s00_axis_tvalid**: Valid of the slave port, *STD_LOGIC* type

- **s00_axis_tdata**: Input data, *STD_LOGIC_VECTOR (DATA_WIDTH-1 DOWNTO 0)* type

- **s00_axis_tready**: Ready of the slave port, *STD_LOGIC* type

- **m00_axis_aclk**: Clock of the master port, *STD_LOGIC* type

- **m00_axis_tready**: Ready of the master port, *STD_LOGIC* type

- **m00_axis_tvalid**: Valid of the master port, *STD_LOGIC* type

- **m00_axis_tdata**: Output data,  *STD_LOGIC_VECTOR (DATA_WIDTH-1 DOWNTO 0)* type

![Ports image] (doc/img/ip_ports.png)

# Sources

We can find in "hdl/" the following module directory:

- **AXI4Stream_Synchronizer**: Wrapper use to generate *AXI4Stream_SynchronizerWrapper* and keep the dimensions of *s00_axis_tdata* and *m00_axis_tdata* as multiples of 8
- **AXI4Stream_SynchronizerWrapper**: Wrapper use to generate *CDC_Synchronizer* or *FIFO_Synchronizer* depending on the value of the generic *MODE_SEL*
- **CDC_Synchronizer**: Module that synchronizes the stream of data using the *cdc_xpm_handshake* component
- **FIFO_Synchronizer**: Module that synchronizes the stream of data using the *fifo_xpm_async* component

# Simulation

We can find in "src/" the following module directory:

- **tb_AXI4Stream_SynchronizerWrapper**: HDL simulation of the AXI4Stream_Synchronizer.
- **tb_AXI4_Stream_Synchronizer_behav_cdc**: waveforms of the simulation obtained when *MODE_SEL="CDC"*, so when *CDC_Synchronizer* is instantiated.
- **tb_AXI4_Stream_Synchronizer_behav_fifo**: waveforms of the simulation obtained when *MODE_SEL="FIFO"*, so when *FIFO_Synchronizer* is instantiated.

In the following image we see the simulation for *MODE_SEL="CDC"*, so the behaviour of the *CDC_Synchronizer*

![Waveforms for the simulation of the CDC Synchronizer] (doc/img/sim_cdc.png)

While in the following image we see the simulation for *MODE_SEL="FIFO"*, so the behaviour of the *FIFO_Synchronizer*

![Waveforms for the simulation of the FIFO Synchronizer] (doc/img/sim_fifo.png)
