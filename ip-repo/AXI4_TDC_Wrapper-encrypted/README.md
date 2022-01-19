# MagicCalibrator_Debugger
This is a Vivado 2017.3 Project, used to make possible the debugging of the BRAM memories that make up the Calibration Table and Characteristic Curve of the AXI4Stream_MagicCalibrator.
This module manages the duplication of the DualPort XPM SDPRAM (*Calibration Table*), where we compute an histogram of the incoming data, and the integrated SinglePort XPM SPRAM (*CharacteristicCurve*) which corresponds to the integration of the histogram (*CalibrationTable*).

![Scheme of the debugger ](doc/img/MagicDebScheme.svg)

The content of the 2 memories is sniffed during the integration process of the MagicCalibrator, from the 1st to the last address of the memories, bringing out to the Debugger, for each memory, the data, valid and last ports.
<br/>
The sniffing of the data is triggered by software, and then a CDC allows the communication between the axi4-wrapper (which talks to the PC) and the Debugger core, since they work at different clock speeds.
<br/>

![Functional scheme](doc/img/Func_scheme.svg)
<br/><br/>

When a memory is requested to be read, the module changes its state from IDLE (the state at start up of the system) to WAITING, where it stays until the set of data being transmitted in that moment is ended, not to mistakenly take just some of the data of a certain set. When there is no more data being transmitted, the state of the debugger goes to WRITE, where it enables the flags to actually write the memories with the data that will come up next. Once the memories are completely copied, the debugger core changes state to READ, rises an Available flag, in order to communicate the presence of the requested data, deasserts the write enable flag and enables the EnB flag, making possible to the axi4-wrapper to directly read the memory through the B Port, by clocking itself the SDPRAM and sending it the address to be read.
Whenever a new Req_To_Read arrives, the debugger core will go back to WAITING state, and the process can start all over again.

![Debugger Core scheme](doc/img/FSM.svg)

<br/>
<br/>
XPM primitives from Xilinx are used, here you can see how they are represented

![XPM Schemes](doc/img/xpm_schemes.svg)


# IP-CORE

This is an image of the AXI4_MagicDebugger wrapper for the AXI4 interface

![IP-CORE scheme](doc/img/Deb_IPClosed.png)

## Generic

- **DEBUG_MODE_CT**: True Activates the Debug of CalibTable, *Boolean* type, default "TRUE".
- **DEBUG_MODE_CC**: True Activates the Debug of CharactCurve, *Boolean* type, default "TRUE".
- **BIT_UNCALIBRATED**: Bit Dimension of Uncalibrated_TDL, *POSITIVE* type *RANGE  2  TO  16*. *2 <sup>BIT_UNCALIBRATED</sup>-1* is the memory length.  
- **SAVE_BIT**: Bit used to decide whether to save one bit in *CharactCurveSPRAM*, *BOOLEAN* type, default **TRUE**.
- **BIT_CALIBRATION**: Number of Bits used to Calibrate, *POSITIVE* type *RANGE  1  TO  32*. *BIT_CALIBRATION* is the memory width.
- **BIT_RESOLUTION**: Number of Bits of the Calibrated_TDL, *POSITIVE* type *RANGE  1  TO  32*.
- **AXI4_LENGTH**: Length of the axi4 ports to set the debug ports length, *POSITIVE* type, default "32".
- **MEMORY_PRIMITIVE**: Length of the axi4 ports to set the debug ports length, *STRING* type, default "auto".

![IP-CORE Generic](doc/img/Generic.png)

## Port
Only ports relative to debugger core are taken in consideration, the AXI slave port is a standard axi slave interface.

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

- **m00_axis_autopush**: AXI4 Stream Master interface, to command the autopush request to the host.
	- **m00_axis_autopush_tvalid**: Valid of Autopush, *STD_LOGIC* type.
	- **m00_axis_autopush_tdata**: Autopush to be sent if *dest_out* of MagicCal_Debugger is 1, 2 or 3, *STD_LOGIC_VECTOR(55 downto 0)* type.
	- **m00_axis_autopush_tready**: Ready for Autopush from host, *STD_LOGIC* type.


 ![IP-CORE scheme with input and output ports](doc/img/Deb_IPOpen.png)

# Sources

We can find the files of *MagicCalibrator_Debugger* in VHDL in *hdl/*:
- **AXI4_MagicDebugger**: AXI4 Wrapper wrapping axi4-wrapper and MagicCalibrator_Debugger.
in the nested folder *hdl/axi4-wrapper* we can find:
- **axi4-wrapper**: AXI4 Wrapper for the AXI template module, managing the AXI protocol communication.
	- **axi4-interface**: This module is a simple AXI interface with a XPM_CDC added for communicating with the Debugger core.
	- **axi_channel_slice_register**: This module implements a channel slice register, it can be generated or not depending on a generic in axi4-wrapper
in the nested folder *hdl/MagicCalibrator_Debugger* we can find:
- **MagicCalibrator_Debugger**: This module manages the instances of 1 or 2 DebugMemoryUnit (one for CT, one for CC) with a XPM_CDC added for communicating with the axi4-wrapper.
	- **DebugMemoryUnit**: This module manages the actual duplication of one of the memories of the MagicCalibrator
	- **MemorySDPRAM**: This module simply instanciates an SDPRAM with the proper dimensions to copy the MC memories.
	- **LocalPackage_MC**: In this package are contained the functions and procedures used by the MagicCalibrator and the MagicDebugger


# Simulation

We can find the VHDL simulation and relative Waveforms of *MagicCalibrator_Debugger* in the directory *cocotb/axi_tpl/*.

 - **DebuggerWaveforms**: Waveforms of *tb_axi4memory*.

![IDLE and WAIT states Image](doc/img/wf1.png)

![Write state Image](doc/img/wf2.png)

![Read state Image](doc/img/wf3.png)
