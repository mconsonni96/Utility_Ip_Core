import cocotb
from cocotb.monitors import Monitor
from cocotb.triggers import Timer, RisingEdge
import numpy as np
from random import randrange, randint
from cocotb.clock import Clock
from cocotb.drivers import BusDriver, Bus
#from cocotb.drivers.amba import Axi4StreamMaster
from cocotbext.axi4stream.drivers import Axi4StreamMaster

# from cocotbext.axi4stram.drivers import Axi4StreamMaster

from cocotb.result import TestFailure
from cocotb.scoreboard import Scoreboard


CLK_PERIOD = 4
BIN_ADDR_WIDTH = 15
BIT_NUM_CH = 4
BIT_PROG_OVERFLOW = 4

BIT_OVERFLOW = 8
BIT_FINE = 16
BIT_COARSE = 8
MAX_VALUE_DATA = 2**(BIT_COARSE + BIT_FINE)
MAX_RANDOM_VALUE = 2**36
BIT_FID = 1
BIT_NUM_CH = 4
NUM_CH = 4

WINDOW_POS_OFFSET = 2**(BIT_OVERFLOW + BIT_COARSE + BIT_FINE + 1)

class SubOutputMonitor(Monitor):

    def __init__(self, name, clk, sub_valid_signal, sub_output, dut, result_combination):

        self.name = name
        self.clk = clk
        self.sub_valid_signal = sub_valid_signal
        self.sub_output = sub_output
        self.dut = dut
        self.result_combination = result_combination
        self.counter = 0
        Monitor.__init__(self)


    @cocotb.coroutine
    async def _monitor_recv(self):

        while True:
            await RisingEdge(self.clk)

            if self.sub_valid_signal == 1:
                self.dut._log.info(f'Checking ch_a = {self.result_combination[self.counter][0]:0x}; ch_b = {self.result_combination[self.counter][1]:0x}')

                self.counter += 1

                self._recv(int(self.sub_output))

        # window_depth = 0

        # for i in range(BIN_ADDR_WIDTH):
        #     window_depth += 2**i


        # while True:

        #     await RisingEdge(self.sub_valid_signal)

        #     window_pos = int(self.bit_trunc)
        #     window_value = window_depth << window_pos

        #     self._recv(int(self.sub_output) & window_value)




@cocotb.coroutine
async def setup_dut(dut, ch_sel_a, ch_sel_b, overflow, window_position):

    dut.bit_trunc <= overflow
    dut.ch_a_sel <= ch_sel_a
    dut.ch_b_sel <= ch_sel_b
    wind_pos = 2**34 + window_position if window_position < 0 else window_position
    dut.window_pos <= wind_pos % WINDOW_POS_OFFSET
    dut.belt_tvalid <= 0
    dut.belt_tdata <= 0

    dut.reset <= 1

    cocotb.fork(Clock(dut.clk, CLK_PERIOD, "ns").start())

    await Timer(CLK_PERIOD * 2, "ns")
    await RisingEdge(dut.clk)
    dut.reset <= 0

    await Timer(CLK_PERIOD * 2, "ns")
    await RisingEdge(dut.clk)

    return Axi4StreamMaster(dut, "belt", dut.clk)


@cocotb.coroutine
async def set_channel_and_overflow(dut, ch_a, ch_b, overflow):

    await RisingEdge(dut.clk)

    dut.bit_trunc <= overflow
    dut.ch_a_sel <= ch_a
    dut.ch_b_sel <= ch_b

    await RisingEdge(dut.clk)


@cocotb.coroutine
async def feed_feb_bus(dut, channel, data, fid=1):
    pos_fid = BIT_COARSE + BIT_FINE
    pos_ch = BIT_COARSE + BIT_FINE + BIT_FID
    data_to_send = (fid << pos_fid) + (channel << pos_ch) + data
    #await axim.write((fid << pos_fid) + (channel << pos_ch) + data)
    dut.belt_tdata <= data_to_send
    await RisingEdge(dut.clk)



@cocotb.coroutine
async def send_data_with_overflow(dut, data_tuple, ch_a, ch_b, MAX_DATA_VALUE):

    await RisingEdge(dut.clk)

    overflow_counter = 0

    dut.belt_tvalid <= 1

    # Send data to subtractor module
    for (ch, data) in data_tuple:

        while int(data/MAX_DATA_VALUE) - overflow_counter != 0:
            # Send overflow to both channels
            await feed_feb_bus(dut, ch_b, overflow_counter + 1, 0)
            await feed_feb_bus(dut, ch_a, overflow_counter + 1, 0)

            overflow_counter += 1

        await feed_feb_bus(dut, ch, data % MAX_DATA_VALUE)

    dut.belt_tvalid <= 0


