# AXI4-Stream FT245 FIFO Sync

## Description

This module communicates with FTDI chips using FT245 synchronous interface. It has been tested with FT2232H.

Please notice that I/O costrainst are needed. Look for them in `example_constraints/`.

Finally, a "Clocking Wizard" (MMCM) IP-core is recommended on the clock line to help meeting the timing costrainst.
![](doc/img/setup_bd.png)
