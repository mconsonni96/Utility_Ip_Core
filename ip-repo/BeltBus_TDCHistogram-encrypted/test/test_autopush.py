#!/usr/bin/env python3

import cocotb
from cocotb.triggers import Timer, RisingEdge, FallingEdge
from random import randrange, randint
from cocotb.clock import Clock


STATE_RESET = 0xA
STATE_IDLE = 0x0
STATE_READY = 0x1
STATE_STOP = 0x3
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


REG_CH_A = 0x200
REG_CH_B = 0x204
REG_FSR = 0x208
REG_OFFSET = 0x20c

AXI_CMD_RESET = 0x400
AXI_CMD_START = 0x404
AXI_CMD_STOP = 0x408
AXI_CMD_READ = 0x40c

AXI_READ_FIFO = 0x300


@cocotb.coroutine
async def setup_dut(dut, wait_memory_init=True):
    cocotb.fork(Clock(dut.M_AXIS_ACLK, CLK_PERIOD, "ns").start())
    dut.M_AXIS_ARESETN <= 1

    dut.M_AXIS_TREADY <= 0
    dut.ask_for_read <= 0

    await Timer(CLK_PERIOD * 2, "ns")
    dut.M_AXIS_ARESETN <= 0

    await RisingEdge(dut.M_AXIS_ACLK)


def generate_random_data_tuple(num_data, max_random_value, ch_a, ch_b,
                               overflow=0, expected_filtered=False):

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

    expected_result_filtered = [x >> overflow for x in expected_result
                                if x < 2**(BIN_ADDR_WIDTH + overflow)]

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
async def send_data_with_overflow(dut, axim, data_tuple, ch_a, ch_b,
                                  ch_overflow, MAX_DATA_VALUE):

    await RisingEdge(dut.S_AXI_ACLK)

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
                await RisingEdge(dut.S_AXI_ACLK)

                overflow_counter += 1

            await feed_feb_bus(axim, ch, data % MAX_DATA_VALUE)


@cocotb.test(skip=False)
async def test_integrate_and_read(dut):

    await setup_dut(dut)

    dut.M_AXIS_TREADY <= 0

    # Assert read request
    dut.ask_for_read <= 1

    # Waiting for req ack
    await RisingEdge(dut.req_read_ack)

    # Deasset read request
    dut.ask_for_read <= 0

    # Waiting for req ack deassertion
    await FallingEdge(dut.req_read_ack)

    await Timer(CLK_PERIOD * 2, "ns")

    await RisingEdge(dut.M_AXIS_ACLK)

    dut.M_AXIS_TREADY <= 1

    await Timer(CLK_PERIOD * 2, "ns")
