    #!/usr/bin/env python3

import cocotb
from cocotb_bus.monitors import Monitor
from cocotb.triggers import Timer, RisingEdge
import numpy as np
from random import randrange, randint
from cocotb.clock import Clock
from cocotb_bus.drivers import BusDriver, Bus
from cocotb_bus.drivers.amba import AXI4LiteMaster
#from cocotb.drivers.amba import Axi4LiteMaster
from cocotbext.axi4stream.drivers import Axi4StreamMaster

# from cocotbext.axi4stram.drivers import Axi4StreamMaster

from cocotb.result import TestFailure
from cocotb_bus.scoreboard import Scoreboard




STATE_RESET = 0xA
STATE_IDLE  = 0x0
STATE_READY = 0x1
STATE_STOP  = 0x3
STATE_ERROR = 0xE

CLK_PERIOD = 4
BIN_ADDR_WIDTH = 8
BIT_NUM_CH = 4
BIT_PROG_OVERFLOW = 3

BIT_FINE = 16
BIT_COARSE = 8
MAX_VALUE_DATA = 2**(BIT_COARSE + BIT_FINE)
MAX_RANDOM_VALUE = 2**36
BIT_FID = 1
BIT_NUM_CH = 4
NUM_CH = 4

BIT_TSG = 4


REG_CH_A = 0x200
REG_CH_B = 0x204
REG_FSR = 0x208
REG_OFFSET = 0x20c

AXI_CMD_RESET = 0x400
AXI_CMD_START = 0x404
AXI_CMD_STOP = 0x408
AXI_CMD_READ = 0x40c
AXI_CMD_SET_AUTOPUSH = 0x410
AXI_CMD_SET_MEAS_TRIGGER = 0x210
AXI_CMD_SET_TIME_TRIGGER = 0x214

AXI_READ_FIFO = 0x300



class SubOutputMonitor(Monitor):

    def __init__(self, name, clk, dut):

        self.name = name
        self.clk = clk
        self.dut = dut

        self.tot_sum = 0

        dut.s00_axi_araddr <= 0x300
        dut.s00_axi_arvalid <= 1
        dut.s00_axi_rready <= 1

        Monitor.__init__(self)


    @cocotb.coroutine
    async def _monitor_recv(self):

        while True:
            await RisingEdge(self.dut.s00_axi_rvalid)

            self.tot_sum += int(self.dut.s00_axi_rdata)>>4

            #self._recv(int(self.sub_output))


@cocotb.coroutine
async def setup_dut(dut, wait_memory_init=True):
    cocotb.fork(Clock(dut.s00_axi_aclk, CLK_PERIOD, "ns").start())
    cocotb.fork(Clock(dut.s00_belt_aclk, CLK_PERIOD, "ns").start())
    cocotb.fork(Clock(dut.m00_axis_aclk, CLK_PERIOD, "ns").start())
    dut.s00_axi_aresetn <= 0
    dut.s00_belt_aresetn <= 1

    dut.s00_axi_awaddr <= 0
    dut.s00_axi_awvalid <= 0
    dut.s00_axi_wdata <= 0
    dut.s00_axi_wstrb <= 0
    dut.s00_axi_wvalid <= 0
    dut.s00_axi_bready <= 0
    dut.s00_axi_araddr <= 0
    dut.s00_axi_arvalid <= 0
    dut.s00_axi_rready <= 0
    dut.m00_axis_aclk <= 0
    dut.m00_axis_aresetn <= 0
    dut.m00_axis_tready <= 0
    dut.s00_belt_aclk <= 0
    dut.s00_belt_tvalid <= 0
    dut.s00_belt_tdata <= 0

    await Timer(CLK_PERIOD * 2, "ns")
    dut.s00_axi_aresetn <= 1

    await Timer(CLK_PERIOD * 2, "ns")

    if wait_memory_init:
        dut._log.info(f'Waiting SDRAM memory reset...')
        for i in range(10):
            await Timer(CLK_PERIOD * (2**BIN_ADDR_WIDTH)/10, "ns")
            dut._log.info(f'Reset is at {(i+1)*10}%...')

        while int(dut.histogrammer_cu_inst.integ_ready) != 3:
            await RisingEdge(dut.s00_axi_aclk)

        await RisingEdge(dut.s00_axi_aclk)

        if dut.histogrammer_cu_inst.state != STATE_IDLE:
            raise TestFailure("Error: SDRAM resetting failed!")

        dut._log.info(f'Memory reset correctly completed!')



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

        if filter_type == 'multi_positive':
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


@cocotb.coroutine
async def feed_feb_bus(dut, channel, data, fid=1):
    pos_fid = BIT_COARSE + BIT_FINE
    pos_ch = BIT_COARSE + BIT_FINE + BIT_FID
    data_to_send = (fid << pos_fid) + (channel << pos_ch) + data
    #await axim.write((fid << pos_fid) + (channel << pos_ch) + data)
    dut.s00_belt_tdata <= data_to_send
    await RisingEdge(dut.s00_axi_aclk)



