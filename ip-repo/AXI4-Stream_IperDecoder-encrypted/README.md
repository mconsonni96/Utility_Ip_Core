# IperDecoder
This is a Vivado 2017.3 Project, used to implement an autoconfigurable Decoder based on DecoderT2B (DecoT2B) or DecoderLog2 (DecoLog2).  
Here the MacroDecoder, where all the modules are tuned only by the Generics choose and the automatic configuration of the pipelines of TA, DecoLog2, DecoT2B are chosen by the user, and TurboDecoder, where all the modules are self tuned for minimize the costs in term of area occuped and propagation time, are wrapped using the AXI4 Stream.  
Both the Decoders are able to work with multiple TDL for sub-interpolation and manage the delay pipeline of the coarse counter.  


# Sources
We can find in *"hdl"* the following module directory:

## IperDecoder

  - **AXI4Stream_IperDecoder**: Wrapper of *AXI4Stream_IperDecoderWrapper* used for rename the input and output interfaces with AXI4-Stream, input as slave and output as master.
  - **AXI4Stream_IperDecoderWrapper**: Wrapping of *AXI4Stream_MacroDecoderWrapper* and *AXI4Stream_TurboDecoderWrapper*.
  - **IperDecoder**: Wrapping of *MacroDecoder* and *TurboDecoder*

## MacroDecoder

  - **AXI4Stream_MacroDecoderWrapper**: Wrapper of *MacroDecoderWrapper_MD* used for rename the input and output interfaces with AXI4-Stream, input as slave and output as master.
  - **AXI4Stream_MacroDecoder**: Wrapper of *MacroDecoder* used for rename the input and output interfaces with AXI4-Stream, input as slave and output as master.
  - **MacroDecoder (MD)**: User full configurable Decoder for multpile TDLs and Coarse pipeline.
  - **MacroDecoderWrapper_MD (MD)**: Wrapping between different Decoders with multpile TDLs and coarse pipeline.
  - **ShiftRegister_SR (SR)**: Shift Register for pipeline realignments of different elaborations.
  - **LocalPacage_TD_MD (MD)**: Functions, Procedures, Constants and Types for autoconfigurable *MacroDecoder*.


## TurboDecoder

  - **AXI4Stream_TurboDecoderWrapper**: Wrapper of *TurboDecoderWrapper_TD* used for rename the input and output interfaces with AXI4-Stream, input as slave and output as master.
  - **AXI4Stream_TurboDecoder**: Wrapper of *TurboDecoder* used for rename the input and output interfaces with AXI4-Stream, input as slave and output as master.
  - **TurboDecoder (TD)**: Autoconfigurable Decoder for multpile TDLs and coarse pipeline.
  - **TurboDecoderWrapper_TD (TD)**: Wrapping between different Decoders with multpile TDLs and coarse pipeline.
  - **ShiftRegister_SR (SR)**: Shift register for pipeline realignments of different elaborations.
  - **LocalPacage_TD_MD (TD)**: Functions, Procedures, Constants and Types for autoconfigurable *TurboDecoder*.


## DecoderT2B
The following modules are derivated by the *DecoderT2B* and we can find them in *"hdl/DecoT2B*:

  - **AXI4Stream_DecodeT2B**: Wrapper of *DecoderT2B* used for rename the input and output interfaces with AXI4-Stream, input as slave and output as master.
  - **DecoderT2B (DecoT2B)**: Autoconfigurable Decoder for TDLs based on *T2B* and *TreeAdder*.
  - **LocalPackage_DecoT2B (DecoT2B)**: Functions, Procedures and Types for the autoconfigurable Decoder.
  - **AreaTimingPackage_DecoT2B**: Area occupancy and relative propagation delay of the ThermoToBin evaluated from tcl script in *tcl/tcl_AreaTimingPackage_T2B.tcl*.

The following modules are derivated by the *ThermoToBinary*:

  - **AXI4Stream_ThermoToBin**: Wrapper  of *ThermoToBin* used for rename the input and output interfaces with AXI4-Stream, input as slave and output as master.
  - **ThermoToBin**: *ThermoToBinWrapper* Wrapper for creating an IP-Core in Vivado.
  - **ThermoToBinWrapper_T2B (T2B)**: Series of *Step_T2B* to transform the Thermometric Code in Pure Binary.
  - **Step_T2B (T2B)**: Union of differents *Engine_T2B* that work in parallel.
  - **Engine_T2B (T2B)**: Configurable engine (adder) that makes the sum of the inputs.
  - **LocalPackage_T2B (T2B)**: Functions, Procedures and Types required by the *T2B* modules.

## DecoderLog2
The following modules are derivated by the *DecoderLog2* and we can find them in *"hdl/decoLog2"*:

  - **AXI4Stream_DecoderLog2**: Wrapper of *DecoderLog2* used for rename the input and output interfaces with AXI4-Stream, input as slave and output as master.
  - **DecoderLog2 (DecoLog2)**: Autoconfigurable Decoder.
  - **DecoderLog2Wrapper_DecoLog2 (DecoLog2)**: Autoconfigurable Decoder for TDLs based on *Log2* and *TreeAdder*.
  - **LocalPackage_DecoLog2 (DecoLog2)**: Functions, Procedures and Types for autoconfigurable Decoder.
  - **AreaTimingPackage_DecoLog2**: Area occupancy and relative propagation delay of the ThermoToBin evaluated from tcl script in *"tcl/tcl_AreaTimingPackage_Log2Dn.tcl"*, *"tcl_/tcl_AreaTimingPackage_Log2Up.tcl"*, and *"tcl/tcl_AreaTimingPackage_TA.tcl"*.

The following modules are derivated by the *hdl/Log2Dn*:

  - **AXI4Stream_Log2Dn**: Wrapper of *Log2Dn* used for rename the input and output interfaces with AXI4-Stream, input as slave and output as master.
  - **Log2Dn**: Wrapper used to instantiate all the modules of the pipeline.
  - **Log2Dn_Init**: Initialization of the pipeline.
  - **Log2Dn_Mod**: Standard module of the pipeline.
  - **Log2Dn_Last**: Last module of the pipeline.

The following modules are derivated by the *hdl/Log2Up*:

  - **AXI4Stream_Log2Up**: Wrapper of *Log2Up* used for rename the input and output interfaces with AXI4-Stream, input as slave and output as master.
  - **Log2Up**: Wrapper used to instantiate all the modules of the pipeline.
  - **Log2Up_Init**: Initialization of the pipeline.
  - **Log2Up_Mod**: Standard module of the pipeline.
  - **Log2Up_Last**: Last module of the pipeline.

The following modules are derivated by the *hdl/TreeAdder*:

  - **AXI4StreamTreeAdder**: Wrapper of *TreeAdder* used for rename the input and output interfaces with AXI4-Stream, input as slave and output as master.
  - **TreeAdder**: *TreeAdderWrapper* Wrapped for creating an IP-Core in Vivado.
  - **TreeAdderWrapper**: Series of *Step_TA* to sum all the inputs.
  - **Step_TA**: Union of differents *Engine_TA* that work in parallel.
  - **Engine_TA**: Configurable engine (adder) that makes the sum of the inputs.
  - **LocalPackage_TA**: Functions, Procedures and Types required by the *TA* modules.


## AXI4Stream_IperDecoder
Wrapping of AXI4Stream_IperDecoderWrapper for AXI4-Stream interface.

![step Image](doc/IPCore_IperDecoder.png)  


### Generic

  - **DEBUG_MODE**: Debug of Turbo/Macro Decoder at clk_SYS, True Active the Sub-Interpolation Matrix, *BOOLEAN* type, default **FALSE**.

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **MD_VS_TD**: Specify the Decoder to be used between *MacroDecoder* (MD) and *TurboDecoder* (TD), *STRING* type, default **TD**.

  - **TYPE_DECODER**: Select the type of Decoder to be used between *DecoderLog2* and *DecoderT2B*, *STRING* type, default **T2B**.

  - **TYPE_EDGE_i**: Specify if the Edge to be detected is Down or Up with i in [0; 15], *STRING* type, default **DN**.

  - **BIT_COARSE**: Bit dimension of the Coarse Counter, *NATURAL* type *RANGE 0 TO 32*. If *BIT_COARSE = 0* the Coarse Pipeline is removed.

  - **NUMBER_OF_TDL**: Number of Tapped Delay Line (TDL) in parallel, *POSITIVE* type *RANGE 1 TO 16*.

  - **BIT_TDL**: Bit Dimension of the TDL, *POSITIVE* type *RANGE  4  TO  4096*.
  - **BIT_BUBBLE**: Bit Dimension of the Bubble, *POSITIVE* type *RANGE  1  TO  16*.
  - **BIT_SUB_INT**: Bit Dimension of Decoded *NUMBER_OF_TDL* TDL, *POSITIVE* type.

  - **DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0**: Select the max number of inputs for the first stage of the *TreeAdder* in *DecoLog2*, *POSITIVE* type.
  - **DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1**: Select the max number of inputs for the second stage of the *TreeAdder* in *DecoLog2*, *POSITIVE* type.

  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0**: Select the max number of inputs for the first stage of the *T2B* in *DecoT2B*, *POSITIVE* type.
  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1**:  Select the max number of inputs for the second stage of the *T2B* in *DecoT2B*, *POSITIVE* type.
  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2**: Select the max number of inputs for the third stage of the *T2B* in *DecoT2B*, *POSITIVE* type.
  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3**:  Select the max number of inputs for the fourth stage of the *T2B* in *DecoT2B*, *POSITIVE* type.

  - **SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0**: Select the max number of inputs for the first stage of *TreeAdder* of the sub-interpolator, *POSITIVE* type.
  - **SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1**: Select the max number of inputs for the second stage of *TreeAdder* of the sub-interpolator, *POSITIVE* type.

  - **PRINT_FULL_REPORT**: Specify if print all the configurations of the *TurboDecoder*, *BOOLEAN* type, default **TRUE**.
  - **OPTIMIZATION_MODE**: Set the parameter to be optimized among Area, Time and Cost, *STRING* type, default **TIME**.
  - **WEIGHT_AREA_VS_TIME_PERCENT**: Percent weigth between Area and Time if the Cost is set, *INTEGER* type *RANGE  0 TO  100*, default **50**.

  ![step Image](doc/IPCore_Generic_1.png)  
  ![step Image](doc/IPCore_Generic_2.png)  
  ![step Image](doc/IPCore_Generic_3.png)




### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **s00_undeco**: AXI4 Stream Slave (Input) interface, undecoded data from sampling both the Coarse Counter and Tapped Delay-Lines.
    - **s00_undeco_tvalid**: Valid of undecoded input data, *STD_LOGIC* type.
    - **s00_undeco_tdata**: Undecoded input Data from Coarse Counter | Tapped Delay-Lines padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_COARSE + NUMBER_OF_TDL*BIT_TDL-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_COARSE + NUMBER_OF_TDL*BIT_TDL-1 downto 0)* type.

  - **m00_subint**: AXI4 Stream Master (Output) interface, decoded data of TDL with pipeline of Coarse Counter.
    - **m00_subint_tvalid**: Valid of decoded output data, *STD_LOGIC* type.
    - **m00_subint_tdata**: Decoded output data from Coarse Counter pipelined | Decoded of TDLs sub-interpolated with the proper FID padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_COARSE + BIT_SUB_INT-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_COARSE + BIT_SUB_INT-1 downto 0)* type.

  - **subInterpolationMatrix**: Implemented only in DEBUG if '1', the relative TDL is subInterpolated, *STD_LOGIC_VECTOR(31 DOWNTO 0)* type, from AXI4 reg.

The module assemble:  

  - The sixteen *TYPE_EDGE* to be detected in the *TYPE_EDGE_ARRAY* constant using *From_DN_VS_UP_STRINGs_To_DN_VS_UP_STRING_ARRAY* function;  
  - The max number of inputs of the stages of the pipeline in the *SUB_INT_MAX_INPUT_ENGINE_PIPELINE* constant;  
  - The max number of inputs of the stages in *TreeAdder* of the *DecoLog2* in the *DECO_LOG_MAX_INPUT_ENGINE_PIPELINE* constant;  
  - The max number of inputs of the stages in *T2B* of the *DecoT2B* in the *DECO_T2B_MAX_INPUT_ENGINE_PIPELINE* constant;  

  ![step Image](doc/IPCore_Signal.png)

