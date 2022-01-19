# BeltBus_NodeInserter
This is a Vivado 2017.3 Project, implementing a parallel to serial converter, with the precise aim to have a serial and temporally ordered output starting from the parallel inputs coming from the TDC.
Every node of the BeltBus has two inputs: one is a AXI4-Stream interface consisting of a Valid and a Data channel, *s00_left_tvalid* and *s00_left_tdata*, corresponding to the current channel input, and a second one, coming from the previous node of the BeltBus, (*s01_top_tvalid*, *s01_top_tdata*).
Data are inserted in the bus thanks to the Inserter module, composed by a simple multiplexer controlled by a specific logic, which can select the older between top and left input. However due to delays along the BeltBus chain, the comparison between data is not fair, if a suitable delay is not applied t the left data. For this reason a specific module in present, called Delay_Synchronizator, which basically applies a delay proportional to the position in the chain: the closer to the end of the bus, the larger will be the delay applied to left data, in order to compensate for the unavoidable propagation delay of the top one.\n
Internally to the Inserter, another module is instantiated: the Super Sampler, which is able to guarantee a ready-valid handshake without losing a clock cycle. This module is therefore used to increase frequency operation of the BeltBus. In the figure we can appreciate an overall representation of the module.

![BeltBus block scheme](doc/image/BeltBus.png)


# IP-Core
Wrapping of Node_Inserter for BeltBus interface for IP-Core.

![IP-Core Image](doc/image/IP-Core.png)

# Generic
## ------------------------ Number of Channels ----------------------------
- **NUM_CH**: Number of Channels [1:16], *NATURAL* type, ranges from 0 to 16, initialized at 2.
- **NUM_NODE**: Node number, *NATURAL* type initialized at zero.
## ------------------------------------------------------------------------

## ----------------------------- Data-------------------------------------
- **PASS_THROUGH**: if TRUE, data is directly transmitted at the BeltBus output.	*BOOLEAN* type initialized FALSE.
- **BIT_NUM_CH**:	Bit for Number of Channels, *NATURAL TYPE* initialized at 4.
- **BIT_FID**: Bit Dimension of the Fid part of the Timestamp, *NATURAL* type. If *BIT_FID = 0* the belt bus is removed and it is a standard axi4 stream.
- **BIT_COARSE**: Bit of Coarse Counter, if 0 the Coarse Pipeline is removed, *NATURAL* type *RANGE 0 TO 32*.
- **BIT_RESOLUTION**: Number of Bits of the Calibrated_TDL, *POSITIVE* type *RANGE 1 TO 32*.
## ------------------------------------------------------------------------

## ------------------------- Generics to tune -----------------------------
- **RETAIN_SINGLE_NODE**: Number of clock cycles necessary to expose a measure,	*INTEGER*	initialized at	1;
- **HOLD_ON_SINGLE_NODE**: Number of clock cycles after the RETAIN necessary to force the injection of a measure in a single node *INTEGER*	initialized at 1;
- **HOLD_ON_MIN_MOD**:*INTEGER*	initialized at 1;
- **HOLD_ON_INTEGRAL**:	*INTEGER*	initialized at	5;
- **INJECT_CYCLES**:	*INTEGER*	initialized at	15
## ------------------------------------------------------------------------
![Generic Image](doc/image/Generic.png)
## ------------------------------------------------------------------------

# Port

## ---------------------------- Reset/Clock -------------------------------
- **clk**		: System Clock, *std_logic* type
- **reset**	: Asynchronus reset	*std_logic* type
## ------------------------------------------------------------------------

## -------------------------- BeltBus (AXI4Stream) Data --------------------

## ----------- AXI4Stream to Insert --------------
- **s00_left_tvalid**	: Valid of axi data to insert in the bus,	*std_logic*	type
- **s00_left_tdata**	:	Data to insert in the bus *std_logic_vector* with dimension ((((BIT_FID + BIT_COARSE + BIT_RESOLUTION-1)/8+1)x8)-1) used only (BIT_FID + BIT_COARSE + BIT_RESOLUTION-1) bits
- **s00_left_tready**	:	Ready of the data to insert in the bus *std_logic*
## ------------------------------------------------

## ----------- BeltBus (AXI4Stream) in ------------
- **s01_top_tvalid**	:	Valid of BeltBus data coming from previous channel,	*std_logic*	type
- **s01_top_tdata**	: BeltBus data coming from previous channel	*std_logic_vector* with dimension ((((BIT_FID + BIT_COARSE + BIT_RESOLUTION-1)/8+1)x8)-1) used only (BIT_FID + BIT_COARSE + BIT_RESOLUTION-1) bits
- **s01_top_tready**	:	Ready of BeltBus data coming from previous channel,	*std_logic*	type
## ------------------------------------------------

## ---------- BeltBus (AXI4Stream) out ------------
- **m00_out_tvalid**	:	Valid of the output data ,*std_logic* type
- **m00_out_tdata**	:	Output data	*std_logic_vector* with dimension ((((BIT_NUM_CH + BIT_FID + BIT_COARSE + BIT_RESOLUTION-1)/8+1)x8)-1) used only (BIT_FID + BIT_COARSE + BIT_RESOLUTION-1) bits
- **m00_out_tready**	:	Ready bit of the output data, *std_logic* type
## ------------------------------------------------

## ------------------------------------------------------------------------
![Ports Image](doc/image/Ports.png)


# Sources

 We can find in *hdl/* the following module directory:

- **BeltBus_NodeInserter**: Wrapper used for rename the input and output interfaces with AXI4-Stream for IP-Core, input as slave and output as a master.
- **BeltBus_NodeInserterWrapper**: Wrapper used for rename the input and output interfaces with pseudo AXI4-Stream for HDL, input as slave and output as a master.
- **Inserter**: Basic module for inserting data in the BeltBus
- **Delay_Synchronizator**:  An AXI4Stream data (*s00_left_tdata*) is passed by the top module to this block computes the delay to assign at the timestamp before injecting it into the BeltBus chain
- **Super_Sampler**: It is able to guarantee a ready-valid handshake without losing a clock cycle.

# Cocotb simulation
 We can find in  *cocotb/* the following module directory:

- *build/* containing the results of cocotb simulation
- *sim/* containing **Tester_Node_Inserter** and **Node_Inserter** used for hdl simulation
- *xpm/* containing unisim libraries used for cocotb simulation
- *Makefile* that sets the parameters and the references to drive cocotb simulation
- *Waveform* is a GTKWave representation of the waveforms of ports and signals
![wave Image](doc/image/BeltBus GTKWave.png)
