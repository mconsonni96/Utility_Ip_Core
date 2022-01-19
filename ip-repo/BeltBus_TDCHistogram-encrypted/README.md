# TDC Histogrammer

## Memory Map

| ADDR     | NAME                                   | RW | Type     | Note                                                                                           |
|----------|----------------------------------------|----|----------|------------------------------------------------------------------------------------------------|
| `0x0000` | `HEADER  0 - MAGIC`                    | R  | ---      |                                                                                                |
| `0x0004` | `HEADER  1 - TYPE`                     | R  | ---      |                                                                                                |
| `0x0008` | `HEADER  2 - VERSION`                  | R  | ---      |                                                                                                |
| `......` | `HEADER  n - RESERVED` - Read as 0     | R  | ---      |                                                                                                |
| `0x00fc` | `HEADER 63 - RESERVED` - Read as 0     | R  | ---      |                                                                                                |
| `      ` |                                        |    |          |                                                                                                |
| `0x0100` | `BIN ADDR WIDTH`                       | R  | uint32   | Number of bits for addressing bins in memory. Number of bins is 2^(`BIN ADDR WIDTH`)           |
| `0x0104` | `BIN DATA WIDTH`                       | R  | uint32   | Number of bits for each memory unit. Every bin can count up to 2^(`BIN DATA WIDTH`) events     |
| `0x0108` | `OVERFLOW BIT`                         | R  | uint32   | OVERFLOW BIT bits are appended to timestamp in order to handle the overflow of timestamp       |
| `0x010c` | `FUNC MOD`                             | R  | bitmask  | Function mode. See section Function mode                                                       |
| `......` | UNMAPPED - Read/write as SLVERR        |    |          |                                                                                                |
| `0x0200` | `CH A - MEAS`                          | RW | uint32   | Channel used to generate stop event                                                            |
| `0x0204` | `CH B - REF`                           | RW | uint32   | Channel used to generate start event                                                           |
| `0x0208` | `BIT TRUNC`                            | RW | uint32   | See section Hisogram window                                                                    |
| `0x020c` | `TIME OFFSET`                          | RW | int32    | See section Hisogram window                                                                    |
| `......` | UNMAPPED - Read/write as SLVERR        |    |          |                                                                                                |
| `0x0300` | `FIFO OUTPUT`                          | R  | uint32   | Reading this register will return bin count values                                             |
| `......` | UNMAPPED - Read/write as SLVERR        |    |          |                                                                                                |
| `0x0400` | Write to `RESET`                       |  W | ---      | Writing this register reset each bin counter and stop the histogrammer module                  |
| `0x0404` | Write to `START`                       |  W | ---      | Writing the session tag to this register start the histogrammer module                         |
| `0x0408` | Write to `STOP`                        |  W | ---      | Writing this register stop the histogrammer module                                             |
| `0x040c` | Write to `READ`                        |  W | ---      | Writing this register will trigger the "autopush" mechanism regardless of bin status           |
| `0x0410` | Write to start autopush                |  W | ---      | Writing this register will enable the autopush mechanism when bin are almost full              |
| `0x0414` | Write to stop autopush                 |  W | ---      | Writing this register will disable the autopush mechanism when bin are almost full             |
| `......` | UNMAPPED - Read/write as SLVERR        |    |          |                                                                                                |
| `0x0ffc` | UNMAPPED - Read/write as SLVERR        |    |          |                                                                                                |

## Function mode
Function mode is a bitmask which tells current operation mode.

| Bit(s)    | Function        | if `0`                                                      | if `1`                                                    |
|:---------:|:---------------:|:-----------------------------------------------------------:|:---------------------------------------------------------:|
| 0 (LSB)   | Negative mode   | Events are counted only if STOP happen after START          | Events are counted even if STOP happens before START      |
| 1         | Multishot       | Only one STOP event per single START event is counted       | Multiple STOP events per single START event are counted   |
| 2-31      | Reserved        |                                                             |                                                           |

### Negative mode
If negative mode is enabled (Bit 0 of `FUNC MOD` is 1) zero is located in the central bin (2^(`BIN ADDR WIDTH`)/2). **TODO: need more details about this. Bins are even number, so no central bin exists**

## Start-stop dynamic
At startup, the histogrammer is stopped. Event on channels are ignored.

Writing a value to `START` (`0x0404`) starts the histogram that will count events from now on. The four LSBits are used as SESSION TAG (`TSG`). The `TSG` is attached to every measurement read from the histogrammer, and can be used to check that recieved data belongs to correct window.

Writing a value to `START` with the histogrammer already started, will only update the `TSG`.

Writing to `STOP` (`0x0408`) will stop the histogrammer. Resuming with `START` after `STOP` will NOT reset the count.

Writing to `RESET` (`0x0400`) will stop the histogrammer and reset the count on each bin.

Changing `MEAS`/`REF` will automatically stop the histogram. You can then write to `RESET` (if needed to reset) and then write to `START` to resume the measurement.

## Histogram window
The histogrammer can store 2^(`BIN ADDR WIDTH`) bins, each bin can store up to 2^(`BIN DATA WIDTH`).
Since the timestamp has usually more bit than `BIN ADDR WIDTH`, the possible amount of different timestamps exceeds the number of available bins.

For this reason, is it possible to select `BIN ADDR WIDTH` bits out of the timestamp to be used to plot the histogram. Is it possible to select
which slice of bits will be used using `BIT TRUNC`.

![Timestamp subdivision](doc/img/timestamp.png)

`TIME OFFSET` is a constant offset that will be subtracted from the full timestamp + overflow bits (before truncation).

![Window position](doc/img/window.png)

## Reading mechanics
The hardware keeps track of the bin with most readings in it. When number of measures in such bin reaches a treshold (set by VHDL generic) the module triggers the autopush, which will request the PC to read the FIFO as soon as possible.

Is it forbidden to read `0x0300` register (`FIFO OUTPUT`) unless autopush is requested. In order to read the histogram values at arbitrary time instant, you have to write to `0x040c` (Write to `READ`) register in order to trigger an autopush.

## Data format

As read from `FIFO OUTPUT` (0x0300)

| (32 - `BIN ADDR WIDTH` - 4) bits        | (`BIN DATA WIDTH`) bits   | (4) bits            |
|:---------------------------------------:|:-------------------------:|:-------------------:|
| Padding zeros                           | Hisotgram values          | Session tag (`TSG`) |

## TODO (PRIORITY: HI - MEDIUM - LO)
### HI:
1. AXI Register to signal positive only or positive/negative (needed to correctly understand histogram x-axis)

### MEDIUM:
1. ~~Allow multiple events CH MEAS per single CH REF.~~ **DONE**
2. ~~Allow negative values (CH MEAS before CH REF).~~ **DONE**
3. Signal integration time of window (counter on beltbus).
4. AXI Register to signal single/multi shot.
5. Autopush on timeout (i.e. autopush when bin full or when counter on beltbus overflows).