Moreover it instantiates the *AXI4Stream_IperDecoderWrapper* module using the constants generated before, set to '0' the MSBs of the output data (*m00_subint_tdata(m00_subint_tdata'LENGTH-1 downto BIT_COARSE + BIT_SUB_INT)*) and rename the input and output interfaces with AXI4-Stream, input as slave and output as master.


## AXI4Stream_IperDecoderWrapper
Wrapping between MacroDecoder and TurboDecoder with AXI4Stream.

### Generic

  - **DEBUG_MODE**: Debug of Turbo/Macro Decoder at clk_SYS, True Active the Sub-Interpolation Matrix, *BOOLEAN* type, default **FALSE**.

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **MD_VS_TD**: Specify the Decoder to be used between *MacroDecoder* (MD) and *TurboDecoder* (TD), *STRING* type, default **TD**.

  - **TYPE_DECODER**: Select the type of Decoder to be used between *DecoderLog2* and *DecoderT2B*, *STRING* type, default **T2B**.

  - **TYPE_EDGE_ARRAY**: Array that specify if the Edges to be detected are Down or Up, *DN_VS_UP_ARRAY_STRING* type, Default **DN, UP, Others => DN**.

  - **BIT_COARSE**: Bit dimension of the Coarse Counter, *NATURAL* type *RANGE 0 TO 32*. If *BIT_COARSE = 0* the Coarse Pipeline is removed.

  - **NUMBER_OF_TDL**: Number of Tapped Delay Line (TDL) in parallel, *POSITIVE* type *RANGE 1 TO 16*.

  - **BIT_TDL**: Bit Dimension of the TDL, *POSITIVE* type *RANGE  4  TO  4096*.
  - **BIT_BUBBLE**: Bit Dimension of the Bubble, *POSITIVE* type *RANGE  1  TO  16*.
  - **BIT_SUB_INT**: Bit Dimension of Decoded *NUMBER_OF_TDL* TDL, *POSITIVE* type.

  - **DECO_LOG_MAX_INPUT_ENGINE_PIPELINE**: Select the max number of inputs per stage of the *TreeAdder* in *DecoLog2*, *MAX_INPUT_ENGINE_PIPELINE_TA_ARRAY_TYPE* type.

  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE**: Select the max number of inputs per stage of the *T2B* in *DecoT2B*, *T2B_POSITIVE_ARRAY_TYPE* type.

  - **SUB_INT_MAX_INPUT_ENGINE_PIPELINE**: Select the max number of inputs per stage of *TreeAdder* of the sub-interpolator, *TA_POSITIVE_ARRAY_TYPE* type.

  - **PRINT_FULL_REPORT**: Specify if print all the configurations of the *TurboDecoder*, *BOOLEAN* type, default **TRUE**.
  - **OPTIMIZATION_MODE**: Set the parameter to be optimized among Area, Time and Cost, *STRING* type, default **TIME**.
  - **WEIGHT_AREA_VS_TIME_PERCENT**: Percent weigth between Area and Time if the Cost is set, *INTEGER* type *RANGE  0 TO  100*, default **50**.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **s00_undeco_tvalid**: Valid of undecoded input data from sampling both the Coarse Counter and Tapped Delay-Lines, *STD_LOGIC* type.
  - **s00_undeco_tdata**: Undecoded input Data from Coarse Counter | Tapped Delay-Lines, *STD_LOGIC_VECTOR(BIT_COARSE + NUMBER_OF_TDL*BIT_TDL-1 downto 0)* type.

  - **m00_subint_tvalid**: Valid of decoded output data of TDL with pipeline of Coarse Counter, *STD_LOGIC* type.
  - **m00_subint_tdata**: Decoded output data from Coarse Counter pipelined | Decoded of TDLs sub-interpolated, *STD_LOGIC_VECTOR(BIT_COARSE + BIT_SUB_INT-1 downto 0)* type.

  - **subInterpolationMatrix**: Implemented only in DEBUG if '1', the relative TDL is subInterpolated, *STD_LOGIC_VECTOR(31 DOWNTO 0)* type, from AXI4 reg, type addressed for *STD_LOGIC_VECTOR(0 TO NUMBER_OF_TDL-1)* type.

The module compute the bit dimension (*BIT_LOG2*) of input data of the *DecoderLog2* using the *COMPUTE_BIT_LOG2* function and the bit dimension (*BIT_DECO*) of decoded data using the *COMPUTE_BIT_DECO* function.  
Finally it instantiates the *AXI4Stream_MacroDecoderWrapper* module if *MD_VS_TD = "MD"* or the *AXI4Stream_TurboDecoderWrapper* module if *MD_VS_TD = "TD"*.


# IperDecoder
Autoconfigurable Wrapper between Turbo and Macro Decoder.

### Generic

  - **DEBUG_MODE**: Debug of Turbo/Macro Decoder at clk_SYS, True Active the Sub-Interpolation Matrix, *BOOLEAN* type, default **FALSE**.

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **MD_VS_TD**: Specify the Decoder to be used between *MacroDecoder* (MD) and *TurboDecoder* (TD), *STRING* type, default **TD**.

  - **TYPE_DECODER**: Select the type of Decoder to be used between *DecoderLog2* and *DecoderT2B*, *STRING* type, default **T2B**.

  - **TYPE_EDGE_i**: Specify if the Edge to be detected is Down or Up with i in [0; 15], *STRING* type, default **DN**.

  - **BIT_COARSE**: Bit dimension of the Coarse Counter, *NATURAL* type *RANGE 0 TO 32*. If *BIT_COARSE = 0* the Coarse Pipeline is removed.

  - **NUMBER_OF_TDL**: Number of Tapped Delay Line (TDL) in parallel, *POSITIVE* type *RANGE 1 TO 16*.

  - **BIT_TDL**: Bit Dimension of the TDL, *POSITIVE* type *RANGE  4  TO  4096*.
  - **BIT_BUBBLE**: Bit Dimension of the Bubble, *POSITIVE* type *RANGE  1  TO  16*.
  - **BIT_SUB_INT**: Bit Dimension of Decoded *NUMBER_OF_TDL* TDL, *POSITIVE* type.

  - **DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0**: Select the max number of inputs for the first stage of the *TreeAdder* in *DecoLog2*, *POSITIVE* type.
  - **DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1**: Select the max number of inputs for the second stage of the *TreeAdder* in *DecoLog2*, *POSITIVE* type.

  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0**: Select the max number of inputs for the first stage of the *T2B* in *DecoT2B*, *POSITIVE* type.
  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1**:  Select the max number of inputs for the second stage of the *T2B* in *DecoT2B*, *POSITIVE* type.
  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2**: Select the max number of inputs for the third stage of the *T2B* in *DecoT2B*, *POSITIVE* type.
  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3**:  Select the max number of inputs for the fourth stage of the *T2B* in *DecoT2B*, *POSITIVE* type.

  - **SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0**: Select the max number of inputs for the first stage of *TreeAdder* of the sub-interpolator, *POSITIVE* type.
  - **SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1**: Select the max number of inputs for the second stage of *TreeAdder* of the sub-interpolator, *POSITIVE* type.

  - **PRINT_FULL_REPORT**: Specify if print all the configurations of the *TurboDecoder*, *BOOLEAN* type, default **TRUE**.
  - **OPTIMIZATION_MODE**: Set the parameter to be optimized among Area, Time and Cost, *STRING* type, default **TIME**.
  - **WEIGHT_AREA_VS_TIME_PERCENT**: Percent weigth between Area and Time if the Cost is set, *INTEGER* type *RANGE  0 TO  100*, default **50**.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **ValidIn_TDL_CNT**: Valid of input Thermometric Data (TDLs) and Coarse Counter, *STD_LOGIC* type.
  - **CoarseIn_CNT**: Coarse Counter input Data, *STD_LOGIC_VECTOR(BIT_COARSE-1 DOWNTO 0)* type.
  - **Undeco_TDL**: Thermometric input Data, *STD_LOGIC_VECTOR(NUMBER_OF_TDL*BIT_TDL-1	DOWNTO 0)* type.

  - **ValidOut_TDL_CNT**: Valid of output Thermometric Data and Coarse Counter, *STD_LOGIC* type.
  - **CoarseOut_CNT**: Coarse Counter output Data, *STD_LOGIC_VECTOR(BIT_COARSE-1 DOWNTO 0)* type.
  - **SubInterpolated_TDL**: Decoded and Sub-Interpolated Thermometric Data, *STD_LOGIC_VECTOR(BIT_SUB_INT-1 DOWNTO 0)* type.

The module assemble the sixteen *TYPE_EDGE* to be detected in the *TYPE_EDGE_ARRAY* constant using *From_DN_VS_UP_STRINGs_To_DN_VS_UP_STRING_ARRAY* function and assign the value to *BIT_DECO* constant using *From_BIT_TDL_To_BIT_DECO* function.  
Finally it instantiates the *TurboDecoderWrapper_TD* module.

## AXI4Stream_MacroDecoderWrapper
Wrapping of MacroDecoderWrapper_MD for AXI4-Stream interface.

### Generic

  - **DEBUG_MODE**: Debug of Turbo/Macro Decoder at clk_SYS, True Active the Sub-Interpolation Matrix, *BOOLEAN* type, default **FALSE**.

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **TYPE_DECODER**: Select the type of Decoder to be used between *DecoderLog2* and *DecoderT2B*, *STRING(1 To 3)* type, default **LOG**.
  - **TYPE_EDGE_ARRAY**: Array that specify if the Edges to be detected are Down or Up, *DN_VS_UP_ARRAY_STRING* type, Default **DN, UP, Others => DN**.

  - **BIT_COARSE**: Bit dimension of the Coarse Counter, *NATURAL* type *RANGE 0 TO 32*. If *BIT_COARSE = 0* the Coarse Pipeline is removed.

  - **NUMBER_OF_TDL**: Number of Tapped Delay Line (TDL) in parallel, *POSITIVE* type *RANGE 1 TO 16*.

  - **BIT_TDL**: Bit Dimension of the TDL, *POSITIVE* type *RANGE  4  TO  4096*.
  - **BIT_BUBBLE**: Bit Dimension of the Bubble, *POSITIVE* type *RANGE  1  TO  16*.

  - **BIT_SUB_INT**: Bit Dimension of Decoded *NUMBER_OF_TDL* TDL, *POSITIVE* type.

  - **SUB_INT_MAX_INPUT_ENGINE_PIPELINE**:  Select the max number of inputs per stage of *TreeAdder* of the sub-interpolator, *TA_POSITIVE_ARRAY_TYPE* type.

  - **BIT_LOG2**: Bit Dimension of input data of the *DecoLog2*, *POSITIVE* type *RANGE 1 TO 10*.
  - **DECO_LOG_MAX_INPUT_ENGINE_PIPELINE**: Select the max number of input per stage of the *TreeAdder* in *DecoLog2*, *MAX_INPUT_ENGINE_PIPELINE_TA_ARRAY_TYPE* type.

  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE**: Select the max number of input per stage in *DecoT2B*, *T2B_POSITIVE_ARRAY_TYPE* type.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **s00_undeco_tvalid**: Valid of undecoded input data from sampling both the Coarse Counter and Tapped Delay-Lines, *STD_LOGIC* type.
  - **s00_undeco_tdata**: Undecoded input Data from Coarse Counter | Tapped Delay-Lines, *STD_LOGIC_VECTOR(BIT_COARSE + NUMBER_OF_TDL*BIT_TDL-1 downto 0)* type.

  - **m00_subint_tvalid**: Valid of decoded output data of TDL with pipeline of Coarse Counter, *STD_LOGIC* type.
  - **m00_subint_tdata**: Decoded output data from Coarse Counter pipelined | Decoded of TDLs sub-interpolated, *STD_LOGIC_VECTOR(BIT_COARSE + BIT_SUB_INT-1 downto 0)* type.

  - **subInterpolationMatrix**: Implemented only in DEBUG if '1', the relative TDL is subInterpolated, *STD_LOGIC_VECTOR(0 TO NUMBER_OF_TDL-1)* type.

The module instantiates the *MacroDecoderWrapper_MD* and rename the input and output interfaces with AXI4-Stream, input as slave and output as master.  
Morever if *DEBUG_MODE = TRUE* it assign the *subInterpolationMatrix* from AXI4-Slave port to the *subInterpolationMatrix_int* signal.


## AXI4Stream_MacroDecoder
Wrapping of MacroDecoder for AXI4-Stream interface.

### Generic

  - **DEBUG_MODE**: Debug of Turbo/Macro Decoder at clk_SYS, True Active the Sub-Interpolation Matrix, *BOOLEAN* type, default **FALSE**.

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **TYPE_DECODER**: Select the type of Decoder to be used between *DecoderLog2* and *DecoderT2B*, *STRING(1 To 3)* type, default **T2B**.

  - **TYPE_EDGE_i**: Specify if the Edge to be detected is Down or Up with i in [0; 15], *STRING(1 To 2)* type, default **DN**.

  - **BIT_COARSE**: Bit dimension of the Coarse Counter, *NATURAL* type *RANGE 0 TO 32*. If *BIT_COARSE = 0* the Coarse Pipeline is removed.

  - **NUMBER_OF_TDL**: Number of Tapped Delay Line (TDL) in parallel, *POSITIVE* type *RANGE 1 TO 16*.

  - **BIT_TDL**: Bit Dimension of the TDL, *POSITIVE* type *RANGE  4  TO  4096*.
  - **BIT_BUBBLE**: Bit Dimension of the Bubble, *POSITIVE* type *RANGE  1  TO  16*.

  - **BIT_SUB_INT**: Bit Dimension of Decoded *NUMBER_OF_TDL* TDL, *POSITIVE* type.

  - **SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0**: Select the max number of inputs of the first stage of the pipeline, *POSITIVE* type.
  - **SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1**: Select the max number of inputs of the second stage of the pipeline, *POSITIVE* type.

  - **BIT_LOG2**: Bit Dimension of input data of the *DecoLog2*, *POSITIVE* type *RANGE 1 TO 10*.
  - **DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0**: Select the max number of inputs of the first stage in *TreeAdder* of the *DecoLog2*, *POSITIVE* type.
  - **DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1**: Select the max number of inputs of the second stage in *TreeAdder* of the *DecoLog2*, *POSITIVE* type.

  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0**: Select the max number of inputs of the first stage in *T2B* of the *DecoT2B*, *POSITIVE* type.
  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1**: Select the max number of inputs of the second stage in *T2B* of the *DecoT2B*, *POSITIVE* type.
  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2**: Select the max number of inputs of the third stage in *T2B* of the *DecoT2B*, *POSITIVE* type.
  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3**: Select the max number of inputs of the fourth stage in *T2B* of the *DecoT2B*, *POSITIVE* type.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **s00_undeco**: AXI4 Stream Slave (Input) interface, undecoded data from sampling both the Coarse Counter and Tapped Delay-Lines.
    - **s00_undeco_tvalid**: Valid of undecoded input data, *STD_LOGIC* type.
    - **s00_undeco_tdata**: Undecoded input Data from Coarse Counter | Tapped Delay-Lines padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_COARSE + NUMBER_OF_TDL*BIT_TDL-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_COARSE + NUMBER_OF_TDL*BIT_TDL-1 downto 0)* type.

  - **m00_subint**: AXI4 Stream Master (Output) interface, decoded data of TDL with pipeline of Coarse Counter.
    - **m00_subint_tvalid**: Valid of decoded output data, *STD_LOGIC* type.
    - **m00_subint_tdata**: Decoded output data from Coarse Counter pipelined | Decoded of TDLs sub-interpolated with the proper FID padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_COARSE + BIT_SUB_INT-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_COARSE + BIT_SUB_INT-1 downto 0)* type.

  - **subInterpolationMatrix**: Implemented only in DEBUG if '1', the relative TDL is subInterpolated, *STD_LOGIC_VECTOR(0 TO NUMBER_OF_TDL-1)* type.

The module instantiates the *MacroDecoder*, set to '0' the MSBs of the output data (*m00_subint_tdata(m00_subint_tdata'LENGTH-1 downto BIT_COARSE + BIT_SUB_INT)*) and rename the input and output interfaces with AXI4-Stream, input as slave and output as master.  
Morever if *DEBUG_MODE = TRUE* it assign the *subInterpolationMatrix* from AXI4-Slave port to the *subInterpolationMatrix_int* signal.


## MacroDecoder
User full configurable Decoder for set all the settings.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **TYPE_DECODER**: Select the type of Decoder to be used between *DecoderLog2* and *DecoderT2B*, *STRING(1 To 3)* type, default **T2B**.

  - **TYPE_EDGE_i**: Specify if the Edge to be detected is Down or Up with i in [0; 15], *STRING(1 To 2)* type, default **DN**.

  - **BIT_COARSE**: Bit dimension of the Coarse Counter, *NATURAL* type *RANGE 0 TO 32*. If *BIT_COARSE = 0* the Coarse Pipeline is removed.

  - **NUMBER_OF_TDL**: Number of Tapped Delay Line (TDL) in parallel, *POSITIVE* type *RANGE 1 TO 16*.

  - **BIT_TDL**: Bit Dimension of the TDL, *POSITIVE* type *RANGE  4  TO  4096*.
  - **BIT_BUBBLE**: Bit Dimension of the Bubble, *POSITIVE* type *RANGE  1  TO  16*.

  - **BIT_SUB_INT**: Bit Dimension of Decoded *NUMBER_OF_TDL* TDL, *POSITIVE* type.

  - **SUB_INT_MAX_INPUT_ENGINE_PIPELINE_0**: Select the max number of inputs of the first stage of the pipeline, *POSITIVE* type.
  - **SUB_INT_MAX_INPUT_ENGINE_PIPELINE_1**: Select the max number of inputs of the second stage of the pipeline, *POSITIVE* type.

  - **BIT_LOG2**: Bit Dimension of input data of the *DecoLog2*, *POSITIVE* type *RANGE 1 TO 10*.
  - **DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_0**: Select the max number of inputs of the first stage in *TreeAdder* of the *DecoLog2*, *POSITIVE* type.
  - **DECO_LOG_MAX_INPUT_ENGINE_PIPELINE_1**: Select the max number of inputs of the second stage in *TreeAdder* of the *DecoLog2*, *POSITIVE* type.

  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_0**: Select the max number of inputs of the first stage in *T2B* of the *DecoT2B*, *POSITIVE* type.
  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_1**: Select the max number of inputs of the second stage in *T2B* of the *DecoT2B*, *POSITIVE* type.
  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_2**: Select the max number of inputs of the third stage in *T2B* of the *DecoT2B*, *POSITIVE* type.
  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE_3**: Select the max number of inputs of the fourth stage in *T2B* of the *DecoT2B*, *POSITIVE* type.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **ValidIn_TDL_CNT**: Valid of input Thermometric Data (TDLs) and Coarse Counter, *STD_LOGIC* type.
  - **CoarseIn_CNT**: Coarse Counter input Data, *STD_LOGIC_VECTOR(BIT_COARSE-1 DOWNTO 0)* type.
  - **Undeco_TDL**: Thermometric input Data, *STD_LOGIC_VECTOR(NUMBER_OF_TDL*BIT_TDL-1	DOWNTO 0)* type.

  - **ValidOut_TDL_CNT**: Valid of output Thermometric Data and Coarse Counter, *STD_LOGIC* type.
  - **CoarseOut_CNT**: Coarse Counter output Data, *STD_LOGIC_VECTOR(BIT_COARSE-1 DOWNTO 0)* type.
  - **SubInterpolated_TDL**: Decoded and Sub-Interpolated Thermometric Data, *STD_LOGIC_VECTOR(BIT_SUB_INT-1 DOWNTO 0)* type.

  - **subInterpolationMatrix**: Implemented only in DEBUG if '1', the relative TDL is subInterpolated, *STD_LOGIC_VECTOR(0 TO NUMBER_OF_TDL-1)* type.

The module assemble:  

  - The sixteen *TYPE_EDGE* to be detected in the *TYPE_EDGE_ARRAY* constant using *From_DN_VS_UP_STRINGs_To_DN_VS_UP_STRING_ARRAY* function;  
  - The max number of inputs of the stages of the pipeline in the *SUB_INT_MAX_INPUT_ENGINE_PIPELINE* constant;  
  - The max number of inputs of the stages in *TreeAdder* of the *DecoLog2* in the *DECO_LOG_MAX_INPUT_ENGINE_PIPELINE* constant;  
  - The max number of inputs of the stages in *T2B* of the *DecoT2B* in the *DECO_T2B_MAX_INPUT_ENGINE_PIPELINE* constant;  

Finally it instantiates the *MacroDecoderWrapper_MD* module.


## MacroDecoderWrapper_MD
Wrapper of MacroDecoder for decoding all setting between DecoLog2 and DecoT2B.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **TYPE_DECODER**: Select the type of Decoder to be used between *DecoderLog2* and *DecoderT2B*, *STRING(1 To 3)* type, default **LOG**.
  - **TYPE_EDGE_ARRAY**: Array that specify if the Edges to be detected are Down or Up, *DN_VS_UP_ARRAY_STRING* type, Default **DN, UP, Others => DN**.

  - **BIT_COARSE**: Bit dimension of the Coarse Counter, *NATURAL* type *RANGE 0 TO 32*. If *BIT_COARSE = 0* the Coarse Pipeline is removed.

  - **NUMBER_OF_TDL**: Number of Tapped Delay Line (TDL) in parallel, *POSITIVE* type *RANGE 1 TO 16*.

  - **BIT_TDL**: Bit Dimension of the TDL, *POSITIVE* type *RANGE  4  TO  4096*.
  - **BIT_BUBBLE**: Bit Dimension of the Bubble, *POSITIVE* type *RANGE  1  TO  16*.

  - **BIT_SUB_INT**: Bit Dimension of Decoded *NUMBER_OF_TDL* TDL, *POSITIVE* type.

  -   **SUB_INT_MAX_INPUT_ENGINE_PIPELINE**: Select the max number of input per stage, *TA_POSITIVE_ARRAY_TYPE* type.

  - **BIT_LOG2**: Bit Dimension of input data of the *DecoLog2*, *POSITIVE* type *RANGE 1 TO 10*.
  - **DECO_LOG_MAX_INPUT_ENGINE_PIPELINE**: Select the max number of input per stage of the *TreeAdder* in *DecoLog2*, *MAX_INPUT_ENGINE_PIPELINE_TA_ARRAY_TYPE* type.

  - **DECO_T2B_MAX_INPUT_ENGINE_PIPELINE**: Select the max number of input per stage in *DecoT2B*, *T2B_POSITIVE_ARRAY_TYPE* type.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **ValidIn_TDL_CNT**: Valid of input Thermometric Data (TDLs) and Coarse Counter, *STD_LOGIC* type.
  - **CoarseIn_CNT**: Coarse Counter input Data, *STD_LOGIC_VECTOR(BIT_COARSE-1 DOWNTO 0)* type.
  - **Undeco_TDL**: Thermometric input Data, *STD_LOGIC_VECTOR(NUMBER_OF_TDL*BIT_TDL-1	DOWNTO 0)* type.

  - **ValidOut_TDL_CNT**: Valid of output Thermometric Data and Coarse Counter, *STD_LOGIC* type.
  - **CoarseOut_CNT**: Coarse Counter output Data, *STD_LOGIC_VECTOR(BIT_COARSE-1 DOWNTO 0)* type.
  - **SubInterpolated_TDL**: Decoded and Sub-Interpolated Thermometric Data, *STD_LOGIC_VECTOR(BIT_SUB_INT-1 DOWNTO 0)* type.

  - **subInterpolationMatrix**: Implemented only in DEBUG if '1', the relative TDL is subInterpolated, *STD_LOGIC_VECTOR(0 TO NUMBER_OF_TDL-1)* type.

The module generates all the generics of *DecoderLog2* (*TreeAdder* and *Log2*) assigning them to the *DECOLOG2_GENERIC* constant using the *SetDecoLog2_MD* function and all the generics of *DecoderT2B* assigning them to the *DECOT2B_GENERIC* constant using the *SetDecoT2B_MD* function.  
Moreover it compute the Coarse pipeline assigning it to the *COARSE_PIPELINE* constant using the *ComputePipeline_MD* function.  
Futhermore it instantiates *NUMBER_OF_TDL* *DecoderLog2Wrapper_DecoLog2* if *TYPE_DECODER = "LOG"* or *NUMBER_OF_TDL* *ThermoToBinWrapper_T2B* if *TYPE_DECODER = "T2B"* using the generics generated before and setting the input data(*Undeco_TDL*) and the input valid(*ValidIn_TDL_CNT*) of the *MacroDecoder* module as the input data(*Undeco_TDL/ThermoIn*) and the input valid(*Valid_Undeco_TDL/Valid_ThermoIn*) of the chosen Decoder.  
Finally it instantiates:

 - The *TreeAdderWrapper_TA*, where its input data and input valid correspond to the output data and output valid of all the chosen Decoders, in order to generate the output valid (*ValidOut_TDL_CNT*) and the Sub-Interpolated output data (*SubInterpolated_TDL*);
 - The *ShiftRegister_SR* in order to generate the Coarse Counter output data (*CoarseOut_CNT*) if *BIT_COARSE > 0*.


## AXI4Stream_TurboDecoderWrapper
Wrapping of TurboDecoderWrapper_TD for AXI4-Stream interface.

### Generic

 - **DEBUG_MODE**: Debug of Turbo/Macro Decoder at clk_SYS, True Active the Sub-Interpolation Matrix, *BOOLEAN* type, default **FALSE**.

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **TYPE_DECODER**: Select the type of Decoder to be used between *DecoderLog2* and *DecoderT2B*, *STRING(1 To 3)* type, default **T2B**.
  - **TYPE_EDGE_ARRAY**: Array that specify if the Edges to be detected are Down or Up, *DN_VS_UP_ARRAY_STRING* type, Default **DN, UP, Others => DN**.

  - **BIT_COARSE**: Bit dimension of the Coarse Counter, *NATURAL* type *RANGE 0 TO 32*. If *BIT_COARSE = 0* the Coarse Pipeline is removed.

  - **NUMBER_OF_TDL**: Number of Tapped Delay Line (TDL) in parallel, *POSITIVE* type *RANGE 1 TO 16*.

  - **BIT_TDL**: Bit Dimension of the TDL, *POSITIVE* type *RANGE  4  TO  4096*.
  - **BIT_BUBBLE**: Bit Dimension of the Bubble, *POSITIVE* type *RANGE  1  TO  16*.

  - **BIT_SUB_INT**: Bit Dimension of Decoded *NUMBER_OF_TDL* TDL, *POSITIVE* type.

  - **PRINT_FULL_REPORT**: Specify if print all the configurations of the *TurboDecoder*, *BOOLEAN* type, default **TRUE**.
  - **OPTIMIZATION_MODE**: Set the parameter to be optimized among Area, Time and Cost, *STRING(1 To 4)* type, default **TIME**.
  - **WEIGHT_AREA_VS_TIME_PERCENT**: Percent weigth between Area and Time if the Cost is set, *INTEGER* type *RANGE  0 TO  100*, default **50**.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **s00_undeco_tvalid**: Valid of undecoded input data from sampling both the Coarse Counter and Tapped Delay-Lines, *STD_LOGIC* type.
  - **s00_undeco_tdata**: Undecoded input Data from Coarse Counter | Tapped Delay-Lines, *STD_LOGIC_VECTOR(BIT_COARSE + NUMBER_OF_TDL*BIT_TDL-1 downto 0)* type.

  - **m00_subint_tvalid**: Valid of decoded output data of TDL with pipeline of Coarse Counter, *STD_LOGIC* type.
  - **m00_subint_tdata**: Decoded output data from Coarse Counter pipelined | Decoded of TDLs sub-interpolated, *STD_LOGIC_VECTOR(BIT_COARSE + BIT_SUB_INT-1 downto 0)* type.

  - **subInterpolationMatrix**: Implemented only in DEBUG if '1', the relative TDL is subInterpolated, *STD_LOGIC_VECTOR(0 TO NUMBER_OF_TDL-1)* type.


The module instantiates the *TurboDecoderWrapper_TD* and rename the input and output interfaces with AXI4-Stream, input as slave and output as master.  
Morever if *DEBUG_MODE = TRUE* it assign the *subInterpolationMatrix* from AXI4-Slave port to the *subInterpolationMatrix_int* signal.


## AXI4Stream_TurboDecoder
Wrapping of TurboDecoder for AXI4-Stream interface.

### Generic

  - **DEBUG_MODE**: Debug of Turbo/Macro Decoder at clk_SYS, True Active the Sub-Interpolation Matrix, *BOOLEAN* type, default **FALSE**.

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **TYPE_DECODER**: Select the type of Decoder to be used between *DecoderLog2* and *DecoderT2B*, *STRING(1 To 3)* type, default **T2B**.

  - **TYPE_EDGE_i**: Specify if the Edge to be detected is Down or Up with i in [0; 15], *STRING(1 To 2)* type, default **DN**.

  - **BIT_COARSE**: Bit dimension of the Coarse Counter, *NATURAL* type *RANGE 0 TO 32*. If *BIT_COARSE = 0* the Coarse Pipeline is removed.

  - **NUMBER_OF_TDL**: Number of Tapped Delay Line (TDL) in parallel, *POSITIVE* type *RANGE 1 TO 16*.

  - **BIT_TDL**: Bit Dimension of the TDL, *POSITIVE* type *RANGE  4  TO  4096*.
  - **BIT_BUBBLE**: Bit Dimension of the Bubble, *POSITIVE* type *RANGE  1  TO  16*.
  - **BIT_SUB_INT**: Bit Dimension of Decoded *NUMBER_OF_TDL* TDL, *POSITIVE* type.

  - **PRINT_FULL_REPORT**: Specify if print all the configurations of the *TurboDecoder*, *BOOLEAN* type, default **TRUE**.
  - **OPTIMIZATION_MODE**: Set the parameter to be optimized among Area, Time and Cost, *STRING(1 To 4)* type, default **TIME**.
  - **WEIGHT_AREA_VS_TIME_PERCENT**: Percent weigth between Area and Time if the Cost is set, *INTEGER* type *RANGE  0 TO  100*, default **50**.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **s00_undeco**: AXI4 Stream Slave (Input) interface, undecoded data from sampling both the Coarse Counter and Tapped Delay-Lines.
    - **s00_undeco_tvalid**: Valid of undecoded input data, *STD_LOGIC* type.
    - **s00_undeco_tdata**: Undecoded input Data from Coarse Counter | Tapped Delay-Lines padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_COARSE + NUMBER_OF_TDL*BIT_TDL-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_COARSE + NUMBER_OF_TDL*BIT_TDL-1 downto 0)* type.

  - **m00_subint**: AXI4 Stream Master (Output) interface, decoded data of TDL with pipeline of Coarse Counter.
    - **m00_subint_tvalid**: Valid of decoded output data, *STD_LOGIC* type.
    - **m00_subint_tdata**: Decoded output data from Coarse Counter pipelined | Decoded of TDLs sub-interpolated with the proper FID padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_COARSE + BIT_SUB_INT-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_COARSE + BIT_SUB_INT-1 downto 0)* type.

  - **subInterpolationMatrix**: Implemented only in DEBUG if '1', the relative TDL is subInterpolated, *STD_LOGIC_VECTOR(0 TO NUMBER_OF_TDL-1)* type.

