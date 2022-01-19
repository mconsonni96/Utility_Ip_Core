# MuxDebugger
This is a Vivado 2017.3 Project, used to make possible the debugging of the BRAM memories of the AXI4Stream_MagicCalibrator among up to 16 channels.
This module basically implements a Tree Multiplexer for the debug ports of the AXI4Stream_MagicCalibrator, up to a 16 to 1 Mux.

![Scheme of a 4to1 implementation of a 16 to 1 Mux ](doc/img/Mux16to1base4.svg)

As the number of TDC channels in the design is defined, the user can select the proper value also for the Multiplexer if debugging is needed.
Moreover, one can choose the type of mux to implement the Tree (4to1, recommended, or 2to1) and what signalns to transmit to the debugger (CT/CC or both).
In order implement the tree, some functions are used to calculate the number of multiplexing stages (steps) to use and the number of Mux for each of these steps.
A pipeline used as a buffer is created to store the values at input and output of every step, in order to be able to feed the proper buses to the following stage, just like in the image below, where a 16 to 1 Tree Mux implemented with 2to1 multiplexers is shown, with a reference to the described pipeline used to store the values.

![Tree with 2to1 mux and pipeline scheme](doc/img/TreeMux_Pipe.svg)

# IP-CORE

This is an image of the AXI4Stream_MuxDebugger, shown with only 4 input ports

![IP-CORE scheme](doc/img/Mux_IPClosed.png)

## Generic

- **MAX_CHANNEL**: Max number of TDC channels, *POSITIVE* type *16* is the maximum.
- **NUM_CHANNEL**: Total number of implemented channels, *NATURAL* type *RANGE 1 to 16*, default **16**.
- **MUX_TYPE**: Number of Bits used to Calibrate, *STRING* type *2to1 or 4to1*, , default **4to1**.
- **DEFAULT_BIT_SEL**: Default number of bits for selection, *POSITIVE* type, default **4**.
- **DEBUG_MODE_CT**: True Activates the Debug of CalibTable, *Boolean* type, default "TRUE".
- **DEBUG_MODE_CC**: True Activates the Debug of CharactCurve, *Boolean* type, default "TRUE".

![IP-CORE Generic](doc/img/Generic.png)

## Port
Only one port example for both CT and CC is taken in consideration, since there are 16 equal ports each (from s00 to s15).

- **reset**: Asynchronous reset active high (of Debugger core).

- **clk**: System clock (of Debugger core).
- **s00_axis_debugct**: AXI4 Stream Slave (Input) interface, CT data coming from MagicCalibrator.
	- **s00_axis_debugct_tvalid**: Valid of debug port for CalibTable, *STD_LOGIC* type.
	- **s00_axis_debugct_tdata**: Actual data of CalibTable (same of data written in calib table), *STD_LOGIC_VECTOR(AXI4_LENGTH-1 DOWNTO 0)* type.
	- **s00_axis_debugct_tlast**: tlast of Axis input debug port for CalibTable to signal end of data set, *STD_LOGIC* type.

- **s00_axis_debugcc**: AXI4 Stream Slave (Input) interface, CC data coming from MagicCalibrator.
	- **s00_axis_debugcc_tvalid**: Valid of debug port for CharactCurve, *STD_LOGIC* type.
	- **s00_axis_debugcc_tdata**: Actual data of CharactCurve (same of data written in calib table), *STD_LOGIC_VECTOR(AXI4_LENGTH-1 DOWNTO 0)* type.
	- **s00_axis_debugcc_tlast**: tlast of Axis input debug port for CharactCurve to signal end of data set, *STD_LOGIC* type.

- **sel**: Input port to select which of the Channels to be sent to the Debugger, *STD_LOGIC_VECTOR(DEFAULT_BIT_SEL-1 downto 0)* type.

- **m_axis_ct**: AXI4 Stream Master interface of CT, to be sent to the Debugger.
	- **m_axis_tvalid_ct**: Mux output Valid of CT, *STD_LOGIC* type.
	- **m_axis_tdata_ct**: Mux output Data of CT, *STD_LOGIC_VECTOR(AXI4_LENGTH-1 downto 0)* type.
	- **m_axis_tlast_ct**: Mux output tlast of CT, *STD_LOGIC* type.

- **m_axis_cc**: AXI4 Stream Master interface of CC, to be sent to the Debugger.
	- **m_axis_tvalid_cc**: Mux output Valid of CC, *STD_LOGIC* type.
	- **m_axis_tdata_cc**: Mux output Data of CC, *STD_LOGIC_VECTOR(AXI4_LENGTH-1 downto 0)* type.
	- **m_axis_tlast_cc**: Mux output tlast of CC, *STD_LOGIC* type.



 ![IP-CORE scheme with input and output ports](doc/img/Mux_IPOpen.png)

# Sources

We can find the files of *AXI4Stream_MuxDebugger* in VHDL in *hdl/*:

- **AXI4Stream_MuxDebugger**: AXI4Stream module instanciating up to 2 AXI4Stream_MuxDebuggerWrapper.
- **AXI4Stream_MuxDebuggerWrapper**: This module manages the construction of the tree structure to implement the full Multiplexer starting from single Muxes
- **Mux**: This module is the simple 2to1 or 4to1 multiplexer
- **LocalPackage_MUX**: In this package are contained the functions and procedures used by the MagicCalibrator and the MagicDebugger


# Simulation

We can find the VHDL simulation and relative Waveforms of *AXI4Stream_MuxDebugger* in the directory *src/*.

 - **MuxWaveforms**: Waveforms of *tb_mux_behav.wcfg*.

![Simulation showing that the selection goes correctly to output](doc/img/Sim_mux.png)
