
import cocotb
from cocotb_bus.drivers import BusDriver
# from cocotb.drivers import BusDriver
from cocotb.triggers import ClockCycles, FallingEdge, First, RisingEdge, Timer
from cocotb.result import TestFailure
from cocotb.utils import get_sim_time


class BeltBusGenerator(BusDriver):
    """
    BeltBusGenerator
    """

    _signals = ["TVALID"]


    def __init__(self, entity, name, clock):
        """
            Initialization of AxiStreamMaster

            Args:
                entity: handle to the simulator entity
                name: Name of the bus
                clock: handle to the clk associated with this bus
        """

        BusDriver.__init__(self, entity, name, clock)
        self.clock = clock




        self.bb_data = []
        self.BIT_FINE = 16
        self.BIT_COARSE = 8
        self.BIT_FID = 1
        self.BIT_NUM_CH = 4
        self.NUM_CH = 4


        self.bus_length         = self.BIT_NUM_CH + self.BIT_FID + self.BIT_COARSE + self.BIT_FINE
        self.bin_width          = 2400e-12 / 2**16



        self.timestamp_length   = 2**(self.BIT_COARSE + self.BIT_FINE) * self.bin_width
        self.ov_ceil            = 2**self.timestamp_length



        self.channels = {'ch_0': 
                            {'freq': "10MHz"},
                        'ch_1':
                            {'freq': "10MHz", 'delay': "100ps", 'jitter': '10ps'}}




        # Drive some sensible defaults (setimmediatevalue to avoid x asserts)
        for signal in self._signals + self._optional_signals:
            if signal != "TREADY":
                try:
                    default_value = \
                        2 ** getattr(self.bus, signal).value.n_bits - 1 \
                        if signal in ("TSTRB", "TKEEP") else 0
                    getattr(self.bus, signal).setimmediatevalue(default_value)
                except AttributeError:
                    pass

    @cocotb.coroutine
    async def write(self, data, sync=True, tlast_on_last=True):
        """
        Write one or more values on the bus.

        Args:
            data (int/dict or iterable of int/dict): the data values to write.
                Each dict represents an AXI4-Stream transfer, where the dict's
                keys are the signal names and the values are the values to
                write. Missing signals are kept constant.
                Each int represents the TDATA signal in the AXI4-Stream
                transfer (so, they are equivalent to {"TDATA": int_value}).
            sync (bool, optional): wait for rising edge on clock initially.
                Defaults to True.
            tlast_on_last(bool, optional): assert TLAST on the last word
                written on the bus.
                Defaults to True.
        """

        try:
            if isinstance(data, dict):
                # Treat dict as not iterable to avoid wrong results when using
                # enumerate method to retrieve data signals.
                raise TypeError
            iter(data)
        except TypeError:
            data = (data,)    # If data is not iterable, make it

        data = copy.copy(data)

        if sync:
            await RisingEdge(self.clock)

        self.bus.TVALID <= 1

        for index, word in enumerate(data):
            # If word is not a dict, make it (using word as "TDATA")
            if not isinstance(word, dict):
                word = {"TDATA": word}

            for signal, value in word.items():
                err_msg = \
                    f"During transfer {index}, signal {signal} has been " \
                    "passed, but it is "
                if signal == 'TREADY':
                    raise TestFailure(err_msg + "an input for the driver")
                elif signal == 'TLAST' and tlast_on_last:
                    raise TestFailure(err_msg + "already controlled by the "
                                                "driver (tlast_on_last=True)")
                elif signal not in Axi4StreamMaster._optional_signals:
                    raise TestFailure(err_msg + "not a valid "
                                                "AXI4-Stream signal")

                try:
                    getattr(self.bus, signal) <= value
                except AttributeError:
                    raise TestFailure(err_msg + "not present on the bus")

            if hasattr(self.bus, "TLAST") and tlast_on_last and \
               index == len(data) - 1:
                self.bus.TLAST <= 1

            await RisingEdge(self.clock)
            while hasattr(self.bus, "TREADY") and not self.bus.TREADY.value:
                await RisingEdge(self.clock)

        if hasattr(self.bus, "TLAST") and tlast_on_last:
            self.bus.TLAST <= 0

        self.bus.TVALID <= 0

    @property
    def n_bits(self):
        return self.bus.TDATA.value.n_bits




    @cocotb.coroutine
    async def drive_ch(self, ch_sel):

        ch = self.channels[ch_sel]


        period = ch.get(ch.period, 1 / ch.freq)   


        while True:

            await Timer(period, 'sec')
            self.bb_data.append(get_sim_time('sec'))
