#!/usr/bin/env python

import argparse
import os

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Helper tool for Xilinx multiboot bitstream images")

    parser.add_argument("-g", "--goldensize", type=int, help="Size of the golden image region in KiB, defaults to half memory")

    parser.add_argument("memorysize", type=int, help="Size of the SPI memory, expressed in MiB")
    parser.add_argument("sectorsize", type=int, help="Size of the erase sectors, expressed in KiB (common value is 64)")

    args = parser.parse_args()

    memory_size_b = args.memorysize * 1024 * 1024

    if args.goldensize:
        golden_size = ((args.goldensize + 1 + args.sectorsize - 1) // args.sectorsize) * args.sectorsize * 1024 - 1024
    else:
        golden_size = memory_size_b // 2 - 1024

    timer1_offset = golden_size
    timer2_offset = memory_size_b - args.sectorsize * 1024

    update_region_start = golden_size + 1024
    update_region_end = memory_size_b - args.sectorsize * 1024

    basepath = os.path.dirname(os.path.realpath(__file__))

    print("--> Quad SPI programmer settings:\n"
          "Start Address: 0x{:08X}\n"
          "End Address:   0x{:08X}\n".format(update_region_start, update_region_end))

    print("--> Golden image constraints:\n"
          "set_property BITSTREAM.CONFIG.CONFIGFALLBACK ENABLE [current_design]\n"
          "set_property BITSTREAM.CONFIG.NEXT_CONFIG_ADDR 32'h{:08X} [current_design]\n".format(timer1_offset))

    print("--> Update image constraints:\n"
          "set_property BITSTREAM.CONFIG.CONFIGFALLBACK ENABLE [current_design]\n")

    print("--> Vivado TCL command to generate the golden image (to be flashed through the Vivado Hardware Manager):\n"
          "write_cfgmem -format bin -size {} -interface SPIx4 -loadbit \"up 0x00000000 <golden bitstream>.bit\" -loaddata \"up 0x{:08X} {} up 0x{:08X} {}\" <golden_image>.bin\n".format(args.memorysize, timer1_offset, os.path.join(basepath, "timer1.bin"), timer2_offset, os.path.join(basepath, "timer2.bin")))

    print("--> Vivado TCL command to generate the update image (to be flashed through the TimeEngineers\' Quad SPI programmer):\n"
          "write_cfgmem -format bin -size {} -interface SPIx4 -loadbit \"up 0x00000000 <update bitstream>.bit\" <update_image>.bin".format(args.memorysize))