he module instantiates the *TurboDecoder*, set to '0' the MSBs of the output data (*m00_subint_tdata(m00_subint_tdata'LENGTH-1 downto BIT_COARSE + BIT_SUB_INT)*) and rename the input and output interfaces with AXI4-Stream, input as slave and output as master.  
Morever if *DEBUG_MODE = TRUE* it assign the *subInterpolationMatrix* from AXI4-Slave port to the *subInterpolationMatrix_int* signal.


## TurboDecoder
Autoconfigurable Decoder for multpile TDLs and coarse pipeline.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **TYPE_DECODER**: Select the type of Decoder to be used between *DecoderLog2* and *DecoderT2B*, *STRING(1 To 3)* type, default **T2B**.

  - **TYPE_EDGE_i**: Specify if the Edge to be detected is Down or Up with i in [0; 15], *STRING(1 To 2)* type, default **DN**.

  - **BIT_COARSE**: Bit dimension of the Coarse Counter, *NATURAL* type *RANGE 0 TO 32*. If *BIT_COARSE = 0* the Coarse Pipeline is removed.

  - **NUMBER_OF_TDL**: Number of Tapped Delay Line (TDL) in parallel, *POSITIVE* type *RANGE 1 TO 16*.

  - **BIT_TDL**: Bit Dimension of the TDL, *POSITIVE* type *RANGE  4  TO  4096*.
  - **BIT_BUBBLE**: Bit Dimension of the Bubble, *POSITIVE* type *RANGE  1  TO  16*.
  - **BIT_SUB_INT**: Bit Dimension of Decoded *NUMBER_OF_TDL* TDL, *POSITIVE* type.

  - **PRINT_FULL_REPORT**: Specify if print all the configurations of the *TurboDecoder*, *BOOLEAN* type, default **TRUE**.
  - **OPTIMIZATION_MODE**: Set the parameter to be optimized among Area, Time and Cost, *STRING(1 To 4)* type, default **TIME**.
  - **WEIGHT_AREA_VS_TIME_PERCENT**: Percent weigth between Area and Time if the Cost is set, *INTEGER* type *RANGE  0 TO  100*, default **50**.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **ValidIn_TDL_CNT**: Valid of input Thermometric Data (TDLs) and Coarse Counter, *STD_LOGIC* type.
  - **CoarseIn_CNT**: Coarse Counter input Data, *STD_LOGIC_VECTOR(BIT_COARSE-1 DOWNTO 0)* type.
  - **Undeco_TDL**: Thermometric input Data, *STD_LOGIC_VECTOR(NUMBER_OF_TDL*BIT_TDL-1	DOWNTO 0)* type.

  - **ValidOut_TDL_CNT**: Valid of output Thermometric Data and Coarse Counter, *STD_LOGIC* type.
  - **CoarseOut_CNT**: Coarse Counter output Data, *STD_LOGIC_VECTOR(BIT_COARSE-1 DOWNTO 0)* type.
  - **SubInterpolated_TDL**: Decoded and Sub-Interpolated Thermometric Data, *STD_LOGIC_VECTOR(BIT_SUB_INT-1 DOWNTO 0)* type.

  - **subInterpolationMatrix**: Implemented only in DEBUG if '1', the relative TDL is subInterpolated, *STD_LOGIC_VECTOR(0 TO NUMBER_OF_TDL-1)* type.

The module assemble the sixteen *TYPE_EDGE* to be detected in the *TYPE_EDGE_ARRAY* constant using *From_DN_VS_UP_STRINGs_To_DN_VS_UP_STRING_ARRAY* function and assign the value to *BIT_DECO* constant using *From_BIT_TDL_To_BIT_DECO* function.  
Finally it instantiates the *TurboDecoderWrapper_TD* module.


## TurboDecoderWrapper_TD
Wrapper of TurboDecoder for decoding all setting between DecoLog2 and DecoT2B.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **TYPE_DECODER**: Select the type of Decoder to be used between *DecoderLog2* and *DecoderT2B*, *STRING(1 To 3)* type, default **T2B**.
  - **TYPE_EDGE_ARRAY**: Array that specify if the Edges to be detected are Down or Up, *DN_VS_UP_ARRAY_STRING* type, Default **DN, UP, Others => DN**.

  - **BIT_COARSE**: Bit dimension of the Coarse Counter, *NATURAL* type *RANGE 0 TO 32*. If *BIT_COARSE = 0* the Coarse Pipeline is removed.

  - **NUMBER_OF_TDL**: Number of Tapped Delay Line (TDL) in parallel, *POSITIVE* type *RANGE 1 TO 16*.

  - **BIT_TDL**: Bit Dimension of the TDL, *POSITIVE* type *RANGE  4  TO  4096*.
  - **BIT_BUBBLE**: Bit Dimension of the Bubble, *POSITIVE* type *RANGE  1  TO  16*.
  - **BIT_DECO**: Bit Dimension of the decoded output data, *POSITIVE* type.

  - **PRINT_FULL_REPORT**: Specify if print all the configurations of the *TurboDecoder*, *BOOLEAN* type, default **TRUE**.
  - **OPTIMIZATION_MODE**: Set the parameter to be optimized among Area, Time and Cost, *STRING(1 To 4)* type, default **TIME**.
  - **WEIGHT_AREA_VS_TIME_PERCENT**: Percent weigth between Area and Time if the Cost is set, *INTEGER* type *RANGE  0 TO  100*, default **50**.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **ValidIn_TDL_CNT**: Valid of input Thermometric Data (TDLs) and Coarse Counter, *STD_LOGIC* type.
  - **CoarseIn_CNT**: Coarse Counter input Data, *STD_LOGIC_VECTOR* type.
  - **Undeco_TDL**: Thermometric input Data, *STD_LOGIC_VECTOR* type.

  - **ValidOut_TDL_CNT**: Valid of output Thermometric Data and Coarse Counter, *STD_LOGIC* type.
  - **CoarseOut_CNT**: Coarse Counter output Data, *STD_LOGIC_VECTOR* type.
  - **SubInterpolated_TDL**: Decoded and Sub-Interpolated Thermometric Data, *STD_LOGIC_VECTOR* type.

  - **subInterpolationMatrix**: Implemented only in DEBUG if '1', the relative TDL is subInterpolated, *STD_LOGIC_VECTOR* type.

The module compute the Coarse pipeline assigning it to the *TURBO_DECODER_PIPELINE* constant using the *ComputePipeline_TD* function.  
Moreover it instantiates *NUMBER_OF_TDL* *DecoderLog2* if *TYPE_DECODER = "LOG"* or *NUMBER_OF_TDL* *DecoderT2B* if *TYPE_DECODER = "T2B"* setting the input data(*Undeco_TDL*) and the input valid(*ValidIn_TDL_CNT*) of the *TurboDecoder* module as the input data(*Undeco_TDL*) and the input valid(*Valid_Undeco_TDL*) of the chosen Decoder.  
Finally it instantiates:

 - *NUMBER_OF_TDL* *ShiftRegister_SR*, where its input data (*Din*) and input valid (*Valid_Din*) correspond to the output data (*Deco_TDL_matrix(I)*) and output valid (*Valid_Deco_TDL_matrix(I)*) of all the chosen Decoders, in order to generate the input valid (*Valids_DataVctIn(I)*) and the input data (*DataVctIn*) of the *TreeAdder*;
 - The *TreeAdderWrapper_TA* in order to generate the output valid (*ValidOut_TDL_CNT*) and the Sub-Interpolated output data (*SubInterpolated_TDL*);  
 - The *ShiftRegister_SR* in order to generate the Coarse Counter output data (*CoarseOut_CNT*) if *BIT_COARSE > 0*.


## ShiftRegister_SR
Shift Register for pipeline realignments of different elaborations.

### Generic

 - **SR_WIDTH**: Number of Pipeline Stages, *NATURAL* type.
 - **SR_DEPTH**: Number of Bit of Data, *NATURAL* type.

 - **SR_DATA_INIT**: Initialization value of the data of Shift Register, *INTEGER* type.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **Valid_Din**: Valid of input data, *STD_LOGIC* type.
  - **Din**: Input data, *STD_LOGIC_VECTOR(SR_WIDTH-1 downto 0)* type.

  - **Valid_Dout**: Valid of output data, *STD_LOGIC* type.
  - **Dout**: Output data, *STD_LOGIC_VECTOR(SR_WIDTH-1	downto 0)* type.

The module defines the *Define_Deph_SR* function, which returns 1 if *sr_depth_nat = 0* otherwise it returns *sr_depth_nat*, and uses it to set the value of *SR_DEPTH_POS* constant.  
Morever it assigns the output according to the value of *SR_DEPTH*.  
If *SR_DEPTH = 0* the module is transparent, so the output valid (*Valid_Dout*) correspond to the input valid (*Valid_Din*) and the output data (*Dout*) correspond to the input data (*Din*), otherwise if *SR_DEPTH > 0* the module assign the valid of the last stage of the pipeline (*mem_valid(SR_DEPTH_POS-1)*) to the output valid (*Valid_Dout*) and the data of the last stage of the pipeline (*mem_data(SR_DEPTH_POS-1)*) to the output data (*Dout*).  
Finally if *SR_DEPTH > 0* the module at each rising edge of the *clk* shifts right the Valid pipeline (*mem_valid*) inserting the input valid (*Valid_Din*) and the Data pipeline (*mem_data*) inserting the input data (*Din*).


## LocalPacage_TD_MD
Functions, Procedures, Constants and Types for autoconfigurable *TurboDecoder* and autoconfigurable *MacroDecoder*.

### Constants

  - **MAX_NUMBER_OF_TDL**: Max number of TDLs allowed, *INTEGER* type.

  - **MAX_INPUT_ENGINE_PIPELINE_TA**: Select the max number of inputs per stage of the *TreeAdder*, *TA_POSITIVE_ARRAY_TYPE* type.

  - **FILE_PATH_TD**: *TD* File Location Path.
  - **FILE_NAME_TD**: Name of the text file where you print all the configuration of the *TurboDecoder*.

  - **FILE_PATH_MD**: *MD* File Location Path.
  - **FILE_NAME_MD**: Name of the text file where you print all the configuration of the *MacroDecoder*.

  - **FILE_PATH_NAME_TD**: Effective *TD* File Location Path.

  - **FILE_PATH_NAME_MD**: Effective *MD* File Location Path.


### Types

  - **DECO_PIPELINE_ARRAY_TYPE**: Array that contains the length of the Deco Pipeline.

  - **DN_VS_UP_ARRAY_STRING**: Array of *DN_VS_UP_STRING*, one for TDLs.

  - **PIPELINE_RECORD_TYPE**: It is a Record that contains the Pipeline of Coarse Counter (*COARSE_PIPELINE*) and the number of Pipeline Stages to add after Deco for realignment (*DECO_REALIGNMENT_PIPELINE*).


### Functions

  - **ComputePipeline_MD**: The function first assigns the number of pipeline stages of the *DecoLog2* and *DecoT2B* using the *SumStage_DecoLog2* and *SumStage_DecoT2B* functions, then it compute the *coarse_pipeline* as the sum of *pipeline_DecoLog2* or *pipeline_DecoT2B* (according to the *type_decoder*) and the *subInterpolator_pipeline*, which is computed using the *ComputeTAPipeline* function.  
  Finally it prints all the settings of the *MacroDecoder* and of the chosen Decoder (*Log2* or *T2B*) using the *write_to_file_ComputePipeline_MD* procedure.

  - **ComputePipeline_TD**: The function first compute the number of Pipeline Stages of each *Deco_Dn* and *Deco_Up* using the *ComputeDecoPipeline* function and save each of them in an array of Naturals (*deco_pipeline*), then it compute the Coarse Pipeline as the sum of *coarse_pipeline*, which corresponds to the higher number of pipeline stages contained in *deco_pipeline*, and the *subInterpolation_pipeline*, which is computed using the *ComputeTAPipeline* function.  
  Moreover it compute the realignment of Pipeline of the Decoder to the longer one (*deco_realignment_pipeline(I) = coarse_pipeline - deco_pipeline(I)*) and it saves the *coarse_pipeline* and *deco_realignment_pipeline* in *deco_realignment_coarse_pipeline*.  
  Finally it prints all the settings of the *TurboDecoder* using the *write_to_file_ComputePipeline_TD* procedure.

  - **SetDecoLog2_MD**: Set all the Generics of *DecoLog2*, *Log2* and *TreeAdder* for *MacroDecoder*.

  - **SetDecoT2B_MD**: Set all the Generics of *DecoderT2B* for *MacroDecoder*.

  - **ComputeTAPipeline**: Compute the number of Pipeline Stages of *TreeAdder* using *step_TA_pipeline_init* function.

  - **ComputeDecoPipeline**: The function if *type_decoder = "LOG"* compute the optimization of the *DecoderLog2* using the *Optimize_DecoLog2* function and then it compute the number of Pipeline Stages of the optimized *DecoderLog2* using the *SumStage_DecoLog2* function, otherwise the fuction if *type_decoder = "T2B"* compute the optimization of the *DecoderT2B* using the *Optimize_DecoT2B* function and then it compute the number of Pipeline Stages of the optimized *DecoderT2B* using the *SumStage_DecoT2B* function.

  - **SumStage_DecoLog2**: Compute the total number of pipeline stages of the *DecoderLog2* as the sum of the number of stages of the *Log2* and the number of stages of the *TreeAdder*, which is computed using the *step_TA_pipeline_init* function.

  - **SumStage_DecoT2B**: Compute the total number of pipeline stages of the *DecoderT2B* using the *step_T2B_pipeline_init* function.

  - **From_BIT_TDL_To_BIT_DECO**: Compute *bit_deco* starting from *bit_tdl*.

  - **From_DN_VS_UP_STRINGs_To_DN_VS_UP_STRING_ARRAY**: The function assemble the sixteen *TYPE_EDGE* to be detected in an single array (*type_edge_array_tmp*).

  - **COMPUTE_BIT**: Compute the bit dimension *bit_log2* of *bit_length*.

  - **COMPUTE_BIT_LOG2**: Compute the bit dimension *bit_log2* of *DecoLog2* using the *COMPUTE_BIT* function on *total_bit*, which correspond to the division between *bit_tdl* and *bit_bubble*.

  - **COMPUTE_BIT_DECO**: Compute the bit dimension *bit_deco* of *DecoT2B* using the *COMPUTE_BIT* function on *total_bit*, which correspond to the *bit_tdl*.

  - **COMPUTE_BIT_SUB_INTERPOLATION**: Compute the bit dimension *bit_sub_int* of Sub-interpolation using the *COMPUTE_BIT* function on *total_bit*, which correspond to the multiplication of *number_of_tdl* and *bit_tdl*.


### Procedures

  - **write_to_file_ComputePipeline_TD**: Print all the generics of the *TurboDecoder* and the number of stages of pipeline of the Decoder on a text file named *result_LocalPackage_TD*.

  - **write_to_file_ComputePipeline_MD**: Prints all the generics of the *MacroDecoder* and of the chosen Decoder, *Log2* or *T2B* according to *type_decoder*, and the number of stages of pipeline of the Decoder on a text file named *result_LocalPackage_MD*.


## AXI4Stream_DecodeT2B
Wrapping of DecoderT2B for AXI4-Stream interface.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **TYPE_EDGE**: Specify if the Edge to be detected is Down or Up, *STRING(1 To 2)* type, default **DN**.

  - **BIT_TDL**: Bit Dimension of the TDL/input data, *POSITIVE* type *RANGE  2  TO  4096*.
  - **BIT_DECO**: Bit Dimension of the decoded output data, *POSITIVE* type.

  - **PRINT_FULL_REPORT**: Specify if print all the configurations of the DecoT2B, *BOOLEAN* type, default **TRUE**.
  - **OPTIMIZATION_MODE**: Set the parameter to be optimized among Area, Time and Cost, *STRING(1 To 4)* type, default **TIME**.
  - **WEIGHT_AREA_VS_TIME_PERCENT**: Percent weigth between Area and Time if the Cost is set, *INTEGER* type *RANGE  0 TO  100*, default **50**.

### Port

  - **Reset**:  Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **Clk**: System clock.

  - **s00_undeco**: AXI4 Stream Slave (Input) interface, undecoded (thermometric) data coming from the previous module(Tapped Delay-Line(TDL)).
     - **s00_undeco_tvalid**: Valid of Thermometric input data, *STD_LOGIC* type.
     - **s00_undeco_tdata**: Thermometric input Data padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_TDL-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_TDL-1 downto 0)* type.

  - **m00_deco**: AXI4 Stream Master (Output) interface, decoded (binary) data of TDL.
     - **m00_deco_tvalid**: Valid of decoded output data, *STD_LOGIC* type.
     - **m00_deco_tdata**: Decoded (binary) output data with the proper FID padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_DECO-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_DECO-1 downto 0)* type.

