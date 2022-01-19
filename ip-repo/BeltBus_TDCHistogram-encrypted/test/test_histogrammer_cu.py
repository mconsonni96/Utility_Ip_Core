#!/usr/bin/env python3

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




STATE_RESET = 0xA
STATE_IDLE  = 0x0
STATE_READY = 0x1
STATE_STOP  = 0x3
STATE_ERROR = 0xE

CLK_PERIOD = 4
BIN_ADDR_WIDTH = 15
BIT_NUM_CH = 4
BIT_PROG_OVERFLOW = 3

BIT_FINE = 16
BIT_COARSE = 8
MAX_VALUE_DATA = 2**24
BIT_FID = 1
BIT_NUM_CH = 4
NUM_CH = 4



class HistReadDataMonitor(Monitor):

    def __init__(self, name, clk, read_valid, read_out):

        self.name = name
        self.clk = clk
        self.read_valid = read_valid
        self.read_out = read_out
        Monitor.__init__(self)


    @cocotb.coroutine
    async def _monitor_recv(self):

        while True:
            await RisingEdge(self.clk)

            if self.read_valid == 1:
                self._recv(int(self.read_out))


@cocotb.coroutine
async def setup_dut(dut, wait_memory_init=True):
    cocotb.fork(Clock(dut.clk, CLK_PERIOD, "ns").start())
    dut.reset <= 1

    dut.cmd_valid <= 0
    dut.cmd <= 4
    dut.cmd_data <= 0

    dut.belt_tvalid <= 0
    dut.belt_tdata <= 0

    dut.req_ack <= 0

    dut.read_ready <= 1

    await Timer(CLK_PERIOD * 2, "ns")
    dut.reset <= 0

    await Timer(CLK_PERIOD * 2, "ns")


    if dut.state != STATE_RESET:
        raise TestFailure("Error: After reset state != STATE_RESET.")

    if wait_memory_init:
        await Timer(CLK_PERIOD * 2**15, "ns")

        while dut.integ_ready != 3:
            await RisingEdge(dut.clk)

        await RisingEdge(dut.clk)

        if dut.state != STATE_IDLE:
            raise TestFailure("Error: After integrator_ready state != STATE_IDLE.")



@cocotb.coroutine
async def send_cmd(dut, cmd, cmd_data=0):

    cmd_dict = {"CMD_UPDATE_CH_A": 0,
                "CMD_UPDATE_CH_B": 1,
                "CMD_UPDATE_FSR": 2,
                "CMD_UPDATE_OFFSET": 3,
                "CMD_RESET": 4,
                "CMD_START": 5,
                "CMD_STOP": 6,
                "CMD_READ": 7
                }

    dict_cmd_to_order = {"CMD_RESET": "order_reset",
                        "CMD_READ": "order_read",
                        "CMD_START": "order_start",
                        "CMD_STOP": "order_stop"}


    # Check if cmd is valid
    if cmd not in cmd_dict.keys():
        raise TestFailure(f'Warning: CMD({cmd}) is not recognise.')


    # Write cmd on bus
    await RisingEdge(dut.clk)
    dut.cmd_valid <= 1
    dut.cmd <= cmd_dict[cmd]
    dut.cmd_data <= cmd_data

    # Check if the result is correct
    await RisingEdge(dut.clk)

    dut.cmd_valid <= 0
    await RisingEdge(dut.clk)

    if cmd in dict_cmd_to_order:



        signal_value = eval(f'dut.{dict_cmd_to_order[cmd]}')

        if signal_value != 1:
            raise TestFailure(f'Error: CMD({cmd}) has not change {dict_cmd_to_order[cmd]} signal. current value: {signal_value}')

    else:
        if cmd == "CMD_UPDATE_CH_A":
            if dut.int_ch_a_sel != cmd_data % (2**BIT_NUM_CH):
                raise TestFailure(f'Error: CMD({cmd}) has not correctly set int_ch_a_sel')
        elif cmd == "CMD_UPDATE_CH_B":
            if dut.int_ch_b_sel != cmd_data % (2**BIT_NUM_CH):
                raise TestFailure(f'Error: CMD({cmd}) has not correctly set int_ch_b_sel')
        elif cmd == "CMD_UPDATE_FSR":
            if dut.int_wind_fsr != cmd_data % (2**BIT_PROG_OVERFLOW):
                raise TestFailure(f'Error: CMD({cmd}) has not correctly set int_wind_fsr')
        else:
            if dut.int_wind_offset != cmd_data % (2**BIT_PROG_OVERFLOW):
                raise TestFailure(f'Error: CMD({cmd}) has not correctly int_wind_offset')



