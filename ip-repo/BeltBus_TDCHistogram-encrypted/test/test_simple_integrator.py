import cocotb
from cocotb.monitors import Monitor
from cocotb.triggers import Timer, RisingEdge
import numpy as np
from random import randrange
from cocotb.clock import Clock
from cocotb.drivers import BusDriver, Bus
#from cocotb.drivers.amba import Axi4StreamMaster
from cocotbext.axi4stream.drivers import Axi4StreamMaster

# from cocotbext.axi4stram.drivers import Axi4StreamMaster

from cocotb.result import TestFailure
from cocotb.scoreboard import Scoreboard



CLK_PERIOD = 4
BIN_ADDR_WIDTH = 8


# ==============================================================================
class HistReadDataMonitor(Monitor):
    """Observes data from bram."""
    def __init__(self, name, clock, fifo_ready, fifo_wen, fifo_data, callback=None, event=None):
        self.name = name
        self.clock = clock
        self.fifo_ready = fifo_ready
        self.fifo_wen = fifo_wen
        self.fifo_data = fifo_data

        self.fifo_ready <= 0

        Monitor.__init__(self, callback, event)

    @cocotb.coroutine
    async def _monitor_recv(self):

        while True:
            # Capture signal at rising edge of clock
            await RisingEdge(self.clock)
            if self.fifo_wen == 1:
                self._recv(int(self.fifo_data.value))


@cocotb.coroutine
async def setup_dut(dut):
    cocotb.fork(Clock(dut.clk, CLK_PERIOD, "ns").start())
    dut.reset <= 1
    await Timer(CLK_PERIOD * 2, "ns")
    await RisingEdge(dut.clk)
    dut.reset <= 0

    dut.read_request <= 0
    dut.integrator_reset <= 0
    dut.integrate <= 0
    dut.bin_addr <= 0
    dut.fifo_read_ready <= 0


    await Timer(CLK_PERIOD * 2, "ns")
    await RisingEdge(dut.clk)

    if dut.state != 0:
        raise TestFailure("Error: After reset state != STATE_RESET.")

    await RisingEdge(dut.integrator_ready)
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)

    if dut.state != 2:
        raise TestFailure("Error: After integrator_ready state != STATE_WRITE.")


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



@cocotb.test(skip=True)
async def test_simple_write_process(dut):

    await setup_dut(dut)

    bram_data = await write_random_data(dut)



@cocotb.test(skip=False)
async def test_integration_process(dut):

    await setup_dut(dut)

    # Write random data to memory
    bram_data = await write_random_data(dut, num_data_to_write=10000)

    # Prepare monitor and scoreboard
    read_monitor = HistReadDataMonitor("read_monitor", dut.clk, dut.fifo_read_ready, dut.fifo_read_wen, dut.fifo_read_data)
    scoreboard = Scoreboard(dut)

    expected_result = bram_data

    # set scorboard interface
    scoreboard.add_interface(read_monitor, expected_result)

    # Start read process that trigger the scoreboard...
    dut.fifo_read_ready <= 1
    await RisingEdge(dut.clk)
    await Timer(CLK_PERIOD * (2**BIN_ADDR_WIDTH), "ns")



@cocotb.test(skip=False)
async def test_multi_sequence(dut):

    await setup_dut(dut)

    num_repetition = 10

    # Prepare monitor and scoreboard
    read_monitor = HistReadDataMonitor("read_monitor", dut.clk, dut.fifo_read_ready, dut.fifo_read_wen, dut.fifo_read_data)
    scoreboard = Scoreboard(dut)

    expected_result = [num_repetition for x in range(2**BIN_ADDR_WIDTH)]

    dut.integrate <= 1
    for i in range(2**BIN_ADDR_WIDTH):
        dut.bin_addr <= i
        for j in range(num_repetition):
            await RisingEdge(dut.clk)

    dut.integrate <= 0

    # set scorboard interface
    scoreboard.add_interface(read_monitor, expected_result)

    # Start read process that trigger the scoreboard...
    dut.read_request <= 1
    dut.fifo_read_ready <= 1
    await RisingEdge(dut.clk)
    await Timer(CLK_PERIOD * (2**BIN_ADDR_WIDTH), "ns")