The module instantiates the *DecoderT2B*, set to '0' the MSBs of the output data (*m00_deco_tdata(m00_deco_tdata'LENGTH-1 downto BIT_DECO)*) and rename the input and output interfaces with AXI4-Stream, input as slave and output as master.


## DecoderT2B
Convert Undeco_TDL in Deco_TDL using T2B.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **TYPE_EDGE**: Specify if the Edge to be detected is Down or Up, *STRING(1 To 2)* type, default **DN**.

  - **BIT_TDL**: Bit Dimension of the TDL/input data, *POSITIVE* type *RANGE  2  TO  4096*.
  - **BIT_DECO**: Bit Dimension of the decoded output data, *POSITIVE* type.

  - **PRINT_FULL_REPORT**: Specify if print all the configurations of the DecoT2B, *BOOLEAN* type, default **TRUE**.
  - **OPTIMIZATION_MODE**: Set the parameter to be optimized among Area, Time and cost, *STRING(1 To 4)* type, default **TIME**.
  - **WEIGHT_AREA_VS_TIME_PERCENT**: Percent weigth between Area and Time if the Cost is set, *INTEGER* type *RANGE  0 TO  100*, default **50**.

### Port

  - **reset**:  Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **Valid_Undeco_TDL**: Valid of Thermometric input data, *STD_LOGIC* type.
  - **Undeco_TDL**: Thermometric input Data from Tapped Delay-Line, *STD_LOGIC_VECTOR(BIT_TDL-1 downto 0)* type.

  - **Valid_Deco_TDL**: Valid of decoded output data, *STD_LOGIC* type.
  - **Deco_TDL**: Decoded (binary) output data of TDL, *STD_LOGIC_VECTOR(BIT_DECO-1 downto 0)* type.

The module assigns the value to the *INVERT_THERMO_IN* constant according to *TYPE_EDGE* generic (if *TYPE_EDGE = "DN"* sum the ones (*INVERT_THERMO_IN = FALSE*), elsif *TYPE_EDGE = "UP"* sum the zeros *(INVERT_THERMO_IN = TRUE*)) and generates all the generics of the *ThermoToBinary* assigning them to the *T2B_GENERIC* constant using the *Optimize_DecoT2B* function.  
Finally it instantiates the *ThermoToBinWrapper_T2B* using the generics generated before.


## LocalPackage_DecoT2B
Functions, Procedures, Contants and Types required by the *LogDecoT2B* module.

### Constants

  - **LENGTH_MAX_INPUT_ENGINE_PIPELINE**: Number of Pipeline Stages of T2B considered in *AreaTimingPackage_DecoT2B*.

  - **COST_PRECISION_COMPUTATION**: Value Used for the integer division.

  - **MAX_AREA**: Maximum Value of the Area occupation set by hand.
  - **MAX_DELAY**: Maximum Value of the Delay propagation set by hand.
  - **MAX_COST**: Maximum Value of the Cost set by hand.

  - **FILE_PATH**: File Location Path.
  - **FILE_NAME**: Nam e of the text file where you print all the configuration of the *ThermoToBin*.
  - **FILE_PATH_NAME**: Effective File Location Path.

  - **MIN_BIT_TDL**: The Minimum of TDL is the minimum that ThermoToBin allow, 2<sup>MIN_BIT_T2B</sup>.

  - **MAX_BIT_TDL**: The Maximum of TDL is the maximum that ThermoToBin allow, 2<sup>MAX_BIT_T2B</sup>.

  - **MIN_BIT_DECO**: The Minimum output is the minimum of Log2, *MIN_BIT_T2B*.

  - **MAX_BIT_DECO**: The maximum output is the maximum of TA, *MAX_BIT_T2B*.


### Types

  - **MAX_INPUT_ENGINE_PIPELINE_T2B_ARRAY_TYPE**: Subtype of *T2B_POSITIVE_ARRAY_TYPE* ranging from '0' to *LENGTH_MAX_INPUT_ENGINE_PIPELINE-1*.

  - **T2B_GENERIC_RECORD_TYPE**: It is a Record that assemble the Generics of the *ThermoToBin*.

  - **T2B_OPTIMIZATION_MODE_STRING**: Subtype of the Optimization Mode AREA vs TIME vs COST.

  - **REPORT_RECORD_TYPE**: Report Compiled by Optimization.

  - **REPORT_ARRAY_RECORD_TYPE**: Array of Reports (*REPORT_RECORD_TYPE*).


### Functions

  - **Optimize_DecoT2B**: Set all the Generics of the *DecoderT2B*. First of all it prints the initial settings of the *DecoderT2B* using the *Print_Init_Configuration_DecoT2B* procedure, then find all the possible configurations using many times the *Set_Possible_Configuration_DecoT2B* function and if *PRINT_FULL_REPORT = TRUE* it prints all the possible configurations on a text file using the *Print_All_Configuration_DecoT2B* procedure.  
  Moreover it choose the best configuration according to the optimization mode(AREA VS TIME VS COST) using the *Choose_Configuration_DecoT2B* procedure and print it in the text file using *Print_Choosen_Configuration_DecoT2B* procedure.  
  Finally it returns the generics of the *ThermoToBin* of the chosen configuration using *Write_Configuration_DecoT2B* function.

  - **Set_Possible_Configuration_DecoT2B**: Set a possible configuration assigning *BIT_TDL* to *bit_thermo_T2B*, computing the *bit_bin_T2B* as the Log2 of *bit_thermo_T2B* and compiling the Report (*possible_configuration*) with the generics of the *T2B* and the Area and Timing usage in terms of LUTs, Flip-Flops and Delay.

  - **set_min_input_engine_pipeline**: Set the minimum number of inputs in engine T2B returning *MIN_INPUT_ENGINE*.

  - **set_max_input_engine_pipeline**: Set the maximum number of inputs in engine T2B  returning *MAX_INPUT_ENGINE*.

  - **T2B_area**: Evaluate the total Area of a possible configuration of the *T2B* in terms of FFs and LUTs usage.

  - **T2B_delay**: Evaluate the maximum local Delay of a possible configuration of the *T2B*.

  - **T2B_cost**: Cost of the relative area and relative delay respect to the max value and the precision of a possible configuration of the *T2B*.

  - **Write_Configuration_DecoT2B**: Write all the generics of the *T2B* contained in the *choosen_configuration* into *T2B_settings*.

  - **From_TYPE_EDGE_STRING_To_INVERT_THERMO_IN_BOOLEAN**: Assign the value to *INVERT_THERMO_IN* according to *TYPE_EDGE*.  
  If *TYPE_EDGE = DN* sum the ones (*INVERT_THERMO_IN = FALSE*) otherwise if *TYPE_EDGE = UP* sum the zeros (*INVERT_THERMO_IN = TRUE*).

  - **is_pwr2**: Check if the natural input *x* is a power of 2 and in this case it returns *TRUE*, otherwise it returns *FALSE*.

  - **log2_unsigned**:  Compute the ceil(log2(x)), where x is natural.

  - **div_exc**: Compute the ceil(real(x/y)), where x,y are natural.

  - **bool_to_integer**: Return 1 if the boolean input *x* is *TRUE* otherwise it returns 0.


### Procedures

  - **Choose_Configuration_DecoT2B**: Choose the best configuration according to the optimization mode(AREA VS TIME VS COST). Indeed it compute the feature to be optimized (Area in terms of FFs and LUTs using *T2B_area* function or Delay of the *T2B* using *T2B_delay* function or Cost in terms of area and delay of the *T2B* using the *T2B_cost* function) and then compare all the configurations searching the best solution which respect the constraint (*optimize_ref*) imposed by the feature to be optimized.

  - **Print_Init_Configuration_DecoT2B**: Print the initial settings of *ThermoToBin* and *Decoder_T2B* in a text file named *result_LocalPackage_DecoT2B*.

  - **Print_All_Configuration_DecoT2B**: Print all the configurations of the *ThermoToBin* in a text file named *result_LocalPackage_DecoT2B* using the *Print_REPORT_RECORD_TYPE_DecoT2B* function for each single configuration.

  - **Print_Choosen_Configuration_DecoT2B**: Print the chosen configuration of the *ThermoToBin* in a text file named *result_LocalPackage_DecoT2B* using the *Print_REPORT_RECORD_TYPE_DecoT2B* function.

  - **Print_REPORT_RECORD_TYPE_DecoT2B**: Print one configuration of the *ThermoToBin* in a text file named *result_LocalPackage_DecoT2B*.


## AreaTimingPackage_DecoT2B
Autogenerated Package used to compute the Area Occupation and the relative Propagation Delay of the *ThermoToBin*.

### Constants

  - **MIN_BIT_T2B**: Minumum number of bit of the *T2B*.

  - **MAX_BIT_T2B**: Maximum number of bit of the *T2B*.

  - **MIN_INPUT_ENGINE**: Minumum number of inputs of the *Engine_T2B*.

  - **MAX_INPUT_ENGINE**: Maximum number of inputs of the *Engine_T2B*.

  - **T2B_AREA_TIMING_USAGE**: Autocomputed Constant which report the usage of Area and the Timing in all the possible configurations.


### Types

  - **AREA_TIMING_RECORD_TYPE**: It is a Record that report the occuped Area, in terms of number of total LUTs required (*LUTs*) and number of total Flip-Flops required (*FFs*), and the Timing, in terms of maximum asynchronous Propagation Logic Delay espressed as minimum asynchronous Propagation Logic Delay available (*DELAY*).

  - **T2B_AREA_TIMING_ARRAY_RECORD_TYPE**: It is an array of *AREA_TIMING_RECORD_TYPE*.


## AXI4Stream_ThermoToBin
Wrapping of ThermoToBin for AXI4-Stream interface.

### Generic

  - **EDGE_CHECK**: Control in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.
  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.

  - **MAX_INPUT_ENGINE_PIPELINE_STAGE0**: Select the max number of inputs for the first stage of the pipeline, *POSITIVE* type.
  - **MAX_INPUT_ENGINE_PIPELINE_STAGE1**: Select the max number of inputs for the second stage of the pipeline, *POSITIVE* type.
  - **MAX_INPUT_ENGINE_PIPELINE_STAGE2**: Select the max number of inputs for the third stage of the pipeline, *POSITIVE* type.
  - **MAX_INPUT_ENGINE_PIPELINE_STAGE3**: Select the max number of inputs for the fourth stage of the pipeline, *POSITIVE* type.

  - **SAVE_BIT**: Bit used to decide whether to save one bit in *BinOut* (from 0 to *BIT_THERMO-1* if true, from 0 to *BIT_THERM0* if false), *BOOLEAN* type, default **TRUE**.
  - **INVERT_THERMO_IN**: Specifies if detect the position of the Down Edge(FALSE) or the Up Edge(TRUE), *BOOLEAN* type, default **FALSE**.

  - **BIT_THERMO**: Bit Dimension of the Thermo/input, *POSITIVE* type *RANGE  2  to  4096*.
  - **BIT_BIN**: Bit Dimension of the Bin/output, *POSITIVE* type. It is necessary to have *BIT_BIN = log2_unsigned(BIT_THERMO)+1* if *SAVE_BIT = TRUE* or *BIT_BIN = log2_unsigned(BIT_THERMO)* if *SAVE_BIT = FALSE*.

### Port

  - **Reset**:  Asynchronous reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **Clk**: Clock signal.

  - **s00_thermo**: AXI4 Stream Slave (Input) interface, undecoded (thermo) data coming from the previous module.
     - **s00_thermo_tvalid**: Valid of the input data, *STD_LOGIC* type.
     - **s00_thermo_tdata**: Undecoded input data padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_THERMO-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_THERMO-1 downto 0)* type.

  - **m00_bin**: AXI4 Stream Master (Output) interface, decoded (binary) data.
     - **m00_bin_tvalid**: Valid of the output data, *STD_LOGIC* type.
     - **m00_bin_tdata**: Decoded output data with the proper FID padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_BIN-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_BIN-1 downto 0)* type.