@cocotb.coroutine
async def write_random_data(dut, write_interval=0, num_data_to_write = 10000):

    NUM_DATA_TO_WRITE = num_data_to_write
    bram_array = [0 for x in range(2**BIN_ADDR_WIDTH)]

    await RisingEdge(dut.clk)

    for i in range(NUM_DATA_TO_WRITE):

        dut.integrate <= 1
        addr = randrange(0, 2**BIN_ADDR_WIDTH)
        dut.bin_addr <= addr
        bram_array[addr] += 1

        await RisingEdge(dut.clk)

        for i in range(write_interval):
            dut.integrate <= 0
            await RisingEdge(dut.clk)

    dut.integrate <= 0

    return bram_array


def generate_random_data_tuple(num_data, max_random_value, ch_a, ch_b, overflow=0, expected_filtered=False):

    expected_result = []

    NUM_DATA = num_data
    MAX_RANDOM_DATA_VALUE = max_random_value

    # generate random value
    random_data = [randrange(0, MAX_RANDOM_DATA_VALUE) for x in range(NUM_DATA)]

    # remove duplicates
    random_data = list(dict.fromkeys(random_data))

    # order data
    random_data.sort()

    # TODO: now work only with ch_a = 0 and ch_b = 1...
    data_to_channel = [(randint(0, 1), x) for x in random_data]


    last_b_data = -1
    b_valid = False


    # Calculate expected values
    for (ch, data) in data_to_channel:

        if ch == ch_b:
            b_valid = True
            last_b_data = data

        elif ch == ch_a and b_valid:
            expected_result.append(data - last_b_data)


    expected_result_filtered = [x >> overflow for x in expected_result if x < 2**(BIN_ADDR_WIDTH + overflow)]

    if expected_filtered:
        return data_to_channel, expected_result_filtered
    else:
        return data_to_channel, expected_result


@cocotb.coroutine
async def feed_feb_bus(axim, channel, data, fid=1):
    pos_fid = BIT_COARSE + BIT_FINE
    pos_ch = BIT_COARSE + BIT_FINE + BIT_FID
    await axim.write((fid << pos_fid) + (channel << pos_ch) + data)


@cocotb.coroutine
async def send_data_with_overflow(dut, axim, data_tuple, ch_a, ch_b, ch_overflow, MAX_DATA_VALUE):

    await RisingEdge(dut.clk)

    last_b_data = -1
    overflow_counter = 0
    b_valid = False

    # Send data to subtractor module
    for (ch, data) in data_tuple:

        if ch == ch_b:
            b_valid = True
            last_b_data = data
            overflow_counter = 0
            await feed_feb_bus(axim, ch, data % MAX_DATA_VALUE)

        elif ch == ch_a and b_valid:

            # If this measure contains overflow send it to subtractor
            for i in range(int(data/MAX_DATA_VALUE) - int(last_b_data/MAX_DATA_VALUE) - overflow_counter):
                await feed_feb_bus(axim, ch_overflow, 0, 0)

                # Wait some cicles...
                await RisingEdge(dut.clk)

                overflow_counter += 1

            await feed_feb_bus(axim, ch, data % MAX_DATA_VALUE)



@cocotb.test(skip=False)
async def test_integrate_and_read(dut):

    await setup_dut(dut)

    await Timer(CLK_PERIOD * 10, "ns")

    ch_a = 0
    ch_b = 1
    ch_overflow = 2
    overflow = 0

    read_monitor = HistReadDataMonitor("monitor", dut.clk, dut.read_valid, dut.read_out)
    scoreboard = Scoreboard(dut)

    axim = Axi4StreamMaster(dut, "belt", dut.clk)


    random_data, expected_result = generate_random_data_tuple(100000, 2**32, ch_a,ch_b, overflow=overflow, expected_filtered=True)

    dut._log.info(f'Number of expected result: {len(expected_result)}')

    bram_array = [expected_result.count(x) for x in range(2**BIN_ADDR_WIDTH)]


    await send_cmd(dut, 'CMD_UPDATE_CH_A', ch_a)
    await send_cmd(dut, 'CMD_UPDATE_CH_B', ch_b)
    await send_cmd(dut, 'CMD_UPDATE_FSR', overflow)

    await send_cmd(dut, 'CMD_START')

    # Set scoreboard
    scoreboard.add_interface(read_monitor, bram_array)

    await send_data_with_overflow(dut, axim, random_data, ch_a, ch_b, ch_overflow, 2**(BIT_FINE+BIT_COARSE))


    await Timer(CLK_PERIOD * 5, "ns")

    # Send read command
    await send_cmd(dut, 'CMD_READ')

    await Timer(CLK_PERIOD * 2**BIN_ADDR_WIDTH + 20, "ns")


@cocotb.test(skip=True)
async def test_integration_process(dut):

    await setup_dut(dut, False)

    await send_cmd(dut, 'CMD_START')

    #bram_data = await write_random_data(dut)
