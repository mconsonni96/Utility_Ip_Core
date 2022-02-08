------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
--                                                                                                                     --
--  __/\\\\\\\\\\\\\\\__/\\\\\\\\\\\\\\\__/\\\\\\\\\\\\_____/\\\\\\\\\\\__/\\\\\\\\\\\\\\\__/\\\_____________          --
--   _\///////\\\/////__\/\\\///////////__\/\\\////////\\\__\/////\\\///__\/\\\///////////__\/\\\_____________         --
--    _______\/\\\_______\/\\\_____________\/\\\______\//\\\_____\/\\\_____\/\\\_____________\/\\\_____________        --
--     _______\/\\\_______\/\\\\\\\\\\\_____\/\\\_______\/\\\_____\/\\\_____\/\\\\\\\\\\\_____\/\\\_____________       --
--      _______\/\\\_______\/\\\///////______\/\\\_______\/\\\_____\/\\\_____\/\\\///////______\/\\\_____________      --
--       _______\/\\\_______\/\\\_____________\/\\\_______\/\\\_____\/\\\_____\/\\\_____________\/\\\_____________     --
--        _______\/\\\_______\/\\\_____________\/\\\_______/\\\______\/\\\_____\/\\\_____________\/\\\_____________	   --
--         _______\/\\\_______\/\\\\\\\\\\\\\\\_\/\\\\\\\\\\\\/____/\\\\\\\\\\\_\/\\\\\\\\\\\\\\\_\/\\\\\\\\\\\\\\\_   --
--          _______\///________\///////////////__\////////////_____\///////////__\///////////////__\///////////////__  --
--                                                                                                                     --
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

--------------------------BRIEF MODULE DESCRIPTION -----------------------------
--! \file
--! \brief The FIFO_Synchronizer instantiates a Xilinx Asynchronous XPM FIFO.
--------------------------------------------------------------------------------


----------------------------- LIBRARY DECLARATION ------------------------------

------------ IEEE LIBRARY -----------
--! Standard IEEE library
library IEEE;
	--! Standard Logic Vector library
	use IEEE.STD_LOGIC_1164.all;
	--! Numeric library
	use IEEE.NUMERIC_STD.ALL;
--	--! Math operation over real number (not for implementation)
--	--use IEEE.MATH_REAL.all;
------------------------------------

-- ------------ STD LIBRARY -----------
-- --! Standard
-- library STD;
-- 	--! Textual Input/Output (only in simulation)
-- 	use STD.textio.all;
-- ------------------------------------


-- ---------- XILINX LIBRARY ----------
-- --! Xilinx Unisim library
-- library UNISIM;
-- 	--! Xilinx Unisim VComponent library
-- 	use UNISIM.VComponents.all;
--
--! \brief Xilinx Parametric Macro library
--! \details To be correctly used in Vivado write auto_detect_xpm into tcl console.
--library xpm;
--! Xilinx Parametric Macro VComponent library
--	use xpm.vcomponents.all;
-- ------------------------------------


-- ------------ LOCAL LIBRARY ---------
-- --! Project defined libary
-- library work;
-- ------------------------------------

--------------------------------------------------------------------------------



-----------------------------ENTITY DESCRIPTION --------------------------------
--! \brief The *FIFO_Synchronizer* is a FIFO used to write (*din*) and read (*dout*) the incoming data with bit dimension of *DATA_WIDTH*, with a different clock domain. Indeed the writing clock (*wr_clk*) is *clk_TDC*, instead the reading clock (*rd_clk*) is *clk_SYS*.
--! \image html FIFO.png
--! In the previous figure we have seen the exploited FIFO.
----------------------------------------------------------------------------------

