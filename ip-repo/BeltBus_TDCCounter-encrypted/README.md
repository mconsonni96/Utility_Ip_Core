# TDC counter module
This module counts pulses that are recieved by the TDC. As reference, it has also an interal counter that is incremented by the system (Belt Bus) clock.

## Use
### Generics
| Name                  | Description                                                           | Default   | Range             |
|-----------------------|-----------------------------------------------------------------------|-----------|-------------------|
| BIT_FINE              | BeltBus BIT FINE      (see BeltBus/TDC doc)                           | 10        |                   |
| BIT_COARSE            | BeltBus BIT COARSE    (see BeltBus/TDC doc)                           | 8         |                   |
| BIT_FID               | BeltBus BIT FID       (see BeltBus/TDC doc) I                         | 1         |                   |
| BIT_NUM_CH            | BeltBus BIT NUM_CH    (see BeltBus/TDC doc)                           | 4         |                   |
|                       |                                                                       |           |                   |
| NUM_CH                | Number of TDC channels                                                | 4         | 1:128             |
| COUNTER_WIDTH         | Width of each counter                                                 | 32        | 2:32              |
| INTTIME_INIT          | Default integration time, expressed in BeltBus cycles                 | 20e6      | 2 to 2147483647   |
|                       |                                                                       |           |                   |
| SYNC_STAGES           | FlipFlop stages used for cross clock domain (BeltBus/AXI4) sync.      | 4         | 1 to 8            |
| SYNC_STAGES_INIT_V    | Initial value for syncronization FlipFlops                            | 0         |                   |
|                       |                                                                       |           |                   |
| COMMAND_CMD_WIDTH     | AxiHandler/Counter BUS Command width                                  | 6         | Read only         |
| COMMAND_DATA_WIDTH    | AxiHandler/Counter BUS Data width                                     | 32        | Read only         |
| COMMAND_RESP_WIDTH    | AxiHandler/Counter BUS Response width                                 | 2         | Read only         |
|                       |                                                                       |           |                   |
| C_S_AXI_ADDR_ABS      | Module absolute address on AXI4 Lite bus. Used for autoPush           | 0         | 0 to 4G           |
| C_S_AXI_DATA_WIDTH    | AXI4 Lite data width                                                  | 32        | Read only         |
| C_S_AXI_ADDR_WIDTH    | AXI4 Lite address width                                               | 12        | Read only         |
| C_M_AXIS_TDEST_WIDTH  | AXI4 Stream TDEST width                                               | 8         | Read only         |
| C_M_AXIS_TDATA_WIDTH  | AXI4 Stream TDATA width                                               | 56        | Read only         |




### Ports
![IP CORE ports](doc/img/IPCORE.png)

| Port          | Function                                                              |
|---------------|-----------------------------------------------------------------------|
| BB            | BeltBus (AXI4S lave) slave, receive events from TDC                   |
| S_AXI         | AXI4 Slave, to be connected to MME system                             |
| M_AXIS_PUSH   | AXI4S Master, to be connected to MM2S S_AXIS_AUX, used to push data   |

### Memory map
On the AXI4 lite interface, this memory is exposed:

| Address| Description                                          | R/W|
|--------|------------------------------------------------------|----|
| 0x0000 | HEADER  0 - MAGIC                                    | R  |
| 0x0004 | HEADER  1 - TYPEID                                   | R  |
| 0x0008 | HEADER  2 - VERSION                                  | R  |
| 0x000c | HEADER  3 - RESV (Read as 0)                         | R  |
| 0x000d | HEADER  4 - RESV (Read as 0)                         | R  |
| ...... | HEADER  n - RESV (Read as 0)                         | R  |
| 0x00fc | HEADER 63 - RESV (Read as 0)                         | R  |
|        |                                                      |    |
| 0x0100 | PROP  0 - Integration Time (in BeltBus clk T)        | RW |
| 0x0104 | PROP  1 - Counters width (bits)                      | R  |
| 0x0108 | PROP  2 - Auto push enabled (0 False / 1 True)       | RW |
| ...... | PROP  n - RESV (Read/write as SLVERR)                | -  |
| 0x01fc | PROP 63 - RESV (Read/write as SLVERR)                | -  |
|        |                                                      |    |
| 0x0200 | MASTER COUNTER (Read to latch all)                   | R  |
| 0x0204 | COUNTER   1 If any, otherwise SLVERR                 | R  |
| 0x0208 | COUNTER   2 If any, otherwise SLVERR                 | R  |
| ...... | COUNTER   n If any, otherwise SLVERR                 | R  |
| 0x0400 | COUNTER 128 If any, otherwise SLVERR                 | R  |
|        |                                                      |    |
| 0x0404 | UNMAPPED (Read/write as SLVERR)                      | -  |
| ...... | UNMAPPED (Read/write as SLVERR)                      | -  |

### Counters logic
![Cache structure](doc/img/Cache_SYS.png)

Using the TDC with N channels, N+1 counters are instantiated, the width of each counter is defined by the generic COUNTER_WIDTH and can be read from properties 1 (0x0104).

For each channel, a "channel counter" is instantiated. The channel counters are incremented each time a measure is recieved by the corresponding TDC channel.

Also a "master counter" will increment for each clock cycle of the system clock, which is also the frequency of the BeltBus. This counter will overflow when reaches the value defined by the property 0 (integration time). When overflow occours, master counter value and channel counters value will be cached into `CACHE INT`. After the copy, master counter and channel counters will be reset to zero. If property 2 "Auto push enabled" (0x0108) is set to 1, a master counter overflow will also cause the module to send a "push request" to MM2S module.

**NOTE 1:** **Integration windows are not contiguous.** Due to the internal structure of the counter, currently copying counters value to `CACHE INT` can not be done in one clock cycle. For this reasons, counters will be freezed for some time and some count may be lost. The "freeze time" is not totally deterministic but increases if the sync FIFO stages are increased. With common settings, i.e. 4 FFs; AXI CLK = 100MHz; SYS_CLK =~ 150MHz, freeze time is less than 100ns.

### Counters reading
Counters are exposed to AXI from address 0x0200 (master) on. When channel counters are read, it is returned the value cached in `CACHE AXI`. When master counter is read, `CACHE INT` is copied into `CACHE AXI`.

To summarize:

- Master counter & channel counters will count free-running
- `CACHE INT` will always contain the most recent snapshot of the counters, taken when "master counter value" equals "integration time"
- `CACHE AXI` will contain a snapshot of `CACHE INT`, updated every time master counter is read from AXI
- Counters read from axi will fetch the value from `CACHE AXI`

Thus it is possible to have an atomic reading by reading the master counter, and then all the other channel counters (without re-reading the master).

**NOTE 2:** **Reading master counter from AXI while `CACHE INT` is begin update, takes some extra time.** While access time to channel counters will always be the same (Read data valid is asserted one clock cycle after Read addr valid), access time to master counter is not deterministic.

## Internal mechanics

The counter module is composed by two submodules, one that handles axi communications (axihandler) and one that handles the counter logic (counters).

![Internal structure](doc/img/Internal.png)

Since counters are clocked to BeltBus' clock which is (can be) different from AXI clock, the two modules are interfaced using an handshaked cross clock domain interface.

### Counters latching & reading

