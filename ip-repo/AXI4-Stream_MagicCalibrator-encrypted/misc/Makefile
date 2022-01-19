export PYTHON_BIN=python3

PWD				:= $(shell pwd)
TOPLEVEL_LANG	 = vhdl
SIM				 = ghdl
SIM_ARGS		 = --wave=$(PWD)/build/waveform.ghw

TOPLEVEL		 = simple_integrator
MODULE			 = test_simple_integrator

VHDL_SOURCES = $(PWD)/simple_integrator.vhd \


VHDL_SOURCES_xpm =$(PWD)/xpm/xpm_entities.vhd \
$(PWD)/xpm/xpm_memory_sdpram_161f17bdedc2a6c07528eff9f41d356b.vhd \
$(PWD)/xpm/xpm_memory_sdpram_64661eed5e0b334792780022881403bc.vhd \
$(PWD)/xpm/xpm_memory_sdpram_555c51ae1a4f05b1ae9865006409dd10.vhd \
$(PWD)/xpm/xpm_memory_sdpram_43e957c8a0152a84c00d543e1bc604cb.vhd \
$(PWD)/xpm/xpm_memory_sdpram_wrapper.vhd \
$(PWD)/xpm/xpm_VCOMP.vhd \

GHDL_ARGS = --ieee=synopsys -fexplicit

include $(shell cocotb-config --makefiles)/Makefile.inc
include $(shell cocotb-config --makefiles)/Makefile.sim