The module instantiates the *ThermoToBin*, set to '0' the MSBs of the output data (*m00_bin_tdata(m00_bin_tdata'LENGTH-1 downto BIT_BIN)*) and rename the input and output interfaces with AXI4-Stream, input as slave and output as master.


## ThermoToBin
Compute the sum bit-by-bit of *ThermoIn*.

### Generic

  - **EDGE_CHECK**: Control in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.
  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.

  - **MAX_INPUT_ENGINE_PIPELINE_STAGE0**: Select the max number of inputs for the first stage of the pipeline, *POSITIVE* type.
  - **MAX_INPUT_ENGINE_PIPELINE_STAGE1**: Select the max number of inputs for the second stage of the pipeline, *POSITIVE* type.
  - **MAX_INPUT_ENGINE_PIPELINE_STAGE2**: Select the max number of inputs for the third stage of the pipeline, *POSITIVE* type.
  - **MAX_INPUT_ENGINE_PIPELINE_STAGE3**: Select the max number of inputs for the fourth stage of the pipeline, *POSITIVE* type.
  - **MAX_INPUT_ENGINE_PIPELINE_STAGE4**: Select the max number of inputs for the fifth stage of the pipeline, *POSITIVE* type.
  - **MAX_INPUT_ENGINE_PIPELINE_STAGE5**: Select the max number of inputs for the sixth stage of the pipeline, *POSITIVE* type.
  - **MAX_INPUT_ENGINE_PIPELINE_STAGE6**: Select the max number of inputs for the seventh stage of the pipeline, *POSITIVE* type.
  - **MAX_INPUT_ENGINE_PIPELINE_STAGE7**: Select the max number of inputs for the eighth stage of the pipeline, *POSITIVE* type.

  - **SAVE_BIT**: Bit used to decide whether to save one bit in *BinOut* (from 0 to *BIT_THERMO-1* if true, from 0 to *BIT_THERM0* if false), *BOOLEAN* type, default **TRUE**.
  - **INVERT_THERMO_IN**: Specifies if detect the position of the Down Edge(FALSE) or the Up Edge(TRUE), *BOOLEAN* type, default **FALSE**.

  - **BIT_THERMO**: Bit Dimension of the Thermo/input, *POSITIVE* type *RANGE  2  to  4096*.
  - **BIT_BIN**: Bit Dimension of the Bin/output, *POSITIVE* type. It is necessary to have *BIT_BIN = log2_unsigned(BIT_THERMO)+1* if *SAVE_BIT = TRUE* or *BIT_BIN = log2_unsigned(BIT_THERMO)* if *SAVE_BIT = FALSE*.

### Port

  - **Reset**:  Asynchronous reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **Clk**: Clock signal.

  - **Valid_ThermoIn**: Valid of *ThermoIn, *STD_LOGIC* type.
  - **ThermoIn**: Input Thermometric Code, *STD_LOGIC_VECTOR(BIT_THERMO-1 downto 0)* type.

  - **Valid_BinOut**: Valid of *BinOut*, *STD_LOGIC* type.
  - **BinOut**: Output Binary Code, *STD_LOGIC_VECTOR(BIT_BIN-1 downto 0)* type.

The module calls the *step_T2B_max_input_engine_init* function for creating an array of Positive that puts together the max number of inputs of each stage of the pipeline, saving it into *MAX_INPUT_ENGINE_PIPELINE* constant.  
Moreover the module assigns to the *PIPELINE_RECORD_ARRAY* constant the whole structure of the *ThermoToBin* calling the *step_T2B_pipeline_init* function, which sets the number of Steps and all the generic of the pipeline (*NUM_INPUT_TOT*, *MAX_IN_VAL_ENGINE*, *MAX_INPUT_ENGINE*).  
Finally it instantiates the *ThermoToBinWrapper_T2B*.


## ThermoToBinWrapper_T2B
Generate the Steps of the *ThermoToBin* and manage the connection and the sizing of the Pipeline Stages.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **MAX_INPUT_ENGINE_PIPELINE**: Select the max number of input per stage, *T2B_POSITIVE_ARRAY_TYPE* type.

  - **SAVE_BIT**: Bit used to decide whether to save one bit in *BinOut* (from 0 to *BIT_THERMO-1* if true, from 0 to *BIT_THERM0* if false), *BOOLEAN* type, default **TRUE**.
  - **INVERT_THERMO_IN**: Specifies if detect the position of the Down Edge(FALSE) or the Up Edge(TRUE), *BOOLEAN* type, default **FALSE**.

  - **BIT_THERMO**: Bit Dimension of the Thermo/input, *POSITIVE* type.
  - **BIT_BIN**: Bit Dimension of the Bin/output, *POSITIVE* type. It is necessary to have *BIT_BIN = log2_unsigned(BIT_THERMO)+1* if *SAVE_BIT = TRUE* or *BIT_BIN = log2_unsigned(BIT_THERMO)* if *SAVE_BIT = FALSE*.

### Port

  - **Reset**:  Asynchronous reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **Clk**: Clock signal.

  - **Valid_ThermoIn**: Valid of *ThermoIn*, *STD_LOGIC* type.
  - **ThermoIn**: Input Thermometric Code, *STD_LOGIC_VECTOR(BIT_THERMO-1 downto 0)* type.

  - **Valid_BinOut**: Valid of *BinOut*, *STD_LOGIC* type.
  - **BinOut**: Output Binary Code, *STD_LOGIC_VECTOR(BIT_BIN-1 downto 0)* type.

The module assigns to the *PIPELINE_RECORD_ARRAY* constant the whole structure of the *ThermoToBin* calling the *step_T2B_pipeline_init* function, which sets the number of Steps and all the generic of the pipeline (*NUM_INPUT_TOT*, *MAX_IN_VAL_ENGINE*, *MAX_INPUT_ENGINE*) and then generates the Steps of the Pipeline instantiating the *Step_T2B* module.  
Moreover this module initialize the first stage of the pipeline setting the *noEdgeEmpty_pipe(0)*, the *noEdgeFull_pipe(0)*, the *Valid_pipe(0)* and the *Data_pipe(0)*.
In particular, it uses the *Insert_ThermoIn_In_Pipe* function for inserting *ThermoIn* in *Data_pipe(0)*.  
Furthermore if *EDGE_CHECK = TRUE* it generates the *yesEdge* signal checking if there is an edge in the input data (*yesEdge = '1'* if *noEdgeEmpty_pipe(NUM_STAGE)(0) = '0'* and *noEdgeFull_pipe(NUM_STAGE)(0) = '0'*). The valid of the output data (*Valid_BinOut*) is then set as the "and" between the output valid of the last stage of the pipeline (*Valid_pipe(NUM_STAGE)*) and *yesEdge*.  
Finally the Thermo-to-Bin Output (*BinOut*) is set equal to the output of the last stage of the pipeline (*Data_pipe(NUM_STAGE)*).


## Step_T2B
Single Pipeline Stage composed by NUM_INPUT_TOT/MAX_INPUT_ENGINE Engines, which add all the inputs. The Free Running and the Valid are managed here.

### Generic

  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.
  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.

  - **NUM_INPUT_TOT**: Number of inputs of the *Step_T2B*, *POSITIVE* type.
  - **MAX_IN_VAL_ENGINE**: Maximum input value available, *POSITIVE* type.
  - **MAX_INPUT_ENGINE**: Maximum number of inputs of the *Engine_T2B*, *POSITIVE* type.

### Port

  - **Reset**:  Asynchronous reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **Clk**: Clock signal.

  - **Valid_in**: Input Valid, *STD_LOGIC* type.
  - **Data_in**: Input Data composed by *NUM_INPUT_TOT* values (0 <= Val <= MAX_IN_VAL), *STD_LOGIC_VECTOR* type.
  - **noEdgeEmpty_in**: Flags of zeros if *NUM_INPUT_TOT* is 0, *STD_LOGIC_VECTOR* type.
  - **noEdgeFull_in**: Flags of ones if *NUM_INPUT_TOT* is *MAX_IN_VAL*, *STD_LOGIC_VECTOR* type.

  - **Valid_out**: Output Valid, *STD_LOGIC* type.
  - **Data_out**: Output composed by Sum of NUM_INPUT_TOT/MAX_IN_VAL_ENGINE, *STD_LOGIC_VECTOR* type.
  - **noEdgeEmpty_out**: Flags of zeros if *SumOut* of Engines is 0, *STD_LOGIC_VECTOR* type.
  - **noEdgeFull_out**: Flags of ones if *SumOut* of Engines is NUM_INPUT * MAX_IN_VAL, *STD_LOGIC_VECTOR* type.

The module assigns:

  - The number of inputs of the Full Engine (*NUM_INPUT_FULL_ENGINE*);  
  - The number of Full Engine (*NUM_ENGINE_FULL*);  
  - The number of inputs of the Last Engine (*NUM_INPUT_LAST_ENGINE*);  
  - The bit dimension of the input of the engine (*BIT_IN_ENGINE*) using the *Compute_Bit_In* function;  
  - The bit dimension of the output of the Full Engine (*BIT_OUT_ENGINE_FULL*) using the *Compute_Bit_Out* function;  
  - The bit dimension of the output of the Last Engine (*BIT_OUT_LAST_ENGINE*) using *Compute_Bit_Out* function.  

Moreover the module instantiate *NUM_ENGINE_FULL* Full Engine (Engine at *MAX_IN_VAL_ENGINE* Input) and *if NUM_INPUT_LAST_ENGINE /= 0* a Last Engine (Engine at *NUM_INPUT_LAST_ENGINE*).  
Finally the module manages the valid of the pipeline assigning *Valid_in* to *Valid_out* at each rising edge of the clock and manages the Free Running Mode: if *FREE_RUNNING = TRUE* set the *Enable* signal to '1' otherwise if *FREE_RUNNING = FALSE* the *Enable* signal corresponds to *Valid_in*.

![Step Image](IperDecoder.doc/Step_T2B.png)


## Engine_T2B
Adder with edge control (T2B) that sums all the inputs.

### Generic

  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **MAX_IN_VAL**:  Maximum input value available, *POSITIVE* type.
  - **NUM_INPUT**: Number of inputs of the *Engine_T2B*, *POSITIVE* type.

### Port

  - **Reset**:  Asynchronous reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **Clk**: Clock signal.

  - **Enable**: Engine_T2B enable, *STD_LOGIC* type.
  - **EnginIn**: Input Data composed by *NUM_INPUT* values (0 <= Val <= MAX_IN_VAL), *STD_LOGIC_VECTOR* type.
  - **EmptyIn**: Flags of zeros if *NUM_INPUT* is 0, *STD_LOGIC_VECTOR* type.
  - **FullIn**: Flags of ones if *NUM_INPUT* is *MAX_IN_VAL*, *STD_LOGIC_VECTOR* type.

  - **SumOut**: Output composed by the Sum of the Value in the range >= 0 and <= MAX_IN_VAL * NUM_INPUT, *STD_LOGIC_VECTOR* type.
  - **EmptyOut**: Flags of zeros if *SumOut* is 0, *STD_LOGIC* type.
  - **FullOut**: Flags of ones if *SumOut* is NUM_INPUT * MAX_IN_VAL, *STD_LOGIC* type.

The module assigns:

  - The maximum value of *SumOut* (*MAX_OUT_VAL*);  
  - The bit dimension of the input of the Engine (*BIT_IN*)   needed to contain *MAX_IN_VAL* using the *Compute_Bit_In* function;  
  - The bit dimension of the output of Engine (*BIT_OUT*) needed to contain *SumOut* using *Compute_Bit_Out* function.  

Moreover if *Enable = '1'* the module sums all the *NUM_INPUT* inputs contained in *EnginIn* and saves the result in *SumOut*.  
Finally if *EDGE_CHECK = TRUE* the module check if the *NUM_INPUT* inputs are at zero and flags *EmptyOut* or if the *NUM_INPUT* inputs are at *MAX_OUT_VAL* and flags *FullOut*.

![Engine Image](IperDecoder.doc/Engine_T2B.png)


## LocalPackage_T2B
Functions, Procedures and Types required by the *T2B* modules.

### Types

  - **STEP_T2B_PIPELINE_RECORD_TYPE**: It is a Record that reassume the Generic and Length of Step_T2B. it contains *NUM_INPUT_TOT[NIT]*, *MAX_IN_VAL_ENGINE[MIE]*, *MAX_INPUT_ENGINE[NIE]*, *LENGTH_DATA_IN[LNG_IN]*, *LENGTH_DATA_OUT[LNG_OUT]*, *LENGTH_EDGE_IN[LEF_IN]*, *LENGTH_EDGE_OUT[LEF_OUT]*.

  - **STEP_T2B_PIPELINE_RECORD_ARRAY_TYPE**: Array of *STEP_T2B_PIPELINE_RECORD_TYPE*, which is required for setting the pipeline

  - **T2B_POSITIVE_ARRAY_TYPE**: Array of *POSITIVE*.


### Functions

  - **Insert_ThermoIn_In_Pipe**: Insert *ThermoIn* in *Data_pipe(0)* according to the *SAVE_BIT* and *INVERT_THERMO_IN*.  
  If *SAVE_BIT = TRUE* and *INVERT_THERMO_IN = TRUE* the *Data_pipe(0)* correspond to inverted *ThermoIn* from 0 to THERMO_BIT-1.  
  If *SAVE_BIT = TRUE* and *INVERT_THERMO_IN = FALSE* the *Data_pipe(0)* correspond to NOT inverted *ThermoIn* from 0 to THERMO_BIT-1.  
  If *SAVE_BIT = FALSE* and *INVERT_THERMO_IN = TRUE* the *Data_pipe(0)* correspond to inverted *ThermoIn* from 0 to THERMO_BIT.  
  If *SAVE_BIT = FALSE* and *INVERT_THERMO_IN = FALSE* the *Data_pipe(0)* correspond to NOT inverted *ThermoIn* from 0 to THERMO_BIT.

  - **Find_Max_Bit_Length_T2B**: Find the maximum *BIT_LENGTH* of *Data_STD_LOGIC_ARRAY_TYPE*, which corrispond to the longest between the *PIPELINE_RECORD_ARRAY(I).LENGTH_DATA_IN*.

  - **Compute_Bit_In**: Find the number of bit at the input given the max input value.

  - **Compute_Bit_Out**: Find the number of bit at the output given the max input value and the number of input.

  - **log2_unsigned**: Compute the ceil(log2(x)), where x is natural.

  - **log2_integer**: Compute the ceil(log2(x)), where x is integer, if x >= 1 else return 0.

  - **div_exc**: Compute the ceil(real(x/y)) where x,y are natural.

  - **step_T2B_max_input_engine_init**: Set the max number of input of each stage of the pipeline and put them together in the *max_input_per_engine_pipeline_tmp* variable, which is an array of Positive.

  - **step_T2B_pipeline_init**: Creates the whole structure of the *ThermoToBin* setting the number of Steps and all the generic of each Step of the pipeline (*NUM_INPUT_TOT*, *MAX_IN_VAL_ENGINE*, *LENGTH_DATA_IN*). If the *number_of_step* is greater of the number of elements of *max_input_per_engine_array*, the max number of inputs of the engine of that step (*step_T2B_pipeline_record_array_tmp(number_of_step).MAX_INPUT_ENGINE*) is set equal to the last element of *max_input_per_engine_array* which must be set on purpose to a value greater than 1. This function creates the last Step when the number of inputs of a certain Step (*step_T2B_pipeline_record_array_tmp(number_of_step).NUM_INPUT_TOT*) is lower than the max number of inputs of the engine of that Step (*step_T2B_pipeline_record_array_tmp(number_of_step).MAX_INPUT_ENGINE*).

 >>>>>>> #### First Step (0)

 >>>>>	   NIT[0]      = num_bit_input
 >>>>>	   MIV[0]      = 1
 >>>>>     NIE[0]      = max_input_per_engine_array(0),fixed
 >>>>>     LNG_IN[0]   = NIT[0] * ceil(log2(MIV[0])+1)
 >>>>>     LNG_OUT [0] = LNG_IN[1]
 >>>>>	   LEF_IN[0]   = num_bit_input
 >>>>>     LEF_OUT[0]  = NIT[1]

 >>>>>>> #### Generic Step_T2B (n)

 >>>>>		NIT[n]  	= ceil(NIT[n-1]/NIE[n-1])
 >>>>>	    MIV[n]	    = MIV[n-1] * NIE[n-1]
 >>>>>      NIE[n]      = max_input_per_engine_array(n),fixed
 >>>>>      LNG_IN[n]	= NIT[n] * ceil(log2(MIV[n])+1)
 >>>>>      LNG_OUT[n]	= LNG_IN[n+1]
 >>>>>	    LEF_IN[n]	= NIT[n]
 >>>>>      LEF_OUT[n]	= NIT[n+1]


### Procedures

  - **write_to_file_step_T2B_pipeline_init**:  Print the value of all generic of the Steps of the pipeline on a text file named *result_LocalPackage_T2B*. This function is called inside the *step_T2B_pipeline_init* function.  


## AXI4Stream_DecoderLog2
Wrapping of DecoderLog2 for AXI4-Stream interface.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **TYPE_EDGE**: Specify if the Edge to be detected is Down or Up, *STRING(1 To 2)* type, default **DN**.

  - **BIT_TDL**: Bit Dimension of the TDL/input data, *POSITIVE* type *RANGE  4  TO  4096*.
  - **BIT_BUBBLE**: Bit Dimension of the Bubble, *POSITIVE* type *RANGE  1  TO  16*.
  - **BIT_DECO**: Bit Dimension of the decoded output data, *POSITIVE* type.

  - **PRINT_FULL_REPORT**: Specify if print all the configurations of the DecoLog2, *BOOLEAN* type, default **TRUE**.
  - **OPTIMIZATION_MODE**: Set the parameter to be optimized among Area, Time and Cost, *STRING(1 To 4)* type, default **TIME**.
  - **WEIGHT_AREA_VS_TIME_PERCENT**: Percent weigth between Area and Time if the Cost is set, *INTEGER* type *RANGE  0 TO  100*, default **50**.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**:  System clock.

  - **s00_undeco**: AXI4 Stream Slave (Input) interface, undecoded data coming from the previous module(Tapped Delay-Line(TDL)).
     - **s00_undeco_tvalid**: Valid of undecoded input data, *STD_LOGIC* type.
     - **s00_undeco_tdata**: Undecoded input Data padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_TDL-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_TDL-1 downto 0)* type.

  - **m00_deco**: AXI4 Stream Master (Output) interface, decoded data of TDL.
     - **m00_deco_tvalid**: Valid of decoded output data, *STD_LOGIC* type.
     - **m00_deco_tdata**: Decoded output data with the proper FID padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_DECO-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_DECO-1 downto 0)* type.

