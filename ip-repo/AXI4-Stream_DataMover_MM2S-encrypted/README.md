# AXI4-Stream DataMover MM2S

### Description

This module is a simplified interface to the MM2S (read) part of the Xilinx's
"AXI DataMover", a high performance module to read and write data on a
Memory-Mapped AXI4 bus from an AXI4-Stream bus.

The module should be connected to an "AXI DataMover" IP-Core as depicted in the
figure; the remaining three interfaces can be connected to the user's system:

 * `S_AXIS_MAIN` is the input data: it allows the user to issue read command to this module
 * `S_AXIS_AUX` is the secondary input data, which can be used by other modules to "push" data
 * `M_AXIS` is the output data: it returns the data and valid status read from the AXI4 bus
 * `M_AXI_MM2S` (from the Xilinx's "AXI DataMover"): it can be connected to the AXI4 bus that needs to be interfaced

All the transactions are pushed in a FIFO and the I/O delay depends on multiple
factors (like the traffic over the AXI4 bus) but all the operations are
guaranteed to be executed in-order.

The corresponding AXI DataMover module can be configured freely, the only
limitation introduced by this module is `Stream Data Width = 32`.

Moreover note that:

 * `Width of BTT field (bits)` limits the maximum size of the `WordToTransfer` field
 * unless really needed, `Allow Unaligned Transfer` should be kept disabled to save area (and all the addresses should be 32-bit aligned)

### S_AXIS_MAIN packet format

Input commands (terminated with the assertion of `TLAST`) must have this format,
invalid packets will be silently dropped:

| UniqueId | StartAddress | ReadInfo |
|:--------:|:------------:|:--------:|
| 4 bytes  | 4 bytes      | 4 bytes  |

with `ReadInfo` with this format (MSB on the left):

| Reserved | ReadType | Reserved | WordsToTransfer |
|:--------:|:--------:|:--------:|:---------------:|
| 7 bits   | 1 bit    | 3 bits   | 21 bits         |

The `UniqueId` can be used as arbitrary identification tag: its value will be
returned in the corresponding output packet to correctly identify the
transaction.

`StartAddress` and `WordToTransfer` identify respectively the first address and
the number of 32-bit words to read from the AXI4 bus.

`ReadType` identifies the type of read (0 = FIXED, 1 = INCR).

`S00_AXIS` supports the `TDEST` signal, which will be returned in the
corresponding output packet unmodified.

### S_AXIS_AUX packet format

Input commands on the `S_AXIS_AUX` interface are 1-transfer long and must have
this structure (MSB on the left):

| Reserved | ReadType | StartAddress | WordsToTransfer |
|:--------:|:--------:|:------------:|:---------------:|
| 2 bits   | 1 bit    | 32 bits      | 21 bits         |

`UniqueId` is fixed to the value provided by the generic.

### M_AXIS packet format

The returned packet (terminated by the assertion of `TLAST`) from a read
transaction has this format:

| UniqueId | StartAddress | ReadInfo | Data                     | Status  |
|:--------:|:------------:|:--------:|:------------------------:|:-------:|
| 4 bytes  | 4 bytes      | 4 bytes  | WordToTransfer * 4 bytes | 4 bytes |

`UniqueId`, `StartAddress` and `ReadInfo` are the ones provided in the
corresponding read issuing over `S_AXIS_MAIN` or `S_AXIS_AUX` and have the same
meaning.

`Data` is composed by `WordToTransfer` 32-bit words which represent the data
read from the AXI4 bus.

`Status` is the status of the read transaction and has this structure:

| Reserved | Okay  | Slave Error | Decode Error | Internal Error |
|:--------:|:-----:|:-----------:|:------------:|:--------------:|
| 28 bits  | 1 bit | 1 bit       | 1 bit        | 1 bit          |

 * `Okay` indicates that the issued transfer has been completed successfully
 * `Slave Error` indicates that the slave associated with the issued address has returned an error condition
 * `Decode Error` indicates that a decode error condition has been detected (likely caused by a read of an unmapped address)
 * `Internal Error` indicates that the AXI DataMover has encountered an internal error; this error should never arise, if so either there's a bug in this module or the AXI DataMover has been incorrectly configured

Note that, regardless of the received status, the length of data is **always**
`WordToTransfer * 4 bytes`:

 * if `Okay` is asserted, then **all** the data received must be considered **valid**
 * if any of the error conditions is asserted, then **part or all** the data is **invalid**

### Example 1

As a reference, let's consider an AXI4 bus with a single 16 KiB memory mapped
from `0xc0000000` to `0xc0004000` initialized as `0x12345678` over the whole
memory.

This packet issues a read command of 4 consecutive (INCR) 32-bit words starting
from the address `0xc0000000` with a `UniqueId` equal to `0xdeadbeef`:

`0xdeadbeef 0xc0000000 0x01000004`

The returned packet is:

`0xdeadbeef 0xc0000000 0x01000004 0x12345678 0x12345678 0x12345678 0x12345678 0x00000008`

with `TLAST` asserted on the last word.

Which means:

 * 4 32-bit words equal to `0x12345678` as data
 * `Okay` as status (all the returned words are valid)

### Example 2

With the same memory over the same addresses, this packet issues a read command
of 4 consecutive 32-bit words starting from the address `0xbffffff8` (which is
`0xc0000000` minus 2 32-bit words) with a `UniqueId` equal to `0xdeadbeef`:

`0xdeadbeef 0xbffffff8 0x01000004`

The returned packet is:

`0xdeadbeef 0xc0000000 0x01000004 0x00000000 0x00000000 0x12345678 0x12345678 0x00000002`

Which means:

 * 2 32-bit words equal to `0x00000000` and 2 32-bit words equal to `0x12345678`
 * `Decode Error` as status (part or all the words are invalid)

We're trying to read addresses `0xbffffff8` and `0xbffffffc`, which are not
mapped (and the module correctly returns `Decode Error`), while addresses
`0xc0000000` and `0xc0000004` are valid addresses, so the returned values are
the expected ones (`0x12345678`). Moreover note that, if at least one word is
invalid, there's no way to determine which ones are valid without issuing
another read transaction.
