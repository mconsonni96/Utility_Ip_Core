

PWD=$(shell pwd)

TOPLEVEL_LANG = vhdl
SIM = ghdl


GHDL_ARGS = --ieee=synopsys -fexplicit 	#--std=08 --std=08

SIM_ARGS = --wave=$(PWD)/build/waveforms.ghw



VHDL_SOURCES = $(PWD)/../hdl/axilite_controller.vhd \
					$(PWD)/../hdl/histogrammer_cu.vhd \
					$(PWD)/../hdl/interface_bridge.vhd \
					$(PWD)/../hdl/m_axis_controller.vhd \
					$(PWD)/../hdl/simple_integrator.vhd \
					$(PWD)/../hdl/subtractors/single_positive_subtractor.vhd \
					$(PWD)/../hdl/subtractors/multi_positive_subtractor.vhd \
					$(PWD)/../hdl/subtractors/single_subtractor.vhd \
					$(PWD)/../hdl/histogrammer_v1_0.vhd

# $(PWD)/../src/subtractor.vhd

VHDL_SOURCES_xpm = $(PWD)/xpm/xpm_memory_sdpram_406ccc2ee8e1a49d969f6caa74af4349.vhd \
					$(PWD)/xpm/xpm_fifo_async_dabd166532907c1c83f048c302a481e3.vhd \
					$(PWD)/xpm/xpm_fifo_async_1c86df2a302e730a2e17e4e4546c18cc.vhd \
					$(PWD)/xpm/xpm_fifo_sync_488bcebdac4b1b1ae1785b70d6072870.vhd \
					$(PWD)/xpm/xpm_fifo_sync_54b59659ed08d8095ea502285fb6cfc5.vhd \
					$(PWD)/xpm/xpm_VCOMP.vhd \
					$(PWD)/xpm/xpm_entities.vhd \
					$(PWD)/xpm/xpm_fifo_async_wrapper.vhd \
					$(PWD)/xpm/xpm_fifo_sync_wrapper.vhd \
					$(PWD)/xpm/xpm_memory_sdpram_wrapper.vhd



# TOPLEVEL = histogrammer_v1_0
# MODULE   = test_hist




include $(shell cocotb-config --makefiles)/Makefile.inc
include $(shell cocotb-config --makefiles)/Makefile.sim