The module instantiates the *DecoderLog2*, set to '0' the MSBs of the output data (*m00_deco_tdata(m00_deco_tdata'LENGTH-1 downto BIT_DECO)*) and rename the input and output interfaces with AXI4-Stream, input as slave and output as master.


## DecoderLog2
Convert Undeco_TDL in Deco_TDL with bubble length equal to *BIT_BUBBLE*.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **TYPE_EDGE**: Specify if the Edge to be detected is Down or Up, *STRING(1 To 2)* type, default **DN**.

  - **BIT_TDL**: Bit Dimension of the TDL/input data, *POSITIVE* type *RANGE  4  TO  4096*.
  - **BIT_BUBBLE**: Bit Dimension of the Bubble, *POSITIVE* type *RANGE  1  TO  16*.
  - **BIT_DECO**: Bit Dimension of the decoded output data, *POSITIVE* type.

  - **PRINT_FULL_REPORT**: Specify if print all the configurations of the DecoLog2, *BOOLEAN* type, default **TRUE**.
  - **OPTIMIZATION_MODE**: Set the parameter to be optimized among Area, Time and Cost, *STRING(1 To 4)* type, default **TIME**.
  - **WEIGHT_AREA_VS_TIME_PERCENT**: Percent weigth between Area and Time if the Cost is set, *INTEGER* type *RANGE  0 TO  100*, default **50**.

### Port

  - **reset**:  Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **Valid_Undeco_TDL**: Valid of undecoded input data, *STD_LOGIC* type.
  - **Undeco_TDL**: Undecoded input Data from Tapped Delay-Line, *STD_LOGIC_VECTOR(BIT_TDL-1 downto 0)* type.

  - **Valid_Deco_TDL**: Valid of decoded output data, *STD_LOGIC* type.
  - **Deco_TDL**: Decoded output data of TDL, *STD_LOGIC_VECTOR(BIT_DECO-1 downto 0)* type.

The module generates all the generics of *TreeAdder* and *Log2* assigning them to the *DECOLOG2_GENERIC* constant using the *Optimize_DecoLog2* function.  
Finally it instantiates the *DecoderLog2Wrapper_DecoLog2* using the generics generated before.


## DecoderLog2Wrapper_DecoLog2
Distribute the Undeco_TDL with *BIT_BUBBLE* between different *DataIn* without bubble.

### Generic

  - **BIT_TDL**: Bit Dimension of the *Undeco_TDL* input data, *POSITIVE* type.
  - **BIT_BUBBLE**: Bit Dimension of the Bubble, *POSITIVE* type.
  - **BIT_DECO**: Bit Dimension of the *Deco_TDL* output data, *POSITIVE* type.

  - **TYPE_EDGE**: Specify if the Edge to be detected is Down or Up, *STRING(1 To 2)* type, default **DN**.

  - **FREE_RUNNING_LOG2**: Enable/Disable the Free Running mode for the *Log2*, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK_LOG2**: Check in pipeline of the *Log2* if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **BIT_DATA_LOG2**: Bit Dimension of input data of the *Log2*, *POSITIVE* type.
  - **BIT_LOG2_LOG2**: Bit Dimension of output data of the *Log2*, *POSITIVE* type.

  - **FREE_RUNNING_TA**: Enable/Disable the Free Running mode for the *TreeAdder*, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **MAX_INPUT_ENGINE_PIPELINE_TA**: Select the max number of input per stage, *MAX_INPUT_ENGINE_PIPELINE_TA_ARRAY_TYPE* type.

  - **NUM_INPUT_TA**: Total number of inputs, *POSITIVE* type.
  - **MAX_IN_VAL_TA**:  Maximum input value available, *POSITIVE* type.

  - **BIT_OUT_TA**: Bit Dimension of the output of the *TreeAdder*, *POSITIVE* type.

### Port

  - **reset**: Asynchronous reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **Valid_Undeco_TDL**: Valid of Thermometric input data, *STD_LOGIC* type.
  - **Undeco_TDL**: Undecoded (Thermometric) input Data, *STD_LOGIC_VECTOR(BIT_TDL-1 downto 0)* type.

  - **Valid_Deco_TDL**: Valid of binary output data, *STD_LOGIC* type.
  - **Deco_TDL**:  Decoded (Binary) output data, *STD_LOGIC_VECTOR(BIT_DECO-1 downto 0)* type.

The module defines 2 functions that are not in Package:  
  - **From_UndecoTDL_To_DataIn**: Split the Thermometric input data (*Undeco_TDL*) in *num_log2* bubbles, each of which is the input of a *Log2* module;  
  - **From_Log2Out_To_DataVctIn**: Merge the outputs (*Log2Out*) of each *Log2* module in a single vector (*DataVctIn*) which is the input of the *TreeAdder* module.  

Moreover the module istantiates *NUM_INPUT_TA* *Log2Dn* or *Log2Up* according to *TYPE_EDGE* in order to perform the decoding without the bubbles and the *TreeAdder* in order to perform the sum for remove the bubbles.  
Finally it assigns:

  - The Valid of the Thermometric input data (*Valid_Undeco_TDL*) to all the Valids of the input of *Log2* modules (*Valid_DataIn*);  
  - The input data (*DataIn*) of the *Log2* modules using the *From_UndecoTDL_To_DataIn* function;  
  - The Valids of the output (*Valid_Log2Out*) of *Log2* modules to the Valids of the input (*Valids_DataVctIn*) of *TreeAdder* module;  
  - The input data (*DataVctIn*) of the *TreeAdder* module using the *From_Log2Out_To_DataVctIn* function;  
  - The output Valid (*Valid_DataOut*) of *TreeAdder* to the Valid of Binary output data (*Valid_Deco_TDL*);  
  - The output data (*DataOut*) of *TreeAdder* to the Binary output data (*Deco_TDL*).


## LocalPackage_DecoLog2
Functions, Procedures, Contants and Types required by the *DecoLog2* module.

### Constants

  - **LENGTH_MAX_INPUT_ENGINE_PIPELINE**: Number of Pipeline Stages of TA considered in *AreaTimingPackage_DecoLog2*.

  - **COST_PRECISION_COMPUTATION**: Value Used for the integer division.

  - **MAX_AREA**: Maximum Value of the Area occupation set by hand.
  - **MAX_DELAY**: Maximum Value of the Delay propagation set by hand.
  - **MAX_COST**: Maximum Value of the Cost set by hand.

  - **FILE_PATH**: File Location Path.
  - **FILE_NAME**: Name of the text file where you print all the configuration of the *DecoLog2*.
  - **FILE_PATH_NAME**: Effective File Location Path.

  - **MIN_BIT_TDL_RANGE**: The Minimum of TDL is the minimum that Log2 allow, 2<sup>MIN_BIT_LOG2</sup>.

  - **MAX_BIT_TDL_RANGE**: The Maximum of TDL is the maximum that Log2 allow, 2<sup>MAX_BIT_LOG2</sup>.

  - **MIN_BIT_BUBBLE_RANGE**: The Minimum of BUBBLE is none, so 1.

  - **MAX_BIT_BUBBLE_RANGE**: The Maximum of Bubble is the maximum number of input of TA (*MAX_NUMBER_OF_INPUT*).

  - **MIN_BIT_DECO_RANGE**: The Minimum output is the minimum of Log2, *MIN_BIT_LOG2*.

  - **MAX_BIT_DECO_RANGE**: The maximum output is the maximum of TA, *MAX_BIT_INPUT* + *(log2_unsigned(MAX_NUMBER_OF_INPUT-1)+1)*.


### Types

  - **LOG2_GENERIC_RECORD_TYPE**: It is a Record that assemble the Generics of the *Log2* module.

  - **MAX_INPUT_ENGINE_PIPELINE_TA_ARRAY_TYPE**: Subtype of *TA_POSITIVE_ARRAY_TYPE* ranging from '0' to *LENGTH_MAX_INPUT_ENGINE_PIPELINE-1*.

  - **TA_GENERIC_RECORD_TYPE**: It is a Record that assemble the Generics of the *TreeAdder* module.

  - **DECOLOG2_GENERIC_RECORD_TYPE**: It is a Record that assemble the Generics of *Decoder_Log2* putting together the Generics of *log2* and *TreeAdder*.

  - **DN_VS_UP_STRING**: Subtype of *TYPE_EDGE*, Down or Up.

  - **DECOLOG_OPTIMIZATION_MODE_STRING**: Subtype of the *Optimization Mode*, AREA vs TIME vs COST.

  - **REPORT_RECORD_TYPE**: Report Compiled by Optimization.

  - **REPORT_ARRAY_RECORD_TYPE**: Array of Reports (*REPORT_RECORD_TYPE*).


### Function

  - **Optimize_DecoLog2**: Set all the Generic of the *DecoderLog2*.  
  First of all it prints the initial settings of *Log2 Dn/Up*, *TreeAdder* and *DecoLog2* using the *Print_Init_Configuration_DecoLog2* procedure and then check if there is a bubble: if you have not a bubble (*bit_bubble = 1*) you can have the solution with only *Log2* and then the function assigns to the *only_Log2* variable a possible configuration without *TreeAdder* using the *Set_Possible_Configuration_DecoLog2* function.  
  Then it finds all the configurations of *DecoderLog2* using many times the *Set_Possible_Configuration_DecoT2B* function and if *PRINT_FULL_REPORT = TRUE* it prints all the configurations on a text file using the *Print_All_Configuration_DecoLog2* procedure.  
  Moreover it choose the possible configurations among all the configuration and, in particular, choose the best configuration according to the optimization mode(AREA VS TIME VS COST) using the *Choose_Configuration_DecoLog2* procedure and print it in the text file using *Print_Choosen_Configuration_DecoLog2* procedure and if *PRINT_FULL_REPORT = TRUE* it print the possible configurations using the *Print_Possible_Configuration_DecoLog2* procedure.  
  Finally it returns the generics of the *DecoLog2* of the chosen configuration using *Write_Configuration_DecoLog2* function.

  - **Set_Possible_Configuration_DecoLog2**: Compile a Report by setting a *possible_configuration* computing:  
    - The bit dimension of the input (*bit_data_LOG2*), the bit dimension of the output (*bit_log2_LOG2*), the Generics (*Log2_generic_tmp*), the Area and Timing usage (*Log2_area_timing_tmp*) in terms of LUTs, Flip-Flops and Delay of the *Log2* module;  
    - The number of inputs (*num_input_TA*), the maximum input value (*max_in_val_TA*) and if *set_bit_bubble >= 2* the Generics (*TreeAdder_generic_tmp*), the Area and Timing usage (*TreeAdder_area_timing_tmp*) in terms of LUTs, Flip-Flops and Delay of the *TreeAdder* module.  

  - **set_min_bit_tdl**: Set the minimum bit dimension of the TDL returning *bit_tdl*.

  - **set_max_bit_tdl**: Set the maximum bit dimension of the TDL returning *max_bit_tdl*, which correspond to *bit_data = 2<sup>bit_log2</sup>*.

  - **set_min_bit_bubble**: Set the minimum bit dimension of the Bubble: if *bit_bubble < MIN_NUMBER_OF_INPUT*, *min_bit_bubble := MIN_NUMBER_OF_INPUT* else *min_bit_bubble := bit_bubble*.

  - **set_max_bit_bubble**: Set the maximum bit dimension of the Bubble, which should be equal to the *MAX_NUMBER_OF_INPUT* of *TreeAdder*, but if *min_bit_tdl_tmp <= min_bit_tdl_allowed* then *max_bit_bubble := integer(min_bit_tdl_tmp) / integer(2<sup>MIN_BIT_LOG2</sup>)*.

  - **set_min_input_engine_pipeline**: Set the minimum number of inputs in engine TA returning *MIN_INPUT_ENGINE*.

  - **set_max_input_engine_pipeline**: Set the maximum number of inputs in engine TA returning *MAX_INPUT_ENGINE*.

  - **Log2_TA_area**: Evaluate the total Area of a possible configuration of the *TreeAdder* and of all the *Log2* in terms of FFs and LUTs usage.

  - **Log2_TA_delay**: Evaluate the maximum local Delay of a possible configuration between the *TreeAdder* and *Log2*.

  - **Log2_TA_cost**: Cost of the relative area and relative delay respect to the max value and the precision of a possible configuration of the *TreeAdder* and *Log2*.

  - **Write_Configuration_DecoLog2**: Write all the generics of the *TreeAdder* and *Log2* contained in the *choosen_configuration* into *decoLog2_settings*.

  - **is_pwr2**: Check if the natural input *x* is a power of 2 and in this case it returns *TRUE*, otherwise it returns *FALSE*.

  - **log2_unsigned**: Compute the ceil(log2(x)) where x is natural.

  - **div_exc**: Compute the ceil(real(x/y)) where x,y are natural.

  - **bool_to_integer**: Return 1 if the boolean input *x* is *TRUE* otherwise it returns 0.


### Procedures

  - **Choose_Configuration_DecoLog2**: Choose the best configuration according to the optimization mode (AREA VS TIME VS COST).  
  First of all, it check if the configuration which has only the *Log2* module is a possible solution (which is so if *possible_configuration_tmp.TreeAdder_generic.NUM_INPUT_TA = 1* and *possible_configuration_tmp.is_a_possible_solution = TRUE*) and compute the feature to be optimized (total Area in terms of FFs and LUTs using *Log2_TA_area* function or Delay of *TreeAdder* and *Log2* using *Log2_TA_delay* function or Cost in terms of area and delay of the *TreeAdder* and *Log2* using the *Log2_TA_cost* function) in order to verify if this configuration is the best solution respect the constraint (*optimize_ref*) imposed by the feature to be optimized.  
   Then it check if all the configuration are possible solutions (which is so if *possible_configuration_tmp.is_a_possible_solution = TRUE*) and compute the feature to be optimized (total Area in terms of FFs and LUTs using *Log2_TA_area* function or Delay of the *TreeAdder* and *Log2* using *Log2_TA_delay* function or Cost in terms of area and delay of the *TreeAdder* and *Log2* using the *Log2_TA_cost* function) in order to compare all the configurations for searching the best solution which respect the constraint (*optimize_ref*) imposed by the feature to be optimized.

  - **Print_Init_Configuration_DecoLog2**: Print the initial settings of *Log2 Dn/Up*, *TreeAdder* and *Decoder_Log2* in a text file named *result_LocalPackage_DecoLog2*.

  - **Print_All_Configuration_DecoLog2**: Print all the configurations of the *TreeAdder* and *Log2* in a text file named *result_LocalPackage_DecoLog2* using the *Print_REPORT_RECORD_TYPE_DecoLog2* function for each single configuration.  
  Moreover if the *TreeAdder* has only one input (*only_Log2.TreeAdder_generic.NUM_INPUT_TA = 1*) it print the no bubble solution (*only_log2*) using *Print_REPORT_RECORD_TYPE_DecoLog2*.

  - **Print_Possible_Configuration_DecoLog2**: Print all the possible configurations of the *TreeAdder* and *Log2* in a text file named *result_LocalPackage_DecoLog2* using the *Print_REPORT_RECORD_TYPE_DecoLog2* function for each single configuration only if *to_write_configuration.is_a_possible_solution = TRUE*.  
  Moreover if the *TreeAdder* has only one input (*possible_only_Log2.TreeAdder_generic.NUM_INPUT_TA = 1*) it print the no bubble solution (*possible_only_log2*) using *Print_REPORT_RECORD_TYPE_DecoLog2*.

  - **Print_Choosen_Configuration_DecoLog2**: Print the chosen configuration of *TreeAdder* and *Log2* in a text file named *result_LocalPackage_DecoLog2* using the *Print_REPORT_RECORD_TYPE_DecoLog2* function.

  - **Print_REPORT_RECORD_TYPE_DecoLog2**: Print one configuration of *TreeAdder* and *Log2* in a text file named *result_LocalPackage_DecoLog2*.


## AreaTimingPackage_DecoLog2
Autogenerated Package used to compute the Area Occupation and the relative Propagation Delay of *TreeAdder* and *Log2*.

### Constants

  - **MIN_BIT_LOG2**: Minumum number of bit of the *Log2*.

  - **MAX_BIT_LOG2**: Maximum number of bit of the *Log2*.

  - **MIN_NUMBER_OF_INPUT**: Minumum number of inputs of the *TreeAdder*.

  - **MAX_NUMBER_OF_INPUT**: Maximum number of inputs of the *TreeAdder*.

  - **MIN_INPUT_ENGINE**: Minumum number of inputs of the *Engine_TA*.

  - **MAX_INPUT_ENGINE**: Maximum number of inputs of the *Engine_TA*.

  - **MIN_BIT_INPUT**: Minumum number of input bit of the *TreeAdder*.

  - **MAX_BIT_INPUT**: Maximum number of input bit of the *TreeAdder*.

  - **LOG2DN_AREA_TIMING_USAGE**: Autocomputed Constant which report the usage of Area and the Timing of the *Log2Dn* in all the possible configurations.

  - **LOG2UP_AREA_TIMING_USAGE**: Autocomputed Constant which report the usage of Area and the Timing of the *Log2Up* in all the possible configurations.

  - **TA_AREA_TIMING_USAGE**: Autocomputed Constant which report the usage of Area and the Timing of the *TreeAdder* in all the possible configurations.


### Types

  - **AREA_TIMING_RECORD_TYPE**: It is a Record that report the occuped Area, in terms of number of total LUTs required (*LUTs*) and number of total Flip-Flops required (*FFs*), and the Timing, in terms of maximum asynchronous Propagation Logic Delay espressed as minimum asynchronous Propagation Logic Delay available (*DELAY*).

  - **LOG2_AREA_TIMING_ARRAY_RECORD_TYPE**: It is an array of *AREA_TIMING_RECORD_TYPE* for the *Log2*.

  - **TA_AREA_TIMING_ARRAY_RECORD_TYPE**: It is an array of *AREA_TIMING_RECORD_TYPE* for the *TreeAdder*.


## AXI4Stream_Log2Dn
Wrapping of Log2Dn for AXI4-Stream interface.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Control in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **BIT_DATA**: Bit Dimension of input data, *POSITIVE* type *RANGE  4  TO  4096*. It is necessary to have *BIT_DATA = 2<sup>BIT_LOG2</sup>*.
  - **BIT_LOG2**: Bit Dimension of output data, *POSITIVE* type *RANGE  2  TO  12*.

### Port

  - **Reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **Clk**: System clock.

  - **s00_data**: AXI4 Stream Slave (Input) interface, undecoded data coming from the previous module(TDL).
     - **s00_data_tvalid**: Valid of the input data, *STD_LOGIC* type.
     - **s00_data_tdata**: Undecoded input data padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_DATA-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_DATA-1 downto 0)* type.

  - **m00_log2dn**: AXI4 Stream master (Output) interface, containing the decoded data (Log2 of the input data).
     - **m00_log2dn_tvalid**: Valid of the output data, *STD_LOGIC* type.
     - **m00_log2dn_tdata**: Decoded output data with the proper FID padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_LOG2-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_LOG2-1 downto 0)* type.