@cocotb.coroutine
async def send_data_with_overflow(dut, data_tuple, ch_a, ch_b, MAX_DATA_VALUE):
    await RisingEdge(dut.s00_belt_aclk)

    overflow_counter = 0

    dut.s00_belt_tvalid <= 1

    # Send data to subtractor module
    for (ch, data) in data_tuple:

        while int(data/MAX_DATA_VALUE) - overflow_counter != 0:
            # Send overflow to both channels
            await feed_feb_bus(dut, ch_b, overflow_counter + 1, 0)
            await feed_feb_bus(dut, ch_a, overflow_counter + 1, 0)

            overflow_counter += 1

        await feed_feb_bus(dut, ch, data % MAX_DATA_VALUE)

    dut.s00_belt_tvalid <= 0



@cocotb.test(skip=True)
async def test_multi_repetition(dut):

    await setup_dut(dut)

    await Timer(CLK_PERIOD * 10, "ns")

    ch_a = 0
    ch_b = 1
    overflow = 10
    window_position = 0

    num_random_data = 10000

    func_mode = 'single_positive'

    axim_hist = AXI4LiteMaster(dut, "s00_axi", dut.s00_axi_aclk)

    # Set channel and overflow
    await axim_hist.write(REG_CH_A, ch_a)
    await axim_hist.write(REG_CH_B, ch_b)
    await axim_hist.write(REG_FSR, overflow)
    await axim_hist.write(REG_OFFSET, window_position)

    random_data = [None]*11
    bram_array = [None]*11
    data_sending = [None]*11


    # Generate random data and calculate expected result
    random_data[0], expected_result, test_dum = generate_random_data_tuple(num_random_data, MAX_RANDOM_VALUE, ch_a,
                                        ch_b, overflow, True, func_mode, window_position)

    # From expected to bram mapping
    bram_array[0] = [expected_result.count(x) for x in range(2**BIN_ADDR_WIDTH)]


    # Start integration
    dut._log.info(f'Send START command.')
    await axim_hist.write(AXI_CMD_START, 0)

    # Wait some time...
    await Timer(CLK_PERIOD * 20, "ns")


    dut._log.info(f'Inject random data into belt_bus.')
    await send_data_with_overflow(dut, random_data[0], ch_a, ch_b, MAX_VALUE_DATA)

    # Send and check data repeatitly:
    for k in range(10):

        dut._log.info(f'Start round: {k}')
        dut._log.info(f'Waiting for {len(expected_result)} results.')

        # Send read Command
        await axim_hist.write(AXI_CMD_READ, 0)

        # Wait some time...
        await Timer(CLK_PERIOD * 20, "ns")

        # Generate random data and calculate expected result
        random_data[k+1], expected_result, test_dum = generate_random_data_tuple(num_random_data, MAX_RANDOM_VALUE, ch_a,
                                            ch_b, overflow, True, func_mode, window_position)

        # From expected to bram mapping
        bram_array[k+1] = [expected_result.count(x) for x in range(2**BIN_ADDR_WIDTH)]

        # Need to reset subtractor because don't know previous status generated
        # by random_data stream.
        RisingEdge(dut.s00_axi_aclk)
        dut.histogrammer_cu_inst.single_positive_subtractor_inst.subtractor_inst.is_buff_b_valid <= 0
        dut.histogrammer_cu_inst.single_positive_subtractor_inst.subtractor_inst.buff_a_overflow <= 0
        dut.histogrammer_cu_inst.single_positive_subtractor_inst.subtractor_inst.buff_b_overflow <= 0
        dut.histogrammer_cu_inst.single_positive_subtractor_inst.subtractor_inst.curr_b_overflow <= 0
        RisingEdge(dut.s00_axi_aclk)

        # Send data to belt bus
        data_sending[k] = cocotb.fork(send_data_with_overflow(dut, random_data[k+1], ch_a, ch_b, MAX_VALUE_DATA))

        # Read at 0x300 axi register and check with generated data
        for i in range(2**BIN_ADDR_WIDTH):
            data = int(await axim_hist.read(AXI_READ_FIFO)) >> BIT_TSG

            if data != bram_array[k][i]:
                await RisingEdge(dut.s00_axi_aclk)
                await RisingEdge(dut.s00_axi_aclk)
                await RisingEdge(dut.s00_axi_aclk)
                await RisingEdge(dut.s00_axi_aclk)
                raise TestFailure(f'Bram data not corresponds at index {i}. Expected {bram_array[k][i]}; Received {data}.')
            elif i % int(2**BIN_ADDR_WIDTH/10) == 0:
                dut._log.info(f'Until {i/int(2**BIN_ADDR_WIDTH/10)*10}% data corresponds!')

        dut._log.info(f'Waiting all data was sent...')
        await data_sending[k].join()


