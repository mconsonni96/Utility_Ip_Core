# AXI4Stream Period Meter
This is a Vivado 2017.3 project used to measure and filter the period of the synchronization signal spread among different FPGAs. This module instantiates the component *Delta* and the *Gated_Integrator* or the *Moving_Average* in cascade configuration depending on the value of the generic *FILTER_SEL*. When *FILTER_SEL* has the value of *GI*, the module *Gated_Integrator* is instantited, while when *FILTER_SEL* is *MA* the module *Moving_Average* is instantited. The dimension of the input data *s00_bb_tdata* is given by the sum of *BIT_NUM_CH*, *BIT_FID*, *BIT_COARSE* and *BIT_RESOLUTION*, while the dimension of the output data *m00_axis_tdata* is given by the sum of *BIT_OVERFLOW*, *BIT_COARSE* and *BIT_RESOLUTION*.

![Cascade of the modules Delta and Gated Integrator or Moving Average depending on the value of FILTER_SEL] (doc/img/cascade_modules2.png)

We can now better explain the three modules:

- The first module that is instantited is *Delta*, that has an input interface which receives the Belt Bus data and an output interface which manages the signals of an AXI4 Stream.
This module is used in order to compute the difference between two consecutive timestamps that arrive on the vector *s00_bb_tdata* and manage the overflows. It also manages the handshakes both on the slave and on the master port: the data arrives on *s00_bb_tdata* when it's valid (it can be recognized because in this case *s00_bb_tvalid* goes high) and when the module is ready (*s00_bb_tready* is high). In a similar way we have a valid data on the master port when the *m00_axis_tvalid* is high, when also the signal *m00_axis_tready* is high ( that means that the receiver is ready to receive a new data) the data *m00_axis_tdata* are send to the destination. A special note has to be taken for the overflow, this case is recognized when the FID field of *s00_bb_tdata* has value of 0. In this case the Coarse and Resolution fields contain the number of overflows happened up to that moment. This is useful in order to keep track of the real value of the counter.

![Waves of Delta module] (doc/img/waves_delta.png)

- The second module that is instantiated when *FILTER_SEL* has the value of *GI* is *Gated_Integrator* which receives the AXI4 Stream signals coming from *Delta* on the slave port and gives the results using a master AXI4 Stream interface. The objective of this module is to compute the mean value of a given number of samples that is 2** *EXPSAMPLE* through the use of a gated integrator filter. It also manages the handshakes both on the slave and on the master port: the data arrives on *s00_axis_tdata* when it's valid (it can be recognized because in this case *s00_axis_tvalid* goes high) and when the module is ready (*s00_axis_tready* is high). In a similar way we have a valid data on the master port when the *m00_axis_tvalid* is high, when also the signal *m00_axis_tready* is high ( that means that the receiver is ready to receive a new data) the data *m00_axis_tdata* are send to the destination. The mean value is calculated by using a gated integrator filter that sums up a number of consecutive data given by 2** *EXPSAMPLE* and apply a right shift of *EXPSAMPLE* (this corresponds to a division by 2** *EXPSAMPLE*). The example reported in the following image represent the filtering of a synchronization signal with period 10 ± 1.

![Waves of Gated Integrator module] (doc/img/waves_gi.png)

- The second module that is instantiated when *FILTER_SEL* has the value of *MA* is *Moving_Average* which receives the AXI4 Stream signals coming from *Delta* on the slave port and gives the results using a master AXI4 Stream interface. The objective of this module is to compute the mean value of a given number of samples that is 2** *EXPSAMPLE*. It also manages the handshakes both on the slave and on the master port: the data arrives on *s00_axis_tdata* when it's valid (it can be recognized because in this case *s00_axis_tvalid* goes high) and when the module is ready (*s00_axis_tready* is high). In a similar way we have a valid data on the master port when the *m00_axis_tvalid* is high, when also the signal *m00_axis_tready* is high ( that means that the receiver is ready to receive a new data) the data *m00_axis_tdata* are send to the destination. The mean value is calculated by using a moving average filter that sums up a number of consecutive data given by 2** *EXPSAMPLE*, apply a right shift of *EXPSAMPLE* (this corresponds to a division by 2** *EXPSAMPLE*), then, when a new data arrives, the filter is shifted by removing from the previously computed sum the oldest data arrived and summing up the new data. At this point the new sum value is obtained and the mean value is computed by right shifting the sum of *EXPSAMPLE*. The example reported in the following image represent the filtering of a synchronization signal with period 10 ± 1.

![Waves of Moving Average module] (doc/img/waves_ma.png)


# IP-Core

Wrapping of the *AXI4Stream_PeriodMeter* gives the following IP-Core:

![IP-core image] (doc/img/ip.png)

## Generic

- **CH_SYNC**: Identifier of the synch channel.

- **FILTER_SEL**: Selecter of the filter type: GI instantiates the Gated Integrator filter, while MA instantiates the Moving Average filter

- **EXPSAMPLE**: Number of shifts. 2**EXPSAMPLE is the number of samples collected for the mean

- **BIT_OVERFLOW**: Number of bits reserved for the overflow value

- **BIT_NUM_CH**: Number of bits reserved for Number of Channels

- **BIT_FID**: Number of bits reserved for Fid

- **BIT_COARSE**: Number of bits reserved for Coarse

- **BIT_RESOLUTION**: Number of bits reserved for Resolution

![Generics image] (doc/img/ip_generics.png)

## Port

- **clk**: System Clock

- **reset**: System reset

- **s00_bb_tvalid**: Valid of the input port

- **s00_bb_tdata**: Input data

- **s00_bb_tready**: Ready of the input port

- **m00_axis_tready**: Ready of the ouput port

- **m00_axis_tvalid**: Valid of the output port

- **m00_axis_tdata**: Output data


![Ports image] (doc/img/ip_ports.png)

# Sources

We can find in "hdl/" the following module directory:

- **AXI4Stream_PeriodMeter**: Wrapper use to generate *AXI4Stream_PeriodMeter_Wrapper* and keep the dimensions of *s00_bb_tdata* and *m00_axis_tdata* as multiples of 8
- **AXI4Stream_PeriodMeter_Wrapper**: Wrapper use to generate *Delta* and *Gated_Integrator* in cascade
- **Delta**: Module that computes the difference between timestamps
- **Gated_Integrator**: Module that computes the mean value among 2** *EXPSAMPLE* data using a gated integrator filter
- **Moving_Average**: Module that computes the mean value among 2** *EXPSAMPLE* data using a moving average filter


# Simulation

We can find in "src/" the following module directory:

- **tb_Meter**: HDL simulation of the AXI4Stream_PeriodMeter.

- **tb_Axi4Stream_PeriodMeter_behav.wcfg**: Waves configuration for the AXI4Stream_PeriodMeter simulation.


In the following image we see the Simulation for the filtering with Gated Integrator module instantiated (when FILTER_SEL=GI)

![Simulation Waveforms] (doc/img/sim_waves_gi.png)

In the following image,instead, we see the Simulation for the filtering with Moving Average module instantiated (when FILTER_SEL=MA)

![Simulation Waveforms] (doc/img/sim_waves_ma.png)
