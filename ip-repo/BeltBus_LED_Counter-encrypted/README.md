# Belt Bus breathing effect

This module generates a PWM "breathing" effect for LEDs whose frequency depends
logarithmically from the rate of event over the corresponding channel.

This module takes the rate of every channel from the Belt Bus, compute the log2
and then generates the breathing pattern. The breathing pattern is generated
with a LUT containing a pre-computed Gaussian shape, as in the figure.

![Gaussian shape](gaussian.svg)

The LUT output is connected to the PWM module and the input is driven by a
counter, incremented by one step every
`(log2(COUNTER_WIDTH) - log2(current_rate) + 1) / 2**LED_PRESCALER_BITS` clock
cycles (with `current_rate` being the number of events in a window of
`2**COUNTER_WIDTH` clock cycles). In other words, the "speed" to traverse the
LUT depends on the current events rate.

Except for the input FIFO, the module is clocked by the `clk` signal.

## Generics

| Name                  | Description                                                           | Default   | Range                |
|-----------------------|-----------------------------------------------------------------------|-----------|----------------------|
| BIT_FINE              | BeltBus BIT FINE      (see BeltBus/TDC doc)                           | 10        |                      |
| BIT_COARSE            | BeltBus BIT COARSE    (see BeltBus/TDC doc)                           | 8         |                      |
| BIT_FID               | BeltBus BIT FID       (see BeltBus/TDC doc) I                         | 1         |                      |
| BIT_NUM_CH            | BeltBus BIT NUM_CH    (see BeltBus/TDC doc)                           | 4         |                      |
| NUM_CH                | Number of TDC channels                                                | 4         | 1 to 2**BIT_NUM_CH-1 |
| CDC_SYNC_STAGES       | Number of CDC sync stages on the BeltBus Asynchronous FIFO            | 2         | 2 to 8               |
|                       |                                                                       |           |                      |
| COUNTER_WIDTH         | Width of each counter                                                 | 32        | 2:32                 |
|                       |                                                                       |           |                      |
| PWM_RES               | PWM resolution (in bits)                                              | 9         |                      |
| PWM_PRESCALER_BITS    | PWM prescaler (in bits)                                               | 7         |                      |
| PWM_INVERT_POLARITY   | Invert or not the polarity of the leds port                           | false     |                      |
| LED_TIME_RES          | Gaussian pattern resolution (in bits)                                 | 11        |                      |
| LED_PRESCALER_BITS    | Gaussian pattern prescaler (in bits)                                  | 11        |                      |
| LED_SIGMA             | Gaussian sigma                                                        | 128       |                      |

### LED generics usage guide

`PWM_RES` sets the resolution of the PWM, i.e., the Y-resolution in the above
image. Likewise, `LED_TIME_RES` sets the resolution of the pre-LUT counter,
i.e., the X-resolution in the above image. Unless you really know what you are
doing, you should leave these two generics to their default values, as they
guarantee the lowest BRAM usage (1 18K BRAM per pair of channels), while still
providing a great visual effect.

`PWM_PRESCALER_BITS` sets the prescaler of the PWM, which can be used to lower
the time-resolution of the PWM. Ideally, you should keep the frequency in the
range of some kHz, so `fclk / (2**(PWM_PRESCALER_BITS + PWM_RES)) ~= 1 - 5kHz`.

`LED_PRESCALER_BITS` sets the prescaler for the pre-LUT counter. In other words,
this generic sets the "speed" of the counter traversing the Gaussian shape.

`LED_SIGMA` sets the sigma of the Gaussian shape. In terms of "visual effect",
it changes the slope and the overall ON time of the LED: higher sigma means
slower transitions and more ON time and vice versa. To make sure that the LED is
off when no events are coming on a channel, `LED_SIGMA` should be small enough
such that the LUT value at x=0 is 0.

### Ports

| Port          | Function                                                              |
|---------------|-----------------------------------------------------------------------|
| BB            | BeltBus (AXI4S lave) slave, receive events from TDC                   |
| leds          | Output port to be connected to the board LEDs                         |
