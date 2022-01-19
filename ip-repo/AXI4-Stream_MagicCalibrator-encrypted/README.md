# MagicCalibrator
This is a Vivado Project, used to calibrate the uncalibrated input data (*s00_uncalib_tdata*) coming from the TDC.
This module manages the Calibration over Internal DualPort XPM SDPRAM (*Calibration Table*), where we compute an histogram of the incoming data, and the two External SinglePort XPM SPRAM (*CharacteristicCurve*) which corrisponds to the integration of the histogram (*CalibrationTable*) in such a way that when one memory is being integrated, the other is being used to calibrate the data.

![Scheme of the calibrator ](doc/img/MagicCalScheme.svg)

The timestamps in output of MagicCalibrator is an AXI4 Stream interface and if we want to measure the event t, we should have:
<br/> t = (N +1)T<sub>clk</sub> - T<sub>fine</sub> &nbsp; &nbsp; &nbsp; &nbsp; with T<sub>clk</sub> = T<sub>fine</sub><sup>-</sup> + T<sub>fine</sub><sup>+</sup>
<br/>
But the Timestamp is generated according to the *INTEGRATION_METHOD*.
<br/>
If **INTEGRATION_METHOD = '-'**, we have simply the padding of the Coarse part and the Fine Part:
<br/> t<sup>-</sup> = (N +1)T<sub>clk</sub> + T<sub>fine</sub><sup>-</sup> = (N +1)T<sub>clk</sub>|T<sub>fine</sub><sup>-</sup>
<br/>
If **INTEGRATION_METHOD = '+'**, we have a little bit more complicated calculation:
<br/>
t<sup>+</sup> = (N +1)T<sub>clk</sub> + (1 - T<sub>fine</sub><sup>+</sup>) = (N +1)T<sub>clk</sub>|(1 - T<sub>fine</sub><sup>+</sup>)
<br/><br/>
In both case we can consider to have an offset on each channel of the TDC.
<br/>
Since the two method are backward compatible, they are both implemented.

![Event Image](doc/img/Event.png)
<br/><br/>

When an uncalibrated data arrives, it is saved into the CalibrationTable in this way: the destination address corresponds to the data itself (es. data = 5 saved at address 5); the previous content of that address is updated with the incoming data

![Updating of the CalibtTable ](doc/img/CalibUpdate.svg)

It is the final MagicCalibrator used for Cosimulation and IP-Core packaging.

It works with exactly the minimum value of bits of *DATA_WIDTH_CC* respect the minimum request for to be safe to avoid overflow.

If *SAVE_BIT=TRUE*

 - **IF BIT_CALIBRATION +1 => BIT_RESOLUTION --> BIT_RESOLUTION**
 - **IF BIT_CALIBRATION +1 < BIT_RESOLUTION  --> BIT_CALIBRATION +1**

If *SAVE_BIT=FALSE*  

 - **IF BIT_CALIBRATION +2 => BIT_RESOLUTION +1 --> BIT_RESOLUTION +1**
 - **IF BIT_CALIBRATION +2 < BIT_RESOLUTION +1  --> BIT_CALIBRATION +2**


![SaveBit Image](doc/img/SaveBit.png)


<br/>
<br/>
<br/>
Moreover this module manages simultaneously the Calibration and the Measurement. Indeed we can consider a chain of buffer with variable propagation time where we want to measure an event which occurs in the Full Scale Range (FSR), but due to statistical fluctuations it is possible to have the extreme code (*00...0* and *10...0*), that normally it should not occur. For this reason we add some buffer to the right and left in order not to lose the FSR and allow the module to work also in this situation.


![Buffer Image](doc/img/Buffer.png)


<br/>
<br/>
XPM memories from Xilinx are used, here you can see how they are represented

![RAM Schemes](doc/img/RAM_schemes.svg)


# IP-CORE

This is an image of the AXI4Stream_MagicCalibrator wrapper for the AXI4_Stream interface

![IP-CORE scheme](doc/img/IPCore_Closed.png)

## Generic

- **BIT_CALIBRATION**: Number of Bits used to Calibrate, *POSITIVE* type *RANGE  1  TO  32*. *BIT_CALIBRATION* is the memory width.
- **BIT_COARSE**: Bit Dimension of the Coarse Counter, *NATURAL* type *RANGE  0  TO  32*.
- **BIT_FID**: Bit Dimension of the Function ID of the Belt Bus, *NATURAL* type. If *BIT_FID = 0* the FID is not considered.
- **BIT_RESOLUTION**: Number of Bits of the Calibrated_TDL, *POSITIVE* type *RANGE  1  TO  32*.
- **BIT_UNCALIBRATED**: Bit Dimension of Uncalibrated_TDL, *POSITIVE* type *RANGE  2  TO  16*. *2 <sup>BIT_UNCALIBRATED</sup>-1* is the memory length.  
- **INTEGRATION_METHOD**: Method used to perform the Positive/Negative integration of Calibration Table, *STRING* type, default "-".
- **SAVE_BIT**: Bit used to decide whether to save one bit in *CharactCurveSPRAM*, *BOOLEAN* type, default **TRUE**.