entity FIFO_Synchronizer is

	generic (

		--------------- xpm_fifo_async ---------------
		DATA_WIDTH			:	POSITIVE						:=	16;					--! Fifo Dimension

		FIFO_MEMORY_TYPE	:	STRING							:=	"distributed";		--! Type of FIFO; "auto", "block", or "distributed";
		RELATED_CLOCKS		:	INTEGER	RANGE	0	TO	1		:=	0;					--! Specifies if the wr_clk (s00_uncalibTDC_aclk) and rd_clk (m00_uncalibSYS_aclk) are related, if 1 clk_TDC and clk_SYS are locked
		FIFO_WRITE_DEPTH	:	INTEGER	RANGE	16	TO	4194304	:=	64;            		--! FIFO Depth, Power of 2
		CDC_SYNC_STAGES		:	INTEGER	RANGE	2	TO	8		:=	4					--! Cross Domain Clock Synch Stages: specifies the number of synchronization stages on the CDC path. It must be < 5 if *FIFO_WRITE_DEPTH = 16*
		----------------------------------------------

	);

	port(

		------------ Input port at  wr_clk ------------
		wr_clk	:	IN	STD_LOGIC;																--! Write clock used for write operation
		wr_en	:	IN	STD_LOGIC;																--! write enable, if the FIFO is not full, asserting this signal causes data (on *din*) to be written to the FIFO.
		din		:	IN	STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0); 								--! write port, the input data bus is used when writing the FIFO.
		-----------------------------------------------


		--------- Uncalibrated Output @ clk_SYS ------
		rd_clk		:	IN	STD_LOGIC;															--! Read clock used for read operation
		data_valid	:	OUT	STD_LOGIC;															--! Read Data Valid, when asserted, this signal indicates that valid data is available on the output bus(*dout*).
		rd_en		:	IN	STD_LOGIC;															--! Read enable
		dout		:	OUT	STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0) 							--! Read Data. The output data bus is driven when reading the FIFO.
		-----------------------------------------------

	);

end FIFO_Synchronizer;

------------------------ ARCHITECTURE DESCRIPTION ------------------------------
--! \brief The *FIFO_Synchronizer* is used to change the clock domain from *clk_TDC* to *clk_SYS*, and it is useful not to loose 2 following measurements,
--! that was the defect of the previous version. The usage of the *FIFO_Synchronizer* is better explained in the *CoarseExtensionCore*.
--------------------------------------------------------------------------------

architecture Behavioral of FIFO_Synchronizer is


	------------------------- COMPONENTS DECLARATION ---------------------------
	----------- FIFO Beh Sync Patch --------------
	component FIFO is
		Generic(
			FIFO_WIDTH : integer := 8;
			FIFO_DEPTH : integer := 16
		);
		Port(
			reset 	: in std_logic;
			clk 	: in std_logic;

			din 	: in std_logic_vector(FIFO_WIDTH-1 DOWNTO 0);
			dout 	: out std_logic_vector(FIFO_WIDTH-1 DOWNTO 0);

			rd_en 	: in std_logic;
			wr_en 	: in std_logic;

			full 	: out std_logic;
			empty 	: out std_logic
		);
	end component;
	----------------------------------------------
	----------------------------------------------------------------------------

	--------------------------- SIGNALS DECLARATION ----------------------------
	----------- FIFO Beh Sync Patch --------------

	signal	empty 	:	std_logic;
	----------------------------------------------
	----------------------------------------------------------------------------


begin


	---------------------- COMPONENTS INSTANTIATION ----------------------------


	----------- FIFO Beh Sync Patch --------------
	Inst_fifo_patch_sync : FIFO
		Generic map(
			FIFO_WIDTH =>	DATA_WIDTH,
			FIFO_DEPTH =>	FIFO_WRITE_DEPTH
		)
		Port map(
			reset 	=> '0',
			clk 	=>	wr_clk,

			din 	=>	din,
			dout 	=>	dout,

			rd_en 	=>	rd_en,
			wr_en 	=>	wr_en,

			full 	=> open,
			empty 	=>	empty
		);

	----------------------------------------------


	----------------------------------------------------------------------------




	------------------------------ DATA FLOW -----------------------------------

	----------- FIFO Beh Sync Patch --------------
	data_valid	<=	not empty;
	----------------------------------------------

	----------------------------------------------------------------------------


end Behavioral;