@cocotb.test(skip=True)
async def test_autopush(dut):

    await setup_dut(dut)

    await Timer(CLK_PERIOD * 10, "ns")

    ch_a = 0
    ch_b = 1
    overflow = 5
    NUM_DATA_TO_SEND = 2**10*4

    axim_hist = AXI4LiteMaster(dut, "s00_axi", dut.s00_axi_aclk)

    sub_monitor = SubOutputMonitor("monitor", dut.s00_axi_aclk, dut)

    # Set channel and overflow
    await axim_hist.write(REG_CH_A, ch_a)
    await axim_hist.write(REG_CH_B, ch_b)
    await axim_hist.write(REG_FSR, overflow)
    await axim_hist.write(AXI_CMD_SET_AUTOPUSH, 0)

    # Start integration
    dut._log.info(f'Send START command.')
    await axim_hist.write(AXI_CMD_START, 0)

    # Wait some time...
    await Timer(CLK_PERIOD * 8, "ns")

    data_to_send = [((x+1) % 2, x) for x in range(0, 2*NUM_DATA_TO_SEND)]

    dut._log.info(f'Inject random data into belt_bus.')
    await send_data_with_overflow(dut, data_to_send, ch_a, ch_b, MAX_VALUE_DATA)

    await Timer(CLK_PERIOD * 1024, "ns")

    await axim_hist.write(AXI_CMD_READ, 0)

    await Timer(CLK_PERIOD * 1024, "ns")

    if sub_monitor.tot_sum != NUM_DATA_TO_SEND:
        raise TestFailure(f'ERROR: not correct number of measure. Expected {NUM_DATA_TO_SEND}; Received {sub_monitor.tot_sum}')
    else:
        dut._log.info(f'Number of measure: {sub_monitor.tot_sum}')



@cocotb.test(skip=True)
async def test_autopush_with_read_cmd(dut):

    await setup_dut(dut)

    dut.m00_axis_tready <= 1

    await Timer(CLK_PERIOD * 10, "ns")

    ch_a = 0
    ch_b = 1
    overflow = 5
    NUM_DATA_PER_ITERATION = 2**10*4
    NUM_ITERATION = 5

    axim_hist = AXI4LiteMaster(dut, "s00_axi", dut.s00_axi_aclk)

    sub_monitor = SubOutputMonitor("monitor", dut.s00_axi_aclk, dut)

    # Set channel and overflow
    await axim_hist.write(REG_CH_A, ch_a)
    await axim_hist.write(REG_CH_B, ch_b)
    await axim_hist.write(REG_FSR, overflow)
    await axim_hist.write(AXI_CMD_SET_AUTOPUSH, 0)

    # Start integration
    dut._log.info(f'Send START command.')
    await axim_hist.write(AXI_CMD_START, 0)

    # Wait some time...
    await Timer(CLK_PERIOD * 8, "ns")

    total_data_to_send = [((x+1) % 2, x) for x in range(NUM_DATA_PER_ITERATION*2*NUM_ITERATION)]

    for i in range(NUM_ITERATION):
        data_to_send = total_data_to_send[i*NUM_DATA_PER_ITERATION*2:(i+1)*NUM_DATA_PER_ITERATION*2]

        dut._log.info(f'Inject {len(data_to_send)} data into belt_bus.')
        await send_data_with_overflow(dut, data_to_send, ch_a, ch_b, MAX_VALUE_DATA)

        await axim_hist.write(AXI_CMD_READ, 0)
        await Timer(CLK_PERIOD * 1024, "ns")

    if sub_monitor.tot_sum != NUM_DATA_PER_ITERATION*NUM_ITERATION:
        raise TestFailure(f'ERROR: not correct number of measure. Expected {NUM_DATA_PER_ITERATION*NUM_ITERATION}; Received {sub_monitor.tot_sum}')
    else:
        dut._log.info(f'Number of measure: {sub_monitor.tot_sum}')


@cocotb.test(skip=True)
async def test_hist_reset_cmd(dut):

    await setup_dut(dut)

    dut.m00_axis_tready <= 1

    axim_hist = AXI4LiteMaster(dut, "s00_axi", dut.s00_axi_aclk)

    await axim_hist.write(AXI_CMD_RESET, 0)

    await Timer(CLK_PERIOD * 1000, "ns")


