library xpm;
use xpm.vcomponents.all;

architecture wrapper of xpm_fifo_async is
begin

xpm_fifo_async_4ec822a1b6cb478dca37bdeb8408b022_gen: if FIFO_MEMORY_TYPE = "distributed" and FIFO_WRITE_DEPTH = 64 and RELATED_CLOCKS = 0 and WRITE_DATA_WIDTH = 20 and READ_MODE = "fwft" and FIFO_READ_LATENCY = 0 and FULL_RESET_VALUE = 1 and USE_ADV_FEATURES = "1000" and READ_DATA_WIDTH = 20 and CDC_SYNC_STAGES = 4 and WR_DATA_COUNT_WIDTH = 1 and PROG_FULL_THRESH = 10 and RD_DATA_COUNT_WIDTH = 1 and PROG_EMPTY_THRESH = 6 and DOUT_RESET_VALUE = "0" and ECC_MODE = "no_ecc" and WAKEUP_TIME = 0 generate
xpm_fifo_async_4ec822a1b6cb478dca37bdeb8408b022_inst: entity work.xpm_fifo_async_4ec822a1b6cb478dca37bdeb8408b022
   port map (
      -- Input Ports - Single Bit
      injectdbiterr         => injectdbiterr,       
      injectsbiterr         => injectsbiterr,       
      rd_clk                => rd_clk,              
      rd_en                 => rd_en,               
      rst                   => rst,                 
      sleep                 => sleep,               
      wr_clk                => wr_clk,              
      wr_en                 => wr_en,               
      -- Input Ports - Busses
      din(19 downto 0)      => din(19 downto 0),    
      -- Output Ports - Single Bit
      almost_empty          => almost_empty,        
      almost_full           => almost_full,         
      data_valid            => data_valid,          
      dbiterr               => dbiterr,             
      empty                 => empty,               
      full                  => full,                
      overflow              => overflow,            
      prog_empty            => prog_empty,          
      prog_full             => prog_full,           
      rd_rst_busy           => rd_rst_busy,         
      sbiterr               => sbiterr,             
      underflow             => underflow,           
      wr_ack                => wr_ack,              
      wr_rst_busy           => wr_rst_busy,         
      -- Output Ports - Busses
      dout(19 downto 0)     => dout(19 downto 0),   
      rd_data_count(0 to 0) => rd_data_count(0 to 0),
      wr_data_count(0 to 0) => wr_data_count(0 to 0)
      -- InOut Ports - Single Bit
      -- InOut Ports - Busses
   );
end generate;

assert ( FIFO_MEMORY_TYPE = "distributed" and FIFO_WRITE_DEPTH = 64 and RELATED_CLOCKS = 0 and WRITE_DATA_WIDTH = 20 and READ_MODE = "fwft" and FIFO_READ_LATENCY = 0 and FULL_RESET_VALUE = 1 and USE_ADV_FEATURES = "1000" and READ_DATA_WIDTH = 20 and CDC_SYNC_STAGES = 4 and WR_DATA_COUNT_WIDTH = 1 and PROG_FULL_THRESH = 10 and RD_DATA_COUNT_WIDTH = 1 and PROG_EMPTY_THRESH = 6 and DOUT_RESET_VALUE = "0" and ECC_MODE = "no_ecc" and WAKEUP_TIME = 0 )
report "XPM not correctly compiled, maybe the generic used in xpm are differet to the vhdl"
severity failure;

end wrapper;
