###############################################################################
# Copyright (c) 2013 Potential Ventures Ltd
# Copyright (c) 2013 SolarFlare Communications Inc
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Potential Ventures Ltd,
#       SolarFlare Communications Inc nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL POTENTIAL VENTURES LTD BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
###############################################################################
export PYTHON_BIN=python3

PWD=$(shell pwd)

# VHDL IP-Core Files
VIVADO_VHDL_SOURCES= $(PWD)/../hdl/CEC/LocalPackage_CEC.vhd \
$(PWD)/../hdl/TreeComparator/LocalPackage_TC.vhd \
$(PWD)/hdl/AXI4Stream_CoarseExtensionCore_CoCoTbWrapper.vhd \
$(PWD)/../hdl/CEC/AXI4Stream_CoarseExtensionCore.vhd \
$(PWD)/../hdl/CEC/AXI4Stream_CoarseExtensionCoreWrapper_CEC.vhd \
$(PWD)/../hdl/CEC/CoarseCounter_CEC.vhd \
$(PWD)/../hdl/CEC/CoarseExtensionCore.vhd \
$(PWD)/../hdl/TreeComparator/TreeComparator.vhd \
$(PWD)/../hdl/TreeComparator/TreeComparatorWrapper.vhd \
$(PWD)/../hdl/TreeComparator/Step_TC.vhd \
$(PWD)/../hdl/TreeComparator/Engine_EQ_TC.vhd \
$(PWD)/../hdl/TreeComparator/Engine_AND_TC.vhd \
$(PWD)/../hdl/FIFO_Synchronizer.vhd \
#$(PWD)/hdl/AXI4Stream_CoarseExtensionCore_patch.vhd \
$(PWD)/hdl/fifo/FIFO_Synchronizer_patch.vhd \
$(PWD)/hdl/fifo/FIFO_patch.vhd

# XPM Files
VHDL_SOURCES_XPM = $(PWD)/hdl/xpm/xpm_fifo_async_4ec822a1b6cb478dca37bdeb8408b022.vhd \
$(PWD)/hdl/xpm/xpm_VCOMP.vhd \
$(PWD)/hdl/xpm/xpm_fifo_async_wrapper.vhd \
$(PWD)/hdl/xpm/xpm_entities.vhd \


GHDL_ARGS = --ieee=synopsys -fexplicit

SIM=ghdl

SIM_ARGS=--wave=$(PWD)/Waveform.ghw


#GUI=1
TOPLEVEL_LANG=vhdl

SIM_BUILD = $(PWD)/build
MODULE   := tb_axi4stream_coarseextensioncore           	# the name of the Python test file
TOPLEVEL := axi4stream_coarseextensioncore_cocotbwrapper	# the module name in your Verilog or VHDL file


VHDL_SOURCES = $(VIVADO_VHDL_SOURCES)

include $(shell cocotb-config --makefiles)/Makefile.inc
include $(shell cocotb-config --makefiles)/Makefile.sim
