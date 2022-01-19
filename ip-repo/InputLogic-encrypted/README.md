# InputLogic (OLD)
This is a Vivado Project, InputLogic for Xilinx 7-Series based on flip-flop FDCE primitive.
First the module, given the *AsyncEventIn*, generates a stretched output (*Stretcher_IL* ), with a duration that is a multiple of the clock period. The *StretchedEventOut* starts in correspondence of the Rising or Falling edge of *AsyncEventIn* by means of *EdgeTrigger_IL*.
In the following figures we can see the concept just explained:

**RISING EDGE** :

![RISE stretch image](doc/img/FDCE_RISE.svg)   

**FALLING EDGE** :

![FALL stretch image](doc/img/FDCE_FALL.svg)    

The *Divider_IL* module generates an *AsyncEventOut* as output that is a decimation of *StretchedEventOut* pulses thanks to a divider.
In the following figure we can see the just explained concept (in the case of *Divider = 1* ):

![Divider image](doc/img/Divider.png)


# IP-Core
This IP-Core wraps the  *EdgeTrigger_IL*, *Stretcher_IL*, and *Divider_IL*.

![IP-Core image](doc/img/InputLogic_IP-Core.png)

## Generic

  - **TUNING_MODE**: Choice between *EDGE_TRIGGER_INIT*, *STRETCH_LENGTH_INIT, DIVIDER_INIT* generic and *EdgeTrigger*, *StretchLength*, *Divider* ports, if *TRUE* we choose the signal coming from the port, if *FALSE* we choose the value of the generic, *BOOLEAN* type.

  - **INPUT_BUFFER_TYPE**: Type of input buffer Single-Ended (IBUF) o Fully-Differential (IBUFDS).

  - **EDGE_TRIGGER_INIT**: Initialization of the Edge Trigger of the stretcher (*EdgeTrigger*) if *TUNING_MODE=TRUE*, else (*TUNING_MODE=FALSE*) it sets statically the Edge Trigger. *RISE* if we sample on the rising edge of the input or *FALL* if we sample on the falling edge of the input, *STRING* type.

  - **BIT_STRETCH_LENGTH**: Bit length of StretchLength, *NATURAL RANGE 0 TO 4* type, **if BIT_STRETCH_LENGTH = 0 the Stretcher_IL is NOT instantiated**.
  - **STRETCH_LENGTH_INIT**: Initialization of *StretchLength* if *TUNING_MODE=TRUE*, else (*TUNING_MODE=FALSE*) it sets statically the Length of the Stretched signal.*NATURAL RANGE 0 TO 2^BIT_STRETCH_LENGTH-1* type.

  - **BIT_DIVIDER**: Bit Length of Divider, *NATURAL RANGE 0 TO 4* type, **if BIT_DIVIDER = 0 the Divider_IL is NOT instantiated**.
  - **DIVIDER_INIT**: Initialization of *Divider* if *TUNING_MODE=TRUE*, else (*TUNING_MODE=FALSE*) it sets statically the Divider for the Stretched signal. *NATURAL RANGE 0 TO 2^BIT_DIVIDER-1* type.

![Generic image](doc/img/InputLogic_Generic.png)

## Port

  - **reset**: Asyncronous system reset, if '1' goto reset state, *STD_LOGIC* type.

  - **clk**: TDC system clock, *STD_LOGIC* type.

  - **EdgeTrigger**: Edge Trigger of the stretcher, '1' if we sample on the rising edge of the input or '0' if we sample on the falling edge of the input, *STD_LOGIC* type.
  - **StretchLength**: Stretched length as clk pulses, *STD_LOGIC_VECTOR(BIT_STRETCH_LENGTH-1 downto 0)* type.
  - **Divider**: Divider of AsyncEventIn not synchronized to AsyncEventIn, *STD_LOGIC_VECTOR(BIT_DIVIDER-1 downto 0)* type.

  - **AsyncEventIn**: Asynchronous Input Event Single-Ended mode, *STD_LOGIC type*.
  - **AsyncEventIn_Diff_P/N**: Asynchronous Input Event Fully-Differential mode, *STD_LOGIC type*.

  - **AsyncEventOut**: Stretched and Divided AsyncInput by output, *STD_LOGIC* type.


This module instantiates the *EdgeTrigger_IL*, the *Stretcher_IL* and the *Divider_IL* and renames the input and the output interfaces, input as slave output as master.
Furthermore, in this module we can find the function *EdgeTriggerDefinition* that converts the *EDGE_TRIGGER_INIT* from a *STRING* type to a *STD_LOGIC_VECTOR* type.

# Sources
We can find in *hdl/* the following module :

  - **InputLogic**: Wrapping of *EdgeTrigger_IL*, *Stretcher_IL*, and *Divider_IL* for usage in block design and IP-Core.

  - **EdgeTrigger_IL**: Determines the active edge of the *Stretcher_IL*, edge trigger positive/negative of FDCE.

  - **Stretcher_IL**: Stretching the *AsyncEventIn* with a duration that is a multiple of the *clk* period selected by *StretchLength* and/or *STRETCH_LENGTH_INIT*.

  - **Divider_IL**: Divide the *StretchedEventOut* by *Divider* and/or *DIVIDER_INIT*.

# Simulation

 We can find the VHDL simulation and relative Waveforms of *InputLogic* in the directory *src/*.
 It is possible to modify all the parameters.  The CocoTB cosimulation is not required.

  - **tb_InputLogic**: VHDL simulation of *InputLogic*
  - **tb_InputLogic_behav**: Waveforms of *tb_InputLogic*


Here we can see the image coming from the simulation of the *Stretcher_IL*:

![InputLogic wave Image](doc/img/wave.png)


# TODO

1) Insert properly timing constraint
2) Insert CDC and choose if one per module or one for channel
