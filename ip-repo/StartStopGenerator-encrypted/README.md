# Statr-Stop Generator

This is a Vivado Project, used as functions generator to test the Timme to Digital (TDC) system.
The module is used to generate a periodic signal not connected to the TDC clock, in this way the TDC can sample this signal and assign a timestamp.

In order to generate this signal there two ways based on the type of FPGA we are using:
- if the FPGA has two clock signals we can use the second as periodic signal that is divided to have a lower frequency.

- if the FPGA has only one clock, we need to generate a periodic signal using a ring oscillator. The ring oscillator is built with a NAND port, and a delay block (CARRY4) in the feedback.

![Ring Oscillator Structure](doc/img/RingOscillator.svg)

In this way we obtain a periodic signal with period time equal to the delay time in the feedback, and we can use the divider to set the output frequency.


At this point the signal we want to generate two different output signals (Start and Stop) to use them as input signal of two different TDC channels.
In order to do that the signal generated is used as Start signal, and the Stop signal is obtained by simply delaying the Start signal with a series of CARRY4 blocks.

![Start and Stop output](doc/img/StartStop.svg)

The value of the divider can be set by generic *HALF_DIVIDER*, but also can be changed on-line by input ports selecting TRUE for *TUNING_MODE*.


# IP-CORE

This is the picture of the StartStopGenerator for IP-Packager.

![IP-CORE scheme](doc/img/IP.png)

### Generic

- **NUM_CARRY_BLOCK**: Number of CARRY4 Block in 7-Series, *POSITIVE*.
- **TUNING_MODE**: Choice between *DIVIDER_INIT* generic and *Divider* port, if *TRUE* we make active the signal coming from the port, if *FALSE* we choose the value of the generic, *BOOLEAN* type.
- **HALF_DIVIDER**: Dividing value for the input signal, *POSITIVE* type.
- **DIVIDER_INIT**:  Initialization of *Divider* if *TUNING_MODE=TRUE*, else (*TUNING_MODE=FALSE*) it sets statically the Divider to *DIVIDER_INIT*, *NATURAL* type.
- **CLK_SELECT**: Choice between *RING OSCILLATOR* vs *EXTERNAL*, *STRING* type.
- **START_STOP_DALAY_NUM_CARRY_BLOCK**: Delay Between The Strat and Stop Signals in CARRY4, *NATURAL* type.

![IP-CORE Generic](doc/img/Generic.png)

### Port

- **reset**: Asynchronous reset active high (if '1' reset state).

- **clk_in**: External Clock

- **Divider**: Extra divider set by the switch of the board, *STD_LOGIC_VECTOR(16-1 downto 0)* type

- **StartOut**: Start signal generated from *RingOscillator* or *clk_in*, *STD_LOGIC* type.
- **StopOut**: Stop signal generated delaying *StartOut*, *STD_LOGIC* type.


### Sources
We can find the files of *ShiftClockPhaser* in VHDL in *hdl/*:
- **StartStopGenerator**: Start-Stop Generator with a internal Delay.
- **RingOscillator**: This is the Ring Oscillator internal to FPGA.
- **OscDivider**: This module divides the output of *RingOscillator* or *clk_in* by 2 times *HALF_DIVIDER*
- **Divider_SS**: This module divides the output of *OscDivider* by a number determined by *Divider* and/or *DIVIDER_INIT*..
- **X7S_CARRY4_Delay**: This module creates a delay using the CARRY4 primitive for 7-Serie based on CARRY4.


### Simulation

We can find the VHDL simulation and relative Waveforms of *StartStopGenerator* in the directory *src/*. It is possible to modify all the parameters.

- **tb_StartStopGenerator**: VHDL simulation of *StartStopGenerator*, it can not consider the Carry4

![Vivado wave simulation](doc/img/Simulation.png)