![IP-CORE Generic](doc/img/Generic.svg)

## Port

- **s00_uncalib**: AXI4 Stream Slave (Input) interface, uncalibrated data coming from the TDC.
	- **s00_uncalib_tvalid**: Valid of the uncalibrated input data, *STD_LOGIC* type.
	- **s00_uncalib_tdata**: Decoded data in TDL padded to upper byte dimension, *STD_LOGIC_VECTOR( ((BIT_FID + BIT_COARSE + BIT_UNCALIBRATED-1)/8 +1)*8 -1 DOWNTO 0)* type, used only *STD_LOGIC_VECTOR(BIT_FID + BIT_COARSE + BIT_UNCALIBRATED-1 downto 0)*.

 - **reset**: Asynchronous reset active high (if '1' goto reset state).

 - **clk**: System clock.

 - **Restart_Calibration**: Bit which sets the *Restart_Calibration* in both Characteristic Curves. *STD_LOGIC* type.

 - **Stop_Calibration**: If '1' the Calibration is Stopped, *STD_LOGIC* type.

 - **bitTrn_Uncal_addr**: Bit of Truncation of Uncalibrated_addr *(ADDR_WIDTH)*, from AXI4 32 bit port, *STD_LOGIC_VECTOR(31 DOWNTO 0)* type, default **0**.

 - **bitTrn_Cal_dout**: Bit of Truncation of Calibrated_dout *(DATA_WIDTH)*, from AXI4 32 bit port,*STD_LOGIC_VECTOR(31 DOWNTO 0)*  type, default **0**.

 - **m00_timestamp**: AXI4 Stream Master (Output) interface, calibrated data (Timestamp) exiting from the *MagicCalibrator*.
    - **m00_timestamp_tvalid**: Valid of the Timestamp, *STD_LOGIC* type.
    - **m00_timestamp_tdata**: Timestamp due to the union between Coarse_CNT and Calibrated_TDL with the proper FID padded to upper byte dimension, *STD_LOGIC_VECTOR( ((BIT_FID + BIT_COARSE + BIT_RESOLUTION-1)/8 +1)*8 -1 DOWNTO 0)* type, used only *STD_LOGIC_VECTOR(BIT_FID + BIT_COARSE + BIT_RESOLUTION-1 downto 0)*.


 - **Calibrated**: If '1' at least one Characteristic Curve is completed, *STD_LOGIC* type.

 ![IP-CORE scheme with input and output ports](doc/img/IPCore_open.png)

# Sources

We can find the files of *MagicCalibrator* in VHDL in *hdl/*:
- **AXI4Stream_MagicCalibrator**: AXI4-Stream Wrapper with ports length as multiple of 8 bit of MagicCalibratorWrapper for IP-Packager.
- **AXI4Stream_MagicCalibratorWrapper_MC**: AXI4-Stream Wrapper for MagicCalibrator.
- **MagicCalibrator**: This module computes the final TimeStamp putting together the Coarse part form the Carry and Fine part from CharactCurve
- **CharacteristicCurveGenerator_MC**: This module manages the saving of the 2 SinglePort XPM RAMs that store the Characteristic Curve in swap
- **CalibrationTableGenerator_MC**: This module manages the calibration over the Internal DualPort XPM RAM (CalibrationTable, which is the Histogram) and 2 External SinglePort XPM RAM used in swap (CharacteristicCurve)
- **LocalPackage_MC**: In this package are contained the functions and procedures used by the MagicCalibrator


# Simulation

We can find the VHDL simulation and relative Waveforms of *MagicCalibrator* in the directory *src//*. It is possible to modify all the parameters.

 - **tb_CalibrationTableGenerator_behav**: Waveform of *tb_CalibrationTableGenerator*.

![CalibrationTableGenerator Image](doc/img/CalibrationTableGenerator.png)

 - **tb_CharacteristicCurveGenerator_behav**: Waveform of *tb_CharacteristicCurveGenerator*.

![CharacteristicCurveGenerator Image](doc/img/CharacteristicCurveGenerator.png)

 - **tb_MagicCalibrator_behav**: Waveform of *tb_MagicCalibrator*.

![MagicCalibrator Image](doc/img/MagicCalibrator.png)