@cocotb.coroutine
async def send_data_with_overflow(dut, data_tuple, ch_a, ch_b, MAX_DATA_VALUE):
    await RisingEdge(dut.s00_belt_aclk)

    overflow_counter = 0

    dut.s00_belt_tvalid <= 1

    # Send data to subtractor module
    for (ch, data) in data_tuple:

        while int(data/MAX_DATA_VALUE) - overflow_counter != 0:
            # Send overflow to both channels
            await feed_feb_bus(dut, ch_b, overflow_counter, 0)
            await feed_feb_bus(dut, ch_a, overflow_counter, 0)

            overflow_counter += 1

        await feed_feb_bus(dut, ch, data % MAX_DATA_VALUE)

    dut.s00_belt_tvalid <= 0


@cocotb.test(skip=False)
async def test_null_read(dut):

    await setup_dut(dut)

    dut.m00_axis_tready <= 1

    await Timer(CLK_PERIOD * 10, "ns")

    ch_a = 0
    ch_b = 1
    overflow = 10
    window_position = 0

    axim_hist = AXI4LiteMaster(dut, "s00_axi", dut.s00_axi_aclk)

    # Set channel and overflow
    await axim_hist.write(REG_CH_A, ch_a)
    await axim_hist.write(REG_CH_B, ch_b)
    await axim_hist.write(REG_FSR, overflow)
    #await axim_hist.write(AXI_CMD_SET_AUTOPUSH, 0)
    await axim_hist.write(AXI_CMD_RESET, 0)
    await axim_hist.write(AXI_CMD_READ, 0)

    await Timer(CLK_PERIOD * 1024, "ns")


@cocotb.test(skip=True)
async def test_measure_trigger(dut):

    await setup_dut(dut)

    await Timer(CLK_PERIOD * 10, "ns")

    ch_a = 0
    ch_b = 1
    overflow = 10
    window_position = 0

    meas_trigger_value = 1045

    NUM_DATA_TO_SEND = 100000

    func_mode = 'single_positive'

    axim_hist = AXI4LiteMaster(dut, "s00_axi", dut.s00_axi_aclk)

    # Set channel and overflow
    await axim_hist.write(REG_CH_A, ch_a)
    await axim_hist.write(REG_CH_B, ch_b)
    await axim_hist.write(REG_FSR, overflow)
    await axim_hist.write(AXI_CMD_SET_MEAS_TRIGGER, meas_trigger_value)
    await axim_hist.write(AXI_CMD_SET_AUTOPUSH, 0)


    data_to_send = [((x+1) % 2, x) for x in range(0, 2*NUM_DATA_TO_SEND)]

    # Start integration
    dut._log.info(f'Send START command.')
    await axim_hist.write(AXI_CMD_START, 0)

    # Wait some time...
    await Timer(CLK_PERIOD * 20, "ns")

    # Inject random data into belt_bus.
    dut._log.info(f'Inject random data into belt_bus.')
    await send_data_with_overflow(dut, data_to_send, ch_a, ch_b, MAX_VALUE_DATA)

    # Send read Command
    # await axim_hist.write(AXI_CMD_READ, 0)

    # Wait some time...
    await Timer(CLK_PERIOD * 20, "ns")

    bram_array = []

    # Read at 0x300 axi register and check with generated data
    for i in range(2**BIN_ADDR_WIDTH):
        bram_array[i] = int(await axim_hist.read(AXI_READ_FIFO)) >> BIT_TSG

    if bram_array[0] != meas_trigger_value:
        raise TestFailure(f'Bram data not corresponds at index')


@cocotb.test(skip=True)
async def test_time_trigger(dut):

    await setup_dut(dut)

    await Timer(CLK_PERIOD * 10, "ns")

    ch_a = 0
    ch_b = 1
    overflow = 10
    window_position = 0

    time_trigger_value = 100

    num_random_data = 10000

    func_mode = 'single_positive'

    axim_hist = AXI4LiteMaster(dut, "s00_axi", dut.s00_axi_aclk)

    # Set channel and overflow
    await axim_hist.write(REG_CH_A, ch_a)
    await axim_hist.write(REG_CH_B, ch_b)
    await axim_hist.write(REG_FSR, overflow)
    await axim_hist.write(AXI_CMD_SET_TIME_TRIGGER, time_trigger_value)

    # Generate random data and calculate expected result
    random_data, expected_result, test_dum = generate_random_data_tuple(num_random_data, MAX_RANDOM_VALUE, ch_a,
                                        ch_b, overflow, True, func_mode, window_position)

    # Start integration
    dut._log.info(f'Send START command.')
    await axim_hist.write(AXI_CMD_START, 0)

    # Wait some time...
    await Timer(CLK_PERIOD * 20, "ns")

    # Inject random data into belt_bus.
    dut._log.info(f'Inject random data into belt_bus.')
    await send_data_with_overflow(dut, random_data, ch_a, ch_b, MAX_VALUE_DATA)

    # Send read Command
    await axim_hist.write(AXI_CMD_READ, 0)

    # Wait some time...
    await Timer(CLK_PERIOD * 1024, "ns")

    dut._log.info(f'This test does not check result succesfulness. Check waveforms...')
