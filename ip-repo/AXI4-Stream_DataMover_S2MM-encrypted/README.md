# AXI4-Stream DataMover S2MM

![BD IP-Core](doc/img/bd_ip_core.png)

### Description

This module is a simplified interface to the S2MM (write) part of the Xilinx's
"AXI DataMover", a high performance module to read and write data on a
Memory-Mapped AXI4 bus from an AXI4-Stream bus.

The module should be connected to an "AXI DataMover" IP-Core as depicted in the
figure; the remaining three interfaces can be connected to the user's system:

 * `S_AXIS` is the input data: it allows the user to issue write command to this module
 * `M_AXIS` is the output data: it optionally returns the write transaction result
 * `M_AXI_MM2S` (from the Xilinx's "AXI DataMover"): it can be connected to the AXI4 bus that needs to be interfaced

All the transactions are pushed in a FIFO and the I/O delay depends on multiple
factors (like the traffic over the AXI4 bus) but all the operations are
guaranteed to be executed in-order.

The corresponding AXI DataMover module can be configured freely, the only
limitation introduced by this module is an unchecked
`Enable Indeterminate BTT Mode`.

Moreover note that:

 * `Width of BTT field (bits)` limits the maximum size of the `WordToTransfer` field
 * unless really needed, `Allow Unaligned Transfer` should be kept disabled to save area (and all the addresses should be 32-bit aligned)

### S_AXIS packet format

Input commands (terminated with the assertion of `TLAST`) must have this format,
invalid packets will be silently dropped:

| UniqueId | StartAddress | WriteInfo | Data                     |
|:--------:|:------------:|:---------:|:------------------------:|
| 4 bytes  | 4 bytes      | 4 bytes   | WordToTransfer * 4 bytes |

with `WriteInfo` with this format (MSB on the left):

| Reserved | WriteResponse | WriteType | Reserved | WordsToTransfer |
|:--------:|:-------------:|:---------:|:--------:|:---------------:|
| 6 bits   | 1 bit         | 1 bit     | 3 bits   | 21 bits         |

The `UniqueId` can be used as arbitrary identification tag: its value will be
returned in the corresponding output packet to correctly identify the
transaction.

`StartAddress` and `WordToTransfer` identify respectively the first address and
the number of 32-bit words to write to the AXI4 bus.

`WriteType` identifies the type of write (0 = FIXED, 1 = INCR).

`WriteResponse` can be:

 * `0` to issue a write
 * `1` to issue a write and request the transaction result

With `WriteResponse = 0` the write operation will be issued to the
DataMover but no result will be sent over the `M_AXIS` interface (which means
that any operation will silently succeed or fail). On the other hand,
`WriteResponse = 1` will issue a write operation and report the status
over the `M_AXIS` interface, with a format specified in the next section.

`S_AXIS` supports the `TDEST` signal, which will be returned in the
corresponding output packet unmodified.

### M_AXIS packet format

If the write confirmation has been requested (`SubcommandId = 0x00000001`) a
packet (terminated by the assertion of `TLAST`) will be returned over this
interface with this structure:

| UniqueId | StartAddress | WriteInfo | Status  |
|:--------:|:------------:|:---------:|:-------:|
| 4 bytes  | 4 bytes      | 4 bytes   | 4 bytes |

`UniqueId`, `StartAddress` and `WriteInfo` are the ones provided in the
corresponding write issuing over `S_AXIS` and have the same meaning.

`Status` is the status of the write transaction and has this structure:

| Reserved | Okay  | Slave Error | Decode Error | Internal Error |
|:--------:|:-----:|:-----------:|:------------:|:--------------:|
| 28 bits  | 1 bit | 1 bit       | 1 bit        | 1 bit          |

 * `Okay` indicates that the issued transfer has been completed successfully
 * `Slave Error` indicates that the slave associated with the issued address has returned an error condition
 * `Decode Error` indicates that a decode error condition has been detected (likely caused by a read of an unmapped address)
 * `Internal Error` indicates that the AXI DataMover has encountered an internal error; this error should never arise, if so either there's a bug in this module or the AXI DataMover has been incorrectly configured

Note that an error doesn't necessarily mean that no data has been written, part
of it could have been written correctly.

### Example 1

As a reference, let's consider an AXI4 bus with a single 16 KiB memory mapped
from `0xc0000000` to `0xc0004000`.

This packet issues a write command (no transaction status) starting from the
address `0xc0000000` with a `UniqueId` equal to `0xdeadbeef`, of 4 consecutive
32-bit words (INCR) `0x11111111 0x22222222 0x33333333 0x44444444`:

`0xdeadbeef 0xc0000000 0x01000004 0x11111111 0x22222222 0x33333333 0x44444444`

No packet will be returned, the operation will silently succeed and the
memory-mapped bus will have this content:

| Offset     | Content    |
|:----------:|:----------:|
| 0xc0000000 | 0x11111111 |
| 0xc0000004 | 0x22222222 |
| 0xc0000008 | 0x33333333 |
| 0xc000000c | 0x44444444 |

The same transaction with `SubcommandId = 0x00000001`:

`0xdeadbeef 0xc0000000 0x03000004 0x11111111 0x22222222 0x33333333 0x44444444`

leads to the same result, but also causes this module to generate a transaction
result packet with this content:

`0xdeadbeef 0xc0000000 0x03000004 0x00000008`

where `Status` is `Okay`.

### Example 2

With the same memory over the same addresses, this packet issues a write command
(with the transaction result) starting from the address `0xbffffff8` (which is
`0xc0000000` minus 2 32-bit words) with a `UniqueId` equal to `0xdeadbeef`, of 4
consecutive 32-bit words (INCR) `0x11111111 0x22222222 0x33333333 0x44444444`:

`0xdeadbeef 0xbffffff8 0x03000004 0x11111111 0x22222222 0x33333333 0x44444444`

The returned packet is:

`0xdeadbeef 0xbffffff8 0x03000004 0x00000002`

Which means that the operation failed with the error `Decode Error`.

The memory-mapped bus now has this content

| Offset     | Content        |
|:----------:|:--------------:|
| 0xbffffff8 | Invalid access |
| 0xbffffffc | Invalid access |
| 0xc0000000 | 0x33333333     |
| 0xc0000004 | 0x44444444     |

We're trying to write on addresses `0xbffffff8` and `0xbffffffc`, which are not
mapped (and the module correctly returns `Decode Error`), while addresses
`0xc0000000` and `0xc0000004` are valid addresses, so the data is correctly
written there. Moreover note that, if at least one write has failed, there's no
way to determine which ones have been completed successfully from this status
alone without reading the memory.