def generate_random_data_tuple(num_data, max_random_value, ch_a, ch_b, overflow=0,
                                expected_filtered=False, filter_type='positive_only',
                                window_pos=0):

    expected_result = []

    NUM_DATA = num_data
    MAX_RANDOM_VALUE_VALUE = max_random_value

    # generate random value
    random_data = [randrange(0, MAX_RANDOM_VALUE_VALUE) for x in range(NUM_DATA)]

    # remove duplicates
    random_data = list(dict.fromkeys(random_data))

    # order data
    random_data.sort()

    # TODO: now work only with ch_a = 0 and ch_b = 1...
    data_to_channel = [(randint(0, 1), x) for x in random_data]

    window_width = int(2**(BIN_ADDR_WIDTH + overflow))
    half_window = int(2**(BIN_ADDR_WIDTH + overflow - 1))

    if expected_filtered:

        if filter_type == 'positive_only':
            # valid signals
            valid_a, valid_b = False, False
            value_a, value_b = 0, 0
            exp_result = []
            result_combination = []

            # for each element
            for (ch, data) in data_to_channel:
                if ch == ch_a:
                    valid_a = True
                    value_a = data

                if ch == ch_b:
                    valid_b = True
                    valid_a = False
                    value_b = data + window_pos

                if valid_a and valid_b:

                    valid_a = False
                    delta = value_a - value_b

                    if delta >= 0 and delta < window_width:
                        exp_result.append(delta >> overflow)

                        result_combination.append((value_a, value_b))

            return data_to_channel, exp_result, result_combination

        elif filter_type == 'single_positive':
            # valid signals
            valid_a, valid_b = False, False
            value_a, value_b = 0, 0
            exp_result = []
            result_combination = []

            # for each element
            for (ch, data) in data_to_channel:
                if ch == ch_a:
                    valid_a = True
                    value_a = data

                if ch == ch_b:
                    valid_b = True
                    valid_a = False
                    value_b = data + window_pos

                if valid_a and valid_b:

                    delta = value_a - value_b

                    if delta >= 0 and delta < window_width:
                        exp_result.append(delta >> overflow)
                        valid_a = False
                        valid_b = False
                        result_combination.append((value_a, value_b))

            return data_to_channel, exp_result, result_combination

        elif filter_type == 'single_shot':
            # valid signals
            valid_a, valid_b = False, False
            value_a, value_b = 0, 0
            exp_result = []
            result_combination = []

            # for each element
            for (ch, data) in data_to_channel:
                if ch == ch_a:
                    valid_a = True
                    value_a = data

                if ch == ch_b:
                    valid_b = True
                    value_b = data + window_pos - half_window

                if valid_a and valid_b:

                    delta = value_a - value_b

                    if delta >= 0 and delta < window_width:
                        exp_result.append(delta >> overflow)
                        valid_a = False
                        valid_b = False
                        result_combination.append((value_a, value_b))

            return data_to_channel, exp_result, result_combination

        elif filter_type == 'multi_shot':
            pass

    return data_to_channel, []


@cocotb.test(skip=False)
async def test_windowed_sub(dut):

    ch_sel_b = 1
    ch_sel_a = 0
    overflow = 8
    window_position = 0
    func_mode = 'single_shot'

    for i in range(10):
        dut._log.info(f'Running test n.{i}')

        axim = await setup_dut(dut, ch_sel_a, ch_sel_b, overflow, window_position)

        await RisingEdge(dut.clk)

        # Generate random data with expected int_sub_out result
        random_data, expected_result, result_combination = generate_random_data_tuple(10000, MAX_RANDOM_VALUE, ch_sel_a, ch_sel_b, overflow, True, func_mode, window_position)

        dut._log.info(f'Waiting for {len(expected_result)} results...')

        sub_monitor = SubOutputMonitor("monitor", dut.clk, dut.sub_valid, dut.sub_out, dut, result_combination)
        scoreboard = Scoreboard(dut)

        # Set scoreboard
        scoreboard.add_interface(sub_monitor, expected_result)

        # Send data to subtractor module
        await send_data_with_overflow(dut, random_data, ch_sel_a, ch_sel_b, MAX_VALUE_DATA)

        await RisingEdge(dut.clk)

        sub_monitor.kill()
        sub_monitor = 0
        scoreboard = 0