The module instantiates the *Log2Dn*, set to '0' the MSBs of the output data (*m00_log2dn_tdata(m00_log2dn_tdata'LENGTH-1 downto BIT_LOG2)*) and rename the input and output interfaces with AXI4-Stream, input as slave and output as master.


## Log2Dn
Instantiate all the modules of the pipeline and find the Edge with Log2(x) in Pipeline.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **BIT_DATA**: Bit Dimension of input data, *POSITIVE* type *RANGE  4  TO  4096*. It is necessary to have *BIT_DATA = 2<sup>BIT_LOG2</sup>*.
  - **BIT_LOG2**: Bit Dimension of output data, *POSITIVE* type *RANGE  2  TO  12*.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **Valid_DataIn**: Valid of *DataIn*, *STD_LOGIC* type.
  - **DataIn**: Input data at *BIT_DATA*, *STD_LOGIC_VECTOR(BIT_DATA-1 downto 0)* type.

  - **Valid_Log2DnOut**: Valid of *Log2DnOut*, *STD_LOGIC* type.
  - **Log2DnOut**: Output data at *BIT_LOG2*, *STD_LOGIC_VECTOR(BIT_LOG2-1 downto 0)* type.

The module instantiates the first stage (*Log2Dn_Init*), *BIT_LOG2 -2* standard stages (*Log2Dn_Mod*) and the last stage (*Log2Dn_Last*) of the pipeline linking the input signal (*DataIn*) to the first stage and the output signal (*Log2DnOut*) to the last stage.  
Moreover if *EDGE_CHECK = TRUE* it generates the *yesEdge* signal checking if there was an edge in the input data (*yesEdge = '1'* if *noEdgeFull = '0'* and *noEdgeEmpty = '0'*). The valid of the output data (*Valid_Log2DnOut*) is then set as the "and" between the output valid of the last stage of the pipeline (*start*) and *yesEdge*.


## Log2Dn_Init
Initialization of the pipeline.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **BIT_HALF**: Bit Dimension of the pipeline stage, *POSITIVE* type.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **start_in**:  Valid of *v_in*, *STD_LOGIC* type
  - **v_in**: Input data of the first stage of the pipeline, *STD_LOGIC_VECTOR (2* * *BIT_HALF-1 downto 0)* type.

  - **start_out**: Valid of *v_out*, *STD_LOGIC* type.
  - **v_out**: Output data of the first stage of the pipeline, *STD_LOGIC_VECTOR (BIT_HALF-1 downto 0)* type.

  - **noEdgeFull_out**: Propagates along the pipeline the signal which takes into account if the input data is all at "1" (Full), *STD_LOGIC* type.
  - **noEdgeEmpty_out**: Propagates along the pipeline the signal which takes into account if the input data is all at "0" (Empty), *STD_LOGIC* type.

  - **r_out**: MSB of the final result (Log2 of the input data), *STD_LOGIC* type.

The module manages the Free Running mode: if *FREE_RUNNING = TRUE* set the *Enable* signal to '1' otherwise if *FREE_RUNNING = FALSE* the *Enable* signal correspond to *start_in*.  
Moreover if *Enable = '1'* it check if there is at least a '1' in the upper part (edge in the second half) of the input data.  
If there is a '1' it transfer only the first half of the input data to the next stage (*v_out <= v_in(2* * *BIT_HALF-1 downto BIT_HALF)*), set the MSB of the final result to '1' (*r_out <= '1'*) and if *EDGE_CHECK = TRUE* set the *noEdgeEmpty_out* signal to '0' since the chain is not empty of '1'; on the contrary, if there is not a '1' it transfer only the second half of the input data (*v_out <= v_in(BIT_HALF-1 downto 0)*) to the next stage, set the MSB of the final result to '0' (*r_out <= '0'*) and if *EDGE_CHECK = TRUE* set the *noEdgeFull_out* signal to '0' since the chain is not full of '1'.


## Log2Dn_Mod
Standard module of the pipeline.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **BIT_HALF**: Bit Dimension of the pipeline stage, *POSITIVE* type.
  - **BIT_STAGE**: Number of the current pipeline stage and Bit Dimension of the output (*r_out*), *POSITIVE* type.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **start_in**:  Valid of *v_in*, *STD_LOGIC* type
  - **v_in**: Input data of the stage I of the pipeline, *STD_LOGIC_VECTOR (2* * *BIT_HALF-1 downto 0)* type.

  - **noEdgeFull_in**: Signal propagated from the previous stages of the pipeline which takes into account if the input data is all at "1" (Full),*STD_LOGIC* type
  - **noEdgeEmpty_in**: Signal propagated from the previous stages of the pipeline which takes into account if the input data is all at "0" (Empty),*STD_LOGIC* type.

  - **r_in**: Value of the final result (Log2 of the input data) propagated from the previous stages of the pipeline ),*STD_LOGIC_VECTOR(BIT_STAGE-1 downto 0)* type.

  - **start_out**: Valid of *v_out*, *STD_LOGIC* type.
  - **v_out**: Output data of the stage I of the pipeline, *STD_LOGIC_VECTOR (BIT_HALF-1 downto 0)* type.

  - **noEdgeFull_out**: Propagates along the pipeline the signal which takes into account if the input data is all at "1" (Full), *STD_LOGIC* type.
  - **noEdgeEmpty_out**: Propagates along the pipeline the signal which takes into account if the input data is all at "0" (Empty), *STD_LOGIC* type.

  - **r_out**: Propagates along the pipeline the value of the final result (Log2 of the input data), *STD_LOGIC_VECTOR(BIT_STAGE downto 0)* type.

The module manages the Free Running mode: if *FREE_RUNNING = TRUE* set the *Enable* signal to '1' otherwise if *FREE_RUNNING = FALSE* the *Enable* signal correspond to *start_in*.  
Moreover if *Enable = '1'* it check if there is at least a '1' in the upper part (edge in the second half) of the input data of the stage.  
If there is a '1' it transfer only the first half of the input data to the next stage (*v_out <= v_in(2* * *BIT_HALF-1 downto BIT_HALF)*), accost a '1' in the final result (*r_out <= r_in&"1"*) and if *EDGE_CHECK = TRUE* set the *noEdgeEmpty_out* signal to '0' since the chain is not empty of '1' and propagates the *noEdgeFull_in* signal; on the contrary, if there is not a '1' it transfer only the second half of the input data (*v_out <= v_in(BIT_HALF-1 downto 0)*) to the next stage, accost a '0' in the final result (*r_out <= r_in&"0"*) and if *EDGE_CHECK = TRUE* set the *noEdgeFull_out* signal to '0' since the chain is not full of '1' and propagates the *noEdgeEmpty_in* signal.


## Log2Dn_Last
Last module of the pipeline.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Check in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **BIT_STAGE**: Number of the current pipeline stage and Bit Dimension of the output (*r_out*), *POSITIVE* type.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **start_in**:  Valid of *v_in*, *STD_LOGIC* type
  - **v_in**: Input data of the last stage of the pipeline, *STD_LOGIC_VECTOR(2-1 downto 0)* type.

  - **noEdgeFull_in**: Signal propagated from the previous stages of the pipeline which takes into account if the input data is all at "1" (Full),*STD_LOGIC* type
  - **noEdgeEmpty_in**: Signal propagated from the previous stages of the pipeline which takes into account if the input data is all at "0" (Empty),*STD_LOGIC* type.

  - **r_in**: Value of the final result (Log2 of the input data) propagated from the previous stages of the pipeline ),*STD_LOGIC_VECTOR(BIT_STAGE-1 downto 0)* type.

  - **start_out**: Valid of output data, *STD_LOGIC* type.

  - **noEdgeFull_out**: Propagates outside the pipeline the signal which takes into account if the input data is all at "1" (Full), *STD_LOGIC* type.
  - **noEdgeEmpty_out**: Propagates outside the pipeline the signal which takes into account if the input data is all at "0" (Empty), *STD_LOGIC* type.

  - **r_out**: Propagates outside the pipeline the value of the final result (Log2 of the input data), *STD_LOGIC_VECTOR(BIT_STAGE downto 0)* type.

The module manages the Free Running mode: if *FREE_RUNNING = TRUE* set the *Enable* signal to '1' otherwise if *FREE_RUNNING = FALSE* the *Enable* signal correspond to *start_in*.  
Moreover if *Enable = '1'* it check if there is at least a '1' in the upper part (edge in the second half) of the input data of the stage.  
If there is a '1' it accost a '1' in the final result (*r_out <= r_in&"1"*) and if *EDGE_CHECK = TRUE* set the *noEdgeEmpty_out* signal to '0' since the chain is not empty of '1' and propagates the *noEdgeFull_in* signal; on the contrary, if there is not a '1' it accost a '0' in the final result (*r_out <= r_in&"0"*) and if *EDGE_CHECK = TRUE* set the *noEdgeFull_out* signal to '0' since the chain is not full of '1' and propagates the *noEdgeEmpty_in* signal.


## AXI4Stream_Log2Up
Wrapping of Log2Up for AXI4-Stream interface.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Control in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **BIT_DATA**: Bit Dimension of input data, *POSITIVE* type *RANGE  4  TO  4096*. It is necessary to have *BIT_DATA = 2<sup>BIT_LOG2</sup>*.
  - **BIT_LOG2**: Bit Dimension of output data, *POSITIVE* type *RANGE  2  TO  12*.

### Port

  - **Reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **Clk**: System clock.

  - **s00_data**: AXI4 Stream Slave (Input) interface, undecoded data coming from the previous module (TDL).
     - **s00_data_tvalid**: Valid of the input data, *STD_LOGIC* type.
     - **s00_data_tdata**: Undecoded input data padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_DATA-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_DATA-1 downto 0)* type.

  - **m00_log2up**: AXI4 Stream master (Output) interface, containing the decoded data (Log2 of the input data).
     - **m00_log2up_tvalid**: Valid of the output data, *STD_LOGIC* type.
     - **m00_log2up_tdata**: Decoded output data with the proper FID padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_LOG2-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_LOG2-1 downto 0)* type.

The module instantiates the *Log2Up*, set to '0' the MSBs of the output data (*m00_log2up_tdata(m00_log2up_tdata'LENGTH-1 downto BIT_LOG2)*) and rename the input and output interfaces with AXI4-Stream, input as slave and output as master.


## Log2Up
Instantiate all the modules of the pipeline.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Control in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **BIT_DATA**: Bit Dimension of input data, *POSITIVE* type *RANGE  4  TO  4096*. It is necessary to have *BIT_DATA = 2<sup>BIT_LOG2</sup>*.
  - **BIT_LOG2**: Bit Dimension of output data, *POSITIVE* type *RANGE  2  TO  12*.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **Valid_DataIn**: Valid of *DataIn*, *STD_LOGIC* type.
  - **DataIn**: Input data at *BIT_DATA*, *STD_LOGIC_VECTOR(BIT_DATA-1 downto 0)* type.

  - **Valid_Log2UpOut**: Valid of *Log2UpOut*, *STD_LOGIC* type.
  - **Log2UpOut**: Output data at *BIT_LOG2*, *STD_LOGIC_VECTOR(BIT_LOG2-1 downto 0)* type.

The module instantiates the first stage (*Log2Up_Init*), *BIT_LOG2 -2* standard stages (*Log2Up_Mod*) and the last stage (*Log2Up_Last*) of the pipeline linking the input signal to the first stage and the the output signal to the last stage. Moreover if *EDGE_CHECK = TRUE* it generates the *yesEdge* signal checking if there was an edge in the input data (*yesEdge = '1'* if *noEdgeFull = '0'* and *noEdgeEmpty = '0'*). The valid of the output data (*Valid_Log2UpOut*) is then set as the "and" between the output valid of the last stage of the pipeline (*start*) and *yesEdge*.


## Log2Up_Init
Initialization of the pipeline.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Control in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **BIT_HALF**: Bit Dimension of the pipeline stage, *POSITIVE* type.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **start_in**:  Valid of *v_in*, *STD_LOGIC* type
  - **v_in**: Input data of the first stage of the pipeline, *STD_LOGIC_VECTOR (2* * *BIT_HALF-1 downto 0)* type.

  - **start_out**: Valid of *v_out*, *STD_LOGIC* type.
  - **v_out**: Output data of the first stage of the pipeline, *STD_LOGIC_VECTOR (BIT_HALF-1 downto 0)* type.

  - **noEdgeFull_out**: Propagates along the pipeline the signal which takes into account if the input data is all at "1" (Full), *STD_LOGIC* type.
  - **noEdgeEmpty_out**: Propagates along the pipeline the signal which takes into account if the input data is all at "0" (Empty), *STD_LOGIC* type.

  - **r_out**: MSB of the final result (Log2 of the input data), *STD_LOGIC* type.

The module first of all performs a swap of the input (*v_swap(2*BIT_HALF -1 - I) := v_in(I)*) and then check if there is at least a '1' in the upper part (edge in the second half) of the swapped input data(*v_swap*), which correspond to the lower part of the input data (*v_in*).  
If there is a '1' it transfer only the first half of the swapped input data to the next stage (*v_out <= v_swap(2* * *BIT_HALF-1 downto BIT_HALF)*), set the MSB of the final result to '0' (*r_out <= '0'*) and if *EDGE_CHECK = TRUE* set the *noEdgeEmpty_out* signal to '0' since the chain is not empty of '1'; on the contrary, if there is not a '1' it transfer only the second half of the swapped input data (*v_out <= v_swap(BIT_HALF-1 downto 0)*) to the next stage, set the MSB of the final result to '1' (*r_out <= '1'*) and if *EDGE_CHECK = TRUE* set the *noEdgeFull_out* signal to '0' since the chain is not full of '1'.


## Log2Up_Mod
Standard module of the pipeline.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Control in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **BIT_HALF**: Bit Dimension of the pipeline stage, *POSITIVE* type.
  - **BIT_STAGE**: Number of the current pipeline stage and Bit Dimension of the output (*r_out*), *POSITIVE* type.

### Port

  - **reset**:Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **start_in**:  Valid of *v_in*, *STD_LOGIC* type
  - **v_in**: Input data of the stage I of the pipeline, *STD_LOGIC_VECTOR (2* * *BIT_HALF-1 downto 0)* type.

  - **noEdgeFull_in**: Signal propagated from the previous stages of the pipeline which takes into account if the input data is all at "1" (Full),*STD_LOGIC* type
  - **noEdgeEmpty_in**: Signal propagated from the previous stages of the pipeline which takes into account if the input data is all at "0" (Empty),*STD_LOGIC* type.

  - **r_in**: Value of the final result (Log2 of the input data) propagated from the previous stages of the pipeline ),*STD_LOGIC_VECTOR(BIT_STAGE-1 downto 0)* type.

  - **start_out**: Valid of *v_out*, *STD_LOGIC* type.
  - **v_out**: Output data of the stage I of the pipeline, *STD_LOGIC_VECTOR (BIT_HALF-1 downto 0)* type.

  - **noEdgeFull_out**: Propagates along the pipeline the signal which takes into account if the input data is all at "1" (Full), *STD_LOGIC* type.
  - **noEdgeEmpty_out**: Propagates along the pipeline the signal which takes into account if the input data is all at "0" (Empty), *STD_LOGIC* type.

  - **r_out**: Propagates along the pipeline the value of the final result (Log2 of the input data), *STD_LOGIC_VECTOR(BIT_STAGE downto 0)* type.

The module check if there is at least a '1' in the upper part (edge in the second half) of the input data of the stage.  
If there is a '1' it transfer only the first half of the input data to the next stage (*v_out <= v_in(2* * *BIT_HALF-1 downto BIT_HALF)*), accost a '0' in the final result (*r_out <= r_in&"0"*) and if *EDGE_CHECK = TRUE* set the *noEdgeEmpty_out* signal to '0' since the chain is not empty of '1' and propagates the *noEdgeFull_in* signal; on the contrary, if there is not a '1' it transfer only the second half of the input data (*v_out <= v_in(BIT_HALF-1 downto 0)*) to the next stage, accost a '1' in the final result (*r_out <= r_in&"1"*) and if *EDGE_CHECK = TRUE* set the *noEdgeFull_out* signal to '0' since the chain is not full of '1' and propagates the *noEdgeEmpty_in* signal.


## Log2Up_Last
Last module of the pipeline.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.
  - **EDGE_CHECK**: Control in pipeline if the input is all at "0" (Empty) or at "1" (Full), *BOOLEAN* type, default **TRUE**. If *EDGE_CHECK = TRUE*, the no edge logic is generated while if *EDGE_CHECK = FALSE* the no edge logic is NOT generated.

  - **BIT_STAGE**: Number of the current pipeline stage and Bit Dimension of the output (*r_out*), *POSITIVE* type.

### Port

  - **reset**: Asynchronous system reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **clk**: System clock.

  - **start_in**:  Valid of *v_in*, *STD_LOGIC* type
  - **v_in**: Input data of the last stage of the pipeline, *STD_LOGIC_VECTOR(2-1 downto 0)* type.

  - **noEdgeFull_in**: Signal propagated from the previous stages of the pipeline which takes into account if the input data is all at "1" (Full),*STD_LOGIC* type
  - **noEdgeEmpty_in**: Signal propagated from the previous stages of the pipeline which takes into account if the input data is all at "0" (Empty),*STD_LOGIC* type.

  - **r_in**: Value of the final result (Log2 of the input data) propagated from the previous stages of the pipeline ),*STD_LOGIC_VECTOR(BIT_STAGE-1 downto 0)* type.

  - **start_out**: Valid of output data, *STD_LOGIC* type.

  - **noEdgeFull_out**: Propagates outside the pipeline the signal which takes into account if the input data is all at "1" (Full), *STD_LOGIC* type.
  - **noEdgeEmpty_out**: Propagates outside the pipeline the signal which takes into account if the input data is all at "0" (Empty), *STD_LOGIC* type.

  - **r_out**: Propagates outside the pipeline the value of the final result (Log2 of the input data), *STD_LOGIC_VECTOR(BIT_STAGE downto 0)* type.

