#!/usr/bin/env python3

import cocotb
from cocotb.triggers import Timer, RisingEdge
from cocotb.clock import Clock
from cocotb.drivers.amba import AXI4LiteMaster
from cocotb.result import TestFailure


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
    cocotb.fork(Clock(dut.S_AXI_ACLK, CLK_PERIOD, "ns").start())
    dut.S_AXI_ARESETN <= 0

    # dut.S_AXI_AWADDR <= 0
    # dut.S_AXI_AWVALID <= 0
    # dut.S_AXI_WDATA <= 0
    # dut.S_AXI_WSTRB <= 0
    # dut.S_AXI_WVALID <= 0
    # dut.S_AXI_BREADY <= 0
    # dut.S_AXI_ARADDR <= 0
    # dut.S_AXI_ARVALID <= 0
    # dut.S_AXI_RREADY <= 0

    dut.cmd_ready <= 1
    dut.req_hist_valid <= 0
    dut.req_hist_data <= 0

    await Timer(CLK_PERIOD * 2, "ns")
    dut.S_AXI_ARESETN <= 1

    await RisingEdge(dut.S_AXI_ACLK)


@cocotb.test(skip=False)
async def test_cmd_sending(dut):

    await setup_dut(dut)

    axim = AXI4LiteMaster(dut, "S_AXI", dut.S_AXI_ACLK)

    await axim.write(REG_CH_A, 0)
    await axim.write(REG_CH_B, 1)
    await axim.write(REG_FSR, 4)


    await Timer(CLK_PERIOD * 20, "ns")
