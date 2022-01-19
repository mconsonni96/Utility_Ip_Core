# AXI4-Stream multiCOBS Upsizer



### Description

The module operates on an input stream which has been encoded through the COBS algorithm.
The function of the module is reading the input words and stacking them into an output word
with a width which is a multiple of the input width.


Since the input stream has been encoded through the COBS algorithm, no occurences of zero bytes
appear in it, except for the packet delimiter. In particular, referring to the multiCOBS algorithm,
the packet delimiter will be a sequence of zero bytes, with size equal to that of the output word
of this module.

The second function of the module is then to correct disalignments in the input words which
can happen if a byte of the stream is lost. If this is the case, the packet delimiter will
no longer be made of the expected number of zero bytes, and the packet which is constructed
at the output of the module will be composed by a mix of zero bytes and encoded data, which should
not happen. The multiCOBS upsizer corrects this by recognizing the arrival of the single zero byte at its input, then
automatically giving at the output a number of zero bytes equal to the packet size (which is the packet delimiter).
Then no new word is proposed at the output until a new input value, different from zero, arrives, which marks the start of a new packet.


 ## IP-Core

 ![BD IP-Core](/doc/img/bd_ip_core.svg)

 ### Generic

 - **C_S_AXIS_TDATA_WIDTH**  :  Width (in bits) of the input word.

 - **C_M_AXIS_TDATA_WIDTH** :  Width (in bits) of the output word.



 ### Port

 - **areset**: Asynchronous reset active low. *STD_LOGIC* type.

 - **clk**: Clock signal. *STD_LOGIC* type.

 - **s_axis_tready**	:  Slave interface tready. *STD_LOGIC* type.
 - **s_axis_tdata**	: Slave interface tdata. *STD_LOGIC_VECTOR(8-1 downto 0)* type.
 - **s_axis_tvalid**	:  Slave interface tvalid.*STD_LOGIC* type.

 - **m_axis_tvalid**	:  Master interface tvalid.*STD_LOGIC* type.
 - **m_axis_tdata**	:  Master interface tdata. *STD_LOGIC_VECTOR(32-1 downto 0)* type.
 - **m_axis_tready**	:  Master interface tready. *STD_LOGIC* type.
 - **m_axis_tlast**	:  Master interface tlast. *STD_LOGIC* type.