The module check if there is at least a '1' in the upper part (edge in the second half) of the input data of the stage.  
If there is a '1' it accost a '0' in the final result (*r_out <= r_in&"0"*) and if *EDGE_CHECK = TRUE* set the *noEdgeEmpty_out* signal to '0' since the chain is not empty of '1' and propagates the *noEdgeFull_in* signal; on the contrary, if there is not a '1' it accost a '1' in the final result (*r_out <= r_in&"1"*) and if *EDGE_CHECK = TRUE* set the *noEdgeFull_out* signal to '0' since the chain is not full of '1' and propagates the *noEdgeEmpty_in* signal.


## AXI4Stream_TreeAdder
Wrapping of TreeAdder for AXI4-Stream interface.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.

  - **MAX_INPUT_ENGINE_PIPELINE_STAGE0**: Select the max number of inputs for the first stage of the pipeline, *POSITIVE* type *RANGE  1  TO  8*.
  - **MAX_INPUT_ENGINE_PIPELINE_STAGE1**: Select the max number of inputs for the second stage of the pipeline, *POSITIVE* type *RANGE  1  TO  8*.
  - **MAX_INPUT_ENGINE_PIPELINE_STAGE2**: Select the max number of inputs for the third stage of the pipeline, *POSITIVE* type *RANGE  1  TO  8*.
  - **MAX_INPUT_ENGINE_PIPELINE_STAGE3**: Select the max number of inputs for the fourth stage of the pipeline, *POSITIVE* type *RANGE  1  TO  8*.

  - **NUMBER_OF_INPUT**: Total number of inputs, *POSITIVE* type *RANGE  2  TO  16*.
  - **MAXIMUM_INPUT_VALUE**: Maximum input value available, *POSITIVE* type *RANGE  1  TO  4095*.

  - **BIT_INPUT**: Bit Dimension of the input, *POSITIVE* type *RANGE  1  TO  12*.
  - **BIT_OUTPUT**: Bit Dimension of the output, *POSITIVE* type *RANGE  2  TO  16*.

### Port

  - **Reset**:  Asynchronous reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **Clk**: Clock signal.

  - **s0[i]_dataIn**: AXI4 Stream Slave (Input) interface, undecoded data coming from the previous module, with i in [0; 15].
     - **s0[i]_dataIn_tvalid**: Input Valid for Element, *STD_LOGIC* type.
     - **s0[i]_dataIn_tdata**: Undecoded input for Element padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_INPUT-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_INPUT-1 downto 0)* type.

 - **m00_dataOut**: AXI4 Stream Master (Output) interface, decoded data.
    - **m00_dataOut_tvalid**: Valid of the output data, *STD_LOGIC* type.
    - **m00_dataOut_tdata**: Decoded output data with the proper FID padded to upper byte dimension, *STD_LOGIC_VECTOR((((BIT_OUTPUT-1)/8+1)* * *8)-1 downto 0)* type, used only *STD_LOGIC_VECTOR(BIT_OUTPUT-1 downto 0)* type.

The module instantiates the *TreeAdder*, set to '0' the MSBs of the output data (*m00_dataOut_tdata(m00_dataOut_tdata'LENGTH-1 downto BIT_OUTPUT)*) and rename the input and output interfaces with AXI4-Stream, input as slave and output as master.


## TreeAdder
Compute the sum *DataOut* (*BIT_OUT* bits) of *DataVctIn* (BIT_INPUT * NUM_INPUT_TA bits) if the *NUM_INPUT_TA* cells with value in 0 to *MAX_IN_VAL_TA* (*BIT_INPUT* bits) are valid.			

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.

  - **MAX_INPUT_ENGINE_PIPELINE_STAGE0**: Select the max number of inputs for the first stage of the pipeline, *POSITIVE* type *RANGE  1  TO  8*.
  - **MAX_INPUT_ENGINE_PIPELINE_STAGE1**: Select the max number of inputs for the second stage of the pipeline, *POSITIVE* type *RANGE  1  TO  8*.
  - **MAX_INPUT_ENGINE_PIPELINE_STAGE2**: Select the max number of inputs for the third stage of the pipeline, *POSITIVE* type *RANGE  1  TO  8*.
  - **MAX_INPUT_ENGINE_PIPELINE_STAGE3**: Select the max number of inputs for the fourth stage of the pipeline, *POSITIVE* type *RANGE  1  TO  8*.

  - **NUMBER_OF_INPUT**: Total number of inputs, *POSITIVE* type *RANGE  2  TO  16*.
  - **MAXIMUM_INPUT_VALUE**: Maximum input value available, *POSITIVE* type *RANGE  1  TO  4095*.

  - **BIT_INPUT**: Bit Dimension of the input, *POSITIVE* type *RANGE  1  TO  12*.
  - **BIT_OUTPUT**: Bit Dimension of the output, *POSITIVE* type *RANGE  2  TO  16*.

### Port

  - **Reset**:  Asynchronous reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **Clk**: Clock signal.

  - **Valid_DataIn_i**: Input Valid for Element with i in [0; 15], *STD_LOGIC* type.
  - **DataIn_i**: Undecoded input for Element with i in [0; 15], *STD_LOGIC_VECTOR(BIT_INPUT-1 downto 0)* type.

  - **Valid_DataOut**: Valid of the output data, *STD_LOGIC* type.
  - **DataOut**: Decoded output data, *STD_LOGIC_VECTOR(BIT_OUTPUT-1 downto 0)* type.

The module calls the *step_TA_max_input_engine_init* function for creating an array of Positive that puts together the max number of inputs of each stage of the pipeline, saving it into *MAX_INPUT_ENGINE_PIPELINE* constant.
Moreover it instantiates the *TreeAdderWrapper_TA*.


## TreeAdderWrapper
Generate the Steps of the *TreeAdder* and manage the connection and the sizing of the Pipeline Stages.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.

  - **MAX_INPUT_ENGINE_PIPELINE**: Select the max number of input per stage, *TA_POSITIVE_ARRAY_TYPE* type.

  - **NUM_INPUT_TA**: Total number of inputs, *POSITIVE* type.
  - **MAX_IN_VAL_TA**: Maximum input value available, *POSITIVE* type.

### Port

  - **Reset**:  Asynchronous reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **Clk**: Clock signal.

  - **Valids_DataVctIn**: Input Valid for *DataVctIn*, *STD_LOGIC_VECTOR* type.
  - **DataVctIn**: Input composed by *NUM_INPUT_TA* values (0 <= Val <= MAX_IN_VAL_TA), *STD_LOGIC_VECTOR* type.

  - **Valid_DataOut**: Output Valid for *DataOut*, *STD_LOGIC* type.
  - **DataOut**: Output data(Sum), *STD_LOGIC_VECTOR* type.

The module assigns to the *PIPELINE_RECORD_ARRAY* constant the whole structure of the *TreeAdder* calling the *step_TA_pipeline_init* function, which sets the number of Steps and all the generic of the pipeline (*NUM_INPUT_TOT*, *MAX_IN_VAL_ENGINE*, *MAX_INPUT_ENGINE*) and then generates the Steps of the Pipeline instantiating the *Step_TA* module.  
Moreover this module initialize the first stage of the pipeline setting the *Valid_pipe(0)* and the *Data_pipe(0)*.
In particular, it uses the *validate_Valids_DataVctIn* function for validate all the valids and then set the *Valid_pipe(0)*.  
Finally the valid of the output data (*Valid_DataOut*) is set equal to the valid of the last stage of the pipeline (*Valid_pipe(NUM_STAGE)* and the output data (*DataOut*) is set equal to the output of the last stage of the pipeline (*Data_pipe(NUM_STAGE)*).


## Step_TA
Single Pipeline Stage composed by NUM_INPUT_TOT/MAX_INPUT_ENGINE Engines, which add all the inputs. The Free Running and the Valid are managed here.

### Generic

  - **FREE_RUNNING**: Enable/Disable the Free Running mode, *BOOLEAN* type, default **TRUE**. If *FREE_RUNNING = TRUE* each stage does the computation if *load = '1'* while if *FREE_RUNNING = FALSE* the stages do the computation each rising_edge(clk) and the valid is the load delayed in pipeline.

  - **NUM_INPUT_TOT**: Total number of inputs of the *Step_TA*, *POSITIVE* type.
  - **MAX_IN_VAL_ENGINE**: Maximum input value available, *POSITIVE* type.
  - **MAX_INPUT_ENGINE**: Maximum number of inputs of the *Engine_TA*, *POSITIVE* type.

### Port

  - **Reset**:  Asynchronous reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **Clk**: Clock signal.

  - **Valid_in**: Input Valid, *STD_LOGIC* type.
  - **Data_in**: Input Data composed by *NUM_INPUT_TOT* values (0 <= Val <= MAX_IN_VAL), *STD_LOGIC_VECTOR* type.

  - **Valid_out**: Output Valid, *STD_LOGIC* type.
  - **Data_out**: Output composed by Sum of NUM_INPUT_TOT/MAX_IN_VAL_ENGINE, *STD_LOGIC_VECTOR* type.

The module assigns:

  - The maximum number of inputs of the Full Engine (*NUM_INPUT_FULL_ENGINE*);
  - The number of Full Engine (*NUM_ENGINE_FULL*);
  - The number of inputs of the Last Engine (*NUM_INPUT_LAST_ENGINE*);
  - The bit dimension of the input of the engine (*BIT_IN_ENGINE*) using the *Compute_Bit_In* function;
  - The bit dimension of the output of the Full Engine (*BIT_OUT_ENGINE_FULL*) using the *Compute_Bit_Out* function;
  - The bit dimension of the output of the Last Engine (*BIT_OUT_LAST_ENGINE*) using *Compute_Bit_Out* function.  

Moreover the module instantiate *NUM_ENGINE_FULL* Full Engine (Engine at *MAX_IN_VAL_ENGINE* Input) and *if NUM_INPUT_LAST_ENGINE /= 0* a Last Engine (Engine at *NUM_INPUT_LAST_ENGINE*).  
Finally the module manages the valid of the pipeline assigning *Valid_in* to *Valid_out* at each rising edge of the clock and manages the Free Running Mode: if *FREE_RUNNING = TRUE* set the *Enable* signal to '1' otherwise if *FREE_RUNNING = FALSE* the *Enable* signal corresponds to *Valid_in*.

![step Image](IperDecoder.doc/Step.png)  


## Engine_TA
Adder without edge control (TA)	that sums all the inputs.

### Generic

  - **MAX_IN_VAL**:  Maximum input value available, *POSITIVE* type.
  - **NUM_INPUT**: Number of inputs of the *Engine_TA*, *POSITIVE* type.

### Port

  - **Reset**:  Asynchronous reset active high (if '1' goto reset state), *STD_LOGIC* type.

  - **Clk**: Clock signal.

  - **Enable**: Engine_TA enable, *STD_LOGIC* type.
  - **EnginIn**: Input Data composed by *NUM_INPUT* values (0 <= Val <= MAX_IN_VAL), *STD_LOGIC_VECTOR* type.

 - **SumOut**: Output composed by the Sum of the Value in the range >= 0 and <= MAX_IN_VAL * NUM_INPUT, *STD_LOGIC_VECTOR* type.

The module assigns:

  - The maximum value of *SumOut* (*MAX_OUT_VAL*);
  - The bit dimension of the input of the Engine (*BIT_IN*) needed to contain *MAX_IN_VAL* using the *Compute_Bit_In* function;
  - The bit dimension of the output of Engine (*BIT_OUT*) needed to contain *SumOut* using *Compute_Bit_Out* function.  

Moreover if *Enable = '1'* the module sums all the *NUM_INPUT* inputs contained in *EnginIn* and saves the result in *SumOut*.

![engine Image](IperDecoder.doc/Engine.png)


## LocalPackage_TA
Functions, Procedures and Types required by the *TA* modules.

### Types

  - **STEP_TA_PIPELINE_RECORD_TYPE**: It is a Record that reassume the Generic and Length of Step_T2B. it contains *NUM_INPUT_TOT[NIT]*, *MAX_IN_VAL_ENGINE[MIE]*, *MAX_INPUT_ENGINE[NIE]*, *LENGTH_DATA_IN[LNG_IN]*, *LENGTH_DATA_OUT[LNG_OUT]*.

  - **STEP_TA_PIPELINE_RECORD_ARRAY_TYPE**: Array of *STEP_TA_PIPELINE_RECORD_TYPE*, which is required for setting the pipeline

  - **TA_POSITIVE_ARRAY_TYPE**: Array of *POSITIVE*.


### Functions

  - **validate_Valids_DataVctIn**: Function used for validate all the valids performing an "and" operation among all the input valids.

  - **Find_Max_Bit_Length_TA**: Find the maximum *BIT_LENGTH* of *Data_STD_LOGIC_ARRAY_TYPE*, which corrispond to the longest between the *PIPELINE_RECORD_ARRAY(I).LENGTH_DATA_IN*.

  - **Compute_Bit_In**: Find the number of bit at the input given the max input value.

  - **Compute_Bit_Out**: Find the number of bit at the output given the max input value and the number of input.

  - **log2_unsigned**: Compute the ceil(log2(x)), where x is natural.

  - **log2_integer**: Compute the ceil(log2(x)), where x is integer, if x >= 1 else return 0.

  - **div_exc**: Compute the ceil(real(x/y)) where x,y are natural.

  - **step_TA_max_input_engine_init**: Set the max number of input of each stage of the pipeline and put them together in the *max_input_per_engine_pipeline_tmp* variable, which is an array of Positive.

  - **step_TA_pipeline_init**: Creates the whole structure of the *TreeAdder* setting the number of Steps and all the generic of each Step of the pipeline (*NUM_INPUT_TOT*, *MAX_IN_VAL_ENGINE*, *LENGTH_DATA_IN*). If the *number_of_step* is greater of the number of elements of *max_input_per_engine_array*, the max number of inputs of the engine of that step (*step_T2B_pipeline_record_array_tmp(number_of_step).MAX_INPUT_ENGINE*) is set equal to the last element of *max_input_per_engine_array* which must be set on purpose to a value greater than 1. This function creates the last Step when the number of inputs of a certain Step (*step_T2B_pipeline_record_array_tmp(number_of_step).NUM_INPUT_TOT*) is lower than the max number of inputs of the engine of that Step (*step_T2B_pipeline_record_array_tmp(number_of_step).MAX_INPUT_ENGINE*).

 >>>>>>> #### First Step (0)

 >>>>>	   NIT[0]      = num_input_TA
 >>>>>	   MIV[0]      = 1
 >>>>>     NIE[0]      = max_input_per_engine_array(0),fixed
 >>>>>     LNG_IN[0]   = NIT[0] * ceil(log2(MIV[0])+1)
 >>>>>     LNG_OUT [0] = LNG_IN[1]

 >>>>>>> #### Generic Step_TA (n)

 >>>>>	   NIT[n]      = ceil(NIT[n-1]/NIE[n-1])
 >>>>>	   MIV[n]	   = MIV[n-1] * NIE[n-1]
 >>>>>     NIE[n]      = max_input_per_engine_array(n),fixed
 >>>>>     LNG_IN[n]   = NIT[n] * ceil(log2(MIV[n])+1)
 >>>>>     LNG_OUT[n]  = LNG_IN[n+1]


### Procedures

  - **write_to_file_step_TA_pipeline_init**:  Print the value of all generic of the Steps of the pipeline on a text file named *result_LocalPackage_TA*. This function is called inside the *step_TA_pipeline_init* function.  



  # Cosimulation
  We can find a CoCoTb cosimulation in Python in *"IperDecoder/IperDecoder.cocotb"*:

    - **IperDecoder_CoCoTbWrapper**: DUT, VHDL Wrapper of sources of IperDecoder to have a DUT compatible with generic types and AXIS names, the *subInterpolationMatrix* is as *GENERIC*.
    - **tb_IperDecoder_CoCoTbWrapper**: Testbench based in Python, completely parametrizable from *Makefile*.
    - **Makefile**: Makefile of  *tb_IperDecoder_CoCoTbWrapper* linked to *IperDecoderCoCoTbWrapper*, it is possible to modify generics of DUT.
    - **Waveform**: Waveform of *tb_IperDecoder_CoCoTbWrapper*.
    - **build**: Building directory, inside it is possile to find the reports written by *tb_launcher*.

># TODO
1. Make in AXI4 Lite Slave Sun Interpolation Matrix with a slower clk
