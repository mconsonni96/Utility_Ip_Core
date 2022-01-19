# AXI Quad SPI bugs/undocumented quirks

During the development of this project, numerous bugs and undocumented quirks of
the _Xilinx AXI Quad SPI_ IP-Core have been uncovered, reported here to help
future development of this module (and maybe others).

## TX FIFO reset

Bit 5 of the SCR (base address + 0x60), when set to 1, resets the TX (DTR) FIFO.
However this reset is not instant, but requires an unspecified number of cycles,
during which any write to the DTR register (base address + 0x68) results in a
SLVERR. The only mention of this error on this register in the datasheet is in
case of a full FIFO, so this lack of documentation can be misrecognized as
full FIFO.

### Workaround in this IP-Core

TX FIFO is never reset, instead all the data written in it is sent over the SPI
bus.

## RX FIFO reset

Likewise, the RX FIFO (base address + 0x70) requires an unspecified number of
cycles to perform a reset when bit 6 of the SCR (base address + 0x60) is set.
During the reset, reads of the corresponding occupancy register
(base address + 0x78) return 0x000000ff.

### Workaround in this IP-Core

After resetting the RX FIFO, the DRR occupancy register is continuously read
until it is different than 0x000000ff.

## AXI WSTRB

Following the AXI specification (A3.4.1), write bursts can not be terminated
early (WLAST asserted on a beat different from the one specified in AWLEN), but
they can be suppressed by de-asserting all the bits of WSTRB for the remaining
beats. In the _Xilinx AXI Quad SPI_ IP-Core, WSTRB is ignored, leading to an
excess of writes in the DTR register.

### Workaround in this IP-Core

For PAGE PROGRAM commands (and the related 32-bit and QUAD variants), in the
remaining AXI beats 0xff is written, which acts as NOP in the SPI memories.

For the other commands, as the length of the burst is known in advance, 4 bits
in the TUSER signal in the slave interface of the axis2spi module hold the
information about the length of the burst, to make sure that AWLEN matches the
actual length.

## Occupancy register

Sometimes, at least the SPI DRR occupancy register (base address + 0x78),
returns values different from the real occupancy of the RX FIFO, usually larger.

### Workaround in this IP-Core

The SPI DRR occupancy register is not used (except to determine whether the RX
FIFO reset has ended). Instead, the occupancy of the RX FIFO is derived from the
number of bytes written in the DTR FIFO.

## AXI4 bursts

Apparently, for reasons still unknown, the _Xilinx AXI Quad SPI_ IP-Core expects
writes onto the DTR register in a single chunk, without "holes" with a low
WVALID. In other words, once WVALID has been asserted, it must be kept high
until all the beats are performed and WLAST is asserted. When this behavior is
not respected, the IP-Core may consider valid the data in a cycle with a low
WVALID, ignoring the trailing beats and asserting prematurely the BVALID signal.

This can also lead to deadlocks, where the master is waiting for the slave to
acknowledge the last write, while the slave is waiting for the master to
acknowledge the write response.

### Workaround in this IP-Core

The data going into the SPI DTR register comes from the user and may come
"fragmented" (with TVALID not always one), which is allowed by the AXI4-Stream
protocol. To make it work with this bug, the incoming data is buffered in a
small FIFO (_axis_burst_buffer_ module) and sent to the module in a single
chunk.
